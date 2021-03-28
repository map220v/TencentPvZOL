package com.qq.modules.td.logic.action.zombie.barrelRoller
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.zombie.basic.ZombieActionWalk;
   import com.qq.modules.td.logic.unit.zombie.BarrelRollerZombie;
   
   public class ZActionBarrelRollerWalk extends ZombieActionWalk
   {
       
      
      public function ZActionBarrelRollerWalk()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         if(this.barrelRoller.barrel.isVaild)
         {
            this.barrelRoller.barrel.setAction(TDConstant.BarrelAction_Roll);
         }
         super.enterState(param1);
      }
      
      override public function runningState() : void
      {
         if(!_zombie.animation.isPlaying)
         {
            if(this.barrelRoller.barrel.isVaild && this.barrelRoller.barrel.getActionID() != TDConstant.BarrelAction_Idle)
            {
               this.barrelRoller.barrel.setAction(TDConstant.BarrelAction_Idle);
            }
            return;
         }
         if(this.barrelRoller.barrel.isVaild && this.barrelRoller.barrel.getActionID() != TDConstant.BarrelAction_Roll)
         {
            this.barrelRoller.barrel.setAction(TDConstant.BarrelAction_Roll);
         }
         super.runningState();
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
         if(this.barrelRoller.barrel.isVaild)
         {
            this.barrelRoller.barrel.setAction(TDConstant.BarrelAction_Idle);
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
      
      public function get barrelRoller() : BarrelRollerZombie
      {
         return _gameObject as BarrelRollerZombie;
      }
   }
}
