package com.qq.modules.signIn.model.vo
{
   public class SignInRewardVO
   {
       
      
      private var m_dayIndex:uint;
      
      private var m_itemID:uint;
      
      private var m_itemCount:uint;
      
      private var m_vipLevel:uint;
      
      public function SignInRewardVO()
      {
         super();
      }
      
      public function set dayIndex(param1:uint) : void
      {
         this.m_dayIndex = param1;
      }
      
      public function get dayIndex() : uint
      {
         return this.m_dayIndex;
      }
      
      public function set itemID(param1:uint) : void
      {
         this.m_itemID = param1;
      }
      
      public function get itemID() : uint
      {
         return this.m_itemID;
      }
      
      public function set itemCount(param1:uint) : void
      {
         this.m_itemCount = param1;
      }
      
      public function get itemCount() : uint
      {
         return this.m_itemCount;
      }
      
      public function set vipLevel(param1:uint) : void
      {
         this.m_vipLevel = param1;
      }
      
      public function get vipLevel() : uint
      {
         return this.m_vipLevel;
      }
   }
}
