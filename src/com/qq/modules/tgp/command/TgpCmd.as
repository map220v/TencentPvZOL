package com.qq.modules.tgp.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class TgpCmd
   {
       
      
      public function TgpCmd()
      {
         super();
      }
      
      public static function openWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TgpCommand","openWindow",[]));
      }
      
      public static function openToUrl() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TgpCommand","openToUrl",[]));
      }
      
      public static function getInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TgpCommand","getInfo",[]));
      }
      
      public static function getLevelRewardInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TgpCommand","getLevelRewardInfo",[]));
      }
   }
}
