package com.qq.modules.td.logic.action.zombie.terracotta
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.modules.td.logic.unit.zombie.TerracottaZombie;
   import flash.events.Event;
   
   public class ZombieTerracottaCtzAction extends BasicZombieAction
   {
       
      
      public function ZombieTerracottaCtzAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.setFrozenAI(true);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinishAction);
         _gameObject.animation.gotoAndPlay("bingmayong_zombie");
      }
      
      override public function runningState() : void
      {
         super.runningState();
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
         _zombie.animation.removeEventListener(Event.COMPLETE,this.onFinishAction);
      }
      
      private function onFinishAction(param1:Event) : void
      {
         _zombie.animation.removeEventListener(Event.COMPLETE,this.onFinishAction);
         _gameObject.setFrozenAI(false);
         _zombie.setAction(TDConstant.ZAction_Walk);
         (_zombie as TerracottaZombie).isWake = true;
      }
   }
}
