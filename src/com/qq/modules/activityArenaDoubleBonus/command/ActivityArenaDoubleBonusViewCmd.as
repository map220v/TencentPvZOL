package com.qq.modules.activityArenaDoubleBonus.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ActivityArenaDoubleBonusViewCmd
   {
       
      
      public function ActivityArenaDoubleBonusViewCmd()
      {
         super();
      }
      
      public static function showWd() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ActivityArenaDoubleBonusViewCommand","showWd",[]));
      }
   }
}
