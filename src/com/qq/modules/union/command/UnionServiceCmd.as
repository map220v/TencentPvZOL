package com.qq.modules.union.command
{
   import com.tencent.protobuf.Int64;
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class UnionServiceCmd
   {
       
      
      public function UnionServiceCmd()
      {
         super();
      }
      
      public static function getMyUnionInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionServiceCommand","getMyUnionInfo",[]));
      }
      
      public static function requestUnionListInfo(param1:int, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionServiceCommand","requestUnionListInfo",[param1,param2]));
      }
      
      public static function applyUnion(param1:Int64) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionServiceCommand","applyUnion",[param1]));
      }
      
      public static function agreeToJoinUnion(param1:Int64) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionServiceCommand","agreeToJoinUnion",[param1]));
      }
      
      public static function applyCreateUnion(param1:String, param2:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionServiceCommand","applyCreateUnion",[param1,param2]));
      }
      
      public static function requestUnionInfo(param1:Int64, param2:Array) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionServiceCommand","requestUnionInfo",[param1,param2]));
      }
      
      public static function requestMyUnionInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionServiceCommand","requestMyUnionInfo",[]));
      }
      
      public static function requestOtherUnionInfo(param1:Int64, param2:Array) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionServiceCommand","requestOtherUnionInfo",[param1,param2]));
      }
      
      public static function requestUnionUnionMemberList(param1:Int64) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionServiceCommand","requestUnionUnionMemberList",[param1]));
      }
      
      public static function levelUp() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionServiceCommand","levelUp",[]));
      }
      
      public static function quit() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionServiceCommand","quit",[]));
      }
      
      public static function fire(param1:Int64) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionServiceCommand","fire",[param1]));
      }
      
      public static function changeQQGroup(param1:String) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionServiceCommand","changeQQGroup",[param1]));
      }
      
      public static function requestUnionJoinList() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionServiceCommand","requestUnionJoinList",[]));
      }
      
      public static function processUnionJoin(param1:Int64, param2:Boolean) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionServiceCommand","processUnionJoin",[param1,param2]));
      }
      
      public static function unionBidding(param1:String, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionServiceCommand","unionBidding",[param1,param2]));
      }
      
      public static function donate(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionServiceCommand","donate",[param1]));
      }
      
      public static function editAnnouncement(param1:String) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionServiceCommand","editAnnouncement",[param1]));
      }
      
      public static function changeUnionFlag(param1:int, param2:int, param3:int, param4:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionServiceCommand","changeUnionFlag",[param1,param2,param3,param4]));
      }
      
      public static function requestInviteListData() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionServiceCommand","requestInviteListData",[]));
      }
      
      public static function invitePlayer(param1:Int64) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionServiceCommand","invitePlayer",[param1]));
      }
      
      public static function useMuck(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionServiceCommand","useMuck",[param1]));
      }
      
      public static function requestGardenLog() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionServiceCommand","requestGardenLog",[]));
      }
      
      public static function requestTempleBonus() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionServiceCommand","requestTempleBonus",[]));
      }
      
      public static function takeUnionBonus() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionServiceCommand","takeUnionBonus",[]));
      }
      
      public static function searchUnionByID(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionServiceCommand","searchUnionByID",[param1]));
      }
      
      public static function delate() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionServiceCommand","delate",[]));
      }
      
      public static function appoint(param1:Int64, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionServiceCommand","appoint",[param1,param2]));
      }
      
      public static function deliver(param1:Int64) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionServiceCommand","deliver",[param1]));
      }
      
      public static function cancelDeliver() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionServiceCommand","cancelDeliver",[]));
      }
      
      public static function requestUnionHonorRank() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionServiceCommand","requestUnionHonorRank",[]));
      }
      
      public static function requestUnionEventList() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionServiceCommand","requestUnionEventList",[]));
      }
      
      public static function requestIgnoreApply() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionServiceCommand","requestIgnoreApply",[]));
      }
      
      public static function setOneKeyCondition(param1:Boolean, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionServiceCommand","setOneKeyCondition",[param1,param2]));
      }
      
      public static function requestOneKeyCondition() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionServiceCommand","requestOneKeyCondition",[]));
      }
      
      public static function requestOneKeyJoin() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionServiceCommand","requestOneKeyJoin",[]));
      }
      
      public static function querySkill() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionServiceCommand","querySkill",[]));
      }
      
      public static function upgradeSkill(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionServiceCommand","upgradeSkill",[param1]));
      }
   }
}
