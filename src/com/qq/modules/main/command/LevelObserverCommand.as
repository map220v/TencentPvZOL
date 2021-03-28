package com.qq.modules.main.command
{
   import asgui.serialization.json.JSON;
   import com.qq.GameGloble;
   import com.qq.modules.activity.command.ActivityProxyCmd;
   import com.qq.modules.basic.model.templates.ServerConfigTemplateFactory;
   import com.qq.modules.brain.command.BrainViewCmd;
   import com.qq.modules.dailyTD.command.DailyTdViewCmd;
   import com.qq.modules.dailyVow.command.DailyVowViewCmd;
   import com.qq.modules.entryIcon.ActivityIconConst;
   import com.qq.modules.entryIcon.command.EntryIconCmd;
   import com.qq.modules.entryIcon.model.templates.EntryIconTemplateFactory;
   import com.qq.modules.entryIcon.model.templates.SystemIconTemplate;
   import com.qq.modules.everyDayBuy.command.EveryDayBuyCmd;
   import com.qq.modules.expedition.command.ExpeditionProxyCmd;
   import com.qq.modules.fuzion.command.FuzionCmd;
   import com.qq.modules.main.command.modules.ModuleSignInCmd;
   import com.qq.modules.main.model.vo.LevelObserver;
   import com.qq.modules.topKing.command.TopKingCmd;
   import com.qq.modules.treasure.command.TreasureCmd;
   import com.qq.modules.unionCompetition.command.UnionCompetitionProxyCmd;
   import com.qq.modules.unionFuben.command.UnionFubenCmd;
   import com.qq.modules.worldBoss.command.WorldBossCmd;
   import com.qq.modules.yetiTD.command.YetiTDViewCmd;
   import flash.utils.Dictionary;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class LevelObserverCommand extends StrongRobotlegCommand
   {
      
      public static const NAME:String = "LevelObserverCommand";
       
      
      public function LevelObserverCommand()
      {
         super();
      }
      
      public function initLevelObserver() : void
      {
         var _loc1_:int = 0;
         this.addLevelObserver(_loc1_,ActivityProxyCmd.getActivityList,null,false);
         this.addLevelObserver(_loc1_,ModuleSignInCmd.start);
         _loc1_ = ServerConfigTemplateFactory.instance.dailyActivityLevelLimit;
         this.addLevelObserver(_loc1_,ModuleOfflineRewardCmd.start);
         _loc1_ = ServerConfigTemplateFactory.instance.getEntryTemplateEveryDayBuy().needLevel;
         this.addLevelObserver(_loc1_,EntryIconCmd.addActivityIcon,[ActivityIconConst.ICON_DAILY_BUY,EveryDayBuyCmd.openEveryDayBuy]);
         this.initSystemIconObserver();
      }
      
      private function addLevelObserver(param1:int, param2:Function = null, param3:Array = null, param4:Boolean = true) : void
      {
         var _loc5_:LevelObserver = new LevelObserver(param1,param2,param3,param4);
         GameGloble.actorModel.addLevelObserver(_loc5_);
      }
      
      private function initSystemIconObserver() : void
      {
         var _loc3_:Array = null;
         var _loc4_:SystemIconTemplate = null;
         var _loc5_:Object = null;
         var _loc6_:String = null;
         var _loc1_:Dictionary = new Dictionary(true);
         _loc1_[1001] = WorldBossCmd.onClickWorldBossIcon;
         _loc1_[1002] = DailyTdViewCmd.showMainPanel;
         _loc1_[1003] = TreasureCmd.openTreasure;
         _loc1_[1004] = GameFlowCmd.gotoEndlessTD;
         _loc1_[1005] = FuzionCmd.enterFuzion;
         _loc1_[1007] = UnionFubenCmd.openUnionFubenWin;
         _loc1_[1008] = UnionCompetitionProxyCmd.getUnionCompetitionInfo;
         _loc1_[1009] = DailyVowViewCmd.openWindow;
         _loc1_[1010] = GameFlowCmd.gotoPlantTest;
         _loc1_[1011] = GameFlowCmd.gotoTDChallengeLevel;
         _loc1_[1012] = BrainViewCmd.openMainView;
         _loc1_[1013] = GameFlowCmd.gotoHole;
         _loc1_[1014] = GameFlowCmd.gotoWebpage;
         _loc1_[1015] = YetiTDViewCmd.showMainWd;
         _loc1_[1017] = TopKingCmd.openRankWindow;
         _loc1_[1018] = ExpeditionProxyCmd.requestOutlineData;
         _loc1_[1019] = GameFlowCmd.gotoEndlessFuben;
         _loc1_[1020] = GameFlowCmd.gotoSuperArena;
         var _loc2_:Vector.<SystemIconTemplate> = EntryIconTemplateFactory.instance.allSystemIcon;
         for each(_loc4_ in _loc2_)
         {
            if(_loc1_.hasOwnProperty(_loc4_.id))
            {
               if(_loc4_.params.length > 0)
               {
                  _loc5_ = asgui.serialization.json.JSON.deserialize(_loc4_.params);
                  _loc3_ = [];
                  for each(_loc6_ in _loc5_)
                  {
                     _loc3_.push(_loc6_);
                  }
               }
               else
               {
                  _loc3_ = null;
               }
               this.addLevelObserver(_loc4_.needLevel,EntryIconCmd.addSystemIcon,[_loc4_.id,_loc1_[_loc4_.id],_loc3_]);
            }
         }
      }
   }
}
