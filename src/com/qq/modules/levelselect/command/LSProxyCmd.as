package com.qq.modules.levelselect.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class LSProxyCmd
   {
       
      
      public function LSProxyCmd()
      {
         super();
      }
      
      public static function requestStageInfo(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("LSProxyCommand","requestStageInfo",[param1]));
      }
      
      public static function finishLevel(param1:int, param2:int, param3:int, param4:int, param5:Array) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("LSProxyCommand","finishLevel",[param1,param2,param3,param4,param5]));
      }
      
      public static function checkForUnlockGate(param1:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("LSProxyCommand","checkForUnlockGate",[param1]));
      }
      
      public static function unlockGate(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("LSProxyCommand","unlockGate",[param1]));
      }
      
      public static function getPromoteBonus(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("LSProxyCommand","getPromoteBonus",[param1,param2,param3,param4,param5]));
      }
      
      public static function getRankBonus(param1:int, param2:int, param3:int, param4:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("LSProxyCommand","getRankBonus",[param1,param2,param3,param4]));
      }
      
      public static function getRank(param1:int, param2:int, param3:int, param4:int, param5:int = 3) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("LSProxyCommand","getRank",[param1,param2,param3,param4,param5]));
      }
      
      public static function getRankRewardInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("LSProxyCommand","getRankRewardInfo",[]));
      }
      
      public static function getPromotionRewardInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("LSProxyCommand","getPromotionRewardInfo",[]));
      }
      
      public static function getOldPromotionRewardInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("LSProxyCommand","getOldPromotionRewardInfo",[]));
      }
      
      public static function takeOldPromotionReward() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("LSProxyCommand","takeOldPromotionReward",[]));
      }
      
      public static function inheritLastWeekScore(param1:uint, param2:uint, param3:uint) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("LSProxyCommand","inheritLastWeekScore",[param1,param2,param3]));
      }
   }
}
