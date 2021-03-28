package com.qq.modules.td.logic.action.zombie.archer
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   
   public class ZombieArcherStartShootAction extends BasicZombieAction
   {
       
      
      public function ZombieArcherStartShootAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinish);
         _gameObject.animation.gotoAndPlay("startShoot",1);
         _gameObject.setFrozenAI(true);
      }
      
      override public function leaveState() : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinish);
         super.leaveState();
      }
      
      private function onFinish(param1:Event) : void
      {
         _gameObject.setRunningProp(TDConstant.GameObject_Prop_Archer_IsKneel,1);
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinish);
         _gameObject.setFrozenAI(false);
         _gameObject.setAction();
         _gameObject.setTimeRecord(TDConstant.TimeRecord_ZombieDuration,TDGameInfo.getInstance().getCurGameTime());
      }
   }
}
