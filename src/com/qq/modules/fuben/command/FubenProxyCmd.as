package com.qq.modules.fuben.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class FubenProxyCmd
   {
       
      
      public function FubenProxyCmd()
      {
         super();
      }
      
      public static function requestMapInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FubenProxyCommand","requestMapInfo",[]));
      }
      
      public static function requestChapterInfo(param1:int, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FubenProxyCommand","requestChapterInfo",[param1,param2]));
      }
      
      public static function requestRewardBox(param1:int, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FubenProxyCommand","requestRewardBox",[param1,param2]));
      }
      
      public static function fightStage(param1:int, param2:int, param3:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FubenProxyCommand","fightStage",[param1,param2,param3]));
      }
      
      public static function startFight() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FubenProxyCommand","startFight",[]));
      }
      
      public static function startUnionFubenFight() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FubenProxyCommand","startUnionFubenFight",[]));
      }
      
      public static function againStartFight() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FubenProxyCommand","againStartFight",[]));
      }
      
      public static function fightStage_sweep(param1:int, param2:int, param3:int, param4:int, param5:Boolean) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FubenProxyCommand","fightStage_sweep",[param1,param2,param3,param4,param5]));
      }
      
      public static function fightStageSweepAgain(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FubenProxyCommand","fightStageSweepAgain",[param1]));
      }
      
      public static function popMsgCacheList() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FubenProxyCommand","popMsgCacheList",[]));
      }
   }
}
