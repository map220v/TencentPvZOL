package com.qq.modules.actFund.command
{
   import PVZ.Cmd.Cmd_FlexibleActivity_ConsumeFundBuy_CS;
   import PVZ.Cmd.Cmd_FlexibleActivity_GrowFundBuy_CS;
   import PVZ.Cmd.Cmd_FlexibleActivity_GrowFundGetReturn_CS;
   import PVZ.Cmd.Cmd_FlexibleActivity_GrowFundReurnList_CS;
   import PVZ.Cmd.Cmd_FlexibleActivity_TakeReward_CS;
   import PVZ.Cmd.Cmd_FlexibleActivity_TryLuck_CS;
   import com.qq.modules.main.server.PvzSocketService;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class ActFundProxyCommand extends StrongRobotlegCommand
   {
       
      
      [Inject]
      public var pvzService:PvzSocketService;
      
      public function ActFundProxyCommand()
      {
         super();
      }
      
      public function buyFund(param1:int, param2:int) : void
      {
         var _loc3_:Cmd_FlexibleActivity_ConsumeFundBuy_CS = new Cmd_FlexibleActivity_ConsumeFundBuy_CS();
         _loc3_.iActivityId = param1;
         _loc3_.iFundId = param2;
         this.pvzService.sendMessage(_loc3_);
      }
      
      public function takeWeekReward(param1:int, param2:int) : void
      {
         var _loc3_:Cmd_FlexibleActivity_TakeReward_CS = new Cmd_FlexibleActivity_TakeReward_CS();
         _loc3_.activityId = param1;
         _loc3_.rewardIndex = param2;
         this.pvzService.sendMessage(_loc3_);
      }
      
      public function requestGrowFundReurnList(param1:int) : void
      {
         var _loc2_:Cmd_FlexibleActivity_GrowFundReurnList_CS = new Cmd_FlexibleActivity_GrowFundReurnList_CS();
         _loc2_.activityId = param1;
         this.pvzService.sendMessage(_loc2_);
      }
      
      public function takeGrowFundReward(param1:int, param2:int) : void
      {
         var _loc3_:Cmd_FlexibleActivity_GrowFundGetReturn_CS = new Cmd_FlexibleActivity_GrowFundGetReturn_CS();
         _loc3_.activityId = param1;
         _loc3_.returnId = param2;
         this.pvzService.sendMessage(_loc3_);
      }
      
      public function buyGrowFund(param1:int) : void
      {
         var _loc2_:Cmd_FlexibleActivity_GrowFundBuy_CS = new Cmd_FlexibleActivity_GrowFundBuy_CS();
         _loc2_.activityId = param1;
         this.pvzService.sendMessage(_loc2_);
      }
      
      public function tryLuck(param1:int, param2:Boolean) : void
      {
         var _loc3_:Cmd_FlexibleActivity_TryLuck_CS = new Cmd_FlexibleActivity_TryLuck_CS();
         _loc3_.activityId = param1;
         _loc3_.goldTicket = param2;
         this.pvzService.sendMessage(_loc3_);
      }
   }
}
