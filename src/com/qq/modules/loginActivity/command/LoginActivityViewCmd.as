package com.qq.modules.loginActivity.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class LoginActivityViewCmd
   {
       
      
      public function LoginActivityViewCmd()
      {
         super();
      }
      
      public static function openWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("LoginActivityViewCommand","openWindow",[]));
      }
   }
}
