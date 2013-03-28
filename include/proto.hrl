-define(CS_KEEPALIVE,0).
-define(CS_EXIT_GAME,1).
-define(CS_USER_LOGIN,2).
-define(CS_CHAR_LOGIN,3).
-define(CS_CHAR_LOGOUT,4).
-define(CS_CHANGE_SCENE,5).
-define(CS_POSITION,6).
-define(CS_PK,7).
-define(CS_IM,8).
-define(CS_MF,9). %%make fun
-define(CS_MF_DCD, 86).
-define(CS_MF_CLEAN, 87).
-define(CS_MF_NEED_HELP, 88).
-define(CS_MF_HELP, 89).
-define(CS_TEAM_CREATE, 10).
-define(CS_TEAM_DESTROY, 11).
-define(CS_TEAM_INVITE, 12).
-define(CS_TEAM_INVITE_ACCEPT, 13).
-define(CS_TEAM_JOIN, 14).
-define(CS_TEAM_JOIN_ACCEPT, 15).
-define(CS_TEAM_OUT, 16).
-define(CS_TEAM_KICK, 17).
%%friend
-define(CS_FRI_FOLLOW, 18).
-define(CS_FRI_UNFOLLOW, 19).
-define(CS_FRI_BLOCK, 20).
-define(CS_FRI_UNBLOCK, 21).
-define(CS_FRI_FLOWER, 22).
-define(CS_FRI_MESSAGE, 50).
%%drama
-define(CS_DRAMA_GET, 23).
-define(CS_DRAMA_DROP, 24).
-define(CS_DRAMA_FINISH, 25).
%%ttasks
-define(CS_TTASKS_GET, 26).
-define(CS_TTASKS_GIVEUP, 27).
-define(CS_TTASKS_STEP, 28).
%%day
-define(CS_DAY_CAT, 29).
-define(CS_DAY_CAT_G, 145).
-define(CS_DAY_SIGNIN, 30).
-define(CS_DAY_AWARD, 31).
-define(CS_DAY_MONTH_SIGNIN, 92).
-define(CS_DAY_TASKS, 93).
-define(CS_DAY_TASKSAWARD, 94).
%%run_business
-define(CS_RUNBUSIN_GET, 32).
-define(CS_RUNBUSIN_INVIT, 33).
-define(CS_RUNBUSIN_AGRINVIT, 34).
-define(CS_RUNBUSIN_ROB, 35).
-define(CS_RUNBUSIN_NEAR, 69).
%%race
-define(CS_RACE_JOIN, 36).
-define(CS_RACE_BET, 37).
%%rich
-define(CS_RICH_GET, 38).
-define(CS_RICH_ANSWER, 39).
-define(CS_RICH_GIVEUP, 40).
%%partner
-define(CS_PARTNER_JOIN, 41).
-define(CS_PARTNER_GET_LIST, 42).
-define(CS_PARTNER_SAVE, 43).
-define(CS_PARTNER_GET, 44).

%%fight
-define(CS_FIGHT_COMPK_JOIN,50).
-define(CS_FIGHT_COMPK_ENTRYMAP, 52).
-define(CS_FIGHT_COMPK_PK, 54).
-define(CS_GOODS_BUY, 55).
-define(CS_GOODS_SELL, 56).
-define(CS_GOODS_SAVE, 59).
-define(CS_GOODS_GET, 60).
-define(CS_GOODS_DROP_BAG, 57).
-define(CS_GOODS_DROP_DEPOT, 58).
-define(CS_GOODS_ARR_BAG, 61).
-define(CS_GOODS_ARR_DEPOT, 62).
-define(CS_GOODS_CHA_BAG, 63).
-define(CS_GOODS_CHA_DEPOT, 64).
-define(CS_GOODS_UNLO_BAG, 65).
-define(CS_GOODS_UNLO_DEPOT, 66).

