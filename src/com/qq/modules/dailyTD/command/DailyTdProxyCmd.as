package com.qq.modules.dailyTD.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class DailyTdProxyCmd
   {
       
      
      public function DailyTdProxyCmd()
      {
         super();
      }
      
      public static function getInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DailyTdProxyCommand","getInfo",[]));
      }
      
      public static function doExtractCard() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DailyTdProxyCommand","doExtractCard",[]));
      }
      
      public static function doChooseCard(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DailyTdProxyCommand","doChooseCard",[param1]));
      }
      
      public static function doLottery() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DailyTdProxyCommand","doLottery",[]));
      }
      
      public static function getTokenShop(param1:Boolean = false) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DailyTdProxyCommand","getTokenShop",[param1]));
      }
      
      public static function doTrade(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DailyTdProxyCommand","doTrade",[param1]));
      }
      
      public static function reportDailyTDResult(param1:int, param2:int, param3:Object, param4:String, param5:Boolean) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DailyTdProxyCommand","reportDailyTDResult",[param1,param2,param3,param4,param5]));
      }
      
      public static function passAllByVip() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DailyTdProxyCommand","passAllByVip",[]));
      }
   }
}
