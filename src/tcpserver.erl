%%%-------------------------------------------------------------------
%%% @author redink <cnredink@gmail.com>
%%% @copyright (C) 2013, redink
%%% @doc
%%%
%%% @end
%%% Created : 28 Mar 2013 by redink <cnredink@gmail.com>
%%%-------------------------------------------------------------------
-module(tcpserver).

-export([start_tcp/4]).
-export([start_ssl/4]).
-export([stop_listener/1]).

%% @doc Start an HTTP listener.
-spec start_tcp(any(), non_neg_integer(), any(), any()) -> {ok, pid()}.
start_tcp(Ref, NbAcceptors, TransOpts, ProtoOpts)
                when is_integer(NbAcceptors), NbAcceptors > 0 ->
        ranch:start_listener(Ref, NbAcceptors,
                ranch_tcp, TransOpts, tcpserver_protocol, ProtoOpts).

%% @doc Start an HTTPS listener.
-spec start_ssl(any(), non_neg_integer(), any(), any()) -> {ok, pid()}.
start_ssl(Ref, NbAcceptors, TransOpts, ProtoOpts)
                when is_integer(NbAcceptors), NbAcceptors > 0 ->
        ranch:start_listener(Ref, NbAcceptors,
                ranch_ssl, TransOpts, tcpserver_protocol, ProtoOpts).


%% @doc Stop a listener.
-spec stop_listener(any()) -> ok.
stop_listener(Ref) ->
        ranch:stop_listener(Ref).
