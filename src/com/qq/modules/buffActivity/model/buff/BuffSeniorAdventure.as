package com.qq.modules.buffActivity.model.buff
{
   public class BuffSeniorAdventure extends BuffAdventure
   {
       
      
      private var m_fightChance:uint;
      
      private var m_debrisMultiple:uint;
      
      public function BuffSeniorAdventure()
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
      
      public function set debrisMultiple(param1:uint) : void
      {
         this.m_debrisMultiple = param1;
      }
      
      public function get debrisMultiple() : uint
      {
         return this.m_debrisMultiple;
      }
   }
}
