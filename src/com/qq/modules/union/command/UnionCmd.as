package com.qq.modules.union.command
{
   import com.tencent.protobuf.Int64;
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class UnionCmd
   {
       
      
      public function UnionCmd()
      {
         super();
      }
      
      public static function enterUnion() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionCommand","enterUnion",[]));
      }
      
      public static function enterUnionHall(param1:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionCommand","enterUnionHall",[param1]));
      }
      
      public static function leaveUnionHall() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionCommand","leaveUnionHall",[]));
      }
      
      public static function enterUnionList() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionCommand","enterUnionList",[]));
      }
      
      public static function gotoCreateUnion() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionCommand","gotoCreateUnion",[]));
      }
      
      public static function gotoChangeUnionFlag(param1:int, param2:int, param3:int, param4:int, param5:Boolean = false) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionCommand","gotoChangeUnionFlag",[param1,param2,param3,param4,param5]));
      }
      
      public static function showUnionDetailInfo(param1:Int64) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionCommand","showUnionDetailInfo",[param1]));
      }
      
      public static function popupUnionDetialWindow(param1:Array) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionCommand","popupUnionDetialWindow",[param1]));
      }
      
      public static function showBiddingWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionCommand","showBiddingWindow",[]));
      }
      
      public static function gotoDonation() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionCommand","gotoDonation",[]));
      }
      
      public static function gotoUnionDonateRank() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionCommand","gotoUnionDonateRank",[]));
      }
      
      public static function gotoUnionBenefit() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionCommand","gotoUnionBenefit",[]));
      }
      
      public static function gotoUnionGarden() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionCommand","gotoUnionGarden",[]));
      }
      
      public static function openInviteListWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionCommand","openInviteListWindow",[]));
      }
      
      public static function openUnionBonusWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionCommand","openUnionBonusWindow",[]));
      }
      
      public static function openConditionWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionCommand","openConditionWindow",[]));
      }
      
      public static function showOtherUnionDetailInfo(param1:Int64) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionCommand","showOtherUnionDetailInfo",[param1]));
      }
      
      public static function popupOtherUnionDetialWindow(param1:Array) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionCommand","popupOtherUnionDetialWindow",[param1]));
      }
      
      public static function popupHonorRankWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionCommand","popupHonorRankWindow",[]));
      }
      
      public static function popupEventWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionCommand","popupEventWindow",[]));
      }
      
      public static function openSkillWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionCommand","openSkillWindow",[]));
      }
   }
}
