package com.qq.modules.td.logic.action.zombie.futureProtector
{
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import flash.events.Event;
   
   public class ZActionFutureProtectorCloseShield extends BasicZombieAction
   {
       
      
      public function ZActionFutureProtectorCloseShield()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _zombie.setFrozenAI(true);
         _zombie.animation.gotoAndPlay("shield_end",false);
         _zombie.animation.addEventListener(Event.COMPLETE,this.onFinish,false,0,true);
      }
      
      private function onFinish(param1:Event = null) : void
      {
         _zombie.animation.removeEventListener(Event.COMPLETE,this.onFinish);
         _zombie.setAction();
         _zombie.setFrozenAI(false);
      }
      
      override public function leaveState() : void
      {
         _zombie.animation.removeEventListener(Event.COMPLETE,this.onFinish);
      }
   }
}
