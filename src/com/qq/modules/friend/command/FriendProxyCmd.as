package com.qq.modules.friend.command
{
   import com.tencent.protobuf.Int64;
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class FriendProxyCmd
   {
       
      
      public function FriendProxyCmd()
      {
         super();
      }
      
      public static function requestList(param1:int, param2:int, param3:int, param4:String = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FriendProxyCommand","requestList",[param1,param2,param3,param4]));
      }
      
      public static function setAvatarPlan(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FriendProxyCommand","setAvatarPlan",[param1]));
      }
      
      public static function applyInviteFriend(param1:Int64) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FriendProxyCommand","applyInviteFriend",[param1]));
      }
      
      public static function applyAgree(param1:Array) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FriendProxyCommand","applyAgree",[param1]));
      }
      
      public static function applyIgnore(param1:Array) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FriendProxyCommand","applyIgnore",[param1]));
      }
      
      public static function getRecommendList() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FriendProxyCommand","getRecommendList",[]));
      }
      
      public static function addRecommendFriends(param1:Array, param2:Boolean) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FriendProxyCommand","addRecommendFriends",[param1,param2]));
      }
      
      public static function getApplyLog(param1:int, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FriendProxyCommand","getApplyLog",[param1,param2]));
      }
      
      public static function getFightLog(param1:int, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FriendProxyCommand","getFightLog",[param1,param2]));
      }
      
      public static function getGiftEnergyLog(param1:int, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FriendProxyCommand","getGiftEnergyLog",[param1,param2]));
      }
      
      public static function deleteEnergyLog(param1:Int64) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FriendProxyCommand","deleteEnergyLog",[param1]));
      }
      
      public static function presentEnergy(param1:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FriendProxyCommand","presentEnergy",[param1]));
      }
      
      public static function takeEnergy(param1:Int64) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FriendProxyCommand","takeEnergy",[param1]));
      }
      
      public static function returnEnergy(param1:Int64) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FriendProxyCommand","returnEnergy",[param1]));
      }
      
      public static function friendFight(param1:Int64, param2:uint) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FriendProxyCommand","friendFight",[param1,param2]));
      }
      
      public static function queryReport(param1:Int64) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FriendProxyCommand","queryReport",[param1]));
      }
      
      public static function deleteFriend(param1:Int64) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FriendProxyCommand","deleteFriend",[param1]));
      }
      
      public static function deleteFightLog(param1:Array) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FriendProxyCommand","deleteFightLog",[param1]));
      }
   }
}
