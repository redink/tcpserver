%%%-------------------------------------------------------------------
%%% @author redink <cnredink>
%%% @copyright (C) 2013, redink
%%% @doc
%%%
%%% @end
%%% Created : 28 Mar 2013 by redink <cnredink@gmail.com>
%%%-------------------------------------------------------------------
-module(tcpserver_proto_parse).



-compile(export_all).
-include("proto.hrl").
-include("logger.hrl").

parse(<< Size:32/big,Checksum:8,Command:16/big, Data/bits >>) ->
    ?LOG(["Size: ",Size," Checksum: ",Checksum," Command: ",Command," Data: ",Data]),
    parse(Size, Command, Checksum, Data).

parse(_Size,?CS_USER_LOGIN,_Checksum,Data)->
    {login,?CS_USER_LOGIN,Data};

parse(_Size,_Command,_Checksum,_Data)->
    ?LOG("ignore proto_parse"),
    ignore.
