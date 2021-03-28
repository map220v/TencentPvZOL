package com.qq.modules.actFund.model
{
   import PVZ.Cmd.Cmd_FlexibleActivity_ConsumeFundBuy_SC;
   import PVZ.Cmd.Cmd_FlexibleActivity_GrowFundBaseInfo_SC;
   import PVZ.Cmd.Cmd_FlexibleActivity_GrowFundGetReturn_SC;
   import PVZ.Cmd.Cmd_FlexibleActivity_GrowFundReurnList_SC;
   import PVZ.Cmd.Cmd_FlexibleActivity_TryLuck_SC;
   import PVZ.Cmd.FlexibleActivity_19;
   import PVZ.Cmd.FlexibleActivity_23;
   import com.qq.modules.actFund.ActFundConst;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.main.command.CommonCmd;
   import com.qq.utils.CommandDispatcher;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class ActFundProxy extends BasicProxy
   {
       
      
      public var model:ActFundModel;
      
      public function ActFundProxy()
      {
         super();
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         this.model = new ActFundModel();
      }
      
      override public function listMsgInterests() : Array
      {
         return [[FlexibleActivity_19.$MessageID,this.onFlexibleActivity_19],[Cmd_FlexibleActivity_ConsumeFundBuy_SC.$MessageID,this.onCmd_FlexibleActivity_ConsumeFundBuy_SC],[Cmd_FlexibleActivity_GrowFundBaseInfo_SC.$MessageID,this.onCmd_FlexibleActivity_GrowFundBaseInfo_SC],[Cmd_FlexibleActivity_GrowFundReurnList_SC.$MessageID,this.onCmd_FlexibleActivity_GrowFundReurnList_SC],[Cmd_FlexibleActivity_GrowFundGetReturn_SC.$MessageID,this.onCmd_FlexibleActivity_GrowFundGetReturn_SC],[FlexibleActivity_23.$MessageID,this.onFlexibleActivity_23],[Cmd_FlexibleActivity_TryLuck_SC.$MessageID,this.onCmd_FlexibleActivity_TryLuck_SC]];
      }
      
      private function onCmd_FlexibleActivity_GrowFundGetReturn_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_FlexibleActivity_GrowFundGetReturn_SC = param1.socketData as Cmd_FlexibleActivity_GrowFundGetReturn_SC;
         CommonCmd.itemFly(_loc2_.items);
      }
      
      private function onCmd_FlexibleActivity_GrowFundBaseInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_FlexibleActivity_GrowFundBaseInfo_SC = param1.socketData as Cmd_FlexibleActivity_GrowFundBaseInfo_SC;
         this.model.grow_actID = _loc2_.activityId;
         this.model.grow_canBuyDay = _loc2_.canBuyDay;
         this.model.grow_openBuy = _loc2_.openBuy;
         this.model.grow_price = _loc2_.price;
         this.model.grow_totalValue = _loc2_.totalValue;
         this.model.grow_buyTime = _loc2_.buyTime;
         this.model.grow_getList = _loc2_.getList;
         if(this.model.grow_Fund_List == null)
         {
            CommandDispatcher.send(ActFundConst.Update_GrowFundInfo_Success);
         }
         else
         {
            this.model.updateGrowFundState(this.model.grow_getList);
            CommandDispatcher.send(ActFundConst.Update_GrowFund_List_Success);
         }
      }
      
      private function onCmd_FlexibleActivity_GrowFundReurnList_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_FlexibleActivity_GrowFundReurnList_SC = param1.socketData as Cmd_FlexibleActivity_GrowFundReurnList_SC;
         _loc2_.allReturn.sortOn("order",Array.NUMERIC);
         this.model.loadGrowFundInfo(_loc2_.allReturn);
         this.model.updateGrowFundState(this.model.grow_getList);
         CommandDispatcher.send(ActFundConst.Update_GrowFund_List_Success);
      }
      
      private function onCmd_FlexibleActivity_ConsumeFundBuy_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_FlexibleActivity_ConsumeFundBuy_SC = param1.socketData as Cmd_FlexibleActivity_ConsumeFundBuy_SC;
         CommonCmd.itemFly(_loc2_.items);
      }
      
      private function onFlexibleActivity_19(param1:SocketServiceEvent) : void
      {
         var _loc2_:FlexibleActivity_19 = param1.socketData as FlexibleActivity_19;
         this.model.consumeActID = _loc2_.activityId;
         _loc2_.confInfo.sortOn("seq",Array.NUMERIC);
         this.model.loadConsumeFundInfo(_loc2_);
         CommandDispatcher.send(ActFundConst.CONSUME_FUND_UPDATE);
         CommandDispatcher.send(ActFundConst.FUND_HAS_REWARD,[0,this.model.hasConsumeReward]);
      }
      
      private function onCmd_FlexibleActivity_TryLuck_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_FlexibleActivity_TryLuck_SC = param1.socketData as Cmd_FlexibleActivity_TryLuck_SC;
         this.model.tryInfo.activityId = _loc2_.activityId;
         this.model.tryInfo.ticketCount = _loc2_.ticketCount;
         this.model.tryInfo.goldTicketCount = _loc2_.goldTicketCount;
         this.model.tryInfo.sumReward = _loc2_.sumReward;
         CommandDispatcher.send(ActFundConst.ActFund_Try_Updated);
         CommandDispatcher.send(ActFundConst.ActFund_Try_Got_Diamond,_loc2_.reward);
      }
      
      private function onFlexibleActivity_23(param1:SocketServiceEvent) : void
      {
         var _loc2_:FlexibleActivity_23 = param1.socketData as FlexibleActivity_23;
         this.model.tryInfo = _loc2_;
         CommandDispatcher.send(ActFundConst.ActFund_Try_Updated);
      }
   }
}
