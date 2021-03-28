package com.qq.modules.td.logic.action.zombie.futureProtector
{
   import com.qq.modules.td.logic.action.zombie.basic.ZombieActionWalk;
   import com.qq.modules.td.logic.unit.zombie.FutureProtectorZombie;
   
   public class ZActionFutureProtectorShield extends ZombieActionWalk
   {
       
      
      public function ZActionFutureProtectorShield()
      {
         super();
         _walkAnimFlagName = "shield_idle";
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
      }
      
      override public function runningState() : void
      {
         super.runningState();
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
         this.protector.closeShield();
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      public function get protector() : FutureProtectorZombie
      {
         return _gameObject as FutureProtectorZombie;
      }
   }
}
