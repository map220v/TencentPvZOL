package com.qq.modules.luckystar.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class LuckyStarCmd
   {
       
      
      public function LuckyStarCmd()
      {
         super();
      }
      
      public static function tryShowMainWd() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("LuckyStarCommand","tryShowMainWd",[]));
      }
      
      public static function doShowMainWd() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("LuckyStarCommand","doShowMainWd",[]));
      }
      
      public static function getEverydayReward(param1:int, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("LuckyStarCommand","getEverydayReward",[param1,param2]));
      }
      
      public static function buy(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("LuckyStarCommand","buy",[param1]));
      }
      
      public static function getInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("LuckyStarCommand","getInfo",[]));
      }
   }
}
