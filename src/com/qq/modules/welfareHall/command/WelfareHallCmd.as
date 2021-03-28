package com.qq.modules.welfareHall.command
{
   import asgui.containers.Canvas;
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class WelfareHallCmd
   {
       
      
      public function WelfareHallCmd()
      {
         super();
      }
      
      public static function openWindow(param1:uint) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("WelfareHallCommand","openWindow",[param1]));
      }
      
      public static function getInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("WelfareHallCommand","getInfo",[]));
      }
      
      public static function takeReward(param1:uint, param2:uint = 0, param3:uint = 0) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("WelfareHallCommand","takeReward",[param1,param2,param3]));
      }
      
      public static function getDailyActivityInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("WelfareHallCommand","getDailyActivityInfo",[]));
      }
      
      public static function getResourceRecoverInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("WelfareHallCommand","getResourceRecoverInfo",[]));
      }
      
      public static function takeResourceRecover(param1:uint, param2:uint) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("WelfareHallCommand","takeResourceRecover",[param1,param2]));
      }
      
      public static function takeAllResourceRecover(param1:uint) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("WelfareHallCommand","takeAllResourceRecover",[param1]));
      }
      
      public static function addBuilding(param1:Canvas) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("WelfareHallCommand","addBuilding",[param1]));
      }
      
      public static function removeBuilding() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("WelfareHallCommand","removeBuilding",[]));
      }
   }
}
