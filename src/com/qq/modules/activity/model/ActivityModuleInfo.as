package com.qq.modules.activity.model
{
   import PVZ.Cmd.Dto_FlexibleActivityLimitFuben;
   
   public class ActivityModuleInfo
   {
       
      
      private var m_coolDown:uint;
      
      private var m_coolDownLimit:uint;
      
      private var m_lastChallengeTime:uint;
      
      private var m_timesLimit:uint;
      
      private var m_realTimesLimit:uint;
      
      private var m_challengeTimes:uint;
      
      private var m_aryOpen:Array;
      
      private var m_energyCost:uint;
      
      private var m_needPrivilegeType:uint;
      
      private var m_timesPrivilegeType:uint;
      
      private var m_buyTimesCostId:uint;
      
      private var m_buyTimesCostValue:Array;
      
      public function ActivityModuleInfo()
      {
         super();
      }
      
      public function parseFromDto(param1:Dto_FlexibleActivityLimitFuben) : void
      {
         this.m_coolDownLimit = param1.coolDown;
         this.m_lastChallengeTime = param1.lastChallengeTime;
         this.m_timesLimit = param1.timesLimit;
         this.m_realTimesLimit = param1.realTimesLimit;
         this.m_challengeTimes = param1.challengeTimes;
         this.m_energyCost = param1.energyCost;
         this.m_aryOpen = param1.fubenId;
         this.m_coolDown = param1.leftCoolDown;
         this.m_needPrivilegeType = param1.needPrivilegeType;
         this.m_timesPrivilegeType = param1.timesPrivilegeType;
         this.m_buyTimesCostId = param1.buyTimesCostId;
         this.m_buyTimesCostValue = param1.buyTimesCostValue;
      }
      
      public function get needPrivilegeType() : uint
      {
         return this.m_needPrivilegeType;
      }
      
      public function get timesPrivilegeType() : uint
      {
         return this.m_timesPrivilegeType;
      }
      
      public function get buyTimesCostId() : uint
      {
         return this.m_buyTimesCostId;
      }
      
      public function getTimesCostValue(param1:int) : uint
      {
         if(this.m_buyTimesCostValue == null)
         {
            return 0;
         }
         if(param1 >= this.m_buyTimesCostValue.length)
         {
            return 0;
         }
         return this.m_buyTimesCostValue[param1];
      }
      
      public function get coolDown() : uint
      {
         return this.m_coolDown;
      }
      
      public function get lastChallengeTime() : uint
      {
         return this.m_lastChallengeTime;
      }
      
      public function get timesLimit() : uint
      {
         return this.m_timesLimit;
      }
      
      public function get leftTimes() : uint
      {
         if(this.m_realTimesLimit > this.m_challengeTimes)
         {
            return this.m_realTimesLimit - this.m_challengeTimes;
         }
         return 0;
      }
      
      public function getBuyTimes() : uint
      {
         if(this.m_challengeTimes > this.m_realTimesLimit)
         {
            return this.m_challengeTimes - this.m_realTimesLimit;
         }
         return 0;
      }
      
      public function getTotalBuyTimes() : uint
      {
         if(this.m_buyTimesCostValue == null)
         {
            return 0;
         }
         return this.m_buyTimesCostValue.length;
      }
      
      public function get openList() : Array
      {
         return this.m_aryOpen;
      }
      
      public function get realTimesLimit() : uint
      {
         return this.m_realTimesLimit;
      }
      
      public function get energyCost() : uint
      {
         return this.m_energyCost;
      }
   }
}