%%company
-define(CS_COM_APPLY, 70).
-define(CS_COM_BUY, 71).
-define(CS_COM_CREATEBUILD_START, 72).
-define(CS_COM_REPAIRBUILD_START, 74).
-define(CS_COM_RISEBUILD_START, 73).
-define(CS_COM_JOIN, 75).
-define(CS_COM_AGREEJOIN, 76).
-define(CS_COM_KICKOUT, 77).
-define(CS_COM_EXIT, 80).
-define(CS_COM_CANCELJOIN, 81).
-define(CS_COM_UP, 82).
-define(CS_COM_DOWN, 83).
-define(CS_COM_TRANSFER, 84).
-define(SC_COM_DESTROY, 151).
-define(SC_COM_ACTIVITY, 155).
-define(SC_COM_COMLIST, 157).
-define(SC_COM_COUNT, 167).
-define(SC_COM_MEMBERLIST, 158).
-define(SC_COM_DETAIL, 159).
-define(SC_COM_APPLYMEMBERLIST, 160).
-define(SC_COM_SETINFO, 152).
-define(SC_COM_SHOWINFO, 161).
-define(SC_COM_GETTODAYCONTRI, 162).
-define(SC_COM_GETHISTORYCONTRI, 163).
-define(SC_COM_SETCONTRIBUTIONM, 153).
-define(SC_COM_SETCONTRIBUTIONG, 154).
%%equip
-define(CS_EQUIP_WEAR, 45).
-define(CS_EQUIP_TAKEOFF, 46).
-define(CS_EQUIP_LEVEUP, 49).
-define(CS_EQUIP_DCD, 48).
-define(CS_EQUIP_WASH, 47).
%%country_pk
-define(CS_COUNTRY_ENTER, 51).
-define(CS_COUNTRY_PK, 53).
-define(CS_COUNTRY_QUIT, 91).
%%wuxue system
-define(CS_YIJIN_OPEN, 101).
-define(CS_YIJIN_CONFIR, 102).
-define(CS_YIJIN_CANCEL, 103).
-define(CS_YIJIN_GET_WUXUE, 105).
-define(CS_YIJIN_USE_WUXUE, 106).
-define(CS_YIJIN_CANCEL_WUXUE, 107).
-define(CS_YIJIN_UPDATA_WUXUE, 108).
-define(CS_YIJIN_TRAN_WUXUE, 109).
-define(CS_YIJIN_STU_WUXUE, 110).
-define(CS_YIJIN_EXCHANGE_BOOK, 115).
-define(CS_YIJIN_OPEN_JINENG, 116).
-define(CS_YIJIN_OPEN_BOOK, 117).
-define(CS_YIJIN_DROP_BOOK, 118).
-define(CS_YIJIN_GET_BOOK, 119).
%%danyao
-define(CS_PLAYER_MAKEDAN, 111).
-define(CS_PLAYER_USEDAN, 112).
-define(CS_PLAYER_GETMAKEDAN, 113).
-define(CS_PLAYER_GETDAN, 114).
%%get information of personal
-define(CS_GET_PERINFO, 100).
%%formation system
-define(CS_FORMATION_GET_MY, 139).
-define(CS_FORMATION_SET, 140).
-define(CS_FORMATION_STU, 141).
-define(CS_FORMATION_SELECT, 142).
-define(CS_FORMATION_GET_LIST, 143).




-define(SC_SEVER_ERROR,0).
-define(SC_FAIL_REPLY,1).
-define(SC_USER_LOGIN_REPLY,2).
-define(SC_CHAR_LOGIN_REPLY,3).
-define(SC_CHAR_LOGOUT_REPLY,4).
-define(SC_USER_NEABY_REPLY,5).
-define(SC_USER_NEABY_REMOVE,6).
-define(SC_USER_NEABY_MOVE,7).
-define(SC_PK_REPLY,8).
-define(SC_PK_VICTORY,9).
-define(SC_CHANGE_SCENE, 10).
-define(SC_IM,11).
-define(SC_INSTALL_MF, 12).
-define(SC_MEET_WITH_MF, 13).
-define(SC_STATE_MF, 14).
-define(SC_INSTALL_SUCCEED_MF, 15).
-define(SC_MF_NEED_HELP, 113).
-define(SC_MF_FAIL, 16).
-define(SC_MF_AWARD, 117).
-define(SC_MF_DCD, 111).
-define(SC_MF_CLEAN, 112).
-define(SC_MF_HELP, 114).
%%
-define(SC_TEAM_CREATE, 17).
-define(SC_TEAM_DESTROY, 18).
-define(SC_TEAM_ACCEPT, 19).
-define(SC_TEAM_OUT, 20).
-define(SC_TEAM_KICK, 21).
-define(SC_TEAM_INVITE,22).
-define(SC_TEAM_JOIN, 59).
%%friend
-define(SC_FRI_FOLLOW_INFO, 23).
-define(SC_FRI_FOLLOW_RETURN, 24).
-define(SC_FRI_UNFOLLOW_INFO, 25).
-define(SC_FRI_UNFOLLOW_RETURN, 26).
-define(SC_FRI_FLOWER_INFO, 27).
-define(SC_FRI_MSG_INFO, 54).
-define(SC_FRI_BLOCK_REPLY, 55).
-define(SC_FRI_UNBLOCK_REPLY, 56).
-define(SC_FRI_MSG_SUC_REPLY, 57).
-define(SC_FRI_MSG_FAIL_REPLY, 58).
%%drama
-define(SC_DRAMA_GET, 59).
-define(SC_DRAMA_DROP, 29).
-define(SC_DRAMA_FINISH, 30).
%% ttask
-define(SC_TTASK_MOSTER, 31).
-define(SC_TTASK_PROP, 32).
-define(SC_DAY_CAT, 33).
-define(SC_DAY_CAT_G, 176).
-define(SC_DAY_SIGNIN, 34).
-define(SC_DAY_REWARD, 35).
-define(SC_DAY_MONTH_SIGNIN, 123).
-define(SC_DAY_TASKS, 124).
-define(SC_DAY_TASKSAWARD, 125).
-define(SC_TTASK_GIVEUP, 65).
-define(SC_TTASK_STEP, 66).
%%run_business
-define(SC_RUNBUSIN_GET_REPLY, 36).
-define(SC_RUNBUSIN_INVIT_INFO, 37).
-define(SC_RUNBUSIN_AGRINVIT_REPLY, 38).
-define(SC_RUNBUSIN_ROB_REPLY, 39).
-define(SC_RUNBUSIN_ROB_INFO, 40).
-define(SC_RUNBUSIN_NEARPLAYER, 41).
%%RACE
-define(SC_RACE_JOIN, 42).
-define(SC_RACE_BET, 43).
%%rich
-define(SC_RICH_GET, 44).
-define(SC_RICH_AWARD, 45).
-define(SC_RICH_ANSWER, 107).
-define(SC_RICH_GIVEUP, 109).

