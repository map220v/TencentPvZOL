package com.qq.modules.main.command
{
   import PVZ.Cmd.Cmd_Battle_QueryReport_CS;
   import PVZ.Cmd.Cmd_Battle_QuerySpecialReport_CS;
   import PVZ.Cmd.Cmd_GetClientData_CS;
   import PVZ.Cmd.Cmd_SetClientData_CS;
   import PVZ.Cmd.Dto_PlantInfo;
   import asgui.core.Application;
   import asgui.managers.PopUpManager;
   import asgui.managers.SystemManager;
   import asgui.utils.StringUtil;
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.MyApplication;
   import com.qq.SceneCenter;
   import com.qq.constant.SceneName;
   import com.qq.display.QAlert;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.model.templates.ServerConfigTemplateFactory;
   import com.qq.modules.basic.model.templates.ce.EntryTemplateCE;
   import com.qq.modules.entryIcon.model.templates.EntryIconTemplateFactory;
   import com.qq.modules.entryIcon.model.templates.SystemIconTemplate;
   import com.qq.modules.fuben.FubenGlobals;
   import com.qq.modules.guide.model.GuideUIData;
   import com.qq.modules.levelselect.model.LSProxy;
   import com.qq.modules.login.command.LoginServerCmd;
   import com.qq.modules.login.service.LoginService;
   import com.qq.modules.main.command.modules.ModuleSoundCmd;
   import com.qq.modules.main.logic.initData.InitActivityTask;
   import com.qq.modules.main.logic.initData.InitBagInfoTask;
   import com.qq.modules.main.logic.initData.InitBuffInfoTask;
   import com.qq.modules.main.logic.initData.InitChatTask;
   import com.qq.modules.main.logic.initData.InitCityBuildingInfoTask;
   import com.qq.modules.main.logic.initData.InitClientDBDataTask;
   import com.qq.modules.main.logic.initData.InitDataManager;
   import com.qq.modules.main.logic.initData.InitDummyTask;
   import com.qq.modules.main.logic.initData.InitFlagInfoTask;
   import com.qq.modules.main.logic.initData.InitFontTask;
   import com.qq.modules.main.logic.initData.InitFubenTask;
   import com.qq.modules.main.logic.initData.InitLabInfoTask;
   import com.qq.modules.main.logic.initData.InitLevelRewardTask;
   import com.qq.modules.main.logic.initData.InitMapInfoTask;
   import com.qq.modules.main.logic.initData.InitMergeServer;
   import com.qq.modules.main.logic.initData.InitOnlineRewardTask;
   import com.qq.modules.main.logic.initData.InitPlayerCardInfo;
   import com.qq.modules.main.logic.initData.InitPlayerGuideInfoTask;
   import com.qq.modules.main.logic.initData.InitPlayerInfoTask;
   import com.qq.modules.main.logic.initData.InitPrivilegeTask;
   import com.qq.modules.main.logic.initData.InitQuestInfoTask;
   import com.qq.modules.main.logic.initData.InitQzoneShareTask;
   import com.qq.modules.main.logic.initData.InitSecondaryPasswordTask;
   import com.qq.modules.main.logic.initData.InitShortcutPayTask;
   import com.qq.modules.main.logic.initData.InitTalentTask;
   import com.qq.modules.main.logic.initData.InitUnionInfoTask;
   import com.qq.modules.main.server.PvzSocketService;
   import com.qq.modules.mapinfo.model.MapInfoProxy;
   import com.qq.modules.notice.command.NoticeCmd;
   import com.qq.modules.td.model.TDStartParam;
   import com.qq.modules.td.view.components.TDPrivilegeWindow;
   import com.qq.templates.font.FontNormal;
   import com.qq.utils.GameDataReport;
   import com.qq.utils.UtilsManager;
   import com.tencent.protobuf.Int64;

import flash.debugger.enterDebugger;

import org.as3commons.logging.api.getLogger;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   import tencent.io.loaderqueue.LoaderQueueEvent;
   
   public class GameFlowCommand extends StrongRobotlegCommand
   {
       
      
      [Inject]
      public var mapInfoProxy:MapInfoProxy;
      
      [Inject]
      public var loginActor:LoginService;
      
      [Inject]
      public var server:PvzSocketService;
      
      [Inject]
      public var lsProxy:LSProxy;
      
      public function GameFlowCommand()
      {
         super();
      }
      
      public function startLoad() : void
      {
         InitDataManager.getInstance().addTask(new InitClientDBDataTask(false));
         InitDataManager.getInstance().addTask(new InitFontTask(false));
         //InitDataManager.getInstance().addTask(new InitPlayerInfoTask(false));
         InitDataManager.getInstance().addTask(new InitPlayerCardInfo());
         InitDataManager.getInstance().addTask(new InitPlayerGuideInfoTask());
         InitDataManager.getInstance().addTask(new InitBagInfoTask());
         InitDataManager.getInstance().addTask(new InitQuestInfoTask());
         InitDataManager.getInstance().addTask(new InitCityBuildingInfoTask());
         InitDataManager.getInstance().addTask(new InitFlagInfoTask());
         InitDataManager.getInstance().addTask(new InitLabInfoTask());
         InitDataManager.getInstance().addTask(new InitUnionInfoTask());
         InitDataManager.getInstance().addTask(new InitMapInfoTask());
         InitDataManager.getInstance().addTask(new InitBuffInfoTask());
         InitDataManager.getInstance().addTask(new InitChatTask());
         InitDataManager.getInstance().addTask(new InitActivityTask());
         InitDataManager.getInstance().addTask(new InitOnlineRewardTask());
         InitDataManager.getInstance().addTask(new InitShortcutPayTask());
         InitDataManager.getInstance().addTask(new InitPrivilegeTask());
         InitDataManager.getInstance().addTask(new InitFubenTask());
         InitDataManager.getInstance().addTask(new InitQzoneShareTask());
         InitDataManager.getInstance().addTask(new InitLevelRewardTask());
         InitDataManager.getInstance().addTask(new InitSecondaryPasswordTask());
         InitDataManager.getInstance().addTask(new InitMergeServer());
         InitDataManager.getInstance().addTask(new InitTalentTask());
         InitDataManager.getInstance().addTask(new InitDummyTask());
         this.loadNextFile();
      }
      
      private function errorHandler(param1:LoaderQueueEvent) : void
      {
         getLogger().debug("Failed to load resource");
      }
      
      private function loadedHandler(param1:LoaderQueueEvent) : void
      {
         getLogger().debug("Test resource loaded successfully");
      }
      
      public function loadNextFile() : void
      {
         InitDataManager.getInstance().loadNext();
      }
      
      public function finishLoad() : void
      {
         this.startGame();
      }
      
      private function defaultLoadModule() : void
      {
         ModuleSoundCmd.start();
         NoticeCmd.noticeGetSysList();
      }
      
      public function startGame() : void
      {
         this.defaultLoadModule();
         /*if(GameGloble.isGuildTD(this.loginActor.actorModel.actorLatestTDLevel.stageId))
         {
            this.gotoGuideTD();
         }
         else if(GuideUIData.getInstance().isLock("3"))
         {
            this.gotoLevelSelect();
         }
         else
         {*/
            this.gotoCity();
         //}
      }
      
      public function gotoCity() : void
      {
         SceneCenter.getInstance().switchScene(SceneName.City);
      }
      
      public function gotoNutrition(param1:int = 1) : void
      {
         SceneCenter.getInstance().switchScene(SceneName.Nutrition,[param1]);
      }
      
      public function balanceFight(param1:Int64) : void
      {
         SceneCenter.getInstance().switchScene(SceneName.BALANCE_FIGHT,[param1]);
      }
      
      public function gotoAwake() : void
      {
         SceneCenter.getInstance().switchScene(SceneName.AWAKE);
      }
      
      public function gotoPlantTest() : void
      {
         SceneCenter.getInstance().switchScene(SceneName.AWAKE,[true]);
      }
      
      public function gotoMyHome() : void
      {
         SceneCenter.getInstance().switchScene(SceneName.MY_HOME);
      }
      
      public function gotoMap(param1:int = 0) : void
      {
         var _loc2_:int = GameGloble.actorModel.getOpenMapNeedLevelNotSatified();
         if(_loc2_ > 0)
         {
            QAlert.Show("You need level " + _loc2_ + " to enter map");
            return;
         }
         if(param1 == 0)
         {
            param1 = this.mapInfoProxy.data.myAreaId;
         }
         SceneCenter.getInstance().switchScene(SceneName.MAP,[param1]);
      }
      
      public function gotoLevelSelect(param1:Object = null) : void
      {
         var _loc2_:int = GameGloble.actorModel.getTDOpenedStageID();
         SceneCenter.getInstance().switchScene(SceneName.LevelSelect,[_loc2_,param1]);
      }
      
      public function gotoLevelSelectByStateID(param1:int, param2:int, param3:int) : void
      {
         SceneCenter.getInstance().switchScene(SceneName.LevelSelect,[param1,null,param2,param3]);
      }
      
      public function gotoFuben(param1:int = 0, param2:int = 1, param3:int = 0, param4:Boolean = false) : void
      {
         if(param4)
         {
            FubenGlobals.TEMP_FIGHT_CHAPTER = param1;
            FubenGlobals.TEMP_FIGHT_MODE = param2;
            FubenGlobals.NEED_ARROW_STAGE = param3;
         }
         else
         {
            FubenGlobals.NEED_ENTER_CHAPTER = param1;
            FubenGlobals.NEED_ENTER_MODE = param2;
            FubenGlobals.NEED_ARROW_STAGE = param3;
         }
         SceneCenter.getInstance().switchScene(SceneName.fuben);
      }
      
      public function gotoEndlessTD() : void
      {
         var _loc1_:SystemIconTemplate = EntryIconTemplateFactory.instance.getSystemIconTemplate(1004);
         if(_loc1_ && GameGloble.actorModel.actorLevel < _loc1_.needLevel)
         {
            QAlert.Show(StringUtil.substitute(FontNormal.ENDLESS_LEVEL_NO_PASS,_loc1_.needLevel));
            return;
         }
         SceneCenter.getInstance().switchScene(SceneName.EndlessTD);
      }
      
      public function gotoTD(param1:int, param2:int, param3:int, param4:int = 0) : void
      {
         LoginServerCmd.requestTDInfo(param1,param2,param3,param4);
         LoginServerCmd.requestPrivilegeAndUnlockPlantInfo(param1,param2,param3,param4);
      }
      
      public function startTD(param1:int, param2:int, param3:int, param4:int, param5:Vector.<int>, param6:Boolean = false, param7:Array = null, param8:Object = null) : void
      {
         var _loc9_:TDStartParam;
         (_loc9_ = new TDStartParam()).initNormalData(param1,param2,param3,param4,param5,param6,Vector.<Dto_PlantInfo>(param7),param8);
         SceneCenter.getInstance().switchScene(SceneName.TD,[_loc9_]);
      }
      
      public function gotoGuideTD() : void
      {
         this.gotoTD(this.loginActor.actorModel.actorLatestTDLevel.stageId,1,1);
      }
      
      public function enterLab() : void
      {
         SceneCenter.getInstance().switchScene(SceneName.LAB);
      }
      
      public function gotoCardBar() : void
      {
         SceneCenter.getInstance().switchScene(SceneName.CardBar);
      }
      
      public function gotoTrialRoad() : void
      {
         SceneCenter.getInstance().switchScene(SceneName.TrialRoad);
      }
      
      public function gotoDrunkery() : void
      {
         SceneCenter.getInstance().switchScene(SceneName.DRUNKERY);
      }
      
      public function gotoArenaEntrance() : void
      {
         SceneCenter.getInstance().switchScene(SceneName.ARENA_ENTRANCE);
      }
      
      public function gotoArena() : void
      {
         SceneCenter.getInstance().switchScene(SceneName.NORMAL_ARENA);
      }
      
      public function gotoRankArena() : void
      {
         SceneCenter.getInstance().switchScene(SceneName.RANK_ARENA);
      }
      
      public function gotoGarden() : void
      {
         SceneCenter.getInstance().switchScene(SceneName.GARDEN);
      }
      
      public function gotoWT() : void
      {
         SceneCenter.getInstance().switchScene(SceneName.WT);
      }
      
      public function gotoHole(param1:Int64 = null) : void
      {
         var _loc2_:EntryTemplateCE = ServerConfigTemplateFactory.instance.getEntryTemplateHole();
         if(GameGloble.actorModel.checkIfOpenDaySatisfiedFromTemplate(_loc2_))
         {
            SceneCenter.getInstance().switchScene(SceneName.HOLE,[param1]);
         }
         else
         {
            QAlert.Show(GameGloble.actorModel.getUnsatisfiedTip(_loc2_.needDays,_loc2_.needLevel));
         }
      }
      
      public function gotoExpedition(param1:Boolean) : void
      {
         var _loc2_:EntryTemplateCE = ServerConfigTemplateFactory.instance.getEntryTemplateExpedition();
         if(GameGloble.actorModel.checkIfOpenDaySatisfiedFromTemplate(_loc2_))
         {
            SceneCenter.getInstance().switchScene(SceneName.Expedition,[param1]);
         }
         else
         {
            QAlert.Show(GameGloble.actorModel.getUnsatisfiedTip(_loc2_.needDays,_loc2_.needLevel));
         }
      }
      
      public function gotoBattleByID(param1:Int64) : void
      {
      }
      
      public function gotoBattleByReport(param1:Object) : void
      {
         SceneCenter.getInstance().switchScene(SceneName.Battle,[param1]);
      }
      
      public function gotoTDChallengeLevel(param1:int = 1) : void
      {
         this.lsProxy.recordLastStageId = param1;
         SceneCenter.getInstance().switchScene(SceneName.LevelSelect,[param1]);
      }
      
      public function lockScreen(param1:int = 7) : void
      {
         dispatch(new CommonEvent(CommandName.Common_LockScreen,{"lockTime":param1}));
         Application.application.checkSizeDispatchTime = param1 * 1000;
      }
      
      public function unlockScreen() : void
      {
         dispatch(new CommonEvent(CommandName.Common_UnlockScreen));
         Application.application.checkSizeDispatchTime = 0;
      }
      
      public function queryReport(param1:Int64) : void
      {
         var _loc2_:Cmd_Battle_QueryReport_CS = new Cmd_Battle_QueryReport_CS();
         _loc2_.reportId = param1;
         this.server.sendMessage(_loc2_);
      }
      
      public function querySpecialReport(param1:String, param2:int) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc3_:Cmd_Battle_QuerySpecialReport_CS = new Cmd_Battle_QuerySpecialReport_CS();
         _loc3_.reportId = param1;
         _loc3_.reportType = param2;
         this.server.sendMessage(_loc3_);
      }
      
      public function forbidConnectAgain() : void
      {
         this.server.closeConnect();
      }
      
      public function finishLoadBaseModule() : void
      {
         var _loc1_:MyApplication = null;
         if(!GameGloble.isFinishBaseModuleLoader)
         {
            GameGloble.isFinishBaseModuleLoader = true;
            GameGloble.loader.finishGameLoad();
            _loc1_ = SystemManager.instance.application as MyApplication;
            if(_loc1_ != null)
            {
               _loc1_.uiLayer.visible = true;
               GameDataReport.getInstance().report(GameDataReport.Data_Show_GameScene_Success);
            }
         }
      }
      
      public function openTDPrivilegeWindow() : void
      {
         PopUpManager.AddPopUp(new TDPrivilegeWindow(),null,true);
      }
      
      public function gotoZombieIsland() : void
      {
         SceneCenter.getInstance().switchScene(SceneName.ZombieIsland);
      }
      
      public function gotoPlantTalent() : void
      {
         SceneCenter.getInstance().switchScene(SceneName.PlantTalent);
      }
      
      public function gotoWebpage(param1:String) : void
      {
         UtilsManager.gotoUrl(param1,"_blank");
      }
      
      public function gotoEndlessFuben() : void
      {
         SceneCenter.getInstance().switchScene(SceneName.EndlessFuben);
      }
      
      public function gotoSuperArena() : void
      {
         SceneCenter.getInstance().switchScene(SceneName.SuperArena);
      }
      
      public function readClientData(param1:Int64) : void
      {
         var _loc2_:Cmd_GetClientData_CS = new Cmd_GetClientData_CS();
         _loc2_.key = param1;
         this.server.sendMessage(_loc2_);
      }
      
      public function writeClientData(param1:Int64, param2:Int64) : void
      {
         var _loc3_:Cmd_SetClientData_CS = new Cmd_SetClientData_CS();
         _loc3_.key = param1;
         _loc3_.value = param2;
         this.server.sendMessage(_loc3_);
      }
   }
}
