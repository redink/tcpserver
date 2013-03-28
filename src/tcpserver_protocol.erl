%%%-------------------------------------------------------------------
%%% @author redink <cnredink@gmail.com>
%%% @copyright (C) 2013, redink
%%% @doc
%%%
%%% @end
%%% Created : 28 Mar 2013 by redink <cnredink@gmail.com>
%%%-------------------------------------------------------------------
-module(tcpserver_protocol).

-export([start_link/4, tcpserver_loop/4]).

-include("records.hrl").
-include("logger.hrl").

start_link(ListenerPid, Socket, Transport, Opts) ->
    Pid = spawn_link(?MODULE, 
		     tcpserver_loop, 
		     [ListenerPid,Socket, Transport, Opts]),
    {ok, Pid}.

get_value(Key, Opts, Default) ->
    case lists:keyfind(Key, 1, Opts) of
	{_, Value} ->
	    Value;
	_ ->
	    Default
    end.

tcpserver_loop(ListenerPid,Socket, Transport, Opts) ->
    Begin_Module = get_value(<<"begin_module">>, Opts, tcpserver_logic),
    Build_Module = get_value(<<"build_module">>, Opts, tcpserver_proto_builder),
    Parse_Moudle = get_value(<<"parse_module">>, Opts, tcpserver_proto_parse),
    Socket_Param = get_value(<<"socket_param">>, Opts, [{active, once}]),
    error_logger:info_report("start tcpserver loop for one socket"),
    Client = #client{socket = Socket,
		     transport = Transport,
		     begin_module = Begin_Module,
		     build_module = Build_Module,
		     parse_module = Parse_Moudle,
		     keepalive_ref = undefined},
    ranch:accept_ack(ListenerPid),
    try
	tcpserver_dispatch:recv(<<>>, Begin_Module, Socket_Param, Client)
    after
	io:format("todo something for client logout")
    end.


