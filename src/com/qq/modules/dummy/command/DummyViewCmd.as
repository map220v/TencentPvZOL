package com.qq.modules.dummy.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class DummyViewCmd
   {
       
      
      public function DummyViewCmd()
      {
         super();
      }
      
      public static function openWindow(param1:int = 0, param2:Boolean = true, param3:Boolean = false) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DummyViewCommand","openWindow",[param1,param2,param3]));
      }
      
      public static function openZombieInfoWindow(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DummyViewCommand","openZombieInfoWindow",[param1]));
      }
      
      public static function openZombieLevelupWindow(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DummyViewCommand","openZombieLevelupWindow",[param1]));
      }
      
      public static function openBuildArmor(param1:int, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DummyViewCommand","openBuildArmor",[param1,param2]));
      }
      
      public static function openLevelUpArmorWindow(param1:int, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DummyViewCommand","openLevelUpArmorWindow",[param1,param2]));
      }
      
      public static function openPromotionArmorWindow(param1:int, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DummyViewCommand","openPromotionArmorWindow",[param1,param2]));
      }
      
      public static function openFubenWindow(param1:int = -1) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DummyViewCommand","openFubenWindow",[param1]));
      }
      
      public static function openFubenDetailWindow(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DummyViewCommand","openFubenDetailWindow",[param1]));
      }
      
      public static function openGetMaterialWindow(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DummyViewCommand","openGetMaterialWindow",[param1]));
      }
      
      public static function openDummyRankUpConfirmWindow(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DummyViewCommand","openDummyRankUpConfirmWindow",[param1]));
      }
      
      public static function openDummyCallCardResult(param1:Array, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DummyViewCommand","openDummyCallCardResult",[param1,param2]));
      }
      
      public static function buyFubenEnergy() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DummyViewCommand","buyFubenEnergy",[]));
      }
      
      public static function openZombiePromotionWindow(param1:int, param2:Boolean) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DummyViewCommand","openZombiePromotionWindow",[param1,param2]));
      }
      
      public static function openDrawingRecycleWindow(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DummyViewCommand","openDrawingRecycleWindow",[param1]));
      }
      
      public static function switchMainWindowPanel(param1:int, param2:Array) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DummyViewCommand","switchMainWindowPanel",[param1,param2]));
      }
   }
}
