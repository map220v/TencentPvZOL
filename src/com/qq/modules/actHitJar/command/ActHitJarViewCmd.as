package com.qq.modules.actHitJar.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ActHitJarViewCmd
   {
       
      
      public function ActHitJarViewCmd()
      {
         super();
      }
      
      public static function openActHitJarMainWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ActHitJarViewCommand","openActHitJarMainWindow",[]));
      }
      
      public static function openActHitJarSelectWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ActHitJarViewCommand","openActHitJarSelectWindow",[]));
      }
   }
}
