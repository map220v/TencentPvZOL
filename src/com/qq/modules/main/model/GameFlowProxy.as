package com.qq.modules.main.model
{
   import PVZ.Cmd.Cmd_Battle_QueryReport_SC;
   import PVZ.Cmd.Cmd_Battle_QuerySpecialReport_SC;
   import PVZ.Cmd.Cmd_GetClientData_SC;
   import PVZ.Cmd.Cmd_PayShop_BuyGoods_SC;
   import PVZ.Cmd.Cmd_SetClientData_SC;
   import com.qq.CommandName;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.battle.command.BattleServiceCmd;
   import com.qq.utils.external.QExternalUtil;
   import com.tencent.protobuf.Int64;
   import flash.utils.Dictionary;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class GameFlowProxy extends BasicProxy
   {
       
      
      private var m_clientDataMap:Dictionary;
      
      public function GameFlowProxy()
      {
         this.m_clientDataMap = new Dictionary();
         super();
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
      }
      
      override public function listMsgInterests() : Array
      {
         return [[Cmd_Battle_QueryReport_SC.$MessageID,this.onCmd_Friend_QueryReport_SC],[Cmd_PayShop_BuyGoods_SC.$MessageID,this.onCmd_PayShop_BuyGoods_SC],[Cmd_GetClientData_SC.$MessageID,this.onCmd_GetClientData_SC],[Cmd_SetClientData_SC.$MessageID,this.onCmd_SetClientData_SC],[Cmd_Battle_QuerySpecialReport_SC.$MessageID,this.onCmd_Battle_QuerySpecialReport_SC]];
      }
      
      private function onCmd_PayShop_BuyGoods_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_PayShop_BuyGoods_SC = param1.socketData as Cmd_PayShop_BuyGoods_SC;
         QExternalUtil.showBuy(_loc2_.url,_loc2_.token);
      }
      
      private function onCmd_Friend_QueryReport_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Battle_QueryReport_SC = param1.socketData as Cmd_Battle_QueryReport_SC;
         BattleServiceCmd.setData(_loc2_.report);
      }
      
      private function onCmd_Battle_QuerySpecialReport_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Battle_QuerySpecialReport_SC = param1.socketData as Cmd_Battle_QuerySpecialReport_SC;
         BattleServiceCmd.setData(_loc2_.report);
      }
      
      private function onCmd_GetClientData_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_GetClientData_SC = param1.socketData as Cmd_GetClientData_SC;
         this.m_clientDataMap[_loc2_.key.low] = _loc2_.value;
         dispatch(new CommonEvent(CommandName.CLIENT_GET_DATA,_loc2_.key.low));
      }
      
      private function onCmd_SetClientData_SC(param1:SocketServiceEvent) : void
      {
         dispatch(new CommonEvent(CommandName.CLIENT_SET_DATA_SUCCESS));
      }
      
      public function getClientData(param1:uint) : Int64
      {
         return this.m_clientDataMap[param1];
      }
   }
}
