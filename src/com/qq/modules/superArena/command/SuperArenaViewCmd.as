package com.qq.modules.superArena.command
{
   import com.tencent.protobuf.Int64;
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class SuperArenaViewCmd
   {
       
      
      public function SuperArenaViewCmd()
      {
         super();
      }
      
      public static function enterSuperArena() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("SuperArenaViewCommand","enterSuperArena",[]));
      }
      
      public static function leaveSuperArena() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("SuperArenaViewCommand","leaveSuperArena",[]));
      }
      
      public static function openScoreRewardWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("SuperArenaViewCommand","openScoreRewardWindow",[]));
      }
      
      public static function openRankRewardWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("SuperArenaViewCommand","openRankRewardWindow",[]));
      }
      
      public static function openRuleWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("SuperArenaViewCommand","openRuleWindow",[]));
      }
      
      public static function openLogWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("SuperArenaViewCommand","openLogWindow",[]));
      }
      
      public static function fightOp(param1:Int64, param2:int, param3:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("SuperArenaViewCommand","fightOp",[param1,param2,param3]));
      }
      
      public static function setDefenceLineup() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("SuperArenaViewCommand","setDefenceLineup",[]));
      }
   }
}
