package com.qq.modules.td.logic.action.zombie.terracotta
{
   import com.greensock.TweenMax;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.modules.td.logic.unit.zombie.TerracottaZombie;
   import flash.events.Event;
   
   public class ZombieTerracottaDeathAction extends BasicZombieAction
   {
       
      
      public function ZombieTerracottaDeathAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onComplete);
         if(this.terracottaZombie.isWake)
         {
            _gameObject.animation.gotoAndPlay("die");
         }
         else if(this.terracottaZombie.isCanWake)
         {
            _gameObject.animation.gotoAndPlay("real_die");
         }
         else
         {
            _gameObject.animation.gotoAndPlay("bingmayong_dead");
         }
      }
      
      override public function leaveState() : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onComplete);
         super.leaveState();
      }
      
      override public function runningState() : void
      {
         super.runningState();
      }
      
      private function onComplete(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onComplete);
         TweenMax.to(_gameObject,0.3,{
            "alpha":0,
            "delay":1,
            "onComplete":this.onFinishDisappear
         });
      }
      
      private function onFinishDisappear() : void
      {
         if(_gameObject == null || !_gameObject.isVaild)
         {
            return;
         }
         _gameObject.setAction(TDConstant.ZAction_Disappear,null,true);
      }
      
      private function get terracottaZombie() : TerracottaZombie
      {
         return _zombie as TerracottaZombie;
      }
   }
}
