package com.qq.modules.hole.command
{
   import com.tencent.protobuf.Int64;
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class HoleProxyCmd
   {
       
      
      public function HoleProxyCmd()
      {
         super();
      }
      
      public static function callCmd_Guard_RobHistory_CS() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("HoleProxyCommand","callCmd_Guard_RobHistory_CS",[]));
      }
      
      public static function callCmd_Guard_Info_CS() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("HoleProxyCommand","callCmd_Guard_Info_CS",[]));
      }
      
      public static function callCmd_Guard_Create_CS(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("HoleProxyCommand","callCmd_Guard_Create_CS",[param1]));
      }
      
      public static function callCmd_Guard_SetFormation_CS(param1:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("HoleProxyCommand","callCmd_Guard_SetFormation_CS",[param1]));
      }
      
      public static function callCmd_Guard_Invite_CS(param1:Int64) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("HoleProxyCommand","callCmd_Guard_Invite_CS",[param1]));
      }
      
      public static function callCmd_Guard_Join_CS(param1:Int64) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("HoleProxyCommand","callCmd_Guard_Join_CS",[param1]));
      }
      
      public static function refreshRob() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("HoleProxyCommand","refreshRob",[]));
      }
      
      public static function fightTarget(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("HoleProxyCommand","fightTarget",[param1]));
      }
      
      public static function callCmd_Guard_CancelRob_CS() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("HoleProxyCommand","callCmd_Guard_CancelRob_CS",[]));
      }
      
      public static function callCmd_Guard_DefenceHistory_CS() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("HoleProxyCommand","callCmd_Guard_DefenceHistory_CS",[]));
      }
      
      public static function callCmd_Guard_TakeReward_CS(param1:Int64) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("HoleProxyCommand","callCmd_Guard_TakeReward_CS",[param1]));
      }
      
      public static function callCmd_Guard_InviteList_CS() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("HoleProxyCommand","callCmd_Guard_InviteList_CS",[]));
      }
      
      public static function callCmd_Guard_Info_By_ID_CS(param1:Int64) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("HoleProxyCommand","callCmd_Guard_Info_By_ID_CS",[param1]));
      }
      
      public static function buyLight() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("HoleProxyCommand","buyLight",[]));
      }
   }
}
