-record(client, {
          socket,
          transport,
          begin_module,
          build_module,
          parse_module,
	  language,
	  parse_proto,
          keepalive_ref
}).
