package com.qq.modules.secondaryPassword.command
{
   import com.tencent.protobuf.Message;
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class SecondaryPasswordCmd
   {
       
      
      public function SecondaryPasswordCmd()
      {
         super();
      }
      
      public static function open() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("SecondaryPasswordCommand","open",[]));
      }
      
      public static function openWindow(param1:uint, param2:uint = 0) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("SecondaryPasswordCommand","openWindow",[param1,param2]));
      }
      
      public static function getInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("SecondaryPasswordCommand","getInfo",[]));
      }
      
      public static function setPassword(param1:String, param2:Boolean) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("SecondaryPasswordCommand","setPassword",[param1,param2]));
      }
      
      public static function inputPassword(param1:String, param2:Boolean) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("SecondaryPasswordCommand","inputPassword",[param1,param2]));
      }
      
      public static function updatePassword(param1:String, param2:String) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("SecondaryPasswordCommand","updatePassword",[param1,param2]));
      }
      
      public static function resetPassword() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("SecondaryPasswordCommand","resetPassword",[]));
      }
      
      public static function setConditions(param1:Array) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("SecondaryPasswordCommand","setConditions",[param1]));
      }
      
      public static function resendSocketData(param1:Message) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("SecondaryPasswordCommand","resendSocketData",[param1]));
      }
      
      public static function parseErrorCodeInputError() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("SecondaryPasswordCommand","parseErrorCodeInputError",[]));
      }
      
      public static function parseErrorCodeOldEqualNew() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("SecondaryPasswordCommand","parseErrorCodeOldEqualNew",[]));
      }
   }
}
