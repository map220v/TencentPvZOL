package com.qq.modules.td.logic.action.zombie.archer
{
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   
   public class ZombieArcherWaitShootAction extends BasicZombieAction
   {
       
      
      public function ZombieArcherWaitShootAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.gotoAndPlay("waitShoot",true);
      }
   }
}
