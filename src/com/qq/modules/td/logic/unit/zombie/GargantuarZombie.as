package com.qq.modules.td.logic.unit.zombie
{
   public class GargantuarZombie extends BasicZombie
   {
       
      
      private var _isHaveImp:Boolean = true;
      
      public function GargantuarZombie()
      {
         super();
      }
      
      public function get isHaveImp() : Boolean
      {
         return this._isHaveImp;
      }
      
      public function set isHaveImp(param1:Boolean) : void
      {
         this._isHaveImp = param1;
         animation.setBoneVisibleRule("_Zombie_Imp_*",false);
         animation.setBoneVisibleRule("_zombie_imp_*",false);
         animation.setBoneVisibleRule("zombie_imp_*",false);
      }
   }
}
