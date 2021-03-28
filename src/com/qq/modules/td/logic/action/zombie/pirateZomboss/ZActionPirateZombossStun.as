package com.qq.modules.td.logic.action.zombie.pirateZomboss
{
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import flash.events.Event;
   
   public class ZActionPirateZombossStun extends BasicZombieAction
   {
       
      
      public function ZActionPirateZombossStun()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.setFrozenAI(true);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinishStunStart);
         _gameObject.animation.gotoAndPlay("stun_start");
      }
      
      private function onFinishStunStart(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinishStunStart);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinishStunLoop);
         _gameObject.animation.gotoAndPlay("stun_loop");
      }
      
      private function onFinishStunLoop(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinishStunLoop);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinishStunEnd);
         _gameObject.animation.gotoAndPlay("stun_end");
      }
      
      private function onFinishStunEnd(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinishStunEnd);
         _gameObject.setFrozenAI(false);
         _gameObject.setAction();
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinishStunStart);
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinishStunLoop);
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinishStunEnd);
      }
   }
}