%%goods
-define(SC_GOODS_BUY, 67).
-define(SC_GOODS_SELL, 69).
-define(SC_GOODS_DROP_BAG, 70).
-define(SC_GOODS_DROP_DEPOT, 71).
-define(SC_GOODS_SAVE, 72).
-define(SC_GOODS_GET, 73).
-define(SC_GOODS_ARR_BAG, 74).
-define(SC_GOODS_ARR_DEPOT, 75).
-define(SC_GOODS_CHA_BAG, 76).
-define(SC_GOODS_CHA_DEPOT, 77).
-define(SC_GOODS_UNLO_BAG, 78).
-define(SC_GOODS_UNLO_DEPOT, 79).
%%fight
-define(SC_FIGHT_COMPK_JOIN, 60).
-define(SC_FIGHT_GZ_ENTRYMAP, 61).
-define(SC_FIGHT_COMPK_ENTRYMAP,62).
-define(SC_FIGHT_GZ_PK, 63).
-define(SC_FIGHT_COMPK_PK, 64).
-define(SC_FIGHT_GZ_WAKEUP, 80).
-define(SC_FIGHT_COMPK_PKFAILED, 81).
-define(SC_FIGHT_GZ_DEAD, 84).
-define(SC_FIGHT_GZ_RELIVE,85).
%%company
-define(SC_COM_APPLY, 86).
-define(SC_COM_BUY, 87).
-define(SC_COM_CREATEBUILD_START, 88).
-define(SC_COM_CREATEBUILD_END, 89).
-define(SC_COM_RISEBUILD_START, 90).
-define(SC_COM_RISEBUILD_END, 91).
-define(SC_COM_REPAIRBUILD_START, 92).
-define(SC_COM_REPAIRBUILD_END, 93).
-define(SC_COM_JOIN, 94).
-define(SC_COM_AGREEJOIN, 95).
-define(SC_COM_KICKOUT, 96).
-define(SC_COM_EXIT, 98).
-define(SC_COM_CANCELJOIN, 99).
-define(SC_COM_UP, 100).
-define(SC_COM_DOWN, 101).
-define(SC_COM_TRANSFER, 102).
-define(SC_COM_UP_EX, 103).
-define(SC_COM_DOWN_EX, 104).
-define(SC_COM_TRANSFER_EX, 105).
-define(SC_COM_KICKOUT_EX, 106).
-define(CS_COM_DESTROY, 120).
-define(CS_COM_ACTIVITY, 121).
-define(CS_COM_COMLIST, 122).
-define(CS_COM_COUNT, 138).
-define(CS_COM_MEMBERLIST, 123).
-define(CS_COM_DETAIL, 124).
-define(CS_COM_APPLYMEMBERLIST,125).
-define(CS_COM_SETINFO, 126).
-define(CS_COM_SHOWINFO, 127).
-define(CS_COM_GETTODAYCONTRI, 128).
-define(CS_COM_GETHISTORYCONTRI, 129).
-define(CS_COM_SETCONTRIBUTIONM, 130).
-define(CS_COM_SETCONTRIBUTIONG, 131).
%%company activity(C TO S)
-define(CS_COMACT_EXPAND,78).
-define(CS_COMACT_EXPANDGOLD, 79).
-define(CS_COMACT_SIGNIN, 146).
-define(CS_COMACT_GETSIGNINDATA, 147).
-define(CS_COMACT_ERNIE, 148).
-define(CS_COMACT_SHOWERNIE, 149).
-define(CS_COMACT_SHOWEXPAND, 150).
-define(CS_COMACT_SKILL, 151).
-define(CS_COMACT_SHOWSKILL, 152).
-define(CS_COMACT_SHOWACTLIST, 153).
-define(CS_COMACT_KICK, 154).
-define(CS_COMACT_SHOWKICKLOG, 155). 
%%company activity(S TO C)
-define(SC_COMACT_EXPAND,97).
-define(SC_COMACT_EXPAND_SUC, 186).
-define(SC_COMACT_EXPANDGOLD, 177).
-define(SC_COMACT_SIGNIN, 178).
-define(SC_COMACT_GETSIGNINDATA, 179).
-define(SC_COMACT_ERNIE, 180). 
-define(SC_COMACT_SHOWERNIE, 181).
-define(SC_COMACT_SHOWEXPAND, 182).
-define(SC_COMACT_SKILL, 183).
-define(SC_COMACT_SHOWSKILL, 184).
-define(SC_COMACT_SHOWACTLIST, 185).
-define(SC_COMACT_KICK, 187).
-define(SC_COMACT_SHOWKICKLOG, 188).

