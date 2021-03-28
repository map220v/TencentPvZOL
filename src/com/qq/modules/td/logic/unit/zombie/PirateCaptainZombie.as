package com.qq.modules.td.logic.unit.zombie
{
   public class PirateCaptainZombie extends BasicZombie
   {
       
      
      private var _isHaveParrot:Boolean = true;
      
      public function PirateCaptainZombie()
      {
         super();
      }
      
      public function get isHaveParrot() : Boolean
      {
         return this._isHaveParrot;
      }
      
      public function set isHaveParrot(param1:Boolean) : void
      {
         this._isHaveParrot = param1;
      }
   }
}
