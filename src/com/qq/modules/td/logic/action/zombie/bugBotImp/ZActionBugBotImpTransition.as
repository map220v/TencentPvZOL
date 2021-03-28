package com.qq.modules.td.logic.action.zombie.bugBotImp
{
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import flash.events.Event;
   
   public class ZActionBugBotImpTransition extends BasicZombieAction
   {
       
      
      public function ZActionBugBotImpTransition()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _zombie.setFrozenAI(true);
         _zombie.animation.gotoAndPlay("drop");
         _zombie.animation.addEventListener(Event.COMPLETE,this.onDropComplete);
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
         _zombie.animation.removeEventListener(Event.COMPLETE,this.onDropComplete);
         _zombie.animation.removeEventListener(Event.COMPLETE,this.onImpactComplete);
         _zombie.animation.removeEventListener(Event.COMPLETE,this.onTransitionComplete);
      }
      
      private function onDropComplete(param1:Event) : void
      {
         _zombie.animation.removeEventListener(Event.COMPLETE,this.onDropComplete);
         _zombie.animation.gotoAndPlay("impact");
         _zombie.animation.addEventListener(Event.COMPLETE,this.onImpactComplete);
      }
      
      private function onImpactComplete(param1:Event) : void
      {
         _zombie.animation.removeEventListener(Event.COMPLETE,this.onImpactComplete);
         _zombie.animation.gotoAndPlay("transition");
         _zombie.animation.addEventListener(Event.COMPLETE,this.onTransitionComplete);
      }
      
      private function onTransitionComplete(param1:Event) : void
      {
         _zombie.animation.removeEventListener(Event.COMPLETE,this.onTransitionComplete);
         _zombie.setFrozenAI(false);
         _zombie.setAction();
      }
   }
}
