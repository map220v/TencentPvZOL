package com.qq.modules.td.logic.action.zombie.pirateCaptain
{
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.modules.td.logic.unit.zombie.PirateCaptainZombie;
   import flash.events.Event;
   
   public class ZActionCaptainGetParrot extends BasicZombieAction
   {
       
      
      public function ZActionCaptainGetParrot()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _zombie.setBoneVisible("parrot_*",true);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinish);
         _gameObject.animation.gotoAndPlay("parrot_land",1);
      }
      
      override public function leaveState() : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinish);
         super.leaveState();
      }
      
      private function onFinish(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinish);
         _gameObject.setAction();
         this.zombieCaptain.isHaveParrot = true;
      }
      
      public function get zombieCaptain() : PirateCaptainZombie
      {
         return _zombie as PirateCaptainZombie;
      }
   }
}
