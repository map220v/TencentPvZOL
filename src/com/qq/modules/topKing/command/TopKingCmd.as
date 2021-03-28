package com.qq.modules.topKing.command
{
   import com.tencent.protobuf.Int64;
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class TopKingCmd
   {
       
      
      public function TopKingCmd()
      {
         super();
      }
      
      public static function openWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TopKingCommand","openWindow",[]));
      }
      
      public static function openBattleDetail(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TopKingCommand","openBattleDetail",[param1]));
      }
      
      public static function openCandiateWin() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TopKingCommand","openCandiateWin",[]));
      }
      
      public static function openMyLineup() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TopKingCommand","openMyLineup",[]));
      }
      
      public static function openMyScore() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TopKingCommand","openMyScore",[]));
      }
      
      public static function openRoleInfoWindow(param1:Int64, param2:Boolean = false, param3:int = 0) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TopKingCommand","openRoleInfoWindow",[param1,param2,param3]));
      }
      
      public static function openRankWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TopKingCommand","openRankWindow",[]));
      }
      
      public static function openBetDetailWindowl(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TopKingCommand","openBetDetailWindowl",[param1]));
      }
      
      public static function openMyBetInfoWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TopKingCommand","openMyBetInfoWindow",[]));
      }
   }
}
