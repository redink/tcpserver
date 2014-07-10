%%%-------------------------------------------------------------------
%%% @author redink <cnredink@gmail.com>
%%% @copyright (C) 2013, redink
%%% @doc
%%%
%%% @end
%%% Created : 28 Mar 2013 by redink <cnredink@gmail.com>
%%%-------------------------------------------------------------------
-module(tcpserver_protocol).

-behaviour(gen_server).

-export([start_link/4]).
-export([init/1, handle_call/3, handle_cast/2,
         handle_info/2, terminate/2, code_change/3]).

-record(state, {socket_param
                , parse_module
                , build_module
                , socket
                , transport
                , c2spid
                , sofar
               }).

-include("records.hrl").

start_link(ListenerPid, Socket, Transport, Opts) ->
    gen_server:start_link(?MODULE, [ListenerPid, Socket, Transport, Opts], []).
    %% Pid = spawn_link(?MODULE, 
	%% 	     tcpserver_loop, 
	%% 	     [ListenerPid,Socket, Transport, Opts]),
    %% {ok, Pid}.

get_value(Key, Opts, Default) ->
    case lists:keyfind(Key, 1, Opts) of
        {Key, Value} ->
            Value;
        _ ->
            Default
    end.

init([_ListenerPid, Socket, Transport, Opts]) ->
    erlang:process_flag(trap_exit, true),
    Socket_Param = get_value(<<"socket_param">>, Opts, [{active, once}]),
    Parse_Module = get_value(<<"parse_module">>, Opts, tcpserver_proto_parse),
    Build_Module = get_value(<<"build_module">>, Opts, tcpserver_proto_builder),
    {ok, C2SPid} = tcpserver_c2s:start_link(Socket, Build_Module, Transport),
    Transport:setopts(Socket, Socket_Param),
    {ok, #state{socket_param = Socket_Param
                , parse_module = Parse_Module
                , build_module = Build_Module
                , socket = Socket
                , transport = Transport
                , c2spid = C2SPid
                , sofar = <<>>
               }}.

handle_call(_, _From, State) ->
    {reply, ok, State}.

handle_cast(_, State) ->
    {noreply, State}.

handle_info({tcp, _, Data}, State) ->
    (State#state.transport):setopts(State#state.socket, State#state.socket_param),
    
    SoFar = State#state.sofar,  %% init : <<>>
    {Commands, Rest} = split_data(<<SoFar/bits, Data/bits>>, []),
    case catch dispatch(Commands, 
                        State#state.c2spid,
                        State#state.parse_module,
                        State#state.build_module) of
        ok ->
            {noreply,  State#state{sofar = Rest}};
        _E ->
            {stop, normal, State}
    end;    

handle_info({tcp_closed, _}, State) ->
    {stop, normal, State};

handle_info({tcp_error, _, Reason}, State) ->
    {stop, Reason, State};

%%ranch:accept_ack(ListenerPid),
handle_info({shoot, _Ref, Transport, Socket, AckTimeout}, State) ->
    Transport:accept_ack(Socket, AckTimeout),
    {noreply, State};

handle_info(_Info, State) ->
    lager:warning(" tcpserver protocol receive unexpected info :~p", [_Info]),
    {noreply, State}.

terminate(Reason, #state{c2spid = C2SPid,
                    socket = Socket}) ->
    lager:error(" terminate occur, reason ~p~n", [Reason]),
    gen_tcp:close(Socket),
    case C2SPid of
        undefined ->
            ok;
        _ ->
            gen_fsm:send_event(C2SPid, closed)
    end,
    ok.

code_change(_, State, _) ->
    {ok, State}.



split_data(Data, Acc) when erlang:byte_size(Data) < 4 ->
    {lists:reverse(Acc), Data};

split_data(<< Size:32/big, Payload/bits >> = Data, Acc) when Size > erlang:byte_size(Payload) ->
    {lists:reverse(Acc), Data};

split_data(<< Size:32/big, _/bits >> = Data, Acc) ->
    PacketSize = Size + 4,
    << Split:PacketSize/binary, Rest/bits >> = Data,
    split_data(Rest, [Split|Acc]).

dispatch([], _, _, _) ->
    ok;

dispatch([Data | Tail], C2SPid, Parse_Module, Build_Module) ->
    gen_fsm:send_event(C2SPid, Parse_Module:parse(Data)),
    dispatch(Tail, C2SPid, Parse_Module, Build_Module).
