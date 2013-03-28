
-define(MAX_KEEPALIVE,1000).% 5 second
-define(PHPWAY,"http://27.50.133.220/websev/visit/server.php?d=").

%% country begin time
-define(BEGIN_HOUR, 8).
-define(BEGIN_MIN, 20).
-define(END_HOUR, 8).
-define(END_MIN, 50).
-define(BEGIN_TIME, {0, 0, 0}).
-define(END_TIME, {23, 59, 1}).

-define(COUNTRY_PK_ZONEID, 9000).

%zones table used by game_zone_master.erl
-record(zones,{zone_id,zone_channel_id,zone_pid,user_count}).
%client records used by whole game loop
%to remeber sokcet,the type of transpost 
%and a ref of timer which is used for delay message
-record(client, {
	  socket,	
	  transport,
	  begin_module,
	  build_module,
	  parse_module,
	  keepalive_ref
}).

-record(users,{
	  pid,
	  client_id,
	  gid,
	  key,
	  role_id,
	  role_name,
	  role_poto,
	  role_style,
	  role_direct,
	  role_state,
	  role_location,
	  zone_id,
	  pre_zone_id = 0,
	  zone_pid,
	  %%money,
	  %%gold, 
	  %%exp,
	  role_level,
	  %%prestige,
	  %%stamina,
	  %%spirit,
	  %%curstamina,
	  %%curspirit,
          dostatus,
	  team_id = -1,
	  member_flag = -1,
	  company_id,
	  company_name,
	  blood
       }).
-record(steal,{
      req_role_id,
      accept_role_id,
      pk_time = 0
       }).

-record(inviteinfo, {
	invite_id,  %%{systemid, teamid}
	invitee_rel %%{sender, invitee}
	}).

-record(notify_outline,{
	role_id,
	msg   %%{proto_num, Msg}
	}).
-record(run_business,{
		mod_id = run_busnes,
		inviter_roleid,
		with_friend = 0,
		accept_roleid,
		start =0,
		goods,
		goods_name,
		prestige,
		money,
		robbed=0,
		time,
		gettask_time
		}).

-record(zone_pid, {
	 zonepid,
	 key}).
