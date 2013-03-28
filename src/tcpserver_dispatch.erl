%%%-------------------------------------------------------------------
%%% @author redink <cnredink@gmail.com>
%%% @copyright (C) 2013, redink
%%% @doc
%%%
%%% @end
%%% Created : 28 Mar 2013 by redink <cnredink@gmail.com>
%%%-------------------------------------------------------------------
-module(tcpserver_dispatch).


-export([recv/4]).
-include("records.hrl").
-include("logger.hrl").

recv(SoFar, CallbackMod, Socket_Param, 
     Client = #client{socket = Socket, transport = Transport}) ->
    Transport:setopts(Socket, Socket_Param),
    {OK, Closed, Error} = Transport:messages(),
    receive
	{OK, _Any, Data} ->
	    {Commands, Rest} = split(<< SoFar/bits, Data/bits >>, []),
	    case dispatch(Commands, CallbackMod, CallbackMod, Client) of
		{ok, NextCallbackMod, NewClient} ->
		    ?MODULE:recv(Rest, NextCallbackMod, Socket_Param, NewClient);
		closed -> closed
	    end;
	{Closed, _} ->
	    ?LOG("Client close the connection"),
	    closed;
	{Error, _, _} -> 
	    ?LOG(["Client close the connection with error",Error]),
	    closed;
	
	Tuple when element(1, Tuple) =:= <<"info">> -> 
	    case CallbackMod:info(Tuple, Client) of
		closed ->
		    ?LOG("Server close the connection"),
		    closed;
		{ok,NewMod,NewClient} -> ?MODULE:recv(SoFar, NewMod, Socket_Param, NewClient);
		{ok,NewClient} -> ?MODULE:recv(SoFar, CallbackMod, Socket_Param, NewClient);
		_Any -> ?MODULE:recv(SoFar, CallbackMod, Socket_Param, Client)
	    end;
	_Any ->
	    ?LOG(["Any", _Any])
    end.

dispatch([], _CallbackMod, NextMod, Client) ->
    {ok, NextMod, Client};
dispatch([Data|Tail], CallbackMod, NextMod, Client = #client{parse_module = Parse_Moudle}) ->
    Ret = case Parse_Moudle:parse(Data) of
	      {command, Command, Channel} ->
		  case Channel of
		      1 -> CallbackMod:cast(Command, Data, Client);
		      _ -> CallbackMod:raw(Command, Data, Client)
		  end;
	      ignore ->
		  ignore;
	      Event ->
		  CallbackMod:event(Event, Client)
	  end,
    case Ret of
	{ok, NewMod, NewClient} ->
	    dispatch(Tail, CallbackMod, NewMod, NewClient);
	{ok, NewClient} ->
	    dispatch(Tail, CallbackMod, NextMod, NewClient);
	closed ->
	    closed;
	_Any ->
	    dispatch(Tail, CallbackMod, NextMod, Client)
    end.

split(Data, Acc) when byte_size(Data) < 4 ->
    {lists:reverse(Acc), Data};
split(<< Size:32/big, Payload/bits >> = Data, Acc) when Size > byte_size(Payload) ->
    {lists:reverse(Acc), Data};
split(<< Size:32/big, _/bits >> = Data, Acc) ->
    PacketSize = Size + 4,
    << Split:PacketSize/binary, Rest/bits >> = Data,
    split(Rest, [Split|Acc]).
