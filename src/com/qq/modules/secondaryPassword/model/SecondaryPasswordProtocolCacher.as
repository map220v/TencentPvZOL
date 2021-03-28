package com.qq.modules.secondaryPassword.model
{
   import PVZ.Cmd.Cmd_Card_Recycle_CS;
   import PVZ.Cmd.Cmd_Item_RecycleDebris_CS;
   import PVZ.Cmd.Cmd_Item_SellItems_CS;
   import PVZ.Cmd.Cmd_Item_Use_CS;
   import PVZ.Cmd.Cmd_Nutrition_ExtractExpAll_CS;
   import PVZ.Cmd.Cmd_Nutrition_ExtractExp_CS;
   import com.tencent.protobuf.Message;
   
   public class SecondaryPasswordProtocolCacher
   {
      
      private static var _instance:SecondaryPasswordProtocolCacher;
       
      
      public var cacheMsg:Message;
      
      public function SecondaryPasswordProtocolCacher()
      {
         super();
      }
      
      public static function get instance() : SecondaryPasswordProtocolCacher
      {
         if(_instance == null)
         {
            _instance = new SecondaryPasswordProtocolCacher();
            _instance.init();
         }
         return _instance;
      }
      
      private function init() : void
      {
      }
      
      public function checkProtocol(param1:Message) : void
      {
         switch(param1.$messageID)
         {
            case Cmd_Item_SellItems_CS.$MessageID:
            case Cmd_Card_Recycle_CS.$MessageID:
            case Cmd_Nutrition_ExtractExp_CS.$MessageID:
            case Cmd_Nutrition_ExtractExpAll_CS.$MessageID:
            case Cmd_Item_Use_CS.$MessageID:
            case Cmd_Item_RecycleDebris_CS.$MessageID:
               this.cacheMsg = param1;
         }
      }
      
      public function getProtocol() : Message
      {
         return this.cacheMsg;
      }
      
      public function clearMsg() : void
      {
         this.cacheMsg = null;
      }
   }
}
