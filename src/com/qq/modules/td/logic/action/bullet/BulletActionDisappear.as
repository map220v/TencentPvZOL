package com.qq.modules.td.logic.action.bullet
{
   public class BulletActionDisappear extends BasicBulletAction
   {
       
      
      public function BulletActionDisappear()
      {
         super();
      }
      
      override public function runningState() : void
      {
         _bullet.dispose();
      }
   }
}
