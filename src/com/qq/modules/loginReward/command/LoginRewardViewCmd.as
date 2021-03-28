package com.qq.modules.loginReward.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class LoginRewardViewCmd
   {
       
      
      public function LoginRewardViewCmd()
      {
         super();
      }
      
      public static function openLoginReward() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("LoginRewardViewCommand","openLoginReward",[]));
      }
   }
}
