package com.qq.modules.unionFuben.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class UnionFubenProxyCmd
   {
       
      
      public function UnionFubenProxyCmd()
      {
         super();
      }
      
      public static function getUnionFubenChapter() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionFubenProxyCommand","getUnionFubenChapter",[]));
      }
      
      public static function getUnionFubenStage(param1:uint) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionFubenProxyCommand","getUnionFubenStage",[param1]));
      }
      
      public static function openChapter(param1:uint) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionFubenProxyCommand","openChapter",[param1]));
      }
      
      public static function resetChapter(param1:uint) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionFubenProxyCommand","resetChapter",[param1]));
      }
      
      public static function getUnionFubenFormation() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionFubenProxyCommand","getUnionFubenFormation",[]));
      }
      
      public static function startUnionFubenFight(param1:uint, param2:uint) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionFubenProxyCommand","startUnionFubenFight",[param1,param2]));
      }
      
      public static function getEveryDayRewardInf() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionFubenProxyCommand","getEveryDayRewardInf",[]));
      }
      
      public static function getEveryDayReward() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("UnionFubenProxyCommand","getEveryDayReward",[]));
      }
   }
}
