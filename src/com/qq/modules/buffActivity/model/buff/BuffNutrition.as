package com.qq.modules.buffActivity.model.buff
{
   public class BuffNutrition
   {
       
      
      private var m_callRebate:uint;
      
      public function BuffNutrition()
      {
         super();
      }
      
      public function get callRebate() : uint
      {
         return this.m_callRebate;
      }
      
      public function set callRebate(param1:uint) : void
      {
         this.m_callRebate = param1;
      }
   }
}
