package com.qq.modules.td.logic.action.zombie.archer
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import flash.events.Event;
   
   public class ZombieArcherEndShootAction extends BasicZombieAction
   {
       
      
      public function ZombieArcherEndShootAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.setFrozenAI(true);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinish);
         _gameObject.animation.gotoAndPlay("endShoot",1);
      }
      
      override public function leaveState() : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinish);
         super.leaveState();
      }
      
      private function onFinish(param1:Event) : void
      {
         _gameObject.setRunningProp(TDConstant.GameObject_Prop_Archer_IsKneel,0);
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinish);
         _gameObject.setFrozenAI(false);
         _gameObject.setAction();
      }
   }
}
