package PVZ
{
   public final class ErrorDefineType
   {
      
      public static const Error_CreateRole_DB:int = -10;
      
      public static const Error_RoleInfo_Serialize:int = -11;
      
      public static const Error_RoleInfo_UnSerialize:int = -12;
      
      public static const Error_CreateRole_NoCache:int = -13;
      
      public static const Error_JceException:int = -14;
      
      public static const Error_Tbus_NoAvailableAddr:int = -15;
      
      public static const Error_ProtocolParse:int = -16;
      
      public static const Error_ZoneIdExceedLimit:int = -17;
      
      public static const Error_GUIdAllocExceedLimit:int = -18;
      
      public static const Error_CreateRoleSession:int = -19;
      
      public static const Error_MemBuffNotEnough:int = -20;
      
      public static const Error_TBusAddrNotExist:int = -21;
      
      public static const Error_TBusAddrExist:int = -22;
      
      public static const Error_TBusAddrAToN:int = -23;
      
      public static const Error_TBusAddrNToA:int = -24;
      
      public static const Error_TBusAddrFmt:int = -25;
      
      public static const Error_ExtIf_Account:int = -30;
      
      public static const Error_ExtIf_Forward:int = -31;
      
      public static const Error_ExtIf_TRela:int = -32;
      
      public static const Error_ExtIf_DirtyCheck:int = -33;
      
      public static const Error_PackProtoMsg:int = -40;
      
      public static const Error_UnpackProtoMsg:int = -41;
      
      public static const Error_InsertRspBag:int = -42;
      
      public static const Error_NotValidProtoBag:int = -43;
      
      public static const Error_BroadCastCountLimit:int = -45;
      
      public static const Error_Proto_GetMemPointer:int = -50;
      
      public static const Error_CmdSerializeFail:int = -60;
      
      public static const Error_CmdClosed:int = -61;
      
      public static const Error_CmdNotExist:int = -62;
      
      public static const Error_GuildSerialize:int = -73;
      
      public static const Error_GuildUnserialize:int = -74;
      
      public static const Error_GuildMemFail:int = -75;
      
      public static const Error_GuildLevelCfg:int = -77;
      
      public static const Error_GuildIdExist:int = -78;
      
      public static const Error_MiscTypeNotFind:int = -80;
      
      public static const Error_LogicNotOpened:int = -81;
      
      public static const Error_TCache_ShmInit:int = -90;
      
      public static const Error_TCache_ShmGet:int = -91;
      
      public static const Error_TCache_ShmSet:int = -92;
      
      public static const Error_TCache_ShmDel:int = -93;
      
      public static const Error_TCache_ModuleNotExist:int = -94;
      
      public static const Error_TCache_NoData:int = -95;
      
      public static const Error_TCache_DbMemFail:int = -96;
      
      public static const Error_TCache_LoadDbNum:int = -97;
      
      public static const Error_Misc_SetPublishTime_Account100:int = -98;
      
      public static const Error_NullPtr:int = -99;
      
      public static const Error_RoleNotExist:int = 100;
      
      public static const Error_ElseLogin:int = 101;
      
      public static const Error_TableLoader:int = 102;
      
      public static const Error_NoGmCmd:int = 103;
      
      public static const Error_GmCmdParam:int = 104;
      
      public static const Error_NoCmdParser:int = 105;
      
      public static const Error_TableNoData:int = 106;
      
      public static const Error_InvalidParam:int = 107;
      
      public static const Error_NoTargetData:int = 108;
      
      public static const Error_UinNotActive:int = 109;
      
      public static const Error_PleaseRelogin:int = 110;
      
      public static const Error_NoIdipParser:int = 111;
      
      public static const Error_UinIsActive:int = 112;
      
      public static const Error_Cheat:int = 113;
      
      public static const Error_EnergyIsFull:int = 114;
      
      public static const Error_RoleBaned:int = 115;
      
      public static const Error_OtherRoleNotExist:int = 116;
      
      public static const Error_RegisterRoleNumLimit:int = 117;
      
      public static const Error_ServerStop:int = 118;
      
      public static const Error_BanReasonError:int = 119;
      
      public static const Error_NoLoginUnionServer:int = 120;
      
      public static const Error_RegisterRoleDayLimit:int = 121;
      
      public static const Error_ForbidPayShop:int = 122;
      
      public static const Error_InvalidSeqId:int = 123;
      
      public static const Error_TimeParseError:int = 124;
      
      public static const Error_RoleNameUsed:int = 125;
      
      public static const Error_RoleNameReserver:int = 126;
      
      public static const Error_RoleNameEmpty:int = 127;
      
      public static const Error_RoleNameTooLonge:int = 128;
      
      public static const Error_RoleNameInvalid:int = 129;
      
      public static const Error_RoleSexInvalid:int = 130;
      
      public static const Error_RoleNameSexNoChange:int = 131;
      
      public static const Error_RoleSignatureSizeLimit:int = 132;
      
      public static const Error_RoleNoPlay:int = 133;
      
      public static const Error_NotInActivity:int = 150;
      
      public static const Error_LevelNotEnough:int = 200;
      
      public static const Error_SunNotEnough:int = 201;
      
      public static const Error_CoinNotEnough:int = 202;
      
      public static const Error_StarNotEnough:int = 203;
      
      public static const Error_ItemNotEnough:int = 204;
      
      public static const Error_EnergyNotEnough:int = 205;
      
      public static const Error_FriendPointNotEnough:int = 206;
      
      public static const Error_FightPowerNotEnough:int = 207;
      
      public static const Error_TicketNotEnough:int = 208;
      
      public static const Error_FameNotEnough:int = 209;
      
      public static const Error_CurrencyNotEnough:int = 210;
      
      public static const Error_PresentTicketNotEnough:int = 211;
      
      public static const Error_TicketMaxLimit:int = 212;
      
      public static const Error_FosterTicketNotEnough:int = 213;
      
      public static const Error_LimitNum:int = 220;
      
      public static const Error_LimitType:int = 221;
      
      public static const Error_LimitPrivilegeType:int = 222;
      
      public static const Error_LimitRefreshType:int = 223;
      
      public static const Error_CoinExceedLimit:int = 240;
      
      public static const Error_TD_NotExistLevel:int = 300;
      
      public static const Error_TD_NotPassPreLevel:int = 301;
      
      public static const Error_TD_LevelNoThisAchievement:int = 302;
      
      public static const Error_TD_LevelGateHasUnlock:int = 303;
      
      public static const Error_TD_LevelPreGatelock:int = 304;
      
      public static const Error_TD_StageLocked:int = 305;
      
      public static const Error_TD_AchievementNumNotEnough:int = 306;
      
      public static const Error_TD_HasCollectCoinToday:int = 307;
      
      public static const Error_TD_TDLogParseError:int = 308;
      
      public static const Error_TD_NoPrivilege:int = 309;
      
      public static const Error_TD_HasUnlockPrivilege:int = 310;
      
      public static const Error_TD_NotPassFirstTwoStage:int = 311;
      
      public static const Error_TD_NoChellangeTimes:int = 312;
      
      public static const Error_TD_HaveInheritScore:int = 313;
      
      public static const Error_TD_InheritInvalid:int = 314;
      
      public static const Error_Plant_Locked:int = 400;
      
      public static const Error_Plant_HasUnLock:int = 401;
      
      public static const Error_Plant_SameAvatar:int = 402;
      
      public static const Error_Plant_NotUnLock:int = 403;
      
      public static const Error_Talent_NotStudyPre:int = 500;
      
      public static const Error_Talent_HasStudy:int = 501;
      
      public static const Error_Talent_NotStudy:int = 502;
      
      public static const Error_Talent_PowerNotEnough:int = 503;
      
      public static const Error_Talent_NotSatisfyCondition:int = 504;
      
      public static const Error_City_BuildhasUnlock:int = 600;
      
      public static const Error_City_AllocateCityPos:int = 601;
      
      public static const Error_City_NotMoveTheArea:int = 602;
      
      public static const Error_City_ChangeAreaCD:int = 603;
      
      public static const Error_Farm_BlockHasUnlock:int = 700;
      
      public static const Error_Farm_Blocklock:int = 701;
      
      public static const Error_Farm_PreBlocklock:int = 702;
      
      public static const Error_Farm_BlockType:int = 703;
      
      public static const Error_Farm_BlockSowed:int = 704;
      
      public static const Error_Farm_BlockNotSow:int = 705;
      
      public static const Error_Farm_BlockNoProduct:int = 706;
      
      public static const Error_Farm_DigUpTime:int = 707;
      
      public static const Error_Farm_CanNotWatering:int = 708;
      
      public static const Error_Farm_CanNotSteal:int = 709;
      
      public static const Error_Farm_AvatarPlantId:int = 710;
      
      public static const Error_Farm_HasSowOtherPlant:int = 711;
      
      public static const Error_Fuben_NoChapterUnlock:int = 720;
      
      public static const Error_Fuben_PreStageNotPass:int = 721;
      
      public static const Error_Fuben_PreModeNotPass:int = 722;
      
      public static const Error_Fuben_CurrModeNotPass:int = 723;
      
      public static const Error_Fuben_HasTakeRewardBox:int = 724;
      
      public static const Error_Fuben_NoThisStage:int = 725;
      
      public static const Error_Fuben_CacheStarBigger:int = 726;
      
      public static const Error_Fuben_NeedFormationLeader:int = 727;
      
      public static const Error_Fuben_NoFormation:int = 728;
      
      public static const Error_Fuben_EmptyFormation:int = 729;
      
      public static const Error_Fuben_StageNotPass:int = 730;
      
      public static const Error_Fuben_StageStarNotEnough:int = 731;
      
      public static const Error_Quest_HaveNoQuest:int = 801;
      
      public static const Error_Quest_NotFinish:int = 802;
      
      public static const Error_Quest_HaveOver:int = 803;
      
      public static const Error_Quest_Doing:int = 804;
      
      public static const Error_Quest_NotDonePre:int = 805;
      
      public static const Error_Quest_StepOperType:int = 806;
      
      public static const Error_Friend_PresentEnergyLimit:int = 820;
      
      public static const Error_Friend_ModuleType:int = 821;
      
      public static const Error_Friend_Type:int = 822;
      
      public static const Error_Friend_OperationType:int = 823;
      
      public static const Error_Friend_CanNotTakeEnergy:int = 824;
      
      public static const Error_Friend_NotExist:int = 825;
      
      public static const Error_Friend_FightAllLimit:int = 826;
      
      public static const Error_Friend_FightOneLimit:int = 827;
      
      public static const Error_Friend_OperationStatus:int = 828;
      
      public static const Error_Friend_InviteCountLimit:int = 829;
      
      public static const Error_Friend_ApplyCooldown:int = 830;
      
      public static const Error_Friend_IsExist:int = 831;
      
      public static const Error_Friend_ApplyLimit:int = 832;
      
      public static const Error_Friend_Limit:int = 833;
      
      public static const Error_Friend_RecommendLimit:int = 834;
      
      public static const Error_Friend_OtherLimit:int = 835;
      
      public static const Error_Friend_NoTakeEnergy:int = 836;
      
      public static const Error_Friend_TakeEnergyLimit:int = 837;
      
      public static const Error_Friend_RecordNoExist:int = 838;
      
      public static const Error_Friend_FightCD:int = 839;
      
      public static const Error_Friend_HelpCardPower:int = 840;
      
      public static const Error_Friend_AlreadyPresentEnergy:int = 841;
      
      public static const Error_Friend_BlackListFull:int = 842;
      
      public static const Error_Friend_BlackListExist:int = 843;
      
      public static const Error_Friend_BlackListNotExist:int = 844;
      
      public static const Error_Item_BagNoLeftSpace:int = 900;
      
      public static const Error_Item_SpecialId:int = 901;
      
      public static const Error_Item_CannotUse:int = 902;
      
      public static const Error_Item_NotFindWithUId:int = 903;
      
      public static const Error_Item_CannotSell:int = 904;
      
      public static const Error_Item_Empty:int = 905;
      
      public static const Error_Item_Type:int = 906;
      
      public static const Error_Item_InUse:int = 907;
      
      public static const Error_Item_IdRange:int = 908;
      
      public static const Error_Item_CannotCompound:int = 909;
      
      public static const Error_Gift_Content:int = 910;
      
      public static const Error_Gift_RewardSize:int = 911;
      
      public static const Error_Gift_IsExist:int = 912;
      
      public static const Error_Gift_NotExist:int = 913;
      
      public static const Error_Item_CannotUseBatch:int = 914;
      
      public static const Error_Item_UseBatchNumLimit:int = 915;
      
      public static const Error_Item_UseBatchGridLimit:int = 916;
      
      public static const Error_CmdSwitch_NotExist:int = 920;
      
      public static const Error_CmdSwitch_HasExist:int = 921;
      
      public static const Error_Card_CannotFind:int = 1000;
      
      public static const Error_Card_PositionError:int = 1001;
      
      public static const Error_Card_PackageFull:int = 1002;
      
      public static const Error_Card_HelpNumLimit:int = 1003;
      
      public static const Error_Card_NotInFormation:int = 1004;
      
      public static const Error_Card_FormationCardLimit:int = 1005;
      
      public static const Error_Card_BagNoLeftSpace:int = 1006;
      
      public static const Error_Card_LevelNoEnough:int = 1007;
      
      public static const Error_Card_ConsumeLevelNoEnough:int = 1008;
      
      public static const Error_Card_ConsumeType:int = 1009;
      
      public static const Error_Card_NewCardType:int = 1010;
      
      public static const Error_Card_AddCardCount:int = 1011;
      
      public static const Error_Card_StarWeightComputeError:int = 1012;
      
      public static const Error_Card_StarLevelGroupPlant:int = 1013;
      
      public static const Error_Card_ForgeLevelNoEnough:int = 1015;
      
      public static const Error_Card_ForgeLevelLargest:int = 1016;
      
      public static const Error_Card_ConsumeForgeLevelNoEnough:int = 1017;
      
      public static const Error_Card_ConsumeCardNumber:int = 1018;
      
      public static const Error_Card_FormationCannotEmpty:int = 1019;
      
      public static const Error_Card_LevelLimit:int = 1020;
      
      public static const Error_Card_InFormation:int = 1021;
      
      public static const Error_Card_RecycleLevelNotOne:int = 1022;
      
      public static const Error_Card_NotAtHome:int = 1023;
      
      public static const Error_Card_HealthFull:int = 1024;
      
      public static const Error_Card_CanNotRecruit:int = 1025;
      
      public static const Error_Card_InArenaFormation:int = 1026;
      
      public static const Error_Card_FilledPiece:int = 1027;
      
      public static const Error_Card_PieceIndex:int = 1028;
      
      public static const Error_Card_FillItem:int = 1029;
      
      public static const Error_Card_PieceNoFull:int = 1030;
      
      public static const Error_Card_NoNextQuality:int = 1031;
      
      public static const Error_Card_NoPrevQuality:int = 1032;
      
      public static const Error_Card_RepeatCardUId:int = 1033;
      
      public static const Error_Card_RepeatCardType:int = 1034;
      
      public static const Error_Card_OnlyOneInArenaFormation:int = 1035;
      
      public static const Error_Card_OnlyOneInSearchFormation:int = 1036;
      
      public static const Error_Card_OnlyOneInSeizeFormation:int = 1037;
      
      public static const Error_Card_InOutpostFormation:int = 1038;
      
      public static const Error_Card_WrongChlorophyllLevel:int = 1039;
      
      public static const Error_Card_ExceedForgeRate:int = 1040;
      
      public static const Error_Card_AwakenNoOpen:int = 1041;
      
      public static const Error_Card_CannotAwaken:int = 1042;
      
      public static const Error_Card_CanNotRecycle:int = 1043;
      
      public static const Error_Card_RecycleNumLimit:int = 1044;
      
      public static const Error_Card_UserLevelLimitUp:int = 1045;
      
      public static const Error_Card_FillCardLevelLimit:int = 1046;
      
      public static const Error_Card_ExchangePieceLevelLimit:int = 1047;
      
      public static const Error_Card_CannotSwapGene:int = 1048;
      
      public static const Error_Card_NeedResetGeneAttribute:int = 1049;
      
      public static const Error_Avatar_Locked:int = 1200;
      
      public static const Error_Avatar_Unlocked:int = 1201;
      
      public static const Error_Avatar_NotBuy:int = 1202;
      
      public static const Error_Avatar_NotUse:int = 1203;
      
      public static const Error_Avatar_NoNextForgeLevel:int = 1204;
      
      public static const Error_Avatar_NotNeedBuy:int = 1205;
      
      public static const Error_Avatar_ZombieNoAvatar:int = 1206;
      
      public static const Error_Avatar_TDIdNoSame:int = 1207;
      
      public static const Error_Avatar_CanNotSwap:int = 1208;
      
      public static const Error_Qzone_InvalidShareType:int = 1300;
      
      public static const Error_Qzone_AllShareLimit:int = 1301;
      
      public static const Error_Qzone_SingleShareTotalNumLimit:int = 1302;
      
      public static const Error_Qzone_EverydayShareNumLimit:int = 1303;
      
      public static const Error_Qzone_InvalidLoginChannel:int = 1304;
      
      public static const Error_Qzone_FriendFightLimit:int = 1305;
      
      public static const Error_Qzone_CardStarLevelLimit:int = 1306;
      
      public static const Error_Qzone_HasNoProducedLab:int = 1307;
      
      public static const Error_Qzone_HasNotSignInToday:int = 1308;
      
      public static const Error_Fight_NoCard:int = 2000;
      
      public static const Error_Fight_InvalidCard:int = 2001;
      
      public static const Error_Fight_InvalidSkill:int = 2002;
      
      public static const Error_Fight_InvalidBattleType:int = 2003;
      
      public static const Error_Fight_InvalidBuff:int = 2004;
      
      public static const Error_Fight_ReportNotFound:int = 2005;
      
      public static const Error_Fight_NoDefendFormation:int = 2006;
      
      public static const Error_Fight_InvalidTeamTaskType:int = 2007;
      
      public static const Error_Fight_InvalidTeamTargetType:int = 2008;
      
      public static const Error_Fight_EmptyReport:int = 2009;
      
      public static const Error_Fight_NoAvailableTarget:int = 2010;
      
      public static const Error_Guide_GuideNotFound:int = 2100;
      
      public static const Error_Chat_Frequency:int = 2201;
      
      public static const Error_Chat_TargetRoleOffline:int = 2202;
      
      public static const Error_Chat_Channel:int = 2203;
      
      public static const Error_Chat_ContentLength:int = 2204;
      
      public static const Error_Chat_TargetRoleIsNotExist:int = 2205;
      
      public static const Error_Chat_NeedHorn:int = 2206;
      
      public static const Error_Chat_Baned:int = 2207;
      
      public static const Error_Lab_NotExistInRole:int = 2301;
      
      public static const Error_Lab_ExistInRole:int = 2302;
      
      public static const Error_Lab_Lock:int = 2303;
      
      public static const Error_Lab_ReachMaxLevel:int = 2304;
      
      public static const Error_Lab_RoleLevelNotEnough:int = 2305;
      
      public static const Error_Lab_MaterialNotEnough:int = 2306;
      
      public static const Error_Lab_HasProduce:int = 2307;
      
      public static const Error_Lab_LockAllByStage:int = 2308;
      
      public static const Error_Lab_LockByStage:int = 2309;
      
      public static const Error_Equip_NotWorn:int = 2401;
      
      public static const Error_Equip_PosInvalid:int = 2402;
      
      public static const Error_Equip_BeWorn:int = 2403;
      
      public static const Error_Equip_RandomEffect:int = 2404;
      
      public static const Error_Equip_CardLevelNotEnough:int = 2405;
      
      public static const Error_Equip_HasTakeDailyPearl:int = 2406;
      
      public static const Error_Equip_HasTakeFirstPearl:int = 2407;
      
      public static const Error_Equip_BeadsNotEnough:int = 2408;
      
      public static const Error_Equip_CloneNotOpen:int = 2409;
      
      public static const Error_Equip_CloneEquipCanNotClone:int = 2410;
      
      public static const Error_Equip_ExceedCloneScore:int = 2411;
      
      public static const Error_Equip_NotExist:int = 2412;
      
      public static const Error_Equip_EnergyNotEnough:int = 2413;
      
      public static const Error_Equip_PosNotOpen:int = 2414;
      
      public static const Error_Equip_NotEnoughEnergy:int = 2415;
      
      public static const Error_Equip_EquipNotFound:int = 2416;
      
      public static const Error_Equip_ItemCostNotEnough:int = 2417;
      
      public static const Error_Equip_WearCardTypeLimit:int = 2418;
      
      public static const Error_Equip_GradeLimit:int = 2419;
      
      public static const Error_Equip_LevelLimit:int = 2420;
      
      public static const Error_Equip_CanNotCreateThisEquip:int = 2421;
      
      public static const Error_Equip_QualityNotExist:int = 2422;
      
      public static const Error_Equip_CloneEquipFail:int = 2423;
      
      public static const Error_Equip_ItemIsNotEquip:int = 2424;
      
      public static const Error_Equip_BeadsExceedLimit:int = 2425;
      
      public static const Error_Equip_AttachLevelFull:int = 2426;
      
      public static const Error_Equip_LevelUpRoleLevelLimit:int = 2427;
      
      public static const Error_Equip_UpgradeRoleLevelLimit:int = 2428;
      
      public static const Error_Equip_CloneEquipCanNotLevelUp:int = 2429;
      
      public static const Error_Equip_CloneEquipCanNotUpgrade:int = 2430;
      
      public static const Error_Equip_BuyBeadExceed:int = 2431;
      
      public static const Error_Equip_NotOpen:int = 2432;
      
      public static const Error_Equip_MaterialNotEnough:int = 2433;
      
      public static const Error_Equip_ExceedCloneLimit:int = 2434;
      
      public static const Error_Equip_UpMaterialNotEnough:int = 2435;
      
      public static const Error_Equip_MaxPoolLevel:int = 2436;
      
      public static const Error_Equip_AttachLevelLow:int = 2437;
      
      public static const Error_Equip_NumLmt:int = 2438;
      
      public static const Error_Equip_EnergyReachMax:int = 2439;
      
      public static const Error_Pay_Internal:int = 3000;
      
      public static const Error_Pay_SystemBusy:int = 3001;
      
      public static const Error_Pay_NotLogin:int = 3002;
      
      public static const Error_Pay_LackOfBalance:int = 3004;
      
      public static const Error_Pay_AccountFrozen:int = 3101;
      
      public static const Error_Pay_TransactionFinish:int = 3103;
      
      public static const Error_Pay_OrderExist:int = 3201;
      
      public static const Error_Pay_OrderNotExist:int = 3202;
      
      public static const Error_Pay_Finish:int = 3203;
      
      public static const Error_Pay_LastPayInProcess:int = 3900;
      
      public static const Error_Pay_TransactionStatError:int = 3901;
      
      public static const Error_Pay_AccountInfoNotSync:int = 3902;
      
      public static const Error_Pay_Itc:int = 3903;
      
      public static const Error_Pay_TooOften:int = 3904;
      
      public static const Error_GetObjInfo_TypeNotExist:int = 4101;
      
      public static const Error_Mail_DataNoFind:int = 4300;
      
      public static const Error_Mail_NoFind:int = 4301;
      
      public static const Error_Mail_SelectType:int = 4302;
      
      public static const Error_Mail_NoAttachment:int = 4303;
      
      public static const Error_Mail_ContentLimit:int = 4304;
      
      public static const Error_Mail_TitleLimit:int = 4305;
      
      public static const Error_Mail_AttachmentLimit:int = 4306;
      
      public static const Error_Mail_SysMailLevel:int = 4307;
      
      public static const Error_Mail_AllocMailId:int = 4308;
      
      public static const Error_Mail_DirtyCheck:int = 4309;
      
      public static const Error_Mail_NotSendToSelf:int = 4310;
      
      public static const Error_Mail_IntervalLimit:int = 4311;
      
      public static const Error_Mail_SendTimeLimit:int = 4312;
      
      public static const Error_Mail_Baned:int = 4313;
      
      public static const Error_Mail_SenderNotExist:int = 4314;
      
      public static const Error_Mail_HasAttachmentNotDelete:int = 4315;
      
      public static const Error_Notice_NoFind:int = 4400;
      
      public static const Error_Notice_IdExist:int = 4401;
      
      public static const Error_Notice_InvalidTime:int = 4402;
      
      public static const Error_Notice_InvalidParam:int = 4403;
      
      public static const Error_Notice_NoRoleInPlat:int = 4404;
      
      public static const Error_Notice_LimitBroadCastGroup:int = 4405;
      
      public static const Error_WorldMap_PositionNoFind:int = 4500;
      
      public static const Error_WorldMap_GridNoFind:int = 4501;
      
      public static const Error_WorldMap_NoCityPos:int = 4502;
      
      public static const Error_WorldMap_CityPosUsed:int = 4503;
      
      public static const Error_WorldMap_CityPosFull:int = 4504;
      
      public static const Error_WorldMap_RangeLimit:int = 4505;
      
      public static const Error_WorldMap_RangeShape:int = 4506;
      
      public static const Error_WorldMap_NoSameArea:int = 4507;
      
      public static const Error_WorldMap_PosNoCity:int = 4508;
      
      public static const Error_WorldMap_NoMinePos:int = 4511;
      
      public static const Error_WorldMap_MineHolder:int = 4512;
      
      public static const Error_WorldMap_NoTemplePos:int = 4513;
      
      public static const Error_WorldMap_Area:int = 4514;
      
      public static const Error_WorldMap_Exile:int = 4515;
      
      public static const Error_WorldMap_NotMyMine:int = 4516;
      
      public static const Error_WorldMap_NotMinePos:int = 4517;
      
      public static const Error_WorldMap_AdvancedUnlock:int = 4518;
      
      public static const Error_War_NoReDeclare:int = 4700;
      
      public static const Error_War_InvalidTeam:int = 4701;
      
      public static const Error_War_TeamOutgo:int = 4702;
      
      public static const Error_War_InvalidEnermyPos:int = 4703;
      
      public static const Error_War_EmptyFormation:int = 4704;
      
      public static const Error_War_TeamInvalidStatus:int = 4705;
      
      public static const Error_War_CanNotFightEnermy:int = 4706;
      
      public static const Error_War_NoDeclareAlly:int = 4707;
      
      public static const Error_War_TimesLimit:int = 4708;
      
      public static const Error_War_InWarFree:int = 4709;
      
      public static const Error_War_InWarFreeCD:int = 4710;
      
      public static const Error_War_NoNeedRecoverHp:int = 4711;
      
      public static const Error_War_TeamType:int = 4712;
      
      public static const Error_War_EnemyNoFormation:int = 4713;
      
      public static const Error_War_EnemyDeclareYou:int = 4714;
      
      public static const Error_War_AtLeastOneNoEmptyTeam:int = 4715;
      
      public static const Error_War_IsNewCity:int = 4716;
      
      public static const Error_War_CityTargetInSameGuild:int = 4717;
      
      public static const Error_War_NotEnoughDuration:int = 4718;
      
      public static const Error_War_DurationFull:int = 4719;
      
      public static const Error_War_RebuildInCoolDown:int = 4720;
      
      public static const Error_War_DefendTeamSetOut:int = 4721;
      
      public static const Error_War_MarchTimeThresholdLimit:int = 4722;
      
      public static const Error_Mine_NoHolder:int = 4750;
      
      public static const Error_Mine_RoleNoTeam:int = 4751;
      
      public static const Error_Mine_RoleHasTeam:int = 4752;
      
      public static const Error_Mine_NoMining:int = 4753;
      
      public static const Error_Mine_Mining:int = 4754;
      
      public static const Error_Mine_NoFreeMineCar:int = 4755;
      
      public static const Error_Mine_RoleNotHold:int = 4756;
      
      public static const Error_Mine_RoleHasHold:int = 4757;
      
      public static const Error_Mine_NotNPCHold:int = 4758;
      
      public static const Error_Mine_NoRoleMineCache:int = 4759;
      
      public static const Error_Mine_CollectCD:int = 4760;
      
      public static const Error_Activity_RewardHasGet:int = 4800;
      
      public static const Error_Activity_VipFlagLimit:int = 4801;
      
      public static const Error_Activity_VipLevelLimit:int = 4802;
      
      public static const Error_Activity_LevelLimit:int = 4803;
      
      public static const Error_Activity_EnergyLimit:int = 4804;
      
      public static const Error_Activity_TimesLimit:int = 4805;
      
      public static const Error_Activity_OutOfDate:int = 4806;
      
      public static const Error_Activity_Fuben_Invalid:int = 4807;
      
      public static const Error_Activity_CD:int = 4808;
      
      public static const Error_Activity_TicketNotEnough:int = 4809;
      
      public static const Error_Activity_WrongChannel:int = 4810;
      
      public static const Error_Activity_3366LevelLimit:int = 4811;
      
      public static const Error_Activity_WrongType:int = 4812;
      
      public static const Error_Activity_ContinousTimesLimit:int = 4813;
      
      public static const Error_Activity_InvalidDiamondType:int = 4814;
      
      public static const Error_Activity_InvalidDiamondFlag:int = 4815;
      
      public static const Error_Activity_NotExist:int = 4816;
      
      public static const Error_Activity_CanNotTakeReward:int = 4817;
      
      public static const Error_Activity_RewardNotFound:int = 4818;
      
      public static const Error_Activity_ConvBeginTimeErr:int = 4819;
      
      public static const Error_Activity_ConvEndTimeErr:int = 4820;
      
      public static const Error_Activity_ConvLimitBeginTimeErr:int = 4821;
      
      public static const Error_Activity_ConvLimitEndTimeErr:int = 4822;
      
      public static const Error_Activity_ConvServerParamsErr:int = 4823;
      
      public static const Error_Activity_ConvClientParamsErr:int = 4824;
      
      public static const Error_Activity_ActivitySave2MiscErr:int = 4825;
      
      public static const Error_Activity_ActivityPageSizeLimit:int = 4826;
      
      public static const Error_Activity_UnserializeFail:int = 4827;
      
      public static const Error_Activity_Exist:int = 4828;
      
      public static const Error_Activity_ConvLimitErr:int = 4829;
      
      public static const Error_Activity_ConvShowLimitErr:int = 4830;
      
      public static const Error_Activity_ConfError:int = 4831;
      
      public static const Error_Activity_SignTimesLimit:int = 4832;
      
      public static const Error_Activity_HaveSigned:int = 4833;
      
      public static const Error_Activity_Saleout:int = 4844;
      
      public static const Error_Activity_PersonalShopLmt:int = 4845;
      
      public static const Error_Activity_ActivityCountLimit:int = 4846;
      
      public static const Error_Activity_FundNotExpired:int = 4847;
      
      public static const Error_Activity_FundInvalidId:int = 4848;
      
      public static const Error_Activity_FundNotOpen:int = 4849;
      
      public static const Error_Activity_FundNotBuy:int = 4850;
      
      public static const Error_Activity_FundConsumeNotEnough:int = 4851;
      
      public static const Error_Activity_FundHaveTakeReward:int = 4852;
      
      public static const Error_Activity_FundExpired:int = 4853;
      
      public static const Error_Activity_RedPacketAlready:int = 4854;
      
      public static const Error_Activity_RedPacketQuestLmt:int = 4855;
      
      public static const Error_Activity_RedPacketEmpty:int = 4856;
      
      public static const Error_Activity_DayGoldTicketConsumeLmt:int = 4857;
      
      public static const Error_Activity_HaveBuy:int = 4858;
      
      public static const Error_Arena_GradeNotExist:int = 4900;
      
      public static const Error_Arena_ChallengeMaxCountLimit:int = 4901;
      
      public static const Error_Arena_RandPosOutOfRange:int = 4902;
      
      public static const Error_Arena_HasTakeDailyReward:int = 4903;
      
      public static const Error_Arena_NoEnemyInGrade:int = 4904;
      
      public static const Error_Arena_ChallengeInCoolDown:int = 4905;
      
      public static const Error_Arena_NoFormation:int = 4906;
      
      public static const Error_Arena_EmptyFormation:int = 4907;
      
      public static const Error_Arena_NoStart:int = 4908;
      
      public static const Error_Arena_PlayerNotExist:int = 4909;
      
      public static const Error_Guild_CreateNameEmpty:int = 5000;
      
      public static const Error_Guild_CreateRoleHasGuild:int = 5001;
      
      public static const Error_Guild_CreateRoleLevelFail:int = 5002;
      
      public static const Error_Guild_CreateROleCoinFail:int = 5003;
      
      public static const Error_Guild_CreateNameInvalid:int = 5004;
      
      public static const Error_Guild_GuildNotExist:int = 5005;
      
      public static const Error_Guild_ParamError:int = 5006;
      
      public static const Error_Guild_AccessDeny:int = 5007;
      
      public static const Error_Guild_GuildFull:int = 5008;
      
      public static const Error_Guild_RoleHasGuild:int = 5009;
      
      public static const Error_Guild_RoleInvitedListFull:int = 5010;
      
      public static const Error_Guild_RoleApplySizeFail:int = 5011;
      
      public static const Error_Guild_LastQuitCDFail:int = 5012;
      
      public static const Error_Guild_GuildHasApply:int = 5013;
      
      public static const Error_Guild_GuildJoinListFull:int = 5014;
      
      public static const Error_Guild_RoleNotInApplyList:int = 5015;
      
      public static const Error_Guild_LevelHasBeMax:int = 5016;
      
      public static const Error_Guild_LevelUpCDFail:int = 5017;
      
      public static const Error_Guild_LevelUpExpFail:int = 5018;
      
      public static const Error_Guild_NoticeSizeFail:int = 5019;
      
      public static const Error_Guild_QQStrNotValid:int = 5020;
      
      public static const Error_Guild_FertilizerConfNotFound:int = 5021;
      
      public static const Error_Guild_FertilizerCoinNotEnough:int = 5022;
      
      public static const Error_Guild_FertilizerTicketNotEnough:int = 5023;
      
      public static const Error_Guild_FertilizerLevelInvalid:int = 5024;
      
      public static const Error_Guild_RoleInvitedGuildInvalid:int = 5025;
      
      public static const Error_Guild_ListIndexInvalid:int = 5026;
      
      public static const Error_Guild_CreateNameHasExist:int = 5027;
      
      public static const Error_Guild_FertilizerTimesFail:int = 5028;
      
      public static const Error_Guild_Same:int = 5029;
      
      public static const Error_Guild_NoSame:int = 5030;
      
      public static const Error_Guild_NameSizeLimit:int = 5031;
      
      public static const Error_Guild_ManifSizeLimit:int = 5032;
      
      public static const Error_Guild_MemberNotFound:int = 5033;
      
      public static const Error_Guild_HasInvited:int = 5034;
      
      public static const Error_Guild_RoleHasNoGuild:int = 5035;
      
      public static const Error_Guild_LeaderQuitFail:int = 5036;
      
      public static const Error_Guild_QQInvalid:int = 5037;
      
      public static const Error_Guild_AppointRightFail:int = 5038;
      
      public static const Error_Guild_TargetPosFull:int = 5039;
      
      public static const Error_Guild_DstRoleNotInSameGuild:int = 5040;
      
      public static const Error_Guild_CannotKickSelf:int = 5041;
      
      public static const Error_Guild_LeaderNotExist:int = 5042;
      
      public static const Error_Guild_LeaderHasBeenDelate:int = 5043;
      
      public static const Error_Guild_CanNotDelate:int = 5044;
      
      public static const Error_Guild_LeaderHasBeenDeliverd:int = 5055;
      
      public static const Error_Guild_NoLeaderDeliverd:int = 5056;
      
      public static const Error_Guild_GuildHasBeenDisband:int = 5057;
      
      public static const Error_Guild_RoleDonateLimit:int = 5058;
      
      public static const Error_Guild_CannotFertilizerInJoinDay:int = 5059;
      
      public static const Error_Guild_JoinSameGuildCD:int = 5060;
      
      public static const Error_Guild_DonateAtJoinDay:int = 5061;
      
      public static const Error_Guild_DonateDayBound:int = 5062;
      
      public static const Error_Guild_NeedLeader:int = 5063;
      
      public static const Error_Guild_NoQuickJoinGuild:int = 5064;
      
      public static const Error_Guild_JoinPowerTooSmall:int = 5065;
      
      public static const Error_Guild_RolePowerTooSmall:int = 5066;
      
      public static const Error_Guild_InviteRoleLevelNotEnough:int = 5067;
      
      public static const Error_Guild_CannotTakeTempleRewardInJoinDay:int = 5068;
      
      public static const Error_Vip_CardCfgNull:int = 5100;
      
      public static const Error_Vip_CardCannotReplace:int = 5101;
      
      public static const Error_Vip_BuyCardTicketNotEnough:int = 5102;
      
      public static const Error_Vip_GetGiftHasGot:int = 5103;
      
      public static const Error_Vip_SweepPrivilegeFail:int = 5104;
      
      public static const Error_Vip_SweepFubenStarFail:int = 5105;
      
      public static const Error_Vip_SweepCardLevelLimitFail:int = 5106;
      
      public static const Error_Vip_SweepFubenFail:int = 5107;
      
      public static const Error_Vip_SweepTimesFail:int = 5108;
      
      public static const Error_Vip_BuyCardPriceFail:int = 5109;
      
      public static const Error_Vip_TodayEnergyHasGot:int = 5110;
      
      public static const Error_Vip_RenewalNotVip:int = 5111;
      
      public static const Error_Vip_RenewalTimeFail:int = 5112;
      
      public static const Error_Vip_LevelNotEnough:int = 5113;
      
      public static const Error_Vip_OnlyBuyVipCard:int = 5114;
      
      public static const Error_Vip_OnlyPresentVipCard:int = 5115;
      
      public static const Error_Vip_NoHaveThisPrivilege:int = 5116;
      
      public static const Error_Vip_DailyTDHasPassed:int = 5117;
      
      public static const Error_Vip_TodayTicketHasGot:int = 5118;
      
      public static const Error_Vip_NoVip3SpecialGiftPrivilege:int = 5119;
      
      public static const Error_Temple_NotExist:int = 5200;
      
      public static const Error_Temple_DefenceTeamFull:int = 5201;
      
      public static const Error_Temple_DefenceTeamEmpty:int = 5202;
      
      public static const Error_Temple_HasTakeDailyReward:int = 5203;
      
      public static const Error_Temple_NoOwnByMyGuild:int = 5204;
      
      public static const Error_Temple_NoStart:int = 5205;
      
      public static const Error_Temple_InvalidTempleId:int = 5206;
      
      public static const Error_Temple_OwnByMyGuild:int = 5207;
      
      public static const Error_Temple_GuildLevelLimit:int = 5208;
      
      public static const Error_Temple_DailyRewardFull:int = 5209;
      
      public static const Error_Temple_NoCaptureTemple:int = 5210;
      
      public static const Error_Temple_InWar:int = 5211;
      
      public static const Error_Temple_ArrivalTimeInvalid:int = 5212;
      
      public static const Error_Temple_StatError:int = 5213;
      
      public static const Error_Temple_NoDetect:int = 5214;
      
      public static const Error_Temple_HasDetected:int = 5215;
      
      public static const Error_SignIn_ExceedFillTimes:int = 5300;
      
      public static const Error_SignIn_LessFillTimes:int = 5301;
      
      public static const Error_Market_TradeNumberError:int = 5400;
      
      public static const Error_Market_HasTrade:int = 5401;
      
      public static const Error_Outpost_TeamLimit:int = 5500;
      
      public static const Error_Battle_NoDefendTeam:int = 5501;
      
      public static const Error_Battle_HasDefendTeam:int = 5502;
      
      public static const Error_AuxQuest_HaveNoAuxQuest:int = 5601;
      
      public static const Error_AuxQuest_NotFinish:int = 5602;
      
      public static const Error_AuxQuest_FinishOrOverDue:int = 5603;
      
      public static const Error_WorldBoss_BossHasExist:int = 5700;
      
      public static const Error_WorldBoss_BossNotExist:int = 5701;
      
      public static const Error_WorldBoss_BossDead:int = 5702;
      
      public static const Error_WorldBoss_CheckFightFail:int = 5703;
      
      public static const Error_WorldBoss_TodayHasInspire:int = 5704;
      
      public static const Error_WorldBoss_ReliveTimesFail:int = 5705;
      
      public static const Error_WorldBoss_CheckFaightCDFail:int = 5706;
      
      public static const Error_WorldBoss_NotInActiveTime:int = 5707;
      
      public static const Error_WorldBoss_CheckLevelFail:int = 5708;
      
      public static const Error_WorldBoss_CheckReliveFightFail:int = 5709;
      
      public static const Error_WorldBoss_RoleNotInRank:int = 5710;
      
      public static const Error_WorldBoss_JoinRewardNone:int = 5711;
      
      public static const Error_WorldBoss_JoinRewardHasGot:int = 5712;
      
      public static const Error_DailyTD_NoLotteryTimes:int = 5800;
      
      public static const Error_DailyTD_NoChallengeTimes:int = 5801;
      
      public static const Error_DailyTD_ErrorCardSeq:int = 5802;
      
      public static const Error_DailyTD_ErrorStage:int = 5803;
      
      public static const Error_DailyTD_ChellangeTimeExpire:int = 5804;
      
      public static const Error_DailyTD_FinishTimeExpire:int = 5805;
      
      public static const Error_DailyTD_LotteryTimeExpire:int = 5806;
      
      public static const Error_DailyTD_AlreadyPass:int = 5807;
      
      public static const Error_DailyTD_FormerNotPass:int = 5808;
      
      public static const Error_DailyTD_NoEnoughOptionPlant:int = 5809;
      
      public static const Error_DailyTD_LotteryBeforeTDPass:int = 5810;
      
      public static const Error_DailyTD_HasTrade:int = 5811;
      
      public static const Error_DailyTD_ExceedRefreshLimit:int = 5812;
      
      public static const Error_DailyTD_OpenConiditionNotReach:int = 5813;
      
      public static const Error_GoldExchange_Limit:int = 5900;
      
      public static const Error_GoldExchange_GoldOverFlow:int = 5901;
      
      public static const Error_ExchangeStore_NotFoundStore:int = 6000;
      
      public static const Error_ExchangeStore_NotFoundCfg:int = 6001;
      
      public static const Error_ExchangeStore_NotFoundItemCfg:int = 6002;
      
      public static const Error_ExchangeStore_StoreItemFail:int = 6003;
      
      public static const Error_ExchangeStore_ItemSpaceFail:int = 6004;
      
      public static const Error_ExchangeStore_ItemRemoveFail:int = 6005;
      
      public static const Error_ExchangeStore_RefreshTimesFail:int = 6006;
      
      public static const Error_ExchangeStore_RefreshCfgFail:int = 6007;
      
      public static const Error_ExchangeStore_RefreshItemFail:int = 6008;
      
      public static const Error_ExchangeStore_ItemHasExchanged:int = 6009;
      
      public static const Error_ZombieIsland_NotReachValidLevel:int = 6100;
      
      public static const Error_ZombieIsland_InvalidLevelId:int = 6101;
      
      public static const Error_ZombieIsland_InvalidBoxId:int = 6102;
      
      public static const Error_ZombieIsland_CardDead:int = 6103;
      
      public static const Error_ZombieIsland_RandomZombieFail:int = 6104;
      
      public static const Error_ZombieIsland_LevelLimit:int = 6105;
      
      public static const Error_ZombieIsland_CanNotRefresh:int = 6106;
      
      public static const Error_ZombieIsland_AlreadyRefreshed:int = 6107;
      
      public static const Error_ZombieIsland_RewardHasTaken:int = 6108;
      
      public static const Error_ZombieIsland_NotEnoughVipLevel:int = 6109;
      
      public static const Error_ZombieIsland_ExceedMaxDeadCard:int = 6110;
      
      public static const Error_ZombieIsland_AlreadyPreCard:int = 6111;
      
      public static const Error_ZombieIsland_NotPreCard:int = 6112;
      
      public static const Error_ZombieIsland_ExceedPreCardNum:int = 6113;
      
      public static const Error_ZombieIsland_LevelUpNeedPass:int = 6114;
      
      public static const Error_Treasure_NotInTime:int = 6200;
      
      public static const Error_Treasure_GuildLevelNotEnough:int = 6201;
      
      public static const Error_Treasure_MapNotExist:int = 6202;
      
      public static const Error_Treasure_GuildPlayerExceed:int = 6203;
      
      public static const Error_Treasure_HouseNotExist:int = 6204;
      
      public static const Error_Treasure_NotSameGuild:int = 6205;
      
      public static const Error_Treasure_AreadyHasPlayer:int = 6206;
      
      public static const Error_Treasure_HouseSideError:int = 6207;
      
      public static const Error_Treasure_SearchFormationNotExist:int = 6208;
      
      public static const Error_Treasure_SeizeFormationNotExist:int = 6209;
      
      public static const Error_Treasure_AreadyInSearch:int = 6210;
      
      public static const Error_Treasure_AreadyHasMap:int = 6211;
      
      public static const Error_Treasure_SearchCDTimeout:int = 6212;
      
      public static const Error_Treasure_SeizeCDTimeout:int = 6213;
      
      public static const Error_Treasure_SideNotMatchMap:int = 6214;
      
      public static const Error_Treasure_NotHaveMap:int = 6215;
      
      public static const Error_Treasure_SearchCountUseUp:int = 6216;
      
      public static const Error_Treasure_LimitBroadCastGroup:int = 6217;
      
      public static const Error_Treasure_RoleNotExist:int = 6218;
      
      public static const Error_Treasure_HouseEmpty:int = 6219;
      
      public static const Error_Nutrition_TempBagLimit:int = 6300;
      
      public static const Error_Nutrition_ReagentLimit:int = 6301;
      
      public static const Error_Nutrition_DieticianNotCall:int = 6302;
      
      public static const Error_Nutrition_ReagentNotExist:int = 6303;
      
      public static const Error_Nutrition_PositionNotExist:int = 6304;
      
      public static const Error_Nutrition_SlotNotExist:int = 6305;
      
      public static const Error_Nutrition_SameReagentUid:int = 6306;
      
      public static const Error_Nutrition_InvalidTargetLevel:int = 6307;
      
      public static const Error_Nutrition_NotEnoughExp:int = 6308;
      
      public static const Error_Nutrition_WhiteNotCollect:int = 6309;
      
      public static const Error_Nutrition_GoldNotExtract:int = 6310;
      
      public static const Error_Nutrition_CoinLimit:int = 6311;
      
      public static const Error_Nutrition_ReagentInBag:int = 6312;
      
      public static const Error_Nutrition_FailToMerge:int = 6313;
      
      public static const Error_Nutrition_CostType:int = 6314;
      
      public static const Error_Nutrition_ExtractType:int = 6315;
      
      public static const Error_Nutrition_RandomReagent:int = 6316;
      
      public static const Error_Nutrition_GoldReagentLimit:int = 6317;
      
      public static const Error_Nutrition_ReagentWithSameType:int = 6318;
      
      public static const Error_Nutrition_SlotNotEmpty:int = 6319;
      
      public static const Error_PayShop_GetTokenFailed:int = 6400;
      
      public static const Error_PayShop_PayProcessError:int = 6401;
      
      public static const Error_PayShop_FindRoleByOpenFail:int = 6402;
      
      public static const Error_PayShop_PayConfirmFail:int = 6403;
      
      public static const Error_PayShop_GoodsCfgNull:int = 6404;
      
      public static const Error_PayShop_GoodsCannotBuy:int = 6405;
      
      public static const Error_PayShop_PayItemParseFail:int = 6406;
      
      public static const Error_PayShop_CheckGoodsIdFail:int = 6407;
      
      public static const Error_PayShop_CheckTokenFail:int = 6408;
      
      public static const Error_PayShop_CheckBillNoFail:int = 6409;
      
      public static const Error_PayShop_AddItemFail:int = 6410;
      
      public static const Error_PayShop_DayTicketGetFail:int = 6411;
      
      public static const Error_PayShop_OpenIDNull:int = 6412;
      
      public static const Error_PayShop_GiftTicketGetFail:int = 6413;
      
      public static const Error_PayShop_NotPay:int = 6414;
      
      public static const Error_OnlineReward_HasTake:int = 6500;
      
      public static const Error_OnlineReward_NotEnoughTime:int = 6501;
      
      public static const Error_SevenDayLogin_ExceedSevenDay:int = 6600;
      
      public static const Error_SevenDayLogin_HasTakeReward:int = 6601;
      
      public static const Error_SevenDayLogin_ProgressNotFinish:int = 6602;
      
      public static const Error_NoEndTDRank_ModeNotExist:int = 6700;
      
      public static const Error_NoEndTDRank_RankLimit:int = 6701;
      
      public static const Error_NoEndTDRank_RankError:int = 6702;
      
      public static const Error_NoEndTDRank_VoteTimesLimit:int = 6703;
      
      public static const Error_NoEndTDRank_RoleNotExist:int = 6704;
      
      public static const Error_NoEndTDRank_CannotVoteYourSelf:int = 6705;
      
      public static const Error_NoEndTDRank_hadVote:int = 6706;
      
      public static const Error_DailyPay_NotPay:int = 6800;
      
      public static const Error_DailyPay_NotGetItem:int = 6801;
      
      public static const Error_DailyPay_TicketNotEnough:int = 6802;
      
      public static const Error_DailyPay_RepeatGetItem:int = 6803;
      
      public static const Error_DailyPay_Exchanged:int = 6804;
      
      public static const Error_DailyPay_ExchangeLimit:int = 6805;
      
      public static const Error_ActivityNoData:int = 6900;
      
      public static const Error_GrouponNoItem:int = 6901;
      
      public static const Error_CreditNotEnough:int = 6902;
      
      public static const Error_GrouponNotInCache:int = 6903;
      
      public static const Error_Groupon_NotPayed:int = 6904;
      
      public static const Error_Groupon_HasTakenReward:int = 6905;
      
      public static const Error_Exceed_Exchange_Limit:int = 6906;
      
      public static const Error_Groupon_RewardNotTaken:int = 6907;
      
      public static const Error_Groupon_HasBoughtToday:int = 6908;
      
      public static const Error_Groupon_NotOpen:int = 6909;
      
      public static const Error_QQBrowser_NotQQBrowser:int = 7000;
      
      public static const Error_Promotion_NotExist:int = 7100;
      
      public static const Error_Promotion_ExceedBuyLimit:int = 7101;
      
      public static const Error_NoEndTD_ModeNotExist:int = 7200;
      
      public static const Error_NoEndTD_ChellangeTimeExpire:int = 7201;
      
      public static const Error_NoEndTD_FinishTimeExpire:int = 7202;
      
      public static const Error_NoEndTD_ExceedChallengeLimit:int = 7203;
      
      public static const Error_NoEndTD_NoRewardToBeToken:int = 7204;
      
      public static const Error_NoEndTD_ExceedTDLevel:int = 7205;
      
      public static const Error_NoEndTD_ExceedPlantMaxLevel:int = 7206;
      
      public static const Error_NoEndTD_RainLack:int = 7207;
      
      public static const Error_NoEndTD_WeekRankNotExist:int = 7208;
      
      public static const Error_NoEndTD_NotTodayMode:int = 7209;
      
      public static const Error_NoEndTD_RankBoardTypeNotExist:int = 7210;
      
      public static const Error_NoEndTD_RecordSizeInvalid:int = 7211;
      
      public static const Error_NoEndTD_LevelInvalid:int = 7212;
      
      public static const Error_Shelling_ExchangeItem:int = 7300;
      
      public static const Error_Shelling_ExchangeNumLimit:int = 7301;
      
      public static const Error_Shelling_TicketNoEnough:int = 7302;
      
      public static const Error_Shelling_WeightCalc:int = 7303;
      
      public static const Error_OfflineReward_HasTake:int = 7400;
      
      public static const Error_OfflineReward_NotEnoughActiveValue:int = 7401;
      
      public static const Error_OfflineReward_NotEnoughLoginDates:int = 7402;
      
      public static const Error_OfflineReward_IsNotActive:int = 7403;
      
      public static const Error_ThanksGiving_NoRemainLottery:int = 7500;
      
      public static const Error_ThanksGiving_UserLevelLimit:int = 7501;
      
      public static const Error_ThanksGiving_EmptyItemList:int = 7502;
      
      public static const Error_ThanksGiving_ItemExceedLimit:int = 7603;
      
      public static const Error_ThanksGiving_QbExceedLimit:int = 7604;
      
      public static const Error_LevelReward_NotInit:int = 7610;
      
      public static const Error_LevelReward_HasTakeReward:int = 7611;
      
      public static const Error_ScrewUp_InvalidStageId:int = 7700;
      
      public static const Error_ScrewUp_CanNotSweep:int = 7701;
      
      public static const Error_ScrewUp_RestartNumLimit:int = 7702;
      
      public static const Error_ScrewUp_ChestHasTaken:int = 7703;
      
      public static const Error_ScrewUp_LevelLimit:int = 7704;
      
      public static const Error_ScrewUp_NoChallengeTimes:int = 7705;
      
      public static const Error_Buff_SameBuffUnexpired:int = 7803;
      
      public static const Error_RankActivity_RankPeriod:int = 7900;
      
      public static const Error_RankActivity_NotRankPeriod:int = 7901;
      
      public static const Error_RankArena_NotStart:int = 8001;
      
      public static const Error_RankArena_OpponentNotExist:int = 8002;
      
      public static const Error_RankArena_OpponentRankChanged:int = 8003;
      
      public static const Error_RankArena_RoleNotInRankBoard:int = 8004;
      
      public static const Error_RankArena_RankNotExist:int = 8005;
      
      public static const Error_RankArena_RoleRankNotMatch:int = 8006;
      
      public static const Error_RankArena_NoSuchFormationType:int = 8007;
      
      public static const Error_RankArena_OnlyOneInFormation:int = 8008;
      
      public static const Error_RankArena_HadTakeReward:int = 8009;
      
      public static const Error_RankArena_ChallengeInCoolDown:int = 8010;
      
      public static const Error_RankArena_RoleNotInArena:int = 8011;
      
      public static const Error_RankArena_NoNeedSwapRank:int = 8012;
      
      public static const Error_RankArena_RankPageNotExist:int = 8013;
      
      public static const Error_RankArena_RankPageSizeCanNotBeZero:int = 8014;
      
      public static const Error_RankArena_ChallengeNotInCoolDown:int = 8015;
      
      public static const Error_RankArena_RoleRankChanged:int = 8016;
      
      public static const Error_SnowMan_ChellangeTimeExpire:int = 8100;
      
      public static const Error_SnowMan_NoChellangeTimes:int = 8101;
      
      public static const Error_SnowMan_NoSuchMode:int = 8102;
      
      public static const Error_SnowMan_FountainIdExceed:int = 8103;
      
      public static const Error_SnowMan_FinishTimeExpire:int = 8104;
      
      public static const Error_SnowMan_KillNumError:int = 8105;
      
      public static const Error_SnowMan_KillNumExceed:int = 8106;
      
      public static const Error_SnowMan_OpenTimeExceed:int = 8107;
      
      public static const Error_SnowMan_ChestNumError:int = 8108;
      
      public static const Error_SnowMan_KeyNumError:int = 8109;
      
      public static const Error_Hoodle_CountLimit:int = 8200;
      
      public static const Error_Hoodle_AllDead:int = 8201;
      
      public static const Error_Hoodle_HaveTokenReward:int = 8202;
      
      public static const Error_Melee_RoleNotInMelee:int = 8300;
      
      public static const Error_Melee_NotStart:int = 8301;
      
      public static const Error_Melee_VipSignNotStart:int = 8302;
      
      public static const Error_Melee_AllSignNotStart:int = 8303;
      
      public static const Error_Melee_CannotSetFormation:int = 8304;
      
      public static const Error_Melee_CanNotTakeReward:int = 8305;
      
      public static const Error_Melee_CannotInspire:int = 8306;
      
      public static const Error_Melee_ExceedInspireLimit:int = 8307;
      
      public static const Error_Melee_HasTakeReward:int = 8308;
      
      public static const Error_SlotMachine_CreditNotEnough:int = 8400;
      
      public static const Error_SlotMachine_ExchangeTimesLimit:int = 8401;
      
      public static const Error_SlotMachine_ExchangeItemNotExist:int = 8402;
      
      public static const Error_SlotMachine_RewardNotExist:int = 8403;
      
      public static const Error_SlotMachine_RewardHasTaken:int = 8404;
      
      public static const Error_SlotMachine_RewardCanNotTake:int = 8405;
      
      public static const Error_SlotMachine_CoinCanNotTake:int = 8406;
      
      public static const Error_GuildFuben_GuildNotExist:int = 8500;
      
      public static const Error_GuildFuben_ChapterTableNotExist:int = 8501;
      
      public static const Error_GuildFuben_ChapterNotOpened:int = 8502;
      
      public static const Error_GuildFuben_NotLeader:int = 8503;
      
      public static const Error_GuildFuben_ChapterAlreadyOpened:int = 8504;
      
      public static const Error_GuildFuben_CohesionNotEnough:int = 8505;
      
      public static const Error_GuildFuben_LevelNotEnough:int = 8506;
      
      public static const Error_GuildFuben_OpenDayNotEnough:int = 8507;
      
      public static const Error_GuildFuben_ChapterNotFound:int = 8508;
      
      public static const Error_GuildFuben_ChapterHasPassed:int = 8509;
      
      public static const Error_GuildFuben_FormationNotExist:int = 8510;
      
      public static const Error_GuildFuben_StageFail:int = 8511;
      
      public static const Error_GuildFuben_MonsterFail:int = 8512;
      
      public static const Error_GuildFuben_JoinTimeFail:int = 8513;
      
      public static const Error_GuildFuben_FubenModeFail:int = 8514;
      
      public static const Error_GuildFuben_DayTimesFail:int = 8515;
      
      public static const Error_GuildFuben_SingleDamageRewardHasToken:int = 8516;
      
      public static const Error_GuildFuben_TotalDamageRewardHasToken:int = 8517;
      
      public static const Error_GuildFuben_DayRewardNone:int = 8518;
      
      public static const Error_GuildFuben_DayRewardHasGot:int = 8519;
      
      public static const Error_GuildFuben_ChapterNotPass:int = 8520;
      
      public static const Error_GuildFuben_RankPageNotExist:int = 8521;
      
      public static const Error_GuildFuben_FormationEmpty:int = 8522;
      
      public static const Error_Garden_FieldNotExist:int = 8600;
      
      public static const Error_Garden_PreviusFieldLocked:int = 8601;
      
      public static const Error_Garden_FieldAlreadyUnlocked:int = 8602;
      
      public static const Error_Garden_PotAlreadyBought:int = 8603;
      
      public static const Error_Garden_PotNotBought:int = 8604;
      
      public static const Error_Garden_FlowerAlreadyPlanted:int = 8605;
      
      public static const Error_Garden_FlowerNotPlanted:int = 8606;
      
      public static const Error_Garden_NotSevenColorFlower:int = 8607;
      
      public static const Error_Garden_AlreadyFertilized:int = 8608;
      
      public static const Error_Garden_AlreadyForeverPet:int = 8609;
      
      public static const Error_Garden_FlowerAlreadyGrown:int = 8610;
      
      public static const Error_Garden_NotItemFlower:int = 8611;
      
      public static const Error_Garden_PetNotExist:int = 8612;
      
      public static const Error_Garden_PetAlreadyWorking:int = 8613;
      
      public static const Error_Garden_KettleLimit:int = 8614;
      
      public static const Error_Garden_VipLimit:int = 8615;
      
      public static const Error_Garden_FertilizeriNoEnough:int = 8616;
      
      public static const Error_Carden_AutoFertilizePrivilege:int = 8617;
      
      public static const Error_WorldTree_MaxLevel:int = 8700;
      
      public static const Error_WorldTree_FosterType:int = 8701;
      
      public static const Error_WorldTree_FreeTimes:int = 8702;
      
      public static const Error_WorldTree_LevelNoEnough:int = 8703;
      
      public static const Error_Spring_HasGetCredits:int = 8800;
      
      public static const Error_Spring_BoxHasOpen:int = 8801;
      
      public static const Error_Spring_CreditNoEnough:int = 8802;
      
      public static const Error_Spring_IndexNotExist:int = 8803;
      
      public static const Error_Welfare_CanNotTake:int = 9000;
      
      public static const Error_Welfare_HasTaken:int = 9001;
      
      public static const Error_Welfare_NoSuchFindType:int = 9002;
      
      public static const Error_Welfare_SuchResourceNoReward:int = 9003;
      
      public static const Error_Adventure_CanNotRefresh:int = 9200;
      
      public static const Error_Adventure_PlaceNotEnough:int = 9201;
      
      public static const Error_Adventure_CanNotTakeAdventure:int = 9202;
      
      public static const Error_Adventure_NotValidPlaceId:int = 9203;
      
      public static const Error_Adventure_NotValidRouteId:int = 9204;
      
      public static const Error_Adventure_DailyTakeTimeLimit:int = 9205;
      
      public static const Error_SecondPwd_PwdSizeError:int = 9300;
      
      public static const Error_SecondPwd_PwdFormatError:int = 9301;
      
      public static const Error_SecondPwd_InReset:int = 9302;
      
      public static const Error_SecondPwd_PwdError:int = 9303;
      
      public static const Error_SecondPwd_OldEqualNew:int = 9304;
      
      public static const Error_SecondPwd_ExceedWrongTime:int = 9305;
      
      public static const Error_SecondPwd_NeedCheck:int = 9306;
      
      public static const Error_SecondPwd_CannotSet:int = 9307;
      
      public static const Error_CastleAdventure_CanNotMoveToNode:int = 9400;
      
      public static const Error_CastleAdventure_MapNotExist:int = 9401;
      
      public static const Error_CastleAdventure_RoutineHasNotChest:int = 9402;
      
      public static const Error_CastleAdventure_ChestNotExist:int = 9403;
      
      public static const Error_CastleAdventure_RoutineVisited:int = 9404;
      
      public static const Error_CastleAdventure_NoDiceTimes:int = 9405;
      
      public static const Error_CastleAdventure_HasSteps:int = 9406;
      
      public static const Error_CastleAdventure_NoSteps:int = 9407;
      
      public static const Error_CastleAdventure_AllMapsOnEnd:int = 9408;
      
      public static const Error_CastleAdventure_ChestNotAllOpen:int = 9409;
      
      public static const Error_CastleAdventure_GiveupMustOnEnd:int = 9410;
      
      public static const Error_CastleAdventure_CompleteRewardTaked:int = 9411;
      
      public static const Error_CastleAdventure_CanNotReset:int = 9412;
      
      public static const Error_CastleAdventure_ResetNumNotEnough:int = 9413;
      
      public static const Error_DragonBoat_InvalidMemberId:int = 9500;
      
      public static const Error_DragonBoat_CreditNotEnough:int = 9501;
      
      public static const Error_DragonBoat_ExchangeTimesLimit:int = 9502;
      
      public static const Error_Scratch_NoChance:int = 9600;
      
      public static const Error_GuildFight_Pair:int = 9701;
      
      public static const Error_GuildFight_Stage:int = 9702;
      
      public static const Error_GuildFight_Way:int = 9703;
      
      public static const Error_GuildFight_WayData:int = 9704;
      
      public static const Error_GuildFight_RoleData:int = 9705;
      
      public static const Error_GuildFight_FightException:int = 9706;
      
      public static const Error_GuildFight_Cycles:int = 9707;
      
      public static const Error_GuildFight_Applied:int = 9708;
      
      public static const Error_GuildFight_CanNotApply:int = 9709;
      
      public static const Error_GuildFight_ApplyEnd:int = 9710;
      
      public static const Error_GuildFight_FightRecord:int = 9711;
      
      public static const Error_GuildFight_FormationIndex:int = 9712;
      
      public static const Error_GuildFight_HasGetReward:int = 9713;
      
      public static const Error_GuildFight_NoReward:int = 9714;
      
      public static const Error_GuildFight_CanNotSetCycles:int = 9716;
      
      public static const Error_GuildFight_HasBet:int = 9717;
      
      public static const Error_GuildFight_BetCoin:int = 9718;
      
      public static const Error_GuildFight_HasGetBetReward:int = 9719;
      
      public static const Error_GuildFight_GuildNum:int = 9720;
      
      public static const Error_GuildFight_Formation1Empty:int = 9721;
      
      public static const Error_GuildFight_Formation2Empty:int = 9722;
      
      public static const Error_GuildFight_JoinTime:int = 9723;
      
      public static const Error_GuildFight_NotQuitGuild:int = 9724;
      
      public static const Error_GuildFight_NotDisbandGuild:int = 9725;
      
      public static const Error_GuildFight_NoOpen:int = 9726;
      
      public static const Error_DailyVow_LevelOpenLimit:int = 9800;
      
      public static const Error_DailyVow_VipOpenLimit:int = 9801;
      
      public static const Error_DailyVow_SingleTimesLimit:int = 9802;
      
      public static const Error_DailyVow_TotalTimesLimit:int = 9803;
      
      public static const Error_DailyVow_TypeNotExist:int = 9804;
      
      public static const Error_DailyVow_MaxLevel:int = 9805;
      
      public static const Error_DailyVow_BigVowInvalid:int = 9806;
      
      public static const Error_SuperFlop_OpenLimit:int = 9900;
      
      public static const Error_SuperFlop_TimesUseUp:int = 9901;
      
      public static const Error_SuperFlop_HasNoTimes:int = 9902;
      
      public static const Error_TDRank_RankLimit:int = 10000;
      
      public static const Error_Tanabata_StoneNoEnough:int = 11000;
      
      public static const Error_Tanabata_ExchangeNumLimit:int = 11001;
      
      public static const Error_Tanabata_ExchangeItem:int = 11002;
      
      public static const Error_Tanabata_NumLimit:int = 11003;
      
      public static const Error_Tanabate_Type:int = 11004;
      
      public static const Error_PlantTest_ChapterInfoNotExist:int = 11100;
      
      public static const Error_PlantTest_StageNotOpen:int = 11101;
      
      public static const Error_PlantTest_LastStageNotPass:int = 11102;
      
      public static const Error_PlantTest_InvalidSubChapterId:int = 11103;
      
      public static const Error_PlantTest_ChallengeTimesLimit:int = 11104;
      
      public static const Error_PlantTest_InvalidSweep:int = 11105;
      
      public static const Error_PlantTest_RestartTimesLimit:int = 11106;
      
      public static const Error_PlantTest_RestartCostNotEnough:int = 11107;
      
      public static const Error_PlantTest_DefenseTeamResetTime:int = 11108;
      
      public static const Error_PlantTest_PlantLimit:int = 11109;
      
      public static const Error_MergeServerWar_Ranking:int = 11200;
      
      public static const Error_MergeServerWar_HasTakeReward:int = 11201;
      
      public static const Error_MergeServerWar_NoReward:int = 11202;
      
      public static const Error_Halloween_CannotTakeHammer:int = 11300;
      
      public static const Error_Halloween_AllPumpkinDead:int = 11301;
      
      public static const Error_Halloween_PumpkinNotDead:int = 11302;
      
      public static const Error_Halloween_AlreadyTakeReward:int = 11303;
      
      public static const Error_Halloween_PumpkinRewardNotTake:int = 11304;
      
      public static const Error_Halloween_AlreadyTakeFinalReward:int = 11305;
      
      public static const Error_Halloween_NotTakeFinalReward:int = 11306;
      
      public static const Error_Halloween_ResetTimesUsedOut:int = 11307;
      
      public static const Error_Halloween_NoFullServerReward:int = 11308;
      
      public static const Error_LuckyNotEnough:int = 11400;
      
      public static const Error_RefineAttributeExceedLimit:int = 11401;
      
      public static const Error_Question_NotInActiveTime:int = 11500;
      
      public static const Error_Question_CannotAnswer:int = 11501;
      
      public static const Error_Question_NeedQuestionData:int = 11502;
      
      public static const Error_Question_CannotTakeReward:int = 11503;
      
      public static const Error_GuildSkill_ContribValNotEnough:int = 11600;
      
      public static const Error_GuildSkill_ReachMaxLevel:int = 11601;
      
      public static const Error_LightNotEnough:int = 11700;
      
      public static const Error_Guard_Unserialize:int = 11701;
      
      public static const Error_Guard_IdExist:int = 11702;
      
      public static const Error_Guard_InvalidId:int = 11703;
      
      public static const Error_Guard_ReachMaxCount:int = 11704;
      
      public static const Error_Guard_NoGuild:int = 11705;
      
      public static const Error_Guard_IsFull:int = 11706;
      
      public static const Error_Guard_AlreadyInvite:int = 11707;
      
      public static const Error_Guard_NotSameGuild:int = 11708;
      
      public static const Error_Guard_RefreshTargetFail:int = 11709;
      
      public static const Error_Guard_NoTarget:int = 11710;
      
      public static const Error_Guard_TimeoutTraget:int = 11711;
      
      public static const Error_Guard_NotFinish:int = 11712;
      
      public static const Error_Guard_AlreadyTakenReward:int = 11713;
      
      public static const Error_Guard_AlreadyJoin:int = 11714;
      
      public static const Error_Guard_JoinTimeLimit:int = 11715;
      
      public static const Error_Guard_CardInFormation:int = 11716;
      
      public static const Error_LuckyStar_NotExist:int = 11817;
      
      public static const Error_LuckyStar_NoDailyPack:int = 11818;
      
      public static const Error_LuckyStar_NoProduct:int = 11819;
      
      public static const Error_LuckyStar_PurchaseExpired:int = 11820;
      
      public static const Error_LuckyStar_PurchaseLimit:int = 11821;
      
      public static const Error_GeneTest_ChapterInfoNotExist:int = 11900;
      
      public static const Error_GeneTest_StageNotOpen:int = 11901;
      
      public static const Error_GeneTest_LastStageNotPass:int = 11902;
      
      public static const Error_GeneTest_InvalidSubChapterId:int = 11903;
      
      public static const Error_GeneTest_ChallengeTimesLimit:int = 11904;
      
      public static const Error_GeneTest_InvalidSweep:int = 11905;
      
      public static const Error_GeneTest_RestartTimesLimit:int = 11906;
      
      public static const Error_GeneTest_RestartCostNotEnough:int = 11907;
      
      public static const Error_GeneTest_DefenseTeamResetTime:int = 11908;
      
      public static const Error_GeneTest_PlantLimit:int = 11909;
      
      public static const Error_GeneTest_SimpleStageNotPass:int = 11910;
      
      public static const Error_TopFight_NoBetTimes:int = 12000;
      
      public static const Error_TopFight_BetValueLimit:int = 12001;
      
      public static const Error_TopFight_CanNotBet:int = 12002;
      
      public static const Error_TopFight_RepeatBet:int = 12003;
      
      public static const Error_TopFight_AlreadyTakeReward:int = 12004;
      
      public static const Error_Item_BagNoLeftSpaceForAction:int = 12100;
      
      public static const Error_Puppet_BagNoLeftSpace:int = 12200;
      
      public static const Error_Puppet_CannotFind:int = 12201;
      
      public static const Error_Puppet_AlreadyGet:int = 12202;
      
      public static const Error_Puppet_UserLevelLimitUp:int = 12203;
      
      public static const Error_Puppet_ReachMaxQuality:int = 12204;
      
      public static const Error_Puppet_CannotUpgradeQuality:int = 12205;
      
      public static const Error_Puppet_SparLevelNotEnough:int = 12206;
      
      public static const Error_Puppet_SkillValNotEnough:int = 12207;
      
      public static const Error_Puppet_SkillValIsFull:int = 12208;
      
      public static const Error_Puppet_EnergyNotEnough:int = 12209;
      
      public static const Error_Puppet_EnergyIsFull:int = 12210;
      
      public static const Error_Puppet_LevelNotEnough:int = 12211;
      
      public static const Error_Puppet_LevelLimit:int = 12212;
      
      public static const Error_Puppet_CannotRecruit:int = 12213;
      
      public static const Error_Puppet_QualityLimitUp:int = 12214;
      
      public static const Error_Puppet_StarNotEnough:int = 12215;
      
      public static const Error_Puppet_SkillLevelNotEnough:int = 12216;
      
      public static const Error_Puppet_MaxQualitySkill:int = 12217;
      
      public static const Error_Puppet_SkillQualityMaxLevel:int = 12218;
      
      public static const Error_PuppetFuben_NoThisStage:int = 12300;
      
      public static const Error_PuppetFuben_StarNotEnough:int = 12301;
      
      public static const Error_PuppetFuben_StageNotUnlock:int = 12302;
      
      public static const Error_PuppetFuben_PreStageNotPass:int = 12303;
      
      public static const Error_PuppetFuben_PreChapterNotPass:int = 12304;
      
      public static const Error_PuppetFuben_PreModeNotPass:int = 12305;
      
      public static const Error_PuppetFuben_NeedFormationLeader:int = 12306;
      
      public static const Error_NewScrewUp_InvalidStageId:int = 12400;
      
      public static const Error_NewScrewUp_CanNotSweep:int = 12401;
      
      public static const Error_NewScrewUp_RestartNumLimit:int = 12402;
      
      public static const Error_NewScrewUp_ChestHasTaken:int = 12403;
      
      public static const Error_NewScrewUp_LevelLimit:int = 12404;
      
      public static const Error_NewScrewUp_NoChallengeTimes:int = 12405;
      
      public static const Error_ExpeditionFight_InBanActionCD:int = 12500;
      
      public static const Error_ExpeditionFight_NotInBanActionCD:int = 12501;
      
      public static const Error_ExpeditionFight_CannotCleanCD:int = 12502;
      
      public static const Error_ExpeditionFight_NpcNotAlive:int = 12503;
      
      public static const Error_NoEndFuben_Closed:int = 12600;
      
      public static const Error_NoEndFuben_AlreadyPreCard:int = 12601;
      
      public static const Error_NoEndFuben_NotPreCard:int = 12602;
      
      public static const Error_PrestigeNotEnough:int = 12700;
       
      
      public function ErrorDefineType()
      {
         super();
      }
   }
}
