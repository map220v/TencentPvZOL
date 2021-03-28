package com.qq.modules.td.logic.unit.zombie
{
   public class JellyFishZombie extends BasicZombie
   {
       
      
      public function JellyFishZombie()
      {
         super();
      }
      
      override public function revive(param1:Array = null) : void
      {
         super.revive(param1);
         this.objectModel.isFlying = true;
      }
   }
}
