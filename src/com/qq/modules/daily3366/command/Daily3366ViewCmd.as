package com.qq.modules.daily3366.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class Daily3366ViewCmd
   {
       
      
      public function Daily3366ViewCmd()
      {
         super();
      }
      
      public static function showDaily3366() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("Daily3366ViewCommand","showDaily3366",[]));
      }
   }
}
