package com.qq.modules.td.logic.action.zombie.jetpack
{
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import flash.events.Event;
   
   public class ZActionFutureJetpackEnter extends BasicZombieAction
   {
       
      
      public function ZActionFutureJetpackEnter()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _zombie.setFrozenAI(true);
         _zombie.objectModel.isFlying = true;
         _zombie.animation.gotoAndPlay("enter",false);
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
