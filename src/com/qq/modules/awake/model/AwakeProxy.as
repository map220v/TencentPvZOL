package com.qq.modules.awake.model
{
   import PVZ.Cmd.Cmd_Card_UseCardAwaken_SC;
   import com.qq.modules.awake.AwakeConst;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.card.model.vo.CardItemVO;
   import com.qq.utils.CommandDispatcher;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class AwakeProxy extends BasicProxy
   {
       
      
      public var curViewCardVO:CardItemVO;
      
      public function AwakeProxy()
      {
         super();
      }
      
      override public function listMsgInterests() : Array
      {
         return [[Cmd_Card_UseCardAwaken_SC.$MessageID,this.onCmd_Card_UseCardAwaken_SC]];
      }
      
      private function onCmd_Card_UseCardAwaken_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Card_UseCardAwaken_SC = param1.socketData as Cmd_Card_UseCardAwaken_SC;
         CommandDispatcher.send(AwakeConst.CARD_AWAKED);
      }
   }
}
