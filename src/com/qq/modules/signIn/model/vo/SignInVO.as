package com.qq.modules.signIn.model.vo
{
   public class SignInVO
   {
       
      
      private var m_totalDay:uint;
      
      private var m_remainDay:uint;
      
      private var m_usedCount:uint;
      
      private var m_usedVipCount:uint;
      
      private var m_hasSignIn:Boolean;
      
      public function SignInVO()
      {
         super();
      }
      
      public function get totalDay() : uint
      {
         return this.m_totalDay;
      }
      
      public function set totalDay(param1:uint) : void
      {
         this.m_totalDay = param1;
      }
      
      public function get remainDay() : uint
      {
         return this.m_remainDay;
      }
      
      public function set remainDay(param1:uint) : void
      {
         this.m_remainDay = param1;
      }
      
      public function get usedCount() : uint
      {
         return this.m_usedCount;
      }
      
      public function set usedCount(param1:uint) : void
      {
         this.m_usedCount = param1;
      }
      
      public function get usedVipCount() : uint
      {
         return this.m_usedVipCount;
      }
      
      public function set usedVipCount(param1:uint) : void
      {
         this.m_usedVipCount = param1;
      }
      
      public function get hasSignIn() : Boolean
      {
         return this.m_hasSignIn;
      }
      
      public function set hasSignIn(param1:Boolean) : void
      {
         this.m_hasSignIn = param1;
      }
      
      public function get usedAllCount() : uint
      {
         return this.m_usedVipCount + this.m_usedCount;
      }
   }
}
