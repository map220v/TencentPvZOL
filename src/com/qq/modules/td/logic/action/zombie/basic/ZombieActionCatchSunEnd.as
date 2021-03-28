package com.qq.modules.td.logic.action.zombie.basic
{
   import asgui.utils.WorldClock;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.modules.td.logic.unit.zombie.TDRaZombie;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   
   public class ZombieActionCatchSunEnd extends BasicZombieAction
   {
       
      
      public function ZombieActionCatchSunEnd()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _zombie.animation.gotoAndPlay("power_down",false);
         _zombie.animation.addEventListener(Event.COMPLETE,this.onPowerDownComplete,false,0,true);
         var _loc2_:TDRaZombie = _zombie as TDRaZombie;
         _loc2_.lastSetCatchingTime = WorldClock.clock.time;
         this.stopCatching();
      }
      
      protected function onPowerDownComplete(param1:Event) : void
      {
         (param1.currentTarget as IEventDispatcher).removeEventListener(Event.COMPLETE,this.onPowerDownComplete);
         _zombie.setAction(TDConstant.ZAction_Idle);
      }
      
      override public function leaveState() : void
      {
      }
      
      public function stopCatching() : void
      {
      }
   }
}
