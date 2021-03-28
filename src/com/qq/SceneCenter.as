package com.qq
{
   import asgui.blit.Blit;
   import asgui.blit.IBlitDisplayFactory;
   import asgui.blit.bone.BlitBoneManager;
   import asgui.blit.display.BlitDisplayContainerBatchEncoderCollectorManager;
   import asgui.core.Application;
   import asgui.managers.PopUpManager;
   import asgui.managers.ToolTipManager;
   import asgui.managers.tooltips.BottomToolTipEffect;
   import asgui.managers.tooltips.NoneToolTipEffect;
   import com.qq.constant.SceneName;
   import com.qq.constant.roleInfo.RoleInfoPanelID;
   import com.qq.display.QPopUpManagerImpl;
   import com.qq.modules.arena.command.ArenaCmd;
   import com.qq.modules.arenaEntrance.command.ArenaEntranceViewCmd;
   import com.qq.modules.awake.command.ModuleAwakeCmd;
   import com.qq.modules.balance.command.BalanceViewCmd;
   import com.qq.modules.chat.ChatUIModeType;
   import com.qq.modules.chat.command.ChatViewCmd;
   import com.qq.modules.city.command.CityViewCmd;
   import com.qq.modules.dailyTD.command.DailyTdViewCmd;
   import com.qq.modules.endlessFuben.command.EndlessFubenViewCmd;
   import com.qq.modules.endlessTD.EndlessTDConst;
   import com.qq.modules.endlessTD.command.EndlessTDViewCmd;
   import com.qq.modules.expedition.command.ExpeditionViewCmd;
   import com.qq.modules.friend.command.FriendViewCmd;
   import com.qq.modules.guide.command.GuideCmd;
   import com.qq.modules.guidePlus.GuideContext;
   import com.qq.modules.guidePlus.command.GuideViewCmd;
   import com.qq.modules.levelup.command.LevelupCmd;
   import com.qq.modules.login.command.LoginServerCmd;
   import com.qq.modules.main.command.CommonCmd;
   import com.qq.modules.main.command.ModuleEntryIconCmd;
   import com.qq.modules.main.command.modules.ModuleArenaCmd;
   import com.qq.modules.main.command.modules.ModuleBattleCardMarketCmd;
   import com.qq.modules.main.command.modules.ModuleBattleCmd;
   import com.qq.modules.main.command.modules.ModuleCardBarCmd;
   import com.qq.modules.main.command.modules.ModuleChatCmd;
   import com.qq.modules.main.command.modules.ModuleCityCmd;
   import com.qq.modules.main.command.modules.ModuleEmbattleCmd;
   import com.qq.modules.main.command.modules.ModuleFubenCmd;
   import com.qq.modules.main.command.modules.ModuleGardenCmd;
   import com.qq.modules.main.command.modules.ModuleLSCmd;
   import com.qq.modules.main.command.modules.ModuleLabCmd;
   import com.qq.modules.main.command.modules.ModuleMailCmd;
   import com.qq.modules.main.command.modules.ModuleMapCmd;
   import com.qq.modules.main.command.modules.ModuleMyHomeCmd;
   import com.qq.modules.main.command.modules.ModuleNutritionCmd;
   import com.qq.modules.main.command.modules.ModulePlantTalentCmd;
   import com.qq.modules.main.command.modules.ModuleRoleInfoCmd;
   import com.qq.modules.main.command.modules.ModuleTDCmd;
   import com.qq.modules.main.command.modules.ModuleWTCmd;
   import com.qq.modules.main.command.modules.ModuleWorldBossCmd;
   import com.qq.modules.main.command.modules.ModuleZombieIslandCmd;
   import com.qq.modules.mergeServer.command.MergeServerCmd;
   import com.qq.modules.notice.command.NoticeCmd;
   import com.qq.modules.offlineReward.command.OfflineRewardViewCmd;
   import com.qq.modules.quest.command.QuestCmd;
   import com.qq.modules.rankArena.command.RankArenaViewCmd;
   import com.qq.modules.roleInfo.command.RoleInfoCmd;
   import com.qq.modules.superArena.command.SuperArenaViewCmd;
   import com.qq.modules.tdPrivilege.command.ModuleTDPrivilegeCmd;
   import com.qq.modules.treasure.command.TreasureCmd;
   import com.qq.modules.trialRoad.command.TrialRoadViewCmd;
   import com.qq.modules.union.command.UnionCmd;
   import com.qq.modules.unionFuben.command.UnionFubenProxyCmd;
   import com.qq.modules.welfareHall.command.ModuleWelfareHallCmd;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.StateMachine;
   import com.qq.utils.UrlManager;
   import com.qq.utils.blit.QBlitBoneManager;
   import com.qq.utils.blit.QBlitDisplayFactory;
   import flash.geom.Point;
   import org.robotlegs.extend.module.RobotlegModuleLoaderManager;
   
   public class SceneCenter
   {
      
      private static var _instance:SceneCenter;
       
      
      private var tdBlitDisplayFactory:IBlitDisplayFactory;
      
      private var normalBlitDisplayFactory:IBlitDisplayFactory;
      
      public var isAutoGotoCity:Boolean;
      
      public var townUpgrade:Boolean;
      
      private var _stateMachine:StateMachine;
      
      public function SceneCenter()
      {
         super();
         this.tdBlitDisplayFactory = new QBlitDisplayFactory();
         this.tdBlitDisplayFactory.CreateStage(Application.application.width,Application.application.height);
         this.normalBlitDisplayFactory = new QBlitDisplayFactory();
         this.normalBlitDisplayFactory.CreateStage(Application.application.width,Application.application.height);
         GameGloble.tdBlitBoneManager = new QBlitBoneManager(Application.application.stage.frameRate);
         GameGloble.normalBlitBoneManager = new BlitBoneManager(Application.application.stage.frameRate,Application.application.stage);
         GameGloble.tdBlitBoneManager.setUndefaultBlitFactory(this.normalBlitDisplayFactory);
         GameGloble.normalBlitBoneManager.setUndefaultBlitFactory(this.normalBlitDisplayFactory);
         BlitBoneManager.setImpl(GameGloble.normalBlitBoneManager);
         this.isAutoGotoCity = false;
         this._stateMachine = new StateMachine();
         this.initScene();
      }
      
      public static function getInstance() : SceneCenter
      {
         if(_instance == null)
         {
            _instance = new SceneCenter();
         }
         return _instance;
      }
      
      public function get currentScene() : String
      {
         return this._stateMachine.getCurState();
      }
      
      private function initScene() : void
      {
         this._stateMachine.addState(SceneName.City,this.enter_city,null,this.leave_city);
         this._stateMachine.addState(SceneName.LevelSelect,this.enter_levelSelect,null,this.leave_levelSelect);
         this._stateMachine.addState(SceneName.TD,this.enter_td,null,this.leave_td);
         this._stateMachine.addState(SceneName.Battle,this.enter_battle,null,this.leave_battle);
         this._stateMachine.addState(SceneName.fuben,this.enter_fuben,null,this.leave_fuben);
         this._stateMachine.addState(SceneName.MAP,this.enter_map,null,this.leave_map);
         this._stateMachine.addState(SceneName.Union,this.enter_unionHall,null,this.leave_unionHall);
         this._stateMachine.addState(SceneName.DailyTD,this.enter_dailyTd,null,this.leave_dailyTd);
         this._stateMachine.addState(SceneName.ZombieIsland,this.enter_island,null,this.leave_island);
         this._stateMachine.addState(SceneName.TreasureHall,this.enter_treasure,null,this.leave_treasure);
         this._stateMachine.addState(SceneName.Nutrition,this.enter_nutrition,null,this.leave_nutrition);
         this._stateMachine.addState(SceneName.MY_HOME,this.enter_myhome,null,this.leave_myhome);
         this._stateMachine.addState(SceneName.EndlessTD,this.enter_endlessTD,null,this.leave_endlessTD);
         this._stateMachine.addState(SceneName.TrialRoad,this.enter_trialRoad,null,this.leave_trialRoad);
         this._stateMachine.addState(SceneName.ARENA_ENTRANCE,this.enter_arenaEntrance,null,this.leave_arenaEntrance);
         this._stateMachine.addState(SceneName.NORMAL_ARENA,this.enter_normalArena,null,this.leave_normalArena);
         this._stateMachine.addState(SceneName.RANK_ARENA,this.enter_rankArena,null,this.leave_rankArena);
         this._stateMachine.addState(SceneName.DRUNKERY,this.enter_drunkery,null,this.leave_drunkery);
         this._stateMachine.addState(SceneName.GARDEN,this.enter_garden,null,this.leave_garden);
         this._stateMachine.addState(SceneName.WT,this.enter_wt,null,this.leave_wt);
         this._stateMachine.addState(SceneName.CardBar,this.enter_cardBar,null,this.leave_cardBar);
         this._stateMachine.addState(SceneName.AWAKE,this.enter_awake,null,this.leave_awake);
         this._stateMachine.addState(SceneName.LAB,this.enter_lab,null,this.leave_lab);
         this._stateMachine.addState(SceneName.PlantTalent,this.enter_plantTalent,null,this.leave_plantTalent);
         this._stateMachine.addState(SceneName.BALANCE_FIGHT,this.enter_balance,null,this.leave_balance);
         this._stateMachine.addState(SceneName.HOLE,this.enterHole,null,this.leaveHole);
         this._stateMachine.addState(SceneName.Expedition,this.enterExpedition,null,this.leaveExpedition);
         this._stateMachine.addState(SceneName.EndlessFuben,this.enterEndlessFuben,null,this.leaveEndlessFuben);
         this._stateMachine.addState(SceneName.SuperArena,this.enterSuperArena,null,this.leaveSuperArena);
      }
      
      private function enterSuperArena(param1:Array) : void
      {
         ModuleRoleInfoCmd.start(RoleInfoPanelID.Bar_GoldDiamond | RoleInfoPanelID.Bar_GiftDiamondBar | RoleInfoPanelID.Bar_Coin);
         SuperArenaViewCmd.enterSuperArena();
         ChatViewCmd.switchChatMode(ChatUIModeType.VIEW_MODE_MIDDLE);
      }
      
      private function leaveSuperArena() : void
      {
         SuperArenaViewCmd.leaveSuperArena();
         ChatViewCmd.switchChatMode(ChatUIModeType.VIEW_MODE_MAX);
      }
      
      private function enterExpedition(param1:Array) : void
      {
         ModuleRoleInfoCmd.start(RoleInfoPanelID.Bar_GoldDiamond | RoleInfoPanelID.Bar_GiftDiamondBar | RoleInfoPanelID.Bar_Coin);
         ExpeditionViewCmd.gotoBatte();
         ChatViewCmd.switchChatMode(ChatUIModeType.VIEW_MODE_MAX,ChatUIModeType.CHANNEL_MODE_EXPEIDITION);
      }
      
      private function leaveExpedition() : void
      {
         ExpeditionViewCmd.leaveBattle();
         ChatViewCmd.switchChatMode(ChatUIModeType.VIEW_MODE_MAX);
      }
      
      private function enter_plantTalent(param1:Array) : void
      {
         ModulePlantTalentCmd.start();
         ModuleRoleInfoCmd.start(RoleInfoPanelID.Bar_Exp);
         ChatViewCmd.switchChatMode(ChatUIModeType.VIEW_MODE_MIN);
         CityViewCmd.setTopRightToolBarVisible(false);
         GuideViewCmd.changeContext(GuideContext.GENIUS_LAB);
         CommandDispatcher.send(CommandName.Hide_Plant_Talent_Tip);
      }
      
      private function leave_plantTalent() : void
      {
         ModulePlantTalentCmd.unload();
         ChatViewCmd.switchChatMode(ChatUIModeType.VIEW_MODE_MAX);
         ModuleRoleInfoCmd.unload();
         CityViewCmd.setTopRightToolBarVisible(true);
         GuideViewCmd.changeContext(GuideContext.TOWN);
      }
      
      private function enter_lab(param1:Array) : void
      {
         CommandDispatcher.send(CommandName.Hide_Lab_Tip);
         ModuleLabCmd.start();
         ModuleRoleInfoCmd.start(RoleInfoPanelID.Bar_Exp | RoleInfoPanelID.Bar_Coin);
         ChatViewCmd.switchChatMode(ChatUIModeType.VIEW_MODE_MIN);
         GuideViewCmd.changeContext(GuideContext.LABORATORY);
      }
      
      private function leave_lab() : void
      {
         ModuleLabCmd.unload();
         RoleInfoCmd.configBar();
         ChatViewCmd.switchChatMode(ChatUIModeType.VIEW_MODE_MAX);
         GuideViewCmd.changeContext(GuideContext.TOWN);
      }
      
      private function enter_drunkery(param1:Array) : void
      {
         this.beforeLeaveAllScene();
         ModuleBattleCardMarketCmd.start();
         ModuleRoleInfoCmd.start(RoleInfoPanelID.Bar_Exp | RoleInfoPanelID.Bar_GoldDiamond | RoleInfoPanelID.Bar_GiftDiamondBar | RoleInfoPanelID.Bar_FriendPoint);
         ChatViewCmd.switchChatMode(ChatUIModeType.VIEW_MODE_MIN);
         GuideViewCmd.changeContext(GuideContext.DRUNKERY);
      }
      
      private function leave_drunkery() : void
      {
         this.beforeLeaveAllScene();
         ModuleBattleCardMarketCmd.unload();
      }
      
      private function enter_map(param1:Array) : void
      {
         this.beforeEnterAllScene();
         ModuleMapCmd.start(!!param1 ? int(param1[0]) : 0);
         ModuleRoleInfoCmd.start(RoleInfoPanelID.Bar_Default,RoleInfoPanelID.CityRolePanel);
         GuideViewCmd.changeContext(GuideContext.MAP);
      }
      
      private function leave_map() : void
      {
         this.beforeLeaveAllScene();
         ModuleMapCmd.unload();
         ModuleRoleInfoCmd.unload();
      }
      
      private function beforeEnterAllScene() : void
      {
         ModuleEmbattleCmd.unload();
      }
      
      private function beforeLeaveAllScene() : void
      {
         CommonCmd.clearBlitDataAndCache();
         ToolTipManager.RemoveAllTooltips(true);
         ChatViewCmd.switchChatMode(ChatUIModeType.VIEW_MODE_MIN);
         RobotlegModuleLoaderManager.impl.unloadModuleInit(UrlManager.getUrl(UrlManager.Url_Module,"ModuleBattleLineup.swf"));
         ModuleArenaCmd.unload();
      }
      
      public function switchScene(param1:String, param2:Array = null) : void
      {
         (PopUpManager.impl as QPopUpManagerImpl).closeAllVisibleComponents();
         GuideCmd.checkAllBtnVisible();
         if(SceneCenter.getInstance().isAutoGotoCity)
         {
            SceneCenter.getInstance().isAutoGotoCity = false;
            if(this.currentScene != SceneName.City && param1 == SceneName.LevelSelect)
            {
               this._stateMachine.setState(SceneName.City,param2);
            }
            else
            {
               this._stateMachine.setState(param1,param2);
            }
         }
         else
         {
            this._stateMachine.setState(param1,param2);
         }
      }
      
      private function enter_battle(param1:Array) : void
      {
         this.beforeEnterAllScene();
         ModuleBattleCmd.start(param1);
      }
      
      private function leave_battle() : void
      {
         this.beforeLeaveAllScene();
         ModuleBattleCmd.unload();
      }
      
      private function enter_city(param1:Array) : void
      {
         this.beforeEnterAllScene();
         GuideCmd.checkBeforeToScene(SceneName.City);
         ModuleCityCmd.start();
         MergeServerCmd.showMergeFlag();
         ModuleRoleInfoCmd.start(RoleInfoPanelID.Bar_Default,RoleInfoPanelID.CityRolePanel);
         ModuleWelfareHallCmd.start();
         NoticeCmd.showNoticeIcon();
         ModuleEntryIconCmd.start();
         ModuleChatCmd.start();
         ChatViewCmd.showUI();
         ChatViewCmd.switchChatMode(ChatUIModeType.VIEW_MODE_MAX);
         LoginServerCmd.getPlayerBattleCardInfo();
         FriendViewCmd.addFriendIm((Application.application as IMyApplication).uiLayer);
         QuestCmd.addQuickQuestPanel((Application.application as IMyApplication).uiLayer);
         GuideViewCmd.changeContext(GuideContext.TOWN);
         OfflineRewardViewCmd.showOfflineEffect();
         if(GameGloble.isAutoPopupDailyQuestWin)
         {
            GameGloble.isAutoPopupDailyQuestWin = false;
            QuestCmd.openDailyQuestWindow();
         }
         if(this.townUpgrade)
         {
            this.showTownLevelUp();
         }
      }
      
      public function showTownLevelUp() : void
      {
         if(this.currentScene != SceneName.City)
         {
            this.townUpgrade = true;
         }
         else
         {
            CommonCmd.addAfterBattleDoFunc(CommonCmd.playClassMcEffct,["Res_Town_level_up_anm",null,null,null,new Point(0,-150)]);
            CommonCmd.addAfterBattleDoFunc(LevelupCmd.openLevelupWin,[GameGloble.actorModel.actorLevel]);
            this.townUpgrade = false;
         }
      }
      
      private function leave_city() : void
      {
         this.beforeLeaveAllScene();
         ModuleCityCmd.unload();
         ModuleRoleInfoCmd.unload();
         ModuleEntryIconCmd.unload();
         ModuleWorldBossCmd.unload();
         FriendViewCmd.removeFriendIm();
         ModuleMailCmd.unload();
         QuestCmd.removeQuestPanel();
         RobotlegModuleLoaderManager.impl.unloadModuleInit(UrlManager.getUrl(UrlManager.Url_Module,"ModuleCard.swf"));
      }
      
      private function enter_levelSelect(param1:Array) : void
      {
         this.beforeEnterAllScene();
         GuideCmd.checkBeforeToScene(SceneName.LevelSelect);
         MergeServerCmd.showMergeFlag();
         ChatViewCmd.hideUI();
         var _loc2_:int = param1[0];
         var _loc3_:Object = param1[1];
         var _loc4_:int = -1;
         if(param1[2] != null)
         {
            _loc4_ = param1[2];
         }
         var _loc5_:int = -1;
         if(param1[3] != null)
         {
            _loc5_ = param1[3];
         }
         ModuleLSCmd.startLS(_loc2_,_loc3_,_loc4_,_loc5_);
         ModuleRoleInfoCmd.start(RoleInfoPanelID.Bar_Exp | RoleInfoPanelID.Bar_Vip | RoleInfoPanelID.Bar_GoldDiamond | RoleInfoPanelID.Bar_GiftDiamondBar | RoleInfoPanelID.Bar_Coin);
         ModuleTDPrivilegeCmd.start();
         GuideViewCmd.changeContext(GuideContext.TD_SELECT);
         LoginServerCmd.requestPrivilegeAndUnlockPlantInfo(1,1,1);
      }
      
      private function leave_levelSelect() : void
      {
         this.beforeLeaveAllScene();
         ModuleLSCmd.unloadLS();
         ModuleRoleInfoCmd.unload();
         ModuleTDPrivilegeCmd.unload();
      }
      
      private function enter_unionHall(param1:Array) : void
      {
         this.beforeEnterAllScene();
         UnionCmd.enterUnionHall(param1[0]);
         ModuleRoleInfoCmd.start();
         GuideViewCmd.changeContext(GuideContext.UNION);
      }
      
      private function leave_unionHall() : void
      {
         UnionCmd.leaveUnionHall();
         ModuleRoleInfoCmd.unload();
      }
      
      private function enter_fuben(param1:Array) : void
      {
         this.beforeEnterAllScene();
         GuideCmd.checkBeforeToScene(SceneName.fuben);
         ModuleFubenCmd.start();
         ModuleRoleInfoCmd.start(RoleInfoPanelID.Bar_Default,RoleInfoPanelID.CityRolePanel);
         ModuleMyHomeCmd.unload();
         GuideViewCmd.changeContext(GuideContext.ADVENTURE_SELECT);
         UnionFubenProxyCmd.getUnionFubenFormation();
         UnionFubenProxyCmd.getUnionFubenChapter();
      }
      
      private function leave_fuben() : void
      {
         this.beforeLeaveAllScene();
         ModuleFubenCmd.unload();
         ModuleRoleInfoCmd.unload();
      }
      
      private function enter_td(param1:Array) : void
      {
         this.beforeEnterAllScene();
         GuideCmd.checkBeforeToScene(SceneName.TD);
         ChatViewCmd.hideUI();
         BlitBoneManager.impl.clearAllChildren();
         Blit.instance.factory = this.tdBlitDisplayFactory;
         BlitBoneManager.setImpl(GameGloble.tdBlitBoneManager);
         ToolTipManager.impl.toolTipEffect = new BottomToolTipEffect();
         GameGloble.normalBlitBoneManager.clearAllBoneDataCache(0);
         ModuleTDCmd.startTDGame(param1);
         GuideViewCmd.changeContext(GuideContext.TD_BATTLE);
      }
      
      private function leave_td() : void
      {
         BlitDisplayContainerBatchEncoderCollectorManager.instance.ClearAndDispose();
         this.beforeLeaveAllScene();
         Blit.instance.factory = this.normalBlitDisplayFactory;
         BlitBoneManager.setImpl(GameGloble.normalBlitBoneManager);
         ToolTipManager.impl.toolTipEffect = new NoneToolTipEffect();
         ModuleTDCmd.unloadTD();
         GameGloble.stage.frameRate = 30;
         GameGloble.tdBlitBoneManager.clearAllBoneDataCache(0);
      }
      
      private function enter_dailyTd(param1:Array) : void
      {
         this.beforeEnterAllScene();
         DailyTdViewCmd.showDailyTDScene();
      }
      
      private function leave_dailyTd() : void
      {
         this.beforeLeaveAllScene();
         DailyTdViewCmd.leaveDailyTDScene();
      }
      
      private function enter_island(param1:Array) : void
      {
         this.beforeEnterAllScene();
         ModuleZombieIslandCmd.start();
         ModuleRoleInfoCmd.start();
         GuideViewCmd.changeContext(GuideContext.ISLAND);
      }
      
      private function leave_island() : void
      {
         this.beforeLeaveAllScene();
         ModuleZombieIslandCmd.unload();
         ModuleRoleInfoCmd.unload();
      }
      
      private function enter_treasure(param1:Array) : void
      {
         this.beforeEnterAllScene();
         TreasureCmd.enterTreasureHall();
         ModuleRoleInfoCmd.start(RoleInfoPanelID.Bar_Empty);
      }
      
      private function leave_treasure() : void
      {
         this.beforeLeaveAllScene();
         TreasureCmd.levelTreasureHall();
         ModuleRoleInfoCmd.unload();
      }
      
      private function enter_nutrition(param1:Object) : void
      {
         this.beforeEnterAllScene();
         ModuleNutritionCmd.start(param1);
         ModuleRoleInfoCmd.start(RoleInfoPanelID.Bar_Exp | RoleInfoPanelID.Bar_Coin | RoleInfoPanelID.Bar_GoldDiamond | RoleInfoPanelID.Bar_GiftDiamondBar | RoleInfoPanelID.Bar_RoleBuffBar);
      }
      
      private function leave_nutrition() : void
      {
         this.beforeLeaveAllScene();
         ModuleNutritionCmd.unload();
         ModuleRoleInfoCmd.start(RoleInfoPanelID.Bar_Exp | RoleInfoPanelID.Bar_Coin | RoleInfoPanelID.Bar_GoldDiamond | RoleInfoPanelID.Bar_GiftDiamondBar | RoleInfoPanelID.Bar_RoleBuffBar);
      }
      
      private function enter_awake(param1:Array) : void
      {
         this.beforeEnterAllScene();
         var _loc2_:Boolean = param1 != null ? Boolean(param1[0]) : false;
         ModuleAwakeCmd.start(_loc2_);
         ModuleRoleInfoCmd.start(RoleInfoPanelID.Bar_Exp | RoleInfoPanelID.Bar_Coin | RoleInfoPanelID.Bar_GoldDiamond | RoleInfoPanelID.Bar_GiftDiamondBar);
      }
      
      private function leave_awake() : void
      {
         this.beforeLeaveAllScene();
         ModuleAwakeCmd.unload();
         ModuleRoleInfoCmd.unload();
      }
      
      private function enter_cardBar(param1:Array) : void
      {
         this.beforeEnterAllScene();
         ModuleCardBarCmd.start();
         ModuleRoleInfoCmd.start(RoleInfoPanelID.Bar_Exp | RoleInfoPanelID.Bar_Coin | RoleInfoPanelID.Bar_GoldDiamond | RoleInfoPanelID.Bar_GiftDiamondBar | RoleInfoPanelID.Bar_RoleBuffBar);
      }
      
      private function leave_cardBar() : void
      {
         this.beforeLeaveAllScene();
         ModuleCardBarCmd.unload();
         ModuleRoleInfoCmd.unload();
      }
      
      private function enter_wt(param1:Array) : void
      {
         this.beforeEnterAllScene();
         ModuleWTCmd.start();
         ModuleRoleInfoCmd.start(RoleInfoPanelID.Bar_RoleMudBar | RoleInfoPanelID.Bar_GoldDiamond | RoleInfoPanelID.Bar_GiftDiamondBar | RoleInfoPanelID.Bar_RoleBuffBar);
         GuideViewCmd.changeContext(GuideContext.WORLD_TREE);
      }
      
      private function leave_wt() : void
      {
         this.beforeLeaveAllScene();
         ModuleWTCmd.unload();
         ModuleRoleInfoCmd.unload();
      }
      
      private function enter_myhome(param1:Array) : void
      {
         this.beforeEnterAllScene();
         ModuleRoleInfoCmd.start(RoleInfoPanelID.Bar_GoldDiamond | RoleInfoPanelID.Bar_GiftDiamondBar);
         GuideViewCmd.changeContext(GuideContext.FAMILY_HOUSE);
      }
      
      private function leave_myhome() : void
      {
         this.beforeLeaveAllScene();
         ModuleMyHomeCmd.unload();
         ModuleFubenCmd.unload();
      }
      
      private function enter_endlessTD(param1:Array) : void
      {
         this.beforeEnterAllScene();
         ModuleRoleInfoCmd.start();
         EndlessTDViewCmd.enterScene();
      }
      
      private function leave_endlessTD() : void
      {
         this.beforeLeaveAllScene();
         ModuleRoleInfoCmd.unload();
         CommandDispatcher.send(EndlessTDConst.ENDLESS_TD_EXIT_SCENE);
      }
      
      private function enter_trialRoad(param1:Array) : void
      {
         this.beforeEnterAllScene();
         TrialRoadViewCmd.enterScene();
         ModuleRoleInfoCmd.start();
         GuideViewCmd.changeContext(GuideContext.TRIAL_ROAD);
      }
      
      private function leave_trialRoad() : void
      {
         this.beforeLeaveAllScene();
         TrialRoadViewCmd.leavaScene();
         ModuleRoleInfoCmd.unload();
      }
      
      private function enter_arenaEntrance(param1:Array) : void
      {
         this.beforeEnterAllScene();
         ArenaEntranceViewCmd.enterScene();
         ModuleRoleInfoCmd.start();
         GuideViewCmd.changeContext(GuideContext.ARENA);
      }
      
      private function leave_arenaEntrance() : void
      {
         this.beforeLeaveAllScene();
         ArenaEntranceViewCmd.leavaScene();
         RobotlegModuleLoaderManager.impl.unloadModuleInitByType(TypeModule.MODULE_ARENA_ENTRANCE);
         ModuleRoleInfoCmd.unload();
      }
      
      private function enter_normalArena(param1:Array) : void
      {
         this.beforeEnterAllScene();
         ArenaCmd.openArenaWD();
         ModuleRoleInfoCmd.start();
      }
      
      private function leave_normalArena() : void
      {
         this.beforeLeaveAllScene();
         ArenaCmd.leaveScene();
         RobotlegModuleLoaderManager.impl.unloadModuleInitByType(TypeModule.MODULE_ARENA);
         ModuleRoleInfoCmd.unload();
      }
      
      private function enter_rankArena(param1:Array) : void
      {
         this.beforeEnterAllScene();
         RankArenaViewCmd.enterScene();
         ModuleRoleInfoCmd.start();
      }
      
      private function leave_rankArena() : void
      {
         this.beforeLeaveAllScene();
         RankArenaViewCmd.leavaScene();
         RobotlegModuleLoaderManager.impl.unloadModuleInitByType(TypeModule.MODULE_RANK_ARENA);
         ModuleRoleInfoCmd.unload();
      }
      
      private function enter_garden(param1:Array) : void
      {
         this.beforeEnterAllScene();
         ModuleGardenCmd.start();
         ModuleRoleInfoCmd.start(RoleInfoPanelID.Bar_GiftDiamondBar | RoleInfoPanelID.Bar_Coin | RoleInfoPanelID.Bar_GoldDiamond);
         ChatViewCmd.hideUI();
         GuideViewCmd.changeContext(GuideContext.GARDEN_MAIN);
      }
      
      private function leave_garden() : void
      {
         this.beforeLeaveAllScene();
         ModuleGardenCmd.unload();
         ModuleRoleInfoCmd.unload();
      }
      
      private function enter_balance(param1:Array) : void
      {
         this.beforeEnterAllScene();
         BalanceViewCmd.prepareFight(param1[0]);
         ModuleRoleInfoCmd.start();
      }
      
      private function leave_balance() : void
      {
         this.beforeLeaveAllScene();
         RobotlegModuleLoaderManager.impl.unloadModuleInitByType(TypeModule.MODULE_BALANCE);
      }
      
      public function enterLab(param1:Array) : void
      {
         ModuleLabCmd.start();
         ModuleRoleInfoCmd.start(RoleInfoPanelID.Bar_Exp | RoleInfoPanelID.Bar_Coin);
         ChatViewCmd.switchChatMode(ChatUIModeType.VIEW_MODE_MIN);
         GuideViewCmd.changeContext(GuideContext.LABORATORY);
      }
      
      public function leaveLab() : void
      {
         ModuleLabCmd.unload();
         ModuleRoleInfoCmd.unload();
         ChatViewCmd.switchChatMode(ChatUIModeType.VIEW_MODE_MAX);
         GuideViewCmd.changeContext(GuideContext.TOWN);
      }
      
      private function enterHole(param1:Array) : void
      {
         this.beforeEnterAllScene();
         ChatViewCmd.hideUI();
         ModuleRoleInfoCmd.start(RoleInfoPanelID.Bar_Coin | RoleInfoPanelID.Bar_LightBar | RoleInfoPanelID.Bar_GoldDiamond | RoleInfoPanelID.Bar_GiftDiamondBar);
         RobotlegModuleLoaderManager.impl.doModuleInitByType(TypeModule.MODULE_HOLE,null,(Application.application as IMyApplication).mainLayer,param1);
         GuideViewCmd.changeContext(GuideContext.HOLE);
      }
      
      private function leaveHole() : void
      {
         this.beforeLeaveAllScene();
         RobotlegModuleLoaderManager.impl.unloadModuleInitByType(TypeModule.MODULE_HOLE);
      }
      
      public function enterEndlessFuben(param1:Array) : void
      {
         this.beforeEnterAllScene();
         GuideCmd.checkBeforeToScene(SceneName.fuben);
         ModuleRoleInfoCmd.start(RoleInfoPanelID.Bar_GoldDiamond | RoleInfoPanelID.Bar_GiftDiamondBar | RoleInfoPanelID.Bar_Coin);
         EndlessFubenViewCmd.enterEndlessFuben();
         ChatViewCmd.switchChatMode(ChatUIModeType.VIEW_MODE_MIN);
      }
      
      public function leaveEndlessFuben() : void
      {
         this.beforeLeaveAllScene();
         EndlessFubenViewCmd.leaveEndlessFuben();
         ChatViewCmd.switchChatMode(ChatUIModeType.VIEW_MODE_MAX);
      }
   }
}
