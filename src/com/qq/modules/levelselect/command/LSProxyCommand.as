package com.qq.modules.levelselect.command
{
   import PVZ.Cmd.Cmd_DoGm_CS;
   import PVZ.Cmd.Cmd_TD_ChallengeInheritLastWeekScore_CS;
   import PVZ.Cmd.Cmd_TD_GetChallengeLevelInfo_CS;
   import PVZ.Cmd.Cmd_TD_GetOldPromotionRewardInfo_CS;
   import PVZ.Cmd.Cmd_TD_GetPromotionRewardInfo_CS;
   import PVZ.Cmd.Cmd_TD_GetPromotionReward_CS;
   import PVZ.Cmd.Cmd_TD_GetRankRewardInfo_CS;
   import PVZ.Cmd.Cmd_TD_GetRankReward_CS;
   import PVZ.Cmd.Cmd_TD_GetRank_CS;
   import PVZ.Cmd.Cmd_TD_GetStageInfo_CS;
   import PVZ.Cmd.Cmd_TD_TakeOldPromotionReward_CS;
   import PVZ.Cmd.Cmd_TD_UnlockLevelGate_CS;
   import asgui.controls.Alert;
   import asgui.events.CloseEvent;
   import com.qq.display.QAlert;
   import com.qq.modules.bag.model.vo.BagProxy;
   import com.qq.modules.levelselect.model.LSProxy;
   import com.qq.modules.levelselect.model.vo.LSGateInfoVO;
   import com.qq.modules.main.command.GameFlowCmd;
   import com.qq.modules.main.server.PvzSocketService;
   import com.qq.templates.font.FontHKHB;
   import com.qq.templates.font.FontNormal;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class LSProxyCommand extends StrongRobotlegCommand
   {
       
      
      [Inject]
      public var server:PvzSocketService;
      
      [Inject]
      public var proxy:LSProxy;
      
      [Inject]
      public var bagProxy:BagProxy;
      
      public function LSProxyCommand()
      {
         super();
      }
      
      public function requestStageInfo(param1:int) : void
      {
         var _loc2_:Cmd_TD_GetStageInfo_CS = new Cmd_TD_GetStageInfo_CS();
         _loc2_.stageId = param1;
         this.server.sendMessage(_loc2_);
         var _loc3_:Cmd_TD_GetChallengeLevelInfo_CS = new Cmd_TD_GetChallengeLevelInfo_CS();
         this.server.sendMessage(_loc3_);
      }
      
      public function finishLevel(param1:int, param2:int, param3:int, param4:int, param5:Array) : void
      {
         var _loc6_:Cmd_DoGm_CS;
         (_loc6_ = new Cmd_DoGm_CS()).requestCmd = "pass_td_level " + param1 + " " + param2 + " " + param3 + " 10";
         this.server.sendMessage(_loc6_);
      }
      
      public function checkForUnlockGate(param1:Object) : void
      {
         var vo:LSGateInfoVO = null;
         var lsGateInfoVO:Object = param1;
         vo = lsGateInfoVO as LSGateInfoVO;
         if(!vo.unlocked)
         {
            if(vo.template.checkEnoughItem(this.bagProxy) == false)
            {
               var linkConfirm:Function = function(param1:CloseEvent):void
               {
                  if(param1.detail == Alert.YES)
                  {
                     GameFlowCmd.gotoFuben();
                  }
               };
               QAlert.Show(FontNormal.LS_UNLOCK_GATE_TIP,"",Alert.YES | Alert.NO,null,linkConfirm,FontHKHB.YES,FontHKHB.NO);
            }
            else
            {
               var unlockConfirm:Function = function(param1:CloseEvent):void
               {
                  if(param1.detail == Alert.YES)
                  {
                     unlockGate(vo.template.gateId);
                  }
               };
               QAlert.Show(vo.template.getUnlockAlert(),"",Alert.YES | Alert.NO,null,unlockConfirm,FontHKHB.YES,FontHKHB.NO);
            }
         }
      }
      
      public function unlockGate(param1:int) : void
      {
         var _loc2_:LSGateInfoVO = this.proxy.data.getGateById(param1);
         if(!_loc2_.template.checkUnlockable(this.proxy.data.star,this.bagProxy))
         {
            QAlert.Show("条件不满足");
            return;
         }
         var _loc3_:Cmd_TD_UnlockLevelGate_CS = new Cmd_TD_UnlockLevelGate_CS();
         _loc3_.stageId = this.proxy.data.stageId;
         _loc3_.gateId = param1;
         this.server.sendMessage(_loc3_);
      }
      
      public function getPromoteBonus(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         var _loc6_:Cmd_TD_GetPromotionReward_CS;
         (_loc6_ = new Cmd_TD_GetPromotionReward_CS()).stageId = param1;
         _loc6_.levelId = param2;
         _loc6_.subLevelId = param3;
         _loc6_.challengeLevelId = param4;
         this.server.sendMessage(_loc6_);
      }
      
      public function getRankBonus(param1:int, param2:int, param3:int, param4:int) : void
      {
         var _loc5_:Cmd_TD_GetRankReward_CS;
         (_loc5_ = new Cmd_TD_GetRankReward_CS()).stageId = param1;
         _loc5_.levelId = param2;
         _loc5_.subLevelId = param3;
         _loc5_.challengeLevelId = param4;
         this.server.sendMessage(_loc5_);
      }
      
      public function getRank(param1:int, param2:int, param3:int, param4:int, param5:int = 3) : void
      {
         var _loc6_:Cmd_TD_GetRank_CS;
         (_loc6_ = new Cmd_TD_GetRank_CS()).stageId = this.proxy.data.stageId;
         _loc6_.levelId = param1;
         _loc6_.subLevelId = param2;
         _loc6_.challengeLevelId = param3;
         _loc6_.pageNo = param4;
         _loc6_.pageSize = param5;
         this.server.sendMessage(_loc6_);
      }
      
      public function getRankRewardInfo() : void
      {
         var _loc1_:Cmd_TD_GetRankRewardInfo_CS = new Cmd_TD_GetRankRewardInfo_CS();
         this.server.sendMessage(_loc1_);
      }
      
      public function getPromotionRewardInfo() : void
      {
         var _loc1_:Cmd_TD_GetPromotionRewardInfo_CS = new Cmd_TD_GetPromotionRewardInfo_CS();
         this.server.sendMessage(_loc1_);
      }
      
      public function getOldPromotionRewardInfo() : void
      {
         var _loc1_:Cmd_TD_GetOldPromotionRewardInfo_CS = new Cmd_TD_GetOldPromotionRewardInfo_CS();
         this.server.sendMessage(_loc1_);
      }
      
      public function takeOldPromotionReward() : void
      {
         var _loc1_:Cmd_TD_TakeOldPromotionReward_CS = new Cmd_TD_TakeOldPromotionReward_CS();
         this.server.sendMessage(_loc1_);
      }
      
      public function inheritLastWeekScore(param1:uint, param2:uint, param3:uint) : void
      {
         var _loc4_:Cmd_TD_ChallengeInheritLastWeekScore_CS;
         (_loc4_ = new Cmd_TD_ChallengeInheritLastWeekScore_CS()).stageId = this.proxy.data.stageId;
         _loc4_.levelId = param1;
         _loc4_.subLevelId = param2;
         _loc4_.challengeLevelId = param3;
         this.server.sendMessage(_loc4_);
      }
   }
}
