package com.qq.modules.dummy.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class DummyProxyCmd
   {
       
      
      public function DummyProxyCmd()
      {
         super();
      }
      
      public static function requestDummyZombieListInfo(param1:Array = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DummyProxyCommand","requestDummyZombieListInfo",[param1]));
      }
      
      public static function getLineup() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DummyProxyCommand","getLineup",[]));
      }
      
      public static function setLineup(param1:Array) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DummyProxyCommand","setLineup",[param1]));
      }
      
      public static function compostiteCard(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DummyProxyCommand","compostiteCard",[param1]));
      }
      
      public static function requestBuildEquipment(param1:int, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DummyProxyCommand","requestBuildEquipment",[param1,param2]));
      }
      
      public static function requestLevelupEquipment(param1:int, param2:int, param3:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DummyProxyCommand","requestLevelupEquipment",[param1,param2,param3]));
      }
      
      public static function requestPromotEquipment(param1:int, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DummyProxyCommand","requestPromotEquipment",[param1,param2]));
      }
      
      public static function requestStarUpZombie(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DummyProxyCommand","requestStarUpZombie",[param1]));
      }
      
      public static function requestLevelUpZombie(param1:int, param2:int, param3:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DummyProxyCommand","requestLevelUpZombie",[param1,param2,param3]));
      }
      
      public static function requestQuiltyUpZombie(param1:int, param2:Boolean) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DummyProxyCommand","requestQuiltyUpZombie",[param1,param2]));
      }
      
      public static function requestZombieSkillLevelup(param1:int, param2:Boolean) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DummyProxyCommand","requestZombieSkillLevelup",[param1,param2]));
      }
      
      public static function requestZombieSkillActive(param1:int, param2:Boolean) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DummyProxyCommand","requestZombieSkillActive",[param1,param2]));
      }
      
      public static function requestChapterInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DummyProxyCommand","requestChapterInfo",[]));
      }
      
      public static function requestStageInfo(param1:int, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DummyProxyCommand","requestStageInfo",[param1,param2]));
      }
      
      public static function requestFightFuben(param1:int, param2:int, param3:int, param4:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DummyProxyCommand","requestFightFuben",[param1,param2,param3,param4]));
      }
      
      public static function requestSweepFuben(param1:int, param2:int, param3:int, param4:int = 1) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DummyProxyCommand","requestSweepFuben",[param1,param2,param3,param4]));
      }
      
      public static function requestZombieCallInfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DummyProxyCommand","requestZombieCallInfo",[]));
      }
      
      public static function requestCallDummy(param1:int, param2:int, param3:Boolean) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DummyProxyCommand","requestCallDummy",[param1,param2,param3]));
      }
      
      public static function requestBuySkillPoint() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DummyProxyCommand","requestBuySkillPoint",[]));
      }
      
      public static function requstBuyFubenEnergy() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DummyProxyCommand","requstBuyFubenEnergy",[]));
      }
      
      public static function recycleDummyDrawing(param1:int, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DummyProxyCommand","recycleDummyDrawing",[param1,param2]));
      }
      
      public static function exchangeCard(param1:int, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DummyProxyCommand","exchangeCard",[param1,param2]));
      }
   }
}
