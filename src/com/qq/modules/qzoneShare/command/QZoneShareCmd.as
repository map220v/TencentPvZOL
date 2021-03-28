package com.qq.modules.qzoneShare.command
{
   import asgui.controls.Button;
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class QZoneShareCmd
   {
       
      
      public function QZoneShareCmd()
      {
         super();
      }
      
      public static function getQZoneShareState() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("QZoneShareCommand","getQZoneShareState",[]));
      }
      
      public static function checkTDShareMsg(param1:int, param2:uint, param3:uint, param4:uint, param5:Button, param6:Function) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("QZoneShareCommand","checkTDShareMsg",[param1,param2,param3,param4,param5,param6]));
      }
      
      public static function checkFBShareMsg(param1:int, param2:uint, param3:Button, param4:Function) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("QZoneShareCommand","checkFBShareMsg",[param1,param2,param3,param4]));
      }
      
      public static function checkFriendPvPShareMsg(param1:Button, param2:Array, param3:Function) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("QZoneShareCommand","checkFriendPvPShareMsg",[param1,param2,param3]));
      }
      
      public static function checkTalentShareMsg(param1:int, param2:Button, param3:Function) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("QZoneShareCommand","checkTalentShareMsg",[param1,param2,param3]));
      }
      
      public static function checkCardShareMsg(param1:uint, param2:uint, param3:Button, param4:Function) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("QZoneShareCommand","checkCardShareMsg",[param1,param2,param3,param4]));
      }
      
      public static function checkLabMakeShareMsg(param1:Button, param2:Function) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("QZoneShareCommand","checkLabMakeShareMsg",[param1,param2]));
      }
      
      public static function checkSignInShareMsg(param1:Button, param2:Function) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("QZoneShareCommand","checkSignInShareMsg",[param1,param2]));
      }
      
      public static function initShareBtn(param1:Button) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("QZoneShareCommand","initShareBtn",[param1]));
      }
      
      public static function sendQZoneShareMsg() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("QZoneShareCommand","sendQZoneShareMsg",[]));
      }
      
      public static function operateShareBtn(param1:Button, param2:uint) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("QZoneShareCommand","operateShareBtn",[param1,param2]));
      }
      
      public static function showQZoneShareMsg(param1:int, param2:Array = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("QZoneShareCommand","showQZoneShareMsg",[param1,param2]));
      }
   }
}
