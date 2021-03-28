package com.qq.modules.td.command
{
   import com.tencent.protobuf.Int64;
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class TDProxyCmd
   {
       
      
      public function TDProxyCmd()
      {
         super();
      }
      
      public static function requestFriendCardInfo(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDProxyCommand","requestFriendCardInfo",[param1]));
      }
      
      public static function requestStartTDGame(param1:int, param2:int, param3:int, param4:int, param5:Int64 = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDProxyCommand","requestStartTDGame",[param1,param2,param3,param4,param5]));
      }
      
      public static function finishLevel(param1:int, param2:int, param3:int, param4:int, param5:int, param6:Array, param7:Boolean) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDProxyCommand","finishLevel",[param1,param2,param3,param4,param5,param6,param7]));
      }
      
      public static function startDailyTDGame() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDProxyCommand","startDailyTDGame",[]));
      }
      
      public static function startYetiTD() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDProxyCommand","startYetiTD",[]));
      }
      
      public static function useSkillPlant(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDProxyCommand","useSkillPlant",[param1]));
      }
      
      public static function useSkillPlantByDiamond(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDProxyCommand","useSkillPlantByDiamond",[param1]));
      }
      
      public static function buyEnergyBean(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDProxyCommand","buyEnergyBean",[param1]));
      }
      
      public static function buySun(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDProxyCommand","buySun",[param1]));
      }
      
      public static function killSnowMan() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDProxyCommand","killSnowMan",[]));
      }
      
      public static function ticketUnlockPlant(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDProxyCommand","ticketUnlockPlant",[param1]));
      }
      
      public static function buyMower(param1:int, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDProxyCommand","buyMower",[param1,param2]));
      }
   }
}
