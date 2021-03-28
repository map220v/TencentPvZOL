package com.qq.modules.login.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class LoginServerCmd
   {
       
      
      public function LoginServerCmd()
      {
         super();
      }
      
      public static function requestTDInfo(param1:int, param2:int, param3:int, param4:int = 0) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("LoginServerCommand","requestTDInfo",[param1,param2,param3,param4]));
      }
      
      public static function requestPrivilegeAndUnlockPlantInfo(param1:int, param2:int, param3:int, param4:int = 0) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("LoginServerCommand","requestPrivilegeAndUnlockPlantInfo",[param1,param2,param3,param4]));
      }
      
      public static function sendFirstMessage() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("LoginServerCommand","sendFirstMessage",[]));
      }
      
      public static function sendInitMessage(param1:String = null, param2:int = 0) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("LoginServerCommand","sendInitMessage",[param1,param2]));
      }
      
      public static function sendClientErrorTrack(param1:String) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("LoginServerCommand","sendClientErrorTrack",[param1]));
      }
      
      public static function requestVipInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("LoginServerCommand","requestVipInfo",[]));
      }
      
      public static function getPlayerBattleCardInfo(param1:uint = 0) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("LoginServerCommand","getPlayerBattleCardInfo",[param1]));
      }
      
      public static function saveMyWord(param1:String) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("LoginServerCommand","saveMyWord",[param1]));
      }
   }
}
