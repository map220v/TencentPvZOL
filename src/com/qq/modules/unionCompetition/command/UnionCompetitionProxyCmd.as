package com.qq.modules.unionCompetition.command
{
   import com.tencent.protobuf.Int64;
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class UnionCompetitionProxyCmd
   {
       
      
      public function UnionCompetitionProxyCmd()
      {
         super();
      }
      
      public static function getUnionCompetitionInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionCompetitionProxyCommand","getUnionCompetitionInfo",[]));
      }
      
      public static function joinGame() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionCompetitionProxyCommand","joinGame",[]));
      }
      
      public static function getReward(param1:uint) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionCompetitionProxyCommand","getReward",[param1]));
      }
      
      public static function doBet(param1:Int64, param2:Int64, param3:uint) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionCompetitionProxyCommand","doBet",[param1,param2,param3]));
      }
      
      public static function setCycles(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionCompetitionProxyCommand","setCycles",[param1]));
      }
      
      public static function applyWay(param1:uint) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionCompetitionProxyCommand","applyWay",[param1]));
      }
      
      public static function switchWay(param1:uint, param2:uint) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionCompetitionProxyCommand","switchWay",[param1,param2]));
      }
      
      public static function requestDistributionInf() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionCompetitionProxyCommand","requestDistributionInf",[]));
      }
      
      public static function distributeReward(param1:Int64) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionCompetitionProxyCommand","distributeReward",[param1]));
      }
   }
}
