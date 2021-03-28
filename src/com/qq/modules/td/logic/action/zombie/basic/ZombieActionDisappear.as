package com.qq.modules.td.logic.action.zombie.basic
{
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   
   public class ZombieActionDisappear extends BasicZombieAction
   {
       
      
      public function ZombieActionDisappear()
      {
         super();
      }
      
      override public function runningState() : void
      {
         super.runningState();
         _zombie.dispose();
      }
      
      override public function leaveState() : void
      {
         _zombie.setVaild(false);
      }
   }
}
