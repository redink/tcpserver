%%%-------------------------------------------------------------------
%%% @author cnredink <cnredink@gmail.com>
%%% @copyright (C) 2013, redink
%%% @doc
%%%
%%% @end
%%% Created : 28 Mar 2013 by redink <cnredink@gmail.com>
%%%-------------------------------------------------------------------
-module(tcpserver_sender).
-export([send/2]).
-include("proto.hrl").
-include("records.hrl").
-include("logger.hrl").
send(#client{socket = Socket, build_module = Build_Module, transport = Transport},Data)->
    Packet = Build_Module:build_packet(Data),
    packet_send(Transport,Socket,Packet).


packet_send(_Transport,_Socket,undefined)->
    ok;

packet_send(Transport,Socket,Packet)->
    Transport:send(Socket,Packet).
