package com.qq.modules.onlineReward.model
{
   import PVZ.Cmd.Dto_OnlineReward;
   import com.qq.constant.onlineReward.OnlineRewardConstant;
   import com.qq.modules.onlineReward.model.templates.ce.OnlineDailyRewardTemplateCE;
   import com.qq.modules.onlineReward.model.templates.ce.OnlineWeekRewardTemplateCE;
   import com.qq.utils.DateUtils;
   
   public class OnlineRewardModel
   {
       
      
      public var daliyOnlineEffectiveTime:Number;
      
      public var weekOnlineTime:Number;
      
      public var lastLoginTime:Number;
      
      public var lastDailyRewardTime:Number;
      
      public var nextDailyRewardID:int;
      
      public var lastWeekRewardList:Array;
      
      public var dailyRewardList:Array;
      
      public var lastWeekRewardStat:int;
      
      public var nextDailyRewardTime:int;
      
      public var nextDailyRewardInfo:OnlineDailyRewardTemplateCE;
      
      public var nextWeeklyRewardInfo:OnlineWeekRewardTemplateCE;
      
      private var _maxLeftTime:Number;
      
      public function OnlineRewardModel()
      {
         super();
         this.reset();
      }
      
      public function reset() : void
      {
         this.daliyOnlineEffectiveTime = 0;
         this.weekOnlineTime = 0;
         this.lastLoginTime = 0;
         this.lastDailyRewardTime = 0;
         this.nextDailyRewardID = 0;
         this.nextDailyRewardTime = -1;
         this.nextDailyRewardInfo = null;
         this.nextWeeklyRewardInfo = null;
         this._maxLeftTime = 0;
      }
      
      public function getDailyOnlineTime() : Number
      {
         var _loc1_:Number = this.daliyOnlineEffectiveTime;
         if(this.nextDailyRewardInfo == null)
         {
            this.nextDailyRewardInfo = OnlineRewardDataFactory.instance.getDailyRewardInfoByID(this.nextDailyRewardID);
         }
         if(this.nextDailyRewardInfo != null)
         {
            if(this.nextDailyRewardInfo.id != this.nextDailyRewardID)
            {
               this.nextDailyRewardInfo = OnlineRewardDataFactory.instance.getDailyRewardInfoByID(this.nextDailyRewardID);
            }
            _loc1_ = Math.min(this.nextDailyRewardInfo.time,_loc1_);
         }
         else
         {
            _loc1_ = this.daliyOnlineEffectiveTime;
         }
         return _loc1_;
      }
      
      public function getWeekOnlineTime() : Number
      {
         var _loc1_:Number = 0;
         if(this.getTakeDailyRewardID() == -1)
         {
            _loc1_ = DateUtils.getInstance().getInterval(this.lastLoginTime);
            this._maxLeftTime = this.weekOnlineTime - _loc1_;
         }
         else if(this._maxLeftTime == 0)
         {
            this._maxLeftTime = this.weekOnlineTime;
         }
         return this._maxLeftTime;
      }
      
      public function getNextRewardLeftTime() : Number
      {
         var _loc1_:Number = this.getNextRewardTime();
         var _loc2_:Number = DateUtils.getInstance().getInterval(_loc1_);
         return Number(Math.max(0,_loc2_));
      }
      
      public function getNextRewardTime() : Number
      {
         var _loc1_:OnlineDailyRewardTemplateCE = null;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if(this.nextDailyRewardTime == -1)
         {
            if(this.nextDailyRewardID == 0)
            {
               _loc1_ = OnlineRewardDataFactory.instance.getDailyRewardInfoByID(1);
            }
            else
            {
               _loc1_ = OnlineRewardDataFactory.instance.getDailyRewardInfoByID(this.nextDailyRewardID);
            }
            if(_loc1_ != null)
            {
               _loc2_ = DateUtils.getInstance().getServerTime();
               _loc3_ = this.getDailyOnlineTime();
               if(_loc3_ > _loc1_.time)
               {
                  this.nextDailyRewardTime = _loc2_ - _loc3_;
               }
               else
               {
                  this.nextDailyRewardTime = _loc2_ + (_loc1_.time - _loc3_);
               }
            }
            else
            {
               this.nextDailyRewardTime = 0;
            }
         }
         return this.nextDailyRewardTime;
      }
      
      public function getTakeDailyRewardID() : int
      {
         if(this.nextDailyRewardID > OnlineRewardConstant.Total_Daily_Reward)
         {
            return -1;
         }
         var _loc1_:Number = this.getNextRewardTime();
         var _loc2_:Number = DateUtils.getInstance().getInterval(_loc1_);
         if(_loc2_ < 0)
         {
            return this.nextDailyRewardID;
         }
         return -1;
      }
      
      public function getTakeWeeklyRewardID() : int
      {
         var _loc3_:int = 0;
         var _loc4_:OnlineWeekRewardTemplateCE = null;
         var _loc5_:int = 0;
         var _loc1_:Number = this.getWeekOnlineTime();
         if(this.nextWeeklyRewardInfo != null && _loc1_ > this.nextWeeklyRewardInfo.time)
         {
            this.nextWeeklyRewardInfo = null;
         }
         if(this.nextWeeklyRewardInfo == null)
         {
            _loc3_ = OnlineRewardDataFactory.instance.getTotalWeeklyReward();
            _loc5_ = 0;
            while(_loc5_ < _loc3_)
            {
               _loc4_ = OnlineRewardDataFactory.instance.getWeekRewardInfoByLevel(_loc5_ + 1);
               if(_loc1_ < _loc4_.time)
               {
                  break;
               }
               this.nextWeeklyRewardInfo = _loc4_;
               _loc5_++;
            }
         }
         var _loc2_:int = -1;
         if(this.nextWeeklyRewardInfo != null)
         {
            _loc2_ = this.nextWeeklyRewardInfo.id;
         }
         return _loc2_;
      }
      
      public function getNextDailyRewardID() : int
      {
         return this.nextDailyRewardID;
      }
      
      public function resetNextRewardData() : void
      {
         this.nextDailyRewardTime = -1;
      }
      
      public function getDailyRewardItemListByID(param1:int) : Array
      {
         var _loc3_:Dto_OnlineReward = null;
         var _loc2_:Array = new Array();
         if(this.dailyRewardList != null)
         {
            if(this.dailyRewardList[param1 - 1] != null)
            {
               _loc3_ = this.dailyRewardList[param1 - 1];
               _loc2_ = _loc3_.items;
            }
         }
         return _loc2_;
      }
   }
}
