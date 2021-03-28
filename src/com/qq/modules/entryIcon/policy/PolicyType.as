package com.qq.modules.entryIcon.policy
{
   public class PolicyType
   {
      
      public static const TYPE_NULL:uint = 0;
      
      public static const TYPE_FIRST_LOGIN:uint = 1;
      
      public static const TYPE_NEW_ACTIVITY:uint = 2;
      
      public static const TYPE_HAS_REWARD:uint = 3;
      
      public static const TYPE_OPEN_UI:uint = 4;
      
      public static const TYPE_TAKE_REWARD:uint = 5;
      
      public static const TYPE_LIMIT_BEGIN:uint = 6;
      
      public static const TYPE_LIMIT_END:uint = 7;
      
      public static const FIRST_CHECK_LIST:Array = [TYPE_FIRST_LOGIN,TYPE_LIMIT_BEGIN,TYPE_LIMIT_END,TYPE_HAS_REWARD,TYPE_TAKE_REWARD];
      
      public static const UI_CHECK_LIST:Array = [TYPE_OPEN_UI];
       
      
      public function PolicyType()
      {
         super();
      }
   }
}
