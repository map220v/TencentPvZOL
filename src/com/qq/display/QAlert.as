package com.qq.display
{
   import asgui.controls.Alert;
   import com.qq.templates.font.FontHKHB;
   import flash.display.DisplayObjectContainer;
   
   public final class QAlert
   {
       
      
      public function QAlert()
      {
         super();
      }
      
      public static function Show(param1:String = "", param2:String = "", param3:uint = 4, param4:DisplayObjectContainer = null, param5:Function = null, param6:String = null, param7:String = null, param8:String = null, param9:String = null, param10:int = 0, param11:int = 0) : Alert
      {
         Alert.yesLabel = FontHKHB.YES;
         Alert.noLabel = FontHKHB.NO;
         Alert.okLabel = FontHKHB.OK;
         Alert.cancelLabel = FontHKHB.NO;
         if(param6)
         {
            Alert.yesLabel = param6;
         }
         if(param7)
         {
            Alert.noLabel = param7;
         }
         if(param8)
         {
            Alert.okLabel = param8;
         }
         if(param9)
         {
            Alert.cancelLabel = param9;
         }
         var _loc12_:Alert = Alert.Show(param1,param2,param3,param4,param5,null,4,false);
         if(param10)
         {
            _loc12_.width = param10;
         }
         if(param11)
         {
            _loc12_.height = param11;
         }
         Alert.yesLabel = FontHKHB.YES;
         Alert.noLabel = FontHKHB.NO;
         Alert.okLabel = FontHKHB.OK;
         Alert.cancelLabel = FontHKHB.NO;
         return _loc12_;
      }
   }
}
