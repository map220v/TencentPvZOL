package com.qq.modules.buffActivity.model.buff
{
   public class BuffAdventure
   {
       
      
      protected var m_cityExpPercent:uint;
      
      protected var m_goldPercent:uint;
      
      protected var m_cardExpPercent:uint;
      
      protected var m_puzzleMultiple:uint;
      
      public function BuffAdventure()
      {
         super();
      }
      
      public function set cityExpPercent(param1:uint) : void
      {
         this.m_cardExpPercent = param1;
      }
      
      public function get cityExpPercent() : uint
      {
         return this.m_cardExpPercent;
      }
      
      public function set goldPercent(param1:uint) : void
      {
         this.m_goldPercent = param1;
      }
      
      public function get goldPercent() : uint
      {
         return this.m_goldPercent;
      }
      
      public function set cardExpPercent(param1:uint) : void
      {
         this.m_cardExpPercent = param1;
      }
      
      public function get cardExpPercent() : uint
      {
         return this.m_cardExpPercent;
      }
      
      public function set puzzleMultiple(param1:uint) : void
      {
         this.m_puzzleMultiple = param1;
      }
      
      public function get puzzleMultiple() : uint
      {
         return this.m_puzzleMultiple;
      }
   }
}
