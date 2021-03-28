package com.qq.modules.activity.model.condtion
{
   import PVZ.Cmd.Dto_FlexibleActivityLimitCondtion;
   
   public class ActivityLimitCondition
   {
       
      
      private var m_minLevel:uint;
      
      private var m_maxLevel:uint;
      
      private var m_sBeginTime:String;
      
      private var m_sEndTime:String;
      
      private var m_uBeginTime:uint;
      
      private var m_uEndTime:uint;
      
      public function ActivityLimitCondition(param1:Dto_FlexibleActivityLimitCondtion)
      {
         super();
         this.m_minLevel = param1.minLevel;
         this.m_maxLevel = param1.maxLevel;
         this.m_sBeginTime = param1.beginTime;
         this.m_sEndTime = param1.endTime;
         this.m_uBeginTime = param1.iBeginTime;
         this.m_uEndTime = param1.iEndTime;
      }
      
      public function get minLevel() : uint
      {
         return this.m_minLevel;
      }
      
      public function get maxLevel() : uint
      {
         return this.m_maxLevel;
      }
      
      public function get sBeginTime() : String
      {
         return this.m_sBeginTime;
      }
      
      public function get sEndTime() : String
      {
         return this.m_sEndTime;
      }
      
      public function get uBeginTime() : uint
      {
         return this.m_uBeginTime;
      }
      
      public function get uEndTime() : uint
      {
         return this.m_uEndTime;
      }
   }
}
