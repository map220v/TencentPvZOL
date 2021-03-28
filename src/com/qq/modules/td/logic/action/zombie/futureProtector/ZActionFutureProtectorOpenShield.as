package com.qq.modules.td.logic.action.zombie.futureProtector
{
   import com.qq.constant.td.TDSoundID;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.modules.td.logic.unit.zombie.FutureProtectorZombie;
   import flash.events.Event;
   
   public class ZActionFutureProtectorOpenShield extends BasicZombieAction
   {
       
      
      public function ZActionFutureProtectorOpenShield()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _zombie.setFrozenAI(true);
         _zombie.animation.gotoAndPlay("shield_start",false);
         _zombie.animation.addEventListener(Event.COMPLETE,this.onFinish,false,0,true);
      }
      
      private function onFinish(param1:Event = null) : void
      {
         this.protector.openShield();
         TDSoundCmd.playSound(TDSoundID.Future_Protector_Shield_Loop);
         _zombie.animation.removeEventListener(Event.COMPLETE,this.onFinish);
         _zombie.setAction();
         _zombie.setFrozenAI(false);
      }
      
      override public function leaveState() : void
      {
         _zombie.animation.removeEventListener(Event.COMPLETE,this.onFinish);
      }
      
      public function get protector() : FutureProtectorZombie
      {
         return _gameObject as FutureProtectorZombie;
      }
   }
}
