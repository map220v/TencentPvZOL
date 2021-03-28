package com.qq.modules.buffActivity.model.buff
{
   public class BuffModule
   {
       
      
      private var m_fightChance:uint;
      
      public function BuffModule()
      {
         super();
      }
      
      public function set fightChance(param1:uint) : void
      {
         this.m_fightChance = param1;
      }
      
      public function get fightChance() : uint
      {
         return this.m_fightChance;
      }
   }
}
