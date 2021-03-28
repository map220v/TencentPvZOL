package com.qq.modules.actQt.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ActQTCmd
   {
       
      
      public function ActQTCmd()
      {
         super();
      }
      
      public static function openQTActWin() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ActQTCommand","openQTActWin",[]));
      }
   }
}
