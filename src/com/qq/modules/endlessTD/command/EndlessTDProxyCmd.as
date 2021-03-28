package com.qq.modules.endlessTD.command
{
   import com.tencent.protobuf.Int64;
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class EndlessTDProxyCmd
   {
       
      
      public function EndlessTDProxyCmd()
      {
         super();
      }
      
      public static function getInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EndlessTDProxyCommand","getInfo",[]));
      }
      
      public static function rechallenge() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EndlessTDProxyCommand","rechallenge",[]));
      }
      
      public static function reportResult(param1:int, param2:int, param3:String, param4:Boolean) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EndlessTDProxyCommand","reportResult",[param1,param2,param3,param4]));
      }
      
      public static function getRankBoard(param1:int, param2:uint) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EndlessTDProxyCommand","getRankBoard",[param1,param2]));
      }
      
      public static function getWeekRankBoard(param1:int, param2:uint) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EndlessTDProxyCommand","getWeekRankBoard",[param1,param2]));
      }
      
      public static function rankGoodOrDown(param1:Int64, param2:uint, param3:Boolean = true) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EndlessTDProxyCommand","rankGoodOrDown",[param1,param2,param3]));
      }
      
      public static function upgradePlant(param1:uint) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EndlessTDProxyCommand","upgradePlant",[param1]));
      }
      
      public static function getEndlessReward() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EndlessTDProxyCommand","getEndlessReward",[]));
      }
      
      public static function startEndlessTDGame(param1:int, param2:Int64 = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EndlessTDProxyCommand","startEndlessTDGame",[param1,param2]));
      }
      
      public static function loadRecord() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EndlessTDProxyCommand","loadRecord",[]));
      }
      
      public static function saveRecord() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EndlessTDProxyCommand","saveRecord",[]));
      }
      
      public static function copyData(param1:Array, param2:Array, param3:uint, param4:uint, param5:uint) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EndlessTDProxyCommand","copyData",[param1,param2,param3,param4,param5]));
      }
   }
}
