package com.qq.modules.main.service
{
   import PVZ.Cmd.Cmd_PayShop_GetFlagList_SC;
   import PVZ.Cmd.Cmd_PayShop_SaveFlag_SC;
   import com.qq.modules.basic.modle.BasicProxy;
   import flash.events.Event;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class ShortcutPayProxy extends BasicProxy
   {
      
      public static const SHORTCUT_SAVE_BACK:String = "SHORTCUT_SAVE_BACK";
       
      
      public var flags:Array;
      
      public function ShortcutPayProxy()
      {
         this.flags = [];
         super();
      }
      
      override public function listMsgInterests() : Array
      {
         return [[Cmd_PayShop_GetFlagList_SC.$MessageID,this.onGetFlagBack],[Cmd_PayShop_SaveFlag_SC.$MessageID,this.onSaveBack]];
      }
      
      private function onGetFlagBack(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_PayShop_GetFlagList_SC = param1.socketData as Cmd_PayShop_GetFlagList_SC;
         this.flags = _loc2_.flag;
      }
      
      private function onSaveBack(param1:SocketServiceEvent) : void
      {
         dispatch(new Event(SHORTCUT_SAVE_BACK));
      }
      
      public function setFlag(param1:int, param2:Boolean) : void
      {
         var _loc3_:int = this.flags.indexOf(param1);
         if(param2)
         {
            if(_loc3_ == -1)
            {
               this.flags.push(param1);
            }
         }
         else if(_loc3_ != -1)
         {
            this.flags.splice(_loc3_,1);
         }
      }
      
      public function getFlag(param1:int) : Boolean
      {
         var _loc2_:int = this.flags.indexOf(param1);
         return _loc2_ != -1;
      }
   }
}
