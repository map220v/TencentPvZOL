package com.qq.modules.actPennyShop.model
{
   import PVZ.Cmd.Cmd_FlexibleActivity_Exchange_SC;
   import PVZ.Cmd.FlexibleActivity_24;
   import com.qq.modules.actPennyShop.ActPennyShopConst;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.main.command.CommonCmd;
   import com.qq.utils.CommandDispatcher;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class ActPennyShopProxy extends BasicProxy
   {
       
      
      public var model:ActPennyShopModel;
      
      public function ActPennyShopProxy()
      {
         super();
         this.model = new ActPennyShopModel();
      }
      
      override public function listMsgInterests() : Array
      {
         return [[FlexibleActivity_24.$MessageID,this.onFlexibleActivity_24],[Cmd_FlexibleActivity_Exchange_SC.$MessageID,this.onCmd_FlexibleActivity_Exchange_SC]];
      }
      
      private function onFlexibleActivity_24(param1:SocketServiceEvent) : void
      {
         var _loc2_:FlexibleActivity_24 = param1.socketData as FlexibleActivity_24;
         this.model.list = _loc2_.exchangeItem;
         CommandDispatcher.send(ActPennyShopConst.PENNY_SHOP_DATA_UPDATE);
      }
      
      private function onCmd_FlexibleActivity_Exchange_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_FlexibleActivity_Exchange_SC = param1.socketData as Cmd_FlexibleActivity_Exchange_SC;
         this.model.updateExchangeInfo(_loc2_.index,_loc2_.times);
         CommonCmd.itemFly(_loc2_.reward);
         CommandDispatcher.send(ActPennyShopConst.PENNY_SHOP_DATA_UPDATE);
      }
   }
}
