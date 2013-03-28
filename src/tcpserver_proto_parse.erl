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
    parse(Size, Command, Checksum, Data).

parse(_Size,_Command,_Checksum,_Data)->
    ignore.
