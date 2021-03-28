package com.qq.modules.exped.model.vo
{
   public class ExpedInfoVO
   {
       
      
      private var m_type:int;
      
      private var m_totalExpedCount:int = 0;
      
      private var m_expedCount:int = 0;
      
      private var m_totalPayCount:int = 0;
      
      private var m_payCount:int = 0;
      
      public function ExpedInfoVO(param1:int)
      {
         super();
         this.m_type = param1;
      }
      
      public function get type() : int
      {
         return this.m_type;
      }
      
      public function updatePayCount(param1:int, param2:int) : void
      {
         this.m_payCount = param1;
         this.m_totalPayCount = param2;
      }
      
      public function updateExpedCount(param1:int, param2:int) : void
      {
         this.m_expedCount = param1;
         this.m_totalExpedCount = param2;
      }
      
      public function get payCount() : int
      {
         return this.m_payCount;
      }
      
      public function get totalPayCount() : int
      {
         return this.m_totalPayCount;
      }
      
      public function get expedCount() : int
      {
         return this.m_expedCount;
      }
      
      public function get totalExpedCount() : int
      {
         return this.m_totalExpedCount;
      }
   }
}
