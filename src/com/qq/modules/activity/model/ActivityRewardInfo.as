package com.qq.modules.activity.model
{
   import PVZ.Cmd.Dto_FlexibleActivityCondtionReward;
   import PVZ.Cmd.Dto_FlexibleActivityReward;
   import PVZ.Cmd.Dto_IdNum;
   import com.qq.modules.activity.model.condtion.ActivityPrivilegeCondition;
   import com.qq.modules.activity.model.condtion.ActivityValueCondition;
   import com.qq.modules.bag.model.vo.ItemVO;
   
   public class ActivityRewardInfo
   {
      
      public static const CONDITION_ROLE_LEVEL:uint = 0;
      
      public static const CONDITION_LOGIN_DATE:uint = 1;
      
      public static const CONDITION_LOGIN_DAY:uint = 2;
      
      public static const CONDITION_RECHARGE:uint = 3;
      
      public static const CONDITION_SIGN_IN:uint = 4;
      
      public static const CONDITION_DF_TODAY_SCORE:uint = 5;
      
      public static const CONDITION_DF_TOTAL_SCORE:uint = 6;
      
      public static const CONDITION_ZOMBIE_COUNT:uint = 7;
      
      public static const CONDITION_USE_GOLD_DIAMOND:uint = 8;
      
      public static const CONDITION_MERGER_LOGIN_NUM:uint = 9;
      
      public static const CONDITION_VIDEO_SEE_TIMES:uint = 10;
       
      
      private var m_vecConditions:Vector.<ActivityValueCondition>;
      
      private var m_privilegeCondition:ActivityPrivilegeCondition;
      
      private var m_vecItems:Vector.<ItemVO>;
      
      private var m_canTake:Boolean = false;
      
      private var m_canSign:Boolean = false;
      
      private var m_takeTime:uint = 0;
      
      private var m_timesLimit:uint = 0;
      
      private var m_flexValue1:uint;
      
      private var m_flexValue2:uint;
      
      public function ActivityRewardInfo(param1:Dto_FlexibleActivityCondtionReward)
      {
         var _loc2_:Dto_FlexibleActivityReward = null;
         var _loc3_:Dto_IdNum = null;
         super();
         if(param1 == null)
         {
            return;
         }
         if(param1.hasPrivilege)
         {
            this.m_privilegeCondition = new ActivityPrivilegeCondition(param1.privilege);
         }
         this.m_vecConditions = new Vector.<ActivityValueCondition>(4);
         this.m_vecConditions[CONDITION_ROLE_LEVEL] = ActivityValueCondition.createByCompare(param1.level);
         this.m_vecConditions[CONDITION_LOGIN_DATE] = ActivityValueCondition.createByCompare(param1.loginDate);
         this.m_vecConditions[CONDITION_LOGIN_DAY] = ActivityValueCondition.createByTracker(param1.loginNum);
         this.m_vecConditions[CONDITION_RECHARGE] = ActivityValueCondition.createByTracker(param1.saveTicket);
         this.m_vecConditions[CONDITION_SIGN_IN] = ActivityValueCondition.createByTracker(param1.signTimes);
         this.m_vecConditions[CONDITION_DF_TODAY_SCORE] = ActivityValueCondition.createByTracker(param1.todayscore);
         this.m_vecConditions[CONDITION_DF_TOTAL_SCORE] = ActivityValueCondition.createByTracker(param1.totalscore);
         this.m_vecConditions[CONDITION_ZOMBIE_COUNT] = ActivityValueCondition.createByTracker(param1.zombieNum);
         this.m_vecConditions[CONDITION_USE_GOLD_DIAMOND] = ActivityValueCondition.createByTracker(param1.costGoldTicket);
         this.m_vecConditions[CONDITION_MERGER_LOGIN_NUM] = ActivityValueCondition.createByTracker(param1.mergeServerLoginNum);
         this.m_vecConditions[CONDITION_VIDEO_SEE_TIMES] = ActivityValueCondition.createByTracker(param1.watchVideo);
         this.m_flexValue1 = param1.flexibleValue1;
         this.m_flexValue2 = param1.flexibleValue2;
         this.m_vecItems = new Vector.<ItemVO>();
         if(param1.reward)
         {
            _loc2_ = param1.reward;
            this.m_takeTime = _loc2_.takeTime;
            this.m_canTake = _loc2_.canTake;
            for each(_loc3_ in _loc2_.items)
            {
               this.m_vecItems.push(new ItemVO(_loc3_.id,_loc3_.num));
            }
            this.m_canSign = _loc2_.canSign;
         }
         else
         {
            this.m_takeTime = 0;
            this.m_canTake = false;
            this.m_canSign = false;
         }
         this.m_timesLimit = param1.timesLimit;
      }
      
      public function setTakeInfo(param1:Boolean, param2:uint) : void
      {
         this.m_canTake = param1;
         this.m_takeTime = param2;
      }
      
      public function get canTake() : Boolean
      {
         return this.m_canTake;
      }
      
      public function get takeTime() : uint
      {
         return this.m_takeTime;
      }
      
      public function get items() : Vector.<ItemVO>
      {
         return this.m_vecItems;
      }
      
      public function get canSign() : Boolean
      {
         return this.m_canSign;
      }
      
      public function get timesLimit() : uint
      {
         return this.m_timesLimit;
      }
      
      public function get flexValue1() : uint
      {
         return this.m_flexValue1;
      }
      
      public function get flexValue2() : uint
      {
         return this.m_flexValue2;
      }
      
      public function get privilegeCondition() : ActivityPrivilegeCondition
      {
         return this.m_privilegeCondition;
      }
      
      public function hasCondition(param1:uint) : Boolean
      {
         if(param1 >= 0 && param1 < this.m_vecConditions.length)
         {
            return this.m_vecConditions[param1] != null;
         }
         return false;
      }
      
      public function getCondition(param1:uint) : ActivityValueCondition
      {
         return this.m_vecConditions[param1];
      }
   }
}
