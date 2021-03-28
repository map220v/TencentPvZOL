package com.qq.modules.topKing.command
{
   import com.tencent.protobuf.Int64;
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class TopKingProxyCmd
   {
       
      
      public function TopKingProxyCmd()
      {
         super();
      }
      
      public static function requestTopKingInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TopKingProxyCommand","requestTopKingInfo",[]));
      }
      
      public static function requestBattleInfo(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TopKingProxyCommand","requestBattleInfo",[param1]));
      }
      
      public static function takeReward() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TopKingProxyCommand","takeReward",[]));
      }
      
      public static function requestRoleInfo(param1:Int64) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TopKingProxyCommand","requestRoleInfo",[param1]));
      }
      
      public static function requestMyScore() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TopKingProxyCommand","requestMyScore",[]));
      }
      
      public static function requestCandiatePlayerInfo(param1:int, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TopKingProxyCommand","requestCandiatePlayerInfo",[param1,param2]));
      }
      
      public static function requestRankInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TopKingProxyCommand","requestRankInfo",[]));
      }
      
      public static function saveLineup() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TopKingProxyCommand","saveLineup",[]));
      }
      
      public static function requestHistroyRoleInfo(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TopKingProxyCommand","requestHistroyRoleInfo",[param1]));
      }
      
      public static function betBattle(param1:int, param2:int, param3:int, param4:Boolean) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TopKingProxyCommand","betBattle",[param1,param2,param3,param4]));
      }
      
      public static function requestMyBetInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TopKingProxyCommand","requestMyBetInfo",[]));
      }
      
      public static function takeMyBetReward(param1:int, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TopKingProxyCommand","takeMyBetReward",[param1,param2]));
      }
   }
}
