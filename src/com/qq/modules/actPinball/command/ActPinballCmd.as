package com.qq.modules.actPinball.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ActPinballCmd
   {
       
      
      public function ActPinballCmd()
      {
         super();
      }
      
      public static function openActPinballWin() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ActPinballCommand","openActPinballWin",[]));
      }
      
      public static function getHoodleInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ActPinballCommand","getHoodleInfo",[]));
      }
      
      public static function fireNute() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ActPinballCommand","fireNute",[]));
      }
      
      public static function resetNuts() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ActPinballCommand","resetNuts",[]));
      }
      
      public static function getReward() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ActPinballCommand","getReward",[]));
      }
   }
}
