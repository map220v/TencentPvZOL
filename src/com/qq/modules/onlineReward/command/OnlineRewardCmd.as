package com.qq.modules.onlineReward.command
{
   import flash.display.DisplayObjectContainer;
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class OnlineRewardCmd
   {
       
      
      public function OnlineRewardCmd()
      {
         super();
      }
      
      public static function addOnlineRewardInfoPanel(param1:DisplayObjectContainer) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("OnlineRewardCommand","addOnlineRewardInfoPanel",[param1]));
      }
      
      public static function clickDailyRewardIcon() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("OnlineRewardCommand","clickDailyRewardIcon",[]));
      }
      
      public static function popupOnlineRewardTakeWindow(param1:Object = null, param2:Function = null, param3:String = null, param4:String = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("OnlineRewardCommand","popupOnlineRewardTakeWindow",[param1,param2,param3,param4]));
      }
   }
}
