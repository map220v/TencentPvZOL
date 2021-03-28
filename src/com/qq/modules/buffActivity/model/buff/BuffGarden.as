package com.qq.modules.buffActivity.model.buff
{
   public class BuffGarden
   {
       
      
      private var m_gardenExpRate:int = 0;
      
      public function BuffGarden()
      {
         super();
      }
      
      public function set gardenExpRate(param1:int) : void
      {
         this.m_gardenExpRate = param1;
      }
      
      public function get gardenExpRate() : int
      {
         return this.m_gardenExpRate;
      }
   }
}
