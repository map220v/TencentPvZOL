package com.qq.modules.login.service
{
   import PVZ.Cmd.Cmd_Aas_Notice_SC;
   import PVZ.Cmd.Cmd_Arena_GetMyInfo_CS;
   import PVZ.Cmd.Cmd_Battle_GetFormation_CS;
   import PVZ.Cmd.Cmd_Battle_GetFormation_SC;
   import PVZ.Cmd.Cmd_Battle_HasNewFormationPos_CS;
   import PVZ.Cmd.Cmd_Battle_HasNewFormationPos_SC;
   import PVZ.Cmd.Cmd_Battle_SyncNewFormation_SC;
   import PVZ.Cmd.Cmd_Card_GetPackage_CS;
   import PVZ.Cmd.Cmd_Card_GetPackage_SC;
   import PVZ.Cmd.Cmd_Card_SyncFullInfo_SC;
   import PVZ.Cmd.Cmd_CheckOldUser_SC;
   import PVZ.Cmd.Cmd_City_MergeServerFlag_CS;
   import PVZ.Cmd.Cmd_City_MergeServerFlag_SC;
   import PVZ.Cmd.Cmd_Init_SC;
   import PVZ.Cmd.Cmd_LogicError_SC;
   import PVZ.Cmd.Cmd_Mail_NewMessage_SC;
   import PVZ.Cmd.Cmd_Market_BuyEnergy_CS;
   import PVZ.Cmd.Cmd_Market_BuyEnergy_SC;
   import PVZ.Cmd.Cmd_SetSignature_SC;
   import PVZ.Cmd.Cmd_Sync3366Info_SC;
   import PVZ.Cmd.Cmd_SyncAasInfo_SC;
   import PVZ.Cmd.Cmd_SyncBuildingInfo_SC;
   import PVZ.Cmd.Cmd_SyncCoin_SC;
   import PVZ.Cmd.Cmd_SyncContribVal_SC;
   import PVZ.Cmd.Cmd_SyncEnergy_SC;
   import PVZ.Cmd.Cmd_SyncExp_SC;
   import PVZ.Cmd.Cmd_SyncFame_SC;
   import PVZ.Cmd.Cmd_SyncFightPower_SC;
   import PVZ.Cmd.Cmd_SyncFosterTicket_SC;
   import PVZ.Cmd.Cmd_SyncFriendPoint_SC;
   import PVZ.Cmd.Cmd_SyncLevel_SC;
   import PVZ.Cmd.Cmd_SyncLight_SC;
   import PVZ.Cmd.Cmd_SyncLucky_SC;
   import PVZ.Cmd.Cmd_SyncName_SC;
   import PVZ.Cmd.Cmd_SyncPresentTicket_SC;
   import PVZ.Cmd.Cmd_SyncPrestige_SC;
   import PVZ.Cmd.Cmd_SyncPuppetEnergy_SC;
   import PVZ.Cmd.Cmd_SyncPuppetSkillVal_SC;
   import PVZ.Cmd.Cmd_SyncQQFaceURL_SC;
   import PVZ.Cmd.Cmd_SyncSun_SC;
   import PVZ.Cmd.Cmd_SyncTicket_SC;
   import PVZ.Cmd.Cmd_SyncUnlockPlant_SC;
   import PVZ.Cmd.Cmd_TD_OpenPrivilege_SC;
   import PVZ.Cmd.Cmd_TD_PrivilegeInfo_SC;
   import PVZ.Cmd.Cmd_TD_RequestTDInfo_SC;
   import PVZ.Cmd.Cmd_VipInfo_SC;
   import PVZ.Cmd.Cmd_Vip_SyncVipInfo_SC;
   import PVZ.Cmd.Dto_FormationInfo;
   import PVZ.Cmd.E_AasAdultType;
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.SceneCenter;
   import com.qq.TDPrivilegeInfo;
   import com.qq.constant.city.CityConstant;
   import com.qq.constant.quest.QuestConstant;
   import com.qq.modules.addict.command.AddictCmd;
   import com.qq.modules.arena.service.ArenaService;
   import com.qq.modules.basic.model.templates.ServerConfigTemplateFactory;
   import com.qq.modules.battleLineup.constant.BattleLineupConst;
   import com.qq.modules.buy.command.MonthCardCmd;
   import com.qq.modules.city.model.vo.CityData;
   import com.qq.modules.dummy.DummyConst;
   import com.qq.modules.guide.command.GuideCmd;
   import com.qq.modules.guide.model.GuideUIData;
   import com.qq.modules.login.command.LoginServerCmd;
   import com.qq.modules.main.command.CommonCmd;
   import com.qq.modules.main.command.GameFlowCmd;
   import com.qq.modules.main.command.LevelObserverCmd;
   import com.qq.modules.main.command.LevelRewardCmd;
   import com.qq.modules.main.logic.initData.InitDataManager;
   import com.qq.modules.main.model.ActorModel;
   import com.qq.modules.main.model.AddictInfo;
   import com.qq.modules.main.model.PrivilegeDiamond;
   import com.qq.modules.main.server.ErrorHanderManager;
   import com.qq.modules.main.server.PvzSocketService;
   import com.qq.modules.offlineReward.OfflineRewardGlobal;
   import com.qq.modules.plantEvolution.PlantEvolutionConst;
   import com.qq.modules.quest.command.QuestServiceCmd;
   import com.qq.modules.rename.command.RenameCmd;
   import com.qq.net.IdleMessageSendManager;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.DateUtils;
   import com.qq.utils.IconUtil;
   import com.qq.utils.external.QExternalUtil;
   import flash.events.Event;
   import org.as3commons.logging.api.getLogger;
   import org.robotlegs.mvcs.Actor;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class LoginService extends Actor
   {
       
      
      [Inject]
      public var myServer:PvzSocketService;
      
      [Inject]
      public var actorModel:ActorModel;
      
      [Inject]
      public var cityData:CityData;
      
      [Inject]
      public var arenaServer:ArenaService;
      
      public function LoginService()
      {
         super();
      }
      
      public function init() : void
      {
         this.myServer.eventDispatcher.addEventListener(Cmd_Init_SC.$MessageID,this.serverDataHandler);
         this.myServer.eventDispatcher.addEventListener(Cmd_SyncCoin_SC.$MessageID,this.serverDataHandler);
         this.myServer.eventDispatcher.addEventListener(Cmd_SyncExp_SC.$MessageID,this.serverDataHandler);
         this.myServer.eventDispatcher.addEventListener(Cmd_SyncFosterTicket_SC.$MessageID,this.serverDataHandler);
         this.myServer.eventDispatcher.addEventListener(Cmd_SyncName_SC.$MessageID,this.serverDataHandler);
         this.myServer.eventDispatcher.addEventListener(Cmd_SyncLevel_SC.$MessageID,this.serverDataHandler);
         this.myServer.eventDispatcher.addEventListener(Cmd_SyncSun_SC.$MessageID,this.serverDataHandler);
         this.myServer.eventDispatcher.addEventListener(Cmd_SyncFightPower_SC.$MessageID,this.serverDataHandler);
         this.myServer.eventDispatcher.addEventListener(Cmd_TD_RequestTDInfo_SC.$MessageID,this.serverDataHandler);
         this.myServer.eventDispatcher.addEventListener(Cmd_Card_GetPackage_SC.$MessageID,this.serverDataHandler);
         this.myServer.eventDispatcher.addEventListener(Cmd_SyncEnergy_SC.$MessageID,this.onCmd_SyncEnergy_SC);
         this.myServer.eventDispatcher.addEventListener(Cmd_SyncFriendPoint_SC.$MessageID,this.serverDataHandler);
         this.myServer.eventDispatcher.addEventListener(Cmd_LogicError_SC.$MessageID,this.serverDataHandler);
         this.myServer.eventDispatcher.addEventListener(Cmd_SyncUnlockPlant_SC.$MessageID,this.serverDataHandler);
         this.myServer.eventDispatcher.addEventListener(Cmd_SyncBuildingInfo_SC.$MessageID,this.serverDataHandler);
         this.myServer.eventDispatcher.addEventListener(Cmd_SyncAasInfo_SC.$MessageID,this.serverDataHandler);
         this.myServer.eventDispatcher.addEventListener(Cmd_SyncTicket_SC.$MessageID,this.serverDataHandler);
         this.myServer.eventDispatcher.addEventListener(Cmd_SyncPresentTicket_SC.$MessageID,this.serverDataHandler);
         this.myServer.eventDispatcher.addEventListener(Cmd_SyncFame_SC.$MessageID,this.serverDataHandler);
         this.myServer.eventDispatcher.addEventListener(Cmd_Battle_GetFormation_SC.$MessageID,this.serverDataHandler);
         this.myServer.eventDispatcher.addEventListener(Cmd_Vip_SyncVipInfo_SC.$MessageID,this.serverDataHandler);
         this.myServer.eventDispatcher.addEventListener(Cmd_Card_SyncFullInfo_SC.$MessageID,this.onSyncFullInfo_SC);
         this.myServer.eventDispatcher.addEventListener(Cmd_Market_BuyEnergy_SC.$MessageID,this.buyPhysicalHandler);
         this.myServer.eventDispatcher.addEventListener(Cmd_Battle_HasNewFormationPos_SC.$MessageID,this.serverDataHandler);
         this.myServer.eventDispatcher.addEventListener(Cmd_Mail_NewMessage_SC.$MessageID,this.serverDataHandler);
         this.myServer.eventDispatcher.addEventListener(Cmd_Battle_SyncNewFormation_SC.$MessageID,this.syncNewFormationHandler);
         this.myServer.eventDispatcher.addEventListener(Cmd_VipInfo_SC.$MessageID,this.serverDataHandler);
         this.myServer.eventDispatcher.addEventListener(Cmd_SyncQQFaceURL_SC.$MessageID,this.serverDataHandler);
         this.myServer.eventDispatcher.addEventListener(Cmd_Sync3366Info_SC.$MessageID,this.serverDataHandler);
         this.myServer.eventDispatcher.addEventListener(Cmd_CheckOldUser_SC.$MessageID,this.serverDataHandler);
         this.myServer.eventDispatcher.addEventListener(Cmd_Aas_Notice_SC.$MessageID,this.serverDataHandler);
         this.myServer.eventDispatcher.addEventListener(Cmd_TD_PrivilegeInfo_SC.$MessageID,this.serverDataHandler);
         this.myServer.eventDispatcher.addEventListener(Cmd_TD_OpenPrivilege_SC.$MessageID,this.serverDataHandler);
         this.myServer.eventDispatcher.addEventListener(Cmd_SyncLucky_SC.$MessageID,this.serverDataHandler);
         this.myServer.eventDispatcher.addEventListener(Cmd_SyncLight_SC.$MessageID,this.serverDataHandler);
         this.myServer.eventDispatcher.addEventListener(Cmd_City_MergeServerFlag_SC.$MessageID,this.onCmd_City_MergeServerFlag_SC);
         this.myServer.eventDispatcher.addEventListener(Cmd_SyncContribVal_SC.$MessageID,this.onCmd_SyncContribVal_SC);
         this.myServer.eventDispatcher.addEventListener(Cmd_SyncPuppetSkillVal_SC.$MessageID,this.onCmd_SyncPuppetSkillVal_SC);
         this.myServer.eventDispatcher.addEventListener(Cmd_SyncPuppetEnergy_SC.$MessageID,this.onCmd_SyncPuppetEnergy_SC);
         this.myServer.eventDispatcher.addEventListener(Cmd_SetSignature_SC.$MessageID,this.onCmd_SetSignature_SC);
         this.myServer.eventDispatcher.addEventListener(Cmd_SyncPrestige_SC.$MessageID,this.onCmd_SyncPrestige_SC);
      }
      
      private function onCmd_SyncPrestige_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_SyncPrestige_SC = param1.socketData as Cmd_SyncPrestige_SC;
         this.actorModel.prestige = _loc2_.prestige;
         CommandDispatcher.send(PlantEvolutionConst.Event_PlantPrestige_Change);
      }
      
      private function syncNewFormationHandler(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Battle_SyncNewFormation_SC = param1.socketData as Cmd_Battle_SyncNewFormation_SC;
         this.actorModel.battleCardModel.unlockNewFormation = _loc2_.teamIdList;
      }
      
      private function buyPhysicalHandler(param1:SocketServiceEvent) : void
      {
         this.actorModel.currEnergyBuyNum = (param1.socketData as Cmd_Market_BuyEnergy_SC).buyNum;
      }
      
      private function onCmd_SyncEnergy_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_SyncEnergy_SC = param1.socketData as Cmd_SyncEnergy_SC;
         this.actorModel.currEnergy = _loc2_.energy;
         CommandDispatcher.send(CommandName.ChangeEnergy);
      }
      
      private function serverDataHandler(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_SyncFightPower_SC = null;
         var _loc3_:Cmd_TD_RequestTDInfo_SC = null;
         var _loc4_:Vector.<int> = null;
         var _loc5_:Cmd_TD_PrivilegeInfo_SC = null;
         var _loc6_:Cmd_TD_OpenPrivilege_SC = null;
         var _loc7_:Cmd_SyncTicket_SC = null;
         var _loc8_:Cmd_SyncPresentTicket_SC = null;
         var _loc9_:Cmd_SyncFame_SC = null;
         var _loc10_:Cmd_Mail_NewMessage_SC = null;
         var _loc11_:Cmd_Vip_SyncVipInfo_SC = null;
         var _loc12_:Cmd_VipInfo_SC = null;
         var _loc13_:Cmd_Aas_Notice_SC = null;
         var _loc14_:Number = NaN;
         var _loc15_:Cmd_Init_SC = null;
         var _loc16_:Cmd_SyncName_SC = null;
         var _loc17_:Cmd_SyncCoin_SC = null;
         var _loc18_:Cmd_SyncUnlockPlant_SC = null;
         var _loc19_:Cmd_SyncExp_SC = null;
         var _loc20_:Cmd_SyncLucky_SC = null;
         var _loc21_:Cmd_SyncLight_SC = null;
         var _loc22_:Cmd_SyncFosterTicket_SC = null;
         var _loc23_:Cmd_SyncQQFaceURL_SC = null;
         var _loc24_:Cmd_SyncLevel_SC = null;
         var _loc25_:Boolean = false;
         var _loc26_:Cmd_Battle_HasNewFormationPos_CS = null;
         var _loc27_:Cmd_SyncSun_SC = null;
         var _loc28_:Cmd_Card_GetPackage_SC = null;
         var _loc29_:Cmd_Battle_GetFormation_SC = null;
         var _loc30_:Cmd_SyncFriendPoint_SC = null;
         var _loc31_:Cmd_LogicError_SC = null;
         var _loc32_:Array = null;
         var _loc33_:Cmd_SyncBuildingInfo_SC = null;
         var _loc34_:Cmd_SyncAasInfo_SC = null;
         var _loc35_:Cmd_Sync3366Info_SC = null;
         var _loc36_:Cmd_CheckOldUser_SC = null;
         switch(param1.type)
         {
            case Cmd_Init_SC.$MessageID:
               getLogger("conn").info("Cmd_Init_SC 开始处理，连接初始化完成");
               if(param1.retCode != 0)
               {
                  return;
               }
               _loc15_ = param1.socketData as Cmd_Init_SC;
               this.actorModel.roleId = _loc15_.roleID;
               this.actorModel.zoneID = _loc15_.zoneId;
               this.actorModel.actorCoin = _loc15_.coin;
               this.actorModel.actorExp = _loc15_.exp;
               this.actorModel.actorLevel = _loc15_.level;
               this.actorModel.actorName = _loc15_.name;
               this.actorModel.actorSun = _loc15_.sun;
               this.actorModel.luckyPoint = _loc15_.lucky;
               this.actorModel.holeLight = _loc15_.light;
               this.actorModel.dummySkillPoint = _loc15_.puppetSkillVal;
               this.actorModel.dummySkillPointBuyTimesToday = _loc15_.buyPuppetSkillValNum;
               this.actorModel.dummyFubenEnergy = _loc15_.puppetEnergy;
               this.actorModel.dummyFubenEnergyBuyTimesToday = _loc15_.buyPuppetEnergyNum;
               this.actorModel.prestige = _loc15_.prestige;
               if(this.actorModel.actorSun > 0)
               {
                  GameGloble.sunExchangeCoin = this.actorModel.actorSun * 300;
               }
               this.actorModel.actorLatestTDLevel = _loc15_.latestTDLevel;
               this.actorModel.currEnergy = _loc15_.energy;
               this.actorModel.friendPoint = _loc15_.friendPoint;
               this.actorModel.avatarPlantInfo = _loc15_.faceAvatar;
               this.actorModel.headIconUrl = IconUtil.getFaceIcon(null,_loc15_.faceId,_loc15_.qqFaceURL,100);
               this.actorModel.unlockPlantList = _loc15_.unlockPlantList;
               this.actorModel.unlockSpecialPlantList = _loc15_.unLockSpecialPlant;
               this.actorModel.goldDiamond = _loc15_.ticket;
               this.actorModel.giftDiamond = _loc15_.presentTicket;
               this.actorModel.fame = _loc15_.fame;
               this.actorModel.currEnergyBuyNum = _loc15_.buyEnergyNum;
               this.actorModel.hasNewFormationPos = _loc15_.hasNewFormationPos;
               this.actorModel.fosterTicket = _loc15_.fosterTicket;
               this.actorModel.isEquipAttachEnabled = _loc15_.isEquipAttachEnabled;
               this.actorModel.regTime = _loc15_.regTime;
               this.actorModel.serverOpenTime = _loc15_.serverOpenTime;
               this.actorModel.regRoleSystemOpenTime = _loc15_.regRoleSystemOpenTime;
               this.actorModel.isPlayZoneTask = _loc15_.isPlayZoneTask;
               this.actorModel.forbidCardAwaken = _loc15_.forbidCardAwaken;
               this.actorModel.contribValue = _loc15_.contribVal;
               this.actorModel.lastPayTime = _loc15_.lastPayTime;
               GameGloble.actorModel = this.actorModel;
               ServerConfigTemplateFactory.instance.loadCmd_Init_SC(_loc15_.serverConfig);
               PvzSocketService.seqId = _loc15_.seqId;
               OfflineRewardGlobal.NEW_OFFLINE = _loc15_.newOfflineReward;
               getLogger("seq").debug("seq ID:" + _loc15_.seqId);
               IconUtil.myFaceId = _loc15_.faceId;
               DateUtils.getInstance().setServerTime(_loc15_.now);
               getLogger("login").info("服务器时间：" + DateUtils.getInstance().getServerDate().toString());
               InitDataManager.getInstance().finishTask(InitDataManager.Init_PlayerInfo);
               GuideUIData.getInstance().init(this.actorModel.actorLevel);
               GameGloble.isFinishInit = true;
               MonthCardCmd.queryInfo();
               LevelObserverCmd.initLevelObserver();
               if(GameGloble.isNew)
               {
                  if(ExternalVars.isPlatform(ExternalVars.SFROM_QZONE) && (ExternalVars.APP_CUSTOM == "QZ.HUODONG.SUMMERHOLIDAY" || this.actorModel.isPlayZoneTask))
                  {
                     CommonCmd.doQzoneSummerHoliday(QExternalUtil.doSummerActivity(1001));
                  }
               }
               break;
            case Cmd_SyncName_SC.$MessageID:
               _loc16_ = param1.socketData as Cmd_SyncName_SC;
               this.actorModel.actorName = _loc16_.name;
               break;
            case Cmd_SyncCoin_SC.$MessageID:
               _loc17_ = param1.socketData as Cmd_SyncCoin_SC;
               this.actorModel.actorCoin = _loc17_.coin;
               CommandDispatcher.send(CommandName.ChangeCoin);
               break;
            case Cmd_SyncUnlockPlant_SC.$MessageID:
               _loc18_ = param1.socketData as Cmd_SyncUnlockPlant_SC;
               this.actorModel.updateUnlockPlant(_loc18_.unlockPlant);
               break;
            case Cmd_SyncExp_SC.$MessageID:
               _loc19_ = param1.socketData as Cmd_SyncExp_SC;
               this.actorModel.actorExp = _loc19_.exp;
               CommandDispatcher.send(CommandName.ChangeExp);
               break;
            case Cmd_SyncLucky_SC.$MessageID:
               _loc20_ = param1.socketData as Cmd_SyncLucky_SC;
               this.actorModel.luckyPoint = _loc20_.lucky;
               CommandDispatcher.send(CommandName.ChangeLuckyPoint);
               break;
            case Cmd_SyncLight_SC.$MessageID:
               _loc21_ = param1.socketData as Cmd_SyncLight_SC;
               this.actorModel.holeLight = _loc21_.light;
               CommandDispatcher.send(CommandName.ChangeHoleLight);
               break;
            case Cmd_SyncFosterTicket_SC.$MessageID:
               _loc22_ = param1.socketData as Cmd_SyncFosterTicket_SC;
               this.actorModel.fosterTicket = _loc22_.fosterTicket;
               CommandDispatcher.send(CommandName.ROLE_FOSTERTICKET_CHANGED);
               break;
            case Cmd_SyncQQFaceURL_SC.$MessageID:
               _loc23_ = param1.socketData as Cmd_SyncQQFaceURL_SC;
               this.actorModel.headIconUrl = IconUtil.getFaceIcon(null,0,_loc23_.url,100);
               break;
            case Cmd_SyncLevel_SC.$MessageID:
               _loc25_ = (_loc24_ = param1.socketData as Cmd_SyncLevel_SC).level - this.actorModel.actorLevel == 1 ? true : false;
               this.actorModel.actorLevel = _loc24_.level;
               CommandDispatcher.send(CommandName.ChangeLevel,_loc25_);
               if(this.actorModel.actorLevel >= 1)
               {
                  SceneCenter.getInstance().showTownLevelUp();
               }
               LevelRewardCmd.queryReward();
               _loc26_ = new Cmd_Battle_HasNewFormationPos_CS();
               this.myServer.sendMessage(_loc26_);
               GuideCmd.checkAllBtnVisible();
               if(ExternalVars.isPlatform(ExternalVars.SFROM_QZONE) && (ExternalVars.APP_CUSTOM == "QZ.HUODONG.SUMMERHOLIDAY" || this.actorModel.isPlayZoneTask))
               {
                  switch(_loc24_.level)
                  {
                     case 7:
                        CommonCmd.doQzoneSummerHoliday(QExternalUtil.doSummerActivity(1002));
                        break;
                     case 18:
                        CommonCmd.doQzoneSummerHoliday(QExternalUtil.doSummerActivity(1003));
                        break;
                     case 30:
                        CommonCmd.doQzoneSummerHoliday(QExternalUtil.doSummerActivity(1004));
                  }
               }
               QuestServiceCmd.getDailyQuestInfo();
               QuestConstant.needUpdateActData = true;
               break;
            case Cmd_Battle_HasNewFormationPos_SC.$MessageID:
               this.actorModel.hasNewFormationPos = (param1.socketData as Cmd_Battle_HasNewFormationPos_SC).has;
               CommandDispatcher.send(CommandName.ChangeFormation);
               break;
            case Cmd_SyncSun_SC.$MessageID:
               _loc27_ = param1.socketData as Cmd_SyncSun_SC;
               this.actorModel.actorSun = _loc27_.sun;
               CommandDispatcher.send(CommandName.ChangeSun);
               break;
            case Cmd_SyncFightPower_SC.$MessageID:
               _loc2_ = param1.socketData as Cmd_SyncFightPower_SC;
               this.actorModel.actorFightPower = _loc2_.fightPower;
               CommandDispatcher.send(CommandName.ChangeFightPower);
               break;
            case Cmd_TD_RequestTDInfo_SC.$MessageID:
               _loc3_ = param1.socketData as Cmd_TD_RequestTDInfo_SC;
               _loc4_ = Vector.<int>(_loc3_.achievementList);
               GameFlowCmd.startTD(_loc3_.stageId,_loc3_.levelId,_loc3_.subLevelId,_loc3_.challengeLevelId,_loc4_,false,_loc3_.unlockPlantList,_loc3_);
               break;
            case Cmd_TD_PrivilegeInfo_SC.$MessageID:
               _loc5_ = param1.socketData as Cmd_TD_PrivilegeInfo_SC;
               TDPrivilegeInfo.getInstance().hasTDPrivilege = _loc5_.hasPrivilege;
               TDPrivilegeInfo.getInstance().privilegeRemainTime = _loc5_.remainTime;
               TDPrivilegeInfo.getInstance().unlockPlantIDList = _loc5_.plantId;
               CommandDispatcher.send(CommandName.TD_GET_UNLOCK_PLANT_INFO);
               break;
            case Cmd_TD_OpenPrivilege_SC.$MessageID:
               _loc6_ = param1.socketData as Cmd_TD_OpenPrivilege_SC;
               TDPrivilegeInfo.getInstance().hasTDPrivilege = _loc6_.hasPrivilege;
               TDPrivilegeInfo.getInstance().privilegeRemainTime = _loc6_.remainTime;
               CommandDispatcher.send(CommandName.TD_GET_UNLOCK_PLANT_INFO);
               break;
            case Cmd_Card_GetPackage_SC.$MessageID:
               _loc28_ = param1.socketData as Cmd_Card_GetPackage_SC;
               this.actorModel.battleCardModel.setBattleCardList(_loc28_.all);
               this.actorModel.battleCardModel.leaderAddParam = _loc28_.leaderAddParam;
               InitDataManager.getInstance().finishTask(InitDataManager.Init_PlayerCard);
               break;
            case Cmd_Battle_GetFormation_SC.$MessageID:
               _loc29_ = param1.socketData as Cmd_Battle_GetFormation_SC;
               this.actorModel.battleCardModel.updateEmbattleCardTeam(_loc29_.team);
               this.actorModel.battleCardModel.teamMaxNum = _loc29_.teamMaxNum;
               this.actorModel.battleCardModel.defaultTeamId = _loc29_.defaultTeamId;
               if(_loc29_.defaultTeamId == 0)
               {
                  this.actorModel.battleCardModel.defaultTeamId = (_loc29_.team[0] as Dto_FormationInfo).teamId;
                  getLogger().error("默认卡牌阵型不能为0");
               }
               eventDispatcher.dispatchEvent(new Event(BattleLineupConst.LINEUP_UPDATE));
               break;
            case Cmd_SyncFriendPoint_SC.$MessageID:
               _loc30_ = param1.socketData as Cmd_SyncFriendPoint_SC;
               this.actorModel.friendPoint = _loc30_.friendPoint;
               CommandDispatcher.send(CommandName.ChangeFriendPoint);
               break;
            case Cmd_LogicError_SC.$MessageID:
               _loc32_ = (_loc31_ = param1.socketData as Cmd_LogicError_SC).param;
               if(param1.retCode != 0)
               {
                  ErrorHanderManager.errorHandler(param1.retCode,_loc32_);
               }
               break;
            case Cmd_SyncBuildingInfo_SC.$MessageID:
               if((_loc33_ = param1.socketData as Cmd_SyncBuildingInfo_SC).buildingInfo.buildingType != CityConstant.Building_Cemeterial && _loc33_.buildingInfo.buildingType != CityConstant.Building_Factory && _loc33_.buildingInfo.buildingType != CityConstant.Building_Timemachine && _loc33_.buildingInfo.buildingType != CityConstant.Building_Postoffice && _loc33_.buildingInfo.buildingType != CityConstant.Building_SuperMarket)
               {
                  if(_loc33_.buildingInfo.buildingType != CityConstant.Building_Lab)
                  {
                     GuideCmd.autoGotoCityScene();
                  }
                  if(GameGloble.isCloseAddBuildingEffect)
                  {
                     this.cityData.addBuilding(_loc33_.buildingInfo.buildingType);
                  }
                  else
                  {
                     this.cityData.addNewBuilding(_loc33_.buildingInfo.buildingType);
                     CommandDispatcher.send(CommandName.ChangeBuilding);
                  }
               }
               break;
            case Cmd_SyncAasInfo_SC.$MessageID:
               _loc34_ = param1.socketData as Cmd_SyncAasInfo_SC;
               AddictInfo.getInstance().updateInfo(_loc34_.aasAdultType,_loc34_.aasState);
               if(!AddictInfo.getInstance().isLoginCheckState)
               {
                  AddictInfo.getInstance().isLoginCheckState = true;
                  AddictInfo.getInstance().updateOnlineTime(_loc34_.onlineTime);
                  AddictCmd.loginCheckState();
               }
               else if(_loc34_.onlineTime > AddictInfo.getInstance().onlineTimeSecond)
               {
                  AddictInfo.getInstance().updateOnlineTime(_loc34_.onlineTime);
                  if(AddictInfo.getInstance().playerType == E_AasAdultType.AasType_Child)
                  {
                     AddictCmd.showAddictInfo(_loc34_.onlineTime);
                  }
               }
               break;
            case Cmd_SyncTicket_SC.$MessageID:
               _loc7_ = param1.socketData as Cmd_SyncTicket_SC;
               this.actorModel.goldDiamond = _loc7_.ticket;
               if(this.actorModel.goldDiamond > 0 && this.actorModel.lastPayTime == 0)
               {
                  this.actorModel.lastPayTime = DateUtils.getInstance().getServerT();
               }
               CommandDispatcher.send(CommandName.ChangeGoldDiamond);
               break;
            case Cmd_SyncPresentTicket_SC.$MessageID:
               _loc8_ = param1.socketData as Cmd_SyncPresentTicket_SC;
               this.actorModel.giftDiamond = _loc8_.presentTicket;
               CommandDispatcher.send(CommandName.ChangeGiftDiamond);
               break;
            case Cmd_SyncFame_SC.$MessageID:
               _loc9_ = param1.socketData as Cmd_SyncFame_SC;
               this.actorModel.fame = _loc9_.fame;
               CommandDispatcher.send(CommandName.ChangeFame);
               break;
            case Cmd_Mail_NewMessage_SC.$MessageID:
               _loc10_ = param1.socketData as Cmd_Mail_NewMessage_SC;
               this.actorModel.setNewMail(_loc10_.newSystemMailNum,_loc10_.newUserMailNum);
               break;
            case Cmd_Vip_SyncVipInfo_SC.$MessageID:
               _loc11_ = param1.socketData as Cmd_Vip_SyncVipInfo_SC;
               this.actorModel.selfPrivilegeModel.privilegeDiamond = PrivilegeDiamond.createByInfo(_loc11_.diamond);
               CommandDispatcher.send(CommandName.CHANGE_VIP_PRIVILEGE__INFO);
               break;
            case Cmd_VipInfo_SC.$MessageID:
               if((_loc12_ = param1.socketData as Cmd_VipInfo_SC).vipInfo == null)
               {
                  this.actorModel.selfPrivilegeModel.vipCardId = 0;
                  this.actorModel.selfPrivilegeModel.vipGotGift = false;
               }
               else
               {
                  this.actorModel.selfPrivilegeModel.vipInfo = _loc12_.vipInfo;
               }
               CommandDispatcher.send(CommandName.ChangeVip);
               break;
            case Cmd_Sync3366Info_SC.$MessageID:
               _loc35_ = param1.socketData as Cmd_Sync3366Info_SC;
               this.actorModel.selfPrivilegeModel.growLevel = _loc35_.growLevel;
               break;
            case Cmd_CheckOldUser_SC.$MessageID:
               if(!(_loc36_ = param1.socketData as Cmd_CheckOldUser_SC).isOldUser)
               {
                  RenameCmd.gotoNewRoleStep(_loc36_.playStartFlash);
               }
               else if(!_loc36_.roleName)
               {
                  RenameCmd.gotoOldRoleChangeNameStep(_loc36_.qqName);
               }
               else
               {
                  LoginServerCmd.sendInitMessage();
               }
               IdleMessageSendManager.getInstance().init(this.myServer);
               break;
            case Cmd_Aas_Notice_SC.$MessageID:
               _loc14_ = (_loc13_ = param1.socketData as Cmd_Aas_Notice_SC).onlineSumTime;
               if(AddictInfo.getInstance().playerType == E_AasAdultType.AasType_UnRegister)
               {
                  AddictCmd.showAddictInfo(_loc14_);
               }
         }
      }
      
      private function onSyncFullInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Card_SyncFullInfo_SC = param1.socketData as Cmd_Card_SyncFullInfo_SC;
         var _loc3_:Array = _loc2_.changeCardList;
         var _loc4_:Array = _loc2_.addCardList;
         var _loc5_:Array = _loc2_.delCardList;
         this.actorModel.battleCardModel.addBattleCard(_loc4_);
         this.actorModel.battleCardModel.updateBattleCardFullInfo(_loc3_);
         this.actorModel.battleCardModel.delBattleCard(_loc5_);
         eventDispatcher.dispatchEvent(new Event(BattleLineupConst.LINEUP_UPDATE));
      }
      
      private function onCmd_SyncContribVal_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_SyncContribVal_SC = param1.socketData as Cmd_SyncContribVal_SC;
         this.actorModel.contribValue = _loc2_.contribVal;
         CommandDispatcher.send(CommandName.Union_ContribValue_Changed);
      }
      
      public function getPlayerCardInfo() : void
      {
         this.myServer.sendMessage(new Cmd_Card_GetPackage_CS());
      }
      
      public function getPlayerBattleCardInfo(param1:int = 0) : void
      {
         var _loc2_:Cmd_Battle_GetFormation_CS = new Cmd_Battle_GetFormation_CS();
         _loc2_.teamId = param1;
         this.myServer.sendMessage(_loc2_);
      }
      
      public function buyPhysical() : void
      {
         var _loc1_:Cmd_Market_BuyEnergy_CS = new Cmd_Market_BuyEnergy_CS();
         this.myServer.sendMessage(_loc1_);
      }
      
      public function getArenaInfo() : void
      {
         this.arenaServer.init();
         var _loc1_:Cmd_Arena_GetMyInfo_CS = new Cmd_Arena_GetMyInfo_CS();
         this.myServer.sendMessage(_loc1_);
      }
      
      public function getMergeServerFlag() : void
      {
         var _loc1_:Cmd_City_MergeServerFlag_CS = new Cmd_City_MergeServerFlag_CS();
         this.myServer.sendMessage(_loc1_);
      }
      
      private function onCmd_City_MergeServerFlag_SC(param1:SocketServiceEvent) : void
      {
         var _loc5_:uint = 0;
         var _loc2_:Cmd_City_MergeServerFlag_SC = param1.socketData as Cmd_City_MergeServerFlag_SC;
         var _loc3_:Array = [_loc2_.iExile,_loc2_.iRoleName,_loc2_.iGuildName];
         var _loc4_:uint = 0;
         for each(_loc5_ in _loc3_)
         {
            _loc4_ += _loc5_;
         }
         this.actorModel.mergeServerFlag = _loc4_ > 0 ? _loc3_ : null;
      }
      
      private function onCmd_SyncPuppetSkillVal_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_SyncPuppetSkillVal_SC = param1.socketData as Cmd_SyncPuppetSkillVal_SC;
         this.actorModel.dummySkillPoint = _loc2_.puppetSkillVal;
         CommandDispatcher.send(DummyConst.DummyEvent_SkillPoint_Change);
      }
      
      private function onCmd_SyncPuppetEnergy_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_SyncPuppetEnergy_SC = param1.socketData as Cmd_SyncPuppetEnergy_SC;
         this.actorModel.dummyFubenEnergy = _loc2_.puppetEnergy;
         CommandDispatcher.send(DummyConst.DummyEvent_Energy_Change);
      }
      
      private function onCmd_SetSignature_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_SetSignature_SC = param1.socketData as Cmd_SetSignature_SC;
         CommandDispatcher.send(CommandName.CHANGE_ROLE_SIGNATURE,_loc2_.signature);
      }
   }
}
