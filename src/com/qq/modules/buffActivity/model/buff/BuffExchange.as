package com.qq.modules.buffActivity.model.buff
{
   public class BuffExchange
   {
       
      
      private var m_conditionChance:uint;
      
      private var m_happenPercent:uint;
      
      private var m_additionPercent:uint;
      
      public function BuffExchange()
      {
         super();
      }
      
      public function set conditionChance(param1:uint) : void
      {
         this.m_conditionChance = param1;
      }
      
      public function get conditionChance() : uint
      {
         return this.m_conditionChance;
      }
      
      public function set happenPercent(param1:uint) : void
      {
         this.m_happenPercent = param1;
      }
      
      public function get happenPercent() : uint
      {
         return this.m_happenPercent;
      }
      
      public function set additionPercent(param1:uint) : void
      {
         this.m_additionPercent = param1;
      }
      
      public function get additionPercent() : uint
      {
         return this.m_additionPercent;
      }
   }
}