-define(CS_CUSTOM_GETDATA, 156).
-define(SC_CUSTOM_GETDATA, 189).
%%broadcast
-define(SC_BROADCAST_MSG, 115).
-define(SC_SYSTEM_MSG, 117).

%%country_pk
-define(SC_COUNTRY_ENTER, 61).
-define(SC_COUNTRY_PK_RETURN, 63).
-define(SC_LENGQUE_END, 80).
-define(SC_COUNTRY_PK_DEAD, 84).
-define(SC_COUNTRY_PK_REVIVE, 85).
-define(SC_COUNTRY_QUIT, 109).
-define(SC_COUNTRY_ALL_AWARD, 120).

%%im
-define(SC_BROAD_INFO, 121).
%%wuxue system 
-define(SC_YIJIN_OPEN, 132).
-define(SC_YIJIN_CONFIR, 133).
-define(SC_YIJIN_CANCEL, 134).
-define(SC_YIJIN_GET_WUXUE, 136).
-define(SC_YIJIN_USE_WUXUE, 137).
-define(SC_YIJIN_CANCEL_WUXUE, 138).
-define(SC_YIJIN_UPDATA_WUXUE, 139).
-define(SC_YIJIN_TRAN_WUXUE, 140).
-define(SC_YIJIN_STUDY_WUXUE, 141).
-define(SC_YIJIN_EXCHANGE_BOOK, 146).
-define(SC_YIJIN_OPEN_JINENG, 147).
-define(SC_YIJIN_OPEN_BOOK, 148).
-define(SC_YIJIN_DROP_BOOK, 149).
-define(SC_YIJIN_GET_BOOK, 150).
%%danyao
-define(SC_PLAYER_MAKEDAN, 142).
-define(SC_PLAYER_USEDAN, 143).
-define(SC_PLAYER_GETMAKEDAN, 144).
-define(SC_PLAYER_GETDAN, 145).
%%get infomation of personal
-define(SC_GET_PERINFO, 131).
%% equip
-define(SC_EQUIP_WEAR, 49).
-define(SC_EQUIP_TAKEOFF, 50).
-define(SC_EQUIP_LEVEUP, 53).
%%formation system
-define(SC_FORMATION_GET_MY, 170).
-define(SC_FORMATION_SET, 171).
-define(SC_FORMATION_STU, 172).
-define(SC_FORMATION_SELECT, 173).
-define(SC_FORMATION_GET_LIST, 174).
%%partner
-define(SC_PARTNER_JOIN, 46).
-define(SC_PARTNER_GET_LIST, 47).
-define(SC_PARTNER_SAVE, 48).
-define(SC_PARTNER_GET, 153).
