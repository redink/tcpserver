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

get_value(Key, Opts, Default) ->
    case lists:keyfind(Key, 1, Opts) of
	{_, Value} ->
	    Value;
	_ ->
	    Default
    end.

parse(Data, Parse_Proto) ->
    case get_value(<<"name">>, Parse_Proto, socket) of
	socket ->
	    parse_proto_socket(Data, Parse_Proto);
	json ->
	    parse_proto_json(Data, Parse_Proto);
	xml ->
	    parse_proto_xml(Data, Parse_Proto);
	google_protocol_buffer ->
	    parse_proto_buffer(Data, Parse_Proto);
	_ ->
	    parse_proto_other(Data, Parse_Proto)
    end.

parse_proto_socket(Data, Parse_Proto) ->
    Header    = get_value(<<"header">>,    Parse_Proto, 32),
    Checksum  = get_value(<<"checksum">>,  Parse_Proto, 8),
    Command   = get_value(<<"command">>,   Parse_Proto, 16),
    _Data_Type = get_value(<<"data_type">>, Parse_Proto, bits),
    <<_:Header/big, _:Checksum, Command_Conext:Command/big, Data_Conext/bits>> = Data,
    parse_proto_socket_do(Command_Conext, Data_Conext).

parse_proto_socket_do(Command_Conext, Data_Conext) ->
    {<<"logic">>, Command_Conext, Data_Conext}.


parse_proto_json(_Data, _Parse_Proto) ->
    ok.

parse_proto_xml(_Date, _Parse_Proto) ->
    ok.

parse_proto_buffer(_Date, _Parse_Proto) ->
    ok.

parse_proto_other(Data, _) ->
    {<<"logic">>, <<"noparse">>, Data}.

