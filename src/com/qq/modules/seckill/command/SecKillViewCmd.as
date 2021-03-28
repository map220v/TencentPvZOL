package com.qq.modules.seckill.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class SecKillViewCmd
   {
       
      
      public function SecKillViewCmd()
      {
         super();
      }
      
      public static function openWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("SecKillViewCommand","openWindow",[]));
      }
   }
}
