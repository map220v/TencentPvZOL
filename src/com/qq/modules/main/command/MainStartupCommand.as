package com.qq.modules.main.command
{
   import PVZ.CmdConst;
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.display.ScreenViewContainer;
   import com.qq.modules.actDf51.model.ActDf51Proxy;
   import com.qq.modules.actFund.command.ActFundProxyCommand;
   import com.qq.modules.actFund.model.ActFundProxy;
   import com.qq.modules.actPennyShop.model.ActPennyShopProxy;
   import com.qq.modules.activity.command.ActivityProxyCommand;
   import com.qq.modules.activity.command.ActivityViewCommand;
   import com.qq.modules.activity.model.ActivityProxy;
   import com.qq.modules.addict.command.AddictCommand;
   import com.qq.modules.arena.model.ArenaModel;
   import com.qq.modules.arena.service.ArenaService;
   import com.qq.modules.awake.command.AwakeCommand;
   import com.qq.modules.awake.command.ModuleAwakeCommand;
   import com.qq.modules.awake.model.AwakeProxy;
   import com.qq.modules.bag.command.BagProxyCommand;
   import com.qq.modules.bag.model.BagService;
   import com.qq.modules.bag.model.vo.BagProxy;
   import com.qq.modules.basic.command.BasicCommand;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.buffActivity.model.BuffActivityProxy;
   import com.qq.modules.buy.command.MonthCardCommand;
   import com.qq.modules.buy.model.MonthCardProxy;
   import com.qq.modules.castle.command.CastleCommand;
   import com.qq.modules.chat.command.ChatProxyCommand;
   import com.qq.modules.chat.model.ChatProxy;
   import com.qq.modules.city.command.CityProxyCommand;
   import com.qq.modules.city.model.CityProxy;
   import com.qq.modules.city.model.vo.CityData;
   import com.qq.modules.collectCoin.command.CollectCoinServiceCommand;
   import com.qq.modules.collectCoin.model.CollectCoinService;
   import com.qq.modules.collectWord.command.CollectWordCommand;
   import com.qq.modules.collectWord.model.CollectWordProxy;
   import com.qq.modules.commEmbattle.command.CommEmbattleProxyCommand;
   import com.qq.modules.dragonBoat.command.DragonBoatCommand;
   import com.qq.modules.dragonBoat.model.DragonBoatProxy;
   import com.qq.modules.dummy.command.DummyProxyCommand;
   import com.qq.modules.dummy.model.DummyProxy;
   import com.qq.modules.embattle.service.EmbattleService;
   import com.qq.modules.entryIcon.command.EntryIconCommand;
   import com.qq.modules.entryIcon.model.EntryIconModel;
   import com.qq.modules.exped.command.ExpedProxyCommand;
   import com.qq.modules.exped.model.ExpedProxy;
   import com.qq.modules.friend.command.FriendProxyCommand;
   import com.qq.modules.friend.model.FriendProxy;
   import com.qq.modules.fuben.command.FubenProxyCommand;
   import com.qq.modules.fuben.model.FubenProxy;
   import com.qq.modules.guide.command.GuideCommand;
   import com.qq.modules.guide.model.GuideProxy;
   import com.qq.modules.lab.command.LabProxyCommand;
   import com.qq.modules.lab.model.LabProxy;
   import com.qq.modules.levelselect.model.LSProxy;
   import com.qq.modules.login.command.LoginServerCommand;
   import com.qq.modules.login.model.CoinCollectInfo;
   import com.qq.modules.login.service.LoginService;
   import com.qq.modules.luckystar.model.LuckyStarProxy;
   import com.qq.modules.main.command.modules.ModuleArenaCommand;
   import com.qq.modules.main.command.modules.ModuleBattleCardMarketCommand;
   import com.qq.modules.main.command.modules.ModuleBattleCommand;
   import com.qq.modules.main.command.modules.ModuleCardBarCommand;
   import com.qq.modules.main.command.modules.ModuleChatCommand;
   import com.qq.modules.main.command.modules.ModuleCityCommand;
   import com.qq.modules.main.command.modules.ModuleDownloadShortcutCommand;
   import com.qq.modules.main.command.modules.ModuleDrawCardCommand;
   import com.qq.modules.main.command.modules.ModuleEmbattleCommand;
   import com.qq.modules.main.command.modules.ModuleFubenCommand;
   import com.qq.modules.main.command.modules.ModuleGardenCommand;
   import com.qq.modules.main.command.modules.ModuleGuideCommand;
   import com.qq.modules.main.command.modules.ModuleLSCommand;
   import com.qq.modules.main.command.modules.ModuleLabCommand;
   import com.qq.modules.main.command.modules.ModuleMailCommand;
   import com.qq.modules.main.command.modules.ModuleMainCommand;
   import com.qq.modules.main.command.modules.ModuleMapCommand;
   import com.qq.modules.main.command.modules.ModuleMyHomeCommand;
   import com.qq.modules.main.command.modules.ModuleNutritionCommand;
   import com.qq.modules.main.command.modules.ModulePlantTalentCommand;
   import com.qq.modules.main.command.modules.ModuleQuestCommand;
   import com.qq.modules.main.command.modules.ModuleRoleInfoCommand;
   import com.qq.modules.main.command.modules.ModuleSignInCommand;
   import com.qq.modules.main.command.modules.ModuleTDCommand;
   import com.qq.modules.main.command.modules.ModuleWTCommand;
   import com.qq.modules.main.command.modules.ModuleWorldBossCommand;
   import com.qq.modules.main.command.modules.ModuleZombieIslandCommand;
   import com.qq.modules.main.model.ActorFlagInfo;
   import com.qq.modules.main.model.ActorModel;
   import com.qq.modules.main.model.GameFlowProxy;
   import com.qq.modules.main.model.SelfInfo;
   import com.qq.modules.main.model.SettingsModel;
   import com.qq.modules.main.model.StoreModel;
   import com.qq.modules.main.model.WhenAfterBattleDoProxy;
   import com.qq.modules.main.server.PvzSocketService;
   import com.qq.modules.main.server.StoreService;
   import com.qq.modules.main.service.BuffProxy;
   import com.qq.modules.main.service.ExitTipsProxy;
   import com.qq.modules.main.service.FlagInfoProxy;
   import com.qq.modules.main.service.LevelRewardProxy;
   import com.qq.modules.main.service.PrivilegeProxy;
   import com.qq.modules.main.service.ShortcutPayProxy;
   import com.qq.modules.main.view.ModuleLoadView;
   import com.qq.modules.mapinfo.command.MapInfoProxyCommand;
   import com.qq.modules.mapinfo.command.MapInfoViewCommand;
   import com.qq.modules.mapinfo.model.MapInfoProxy;
   import com.qq.modules.mergeServer.command.MergeServerCommand;
   import com.qq.modules.notice.service.NoticeService;
   import com.qq.modules.nutrition.command.NutritionGlobalProxyCommand;
   import com.qq.modules.onlineReward.command.OnlineRewardServiceCommand;
   import com.qq.modules.onlineReward.model.OnlineRewardModel;
   import com.qq.modules.onlineReward.model.OnlineRewardService;
   import com.qq.modules.plantTalent.command.PlantTalentCommand;
   import com.qq.modules.plantTalent.model.PlantTalentModel;
   import com.qq.modules.plantTalent.service.PlantTalentService;
   import com.qq.modules.quest.model.QuestModel;
   import com.qq.modules.quest.service.QuestService;
   import com.qq.modules.qzoneShare.command.QZoneShareCommand;
   import com.qq.modules.qzoneShare.model.QZoneShareProxy;
   import com.qq.modules.rank.command.RankProxyCommand;
   import com.qq.modules.rank.model.RankProxy;
   import com.qq.modules.roleInfo.command.RoleInfoCommand;
   import com.qq.modules.rookieCeremony.command.RookieCeremonyCommand;
   import com.qq.modules.rookieCeremony.model.RookieCeremonyProxy;
   import com.qq.modules.scratch.command.ScratchProxyCommand;
   import com.qq.modules.signIn.model.SignInProxy;
   import com.qq.modules.spring.model.SpringProxy;
   import com.qq.modules.tdPrivilege.command.ModuleTDPrivilegeCommand;
   import com.qq.modules.thanksgiving.model.ThanksgivingProxy;
   import com.qq.modules.topKing.command.TopKingProxyCommand;
   import com.qq.modules.topKing.model.TopKingProxy;
   import com.qq.modules.union.command.UnionServiceCommand;
   import com.qq.modules.union.model.UnionModel;
   import com.qq.modules.union.model.UnionService;
   import com.qq.modules.unionFuben.command.UnionFubenProxyCommand;
   import com.qq.modules.unionFuben.model.UnionFubenProxy;
   import com.qq.modules.unionFuben.model.UnionFubenRankProxy;
   import com.qq.utils.CommandDispatcher;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class MainStartupCommand extends BasicCommand
   {
       
      
      public function MainStartupCommand()
      {
         super();
      }
      
      override public function execute() : void
      {
         CommandDispatcher.init(eventDispatcher);
         this.initMainConfig();
         this.initCommand();
         this.initActor();
         this.initView();
         this.initLoginModule();
      }
      
      private function initLoginModule() : void
      {
         injector.mapSingleton(ActorModel);
         this.autoCreateProxy(PrivilegeProxy);
         injector.mapSingleton(BagProxy);
         injector.mapSingleton(BagService);
         injector.mapSingleton(QuestModel);
         injector.mapSingleton(QuestService);
         injector.mapSingleton(CityData);
         injector.mapSingleton(CityProxy);
         injector.mapSingleton(ActorFlagInfo);
         injector.mapSingleton(FlagInfoProxy);
         injector.mapSingleton(BuffProxy);
         injector.mapSingleton(LabProxy);
         injector.mapSingleton(UnionModel);
         injector.mapSingleton(UnionService);
         injector.mapSingleton(ChatProxy);
         injector.mapSingleton(ActivityProxy);
         injector.mapSingleton(BuffActivityProxy);
         injector.mapSingleton(ArenaService);
         injector.mapSingleton(ArenaModel);
         injector.mapSingleton(StoreModel);
         injector.mapSingleton(StoreService);
         injector.mapSingleton(FubenProxy);
         injector.mapSingleton(OnlineRewardService);
         injector.mapSingleton(OnlineRewardModel);
         injector.mapSingleton(NoticeService);
         injector.mapSingleton(LevelRewardProxy);
         injector.mapSingleton(CoinCollectInfo);
         injector.mapSingleton(PlantTalentModel);
         injector.mapSingleton(PlantTalentService);
         RegisterModuleCmd.registerModuleProxy([[WhenAfterBattleDoProxy,[]]]);
         var _loc1_:LoginService = new LoginService();
         injector.injectInto(_loc1_);
         injector.mapValue(LoginService,_loc1_);
         _loc1_.init();
         this.autoCreateProxy(SignInProxy);
         this.autoCreateProxy(ExpedProxy);
         this.autoCreateProxy(MapInfoProxy);
         this.autoCreateProxy(GameFlowProxy);
         this.autoCreateProxy(MonthCardProxy);
         this.autoCreateProxy(FriendProxy);
         this.autoCreateProxy(ExitTipsProxy);
         this.autoCreateProxy(ShortcutPayProxy);
         this.autoCreateProxy(QZoneShareProxy);
         this.autoCreateProxy(UnionFubenProxy);
         this.autoCreateProxy(UnionFubenRankProxy);
         this.autoCreateProxy(RankProxy);
         this.autoCreateProxy(ActDf51Proxy);
         this.autoCreateProxy(RookieCeremonyProxy);
         this.autoCreateProxy(DragonBoatProxy);
         this.autoCreateProxy(CollectWordProxy);
         this.autoCreateProxy(LSProxy);
         this.autoCreateProxy(AwakeProxy);
         this.autoCreateProxy(CollectCoinService);
         this.autoCreateProxy(ThanksgivingProxy);
         this.autoCreateProxy(ActFundProxy);
         this.autoCreateProxy(SpringProxy);
         this.autoCreateProxy(LuckyStarProxy);
         this.autoCreateProxy(ActPennyShopProxy);
         this.autoCreateProxy(TopKingProxy);
         this.autoCreateProxy(DummyProxy);
         this.autoCreateProxy(EmbattleService);
      }
      
      private function autoCreateProxy(param1:Class) : void
      {
         injector.mapSingleton(param1);
         var _loc2_:BasicProxy = GameGloble.injector.getInstance(param1);
         _loc2_.init();
      }
      
      private function initMainConfig() : void
      {
      }
      
      private function initCommand() : void
      {
         commandMap.mapEvent("RegisterModuleCommand",RegisterModuleCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("LoginServerCommand",LoginServerCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("ModuleTDCommand",ModuleTDCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("ModuleLSCommand",ModuleLSCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("ModuleMainCommand",ModuleMainCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("ModuleTDPrivilegeCommand",ModuleTDPrivilegeCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("GameFlowCommand",GameFlowCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("CommonCommand",CommonCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("ModuleRoleInfoCommand",ModuleRoleInfoCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("ModuleCityCommand",ModuleCityCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("ModuleFubenCommand",ModuleFubenCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("ModulePlantTalentCommand",ModulePlantTalentCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("ModuleQuestCommand",ModuleQuestCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("ModuleBattleCommand",ModuleBattleCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("ModuleDrawCardCommand",ModuleDrawCardCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("ModuleEmbattleCommand",ModuleEmbattleCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("ModuleLabCommand",ModuleLabCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent(CommandName.Common_SwitchPage,SwitchPageCommand,CommonEvent);
         commandMap.mapEvent("ModuleChatCommand",ModuleChatCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("ModuleDownloadShortcutCommand",ModuleDownloadShortcutCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent(ModuleBattleCardMarketCommand.NAME,ModuleBattleCardMarketCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent(ModuleGardenCommand.NAME,ModuleGardenCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("RoleInfoCommand",RoleInfoCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("CmdStoreProxyCommand",CmdStoreProxyCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("GuideCommand",GuideCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("AddictCommand",AddictCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("CityProxyCommand",CityProxyCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("TQOSCommand",TQOSCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("FlagInfoServiceCommand",FlagInfoServiceCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("BuffProxyCommand",BuffProxyCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("LabProxyCommand",LabProxyCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("ModuleMapCommand",ModuleMapCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("ModuleMailCommand",ModuleMailCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("FubenProxyCommand",FubenProxyCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent(ModuleSignInCommand.NAME,ModuleSignInCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent(ModuleDailyActivityCommand.NAME,ModuleDailyActivityCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent(ModuleOfflineRewardCommand.NAME,ModuleOfflineRewardCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("MapInfoProxyCommand",MapInfoProxyCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("MapInfoViewCommand",MapInfoViewCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("TextLinkTriglerCommand",TextLinkTriglerCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent(LevelRewardCommand.NAME,LevelRewardCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent(ModuleGuideCommand.NAME,ModuleGuideCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("UnionServiceCommand",UnionServiceCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("CollectCoinServiceCommand",CollectCoinServiceCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent(ModuleNutritionCommand.NAME,ModuleNutritionCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent(ModuleEntryIconCommand.NAME,ModuleEntryIconCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent(LevelObserverCommand.NAME,LevelObserverCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent(ExpedProxyCommand.NAME,ExpedProxyCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent(ModuleCardBarCommand.NAME,ModuleCardBarCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent(ModuleZombieIslandCommand.NAME,ModuleZombieIslandCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("FriendProxyCommand",FriendProxyCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent(ModuleAwakeCommand.NAME,ModuleAwakeCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("ChatProxyCommand",ChatProxyCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("ModuleArenaCommand",ModuleArenaCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent(EntryIconCommand.NAME,EntryIconCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent(ActivityProxyCommand.NAME,ActivityProxyCommand);
         commandMap.mapEvent(ActivityViewCommand.NAME,ActivityViewCommand);
         commandMap.mapEvent("OnlineRewardServiceCommand",OnlineRewardServiceCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("NutritionGlobalProxyCommand",NutritionGlobalProxyCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("MonthCardCommand",MonthCardCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("ShortcutPayProxyCommand",ShortcutPayProxyCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("PrivilegeProxyCommand",PrivilegeProxyCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("QZoneShareCommand",QZoneShareCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("ModuleMyHomeCommand",ModuleMyHomeCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("ModuleWorldBossCommand",ModuleWorldBossCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("ModuleWTCommand",ModuleWTCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent(ScratchProxyCommand.NAME,ScratchProxyCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("UnionFubenProxyCommand",UnionFubenProxyCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent(RookieCeremonyCommand.NAME,RookieCeremonyCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent(DragonBoatCommand.NAME,DragonBoatCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent(CastleCommand.NAME,CastleCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent(CollectWordCommand.NAME,CollectWordCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent(RankProxyCommand.NAME,RankProxyCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent(AwakeCommand.NAME,AwakeCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent(MergeServerCommand.NAME,MergeServerCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("PlantTalentCommand",PlantTalentCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("BagProxyCommand",BagProxyCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("ActFundProxyCommand",ActFundProxyCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("CommonActCommand",CommonActCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("TopKingProxyCommand",TopKingProxyCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("DummyProxyCommand",DummyProxyCommand,StrongRobotlegCommandEvent);
         commandMap.mapEvent("CommEmbattleProxyCommand",CommEmbattleProxyCommand,StrongRobotlegCommandEvent);
      }
      
      private function initActor() : void
      {
         injector.mapSingleton(SelfInfo);
         CmdConst.init();
         var _loc1_:PvzSocketService = new PvzSocketService();
         injector.injectInto(_loc1_);
         injector.mapValue(PvzSocketService,_loc1_);
         if(ExternalVars.TGW_PATH.length > 0)
         {
            _loc1_.init(ExternalVars.TGW_PATH);
         }
         else
         {
            _loc1_.init(ExternalVars.SOCKET_PATH);
         }
         injector.mapSingleton(SettingsModel);
         injector.mapSingleton(EntryIconModel);
         RegisterModuleCmd.registerModuleProxy([[GuideProxy,[]]]);
      }
      
      private function initView() : void
      {
         injector.mapSingleton(ModuleLoadView);
         ScreenViewContainer.getInstance().tiplayer.addChild(injector.getInstance(ModuleLoadView));
      }
   }
}
