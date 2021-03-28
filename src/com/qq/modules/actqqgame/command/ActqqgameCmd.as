package com.qq.modules.actqqgame.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ActqqgameCmd
   {
       
      
      public function ActqqgameCmd()
      {
         super();
      }
      
      public static function openWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ActqqgameCommand","openWindow",[]));
      }
      
      public static function getInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ActqqgameCommand","getInfo",[]));
      }
      
      public static function getLevelRewardInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ActqqgameCommand","getLevelRewardInfo",[]));
      }
   }
}
