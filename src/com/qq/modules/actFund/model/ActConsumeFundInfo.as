package com.qq.modules.actFund.model
{
   import PVZ.Cmd.Dto_Fund_BaseInfo;
   import PVZ.Cmd.Dto_Fund_BuyInfo;
   import PVZ.Cmd.Dto_Fund_RewardPkg;
   import com.qq.utils.DateUtils;
   
   public class ActConsumeFundInfo
   {
       
      
      private var _baseInfo:Dto_Fund_BaseInfo;
      
      private var _buyInfo:Dto_Fund_BuyInfo;
      
      private var _consumeDiamond:int;
      
      private var _lastTakeTime:Number;
      
      public function ActConsumeFundInfo(param1:Dto_Fund_BaseInfo, param2:Dto_Fund_BuyInfo, param3:int)
      {
         var _loc4_:Date = null;
         var _loc5_:int = 0;
         super();
         this._baseInfo = param1;
         this._buyInfo = param2;
         this._consumeDiamond = param3;
         if(this._buyInfo != null)
         {
            _loc4_ = DateUtils.getInstance().getServerDate();
            _loc5_ = 0;
            while(_loc5_ < 10)
            {
               if(_loc4_.day == 0)
               {
                  _loc4_.hours = 23;
                  _loc4_.minutes = 59;
                  break;
               }
               ++_loc4_.date;
               _loc5_++;
            }
            this._lastTakeTime = _loc4_.getTime() * 0.001;
         }
      }
      
      public function get fundID() : int
      {
         return this._baseInfo.fundId;
      }
      
      public function get isBuy() : Boolean
      {
         return this._buyInfo != null;
      }
      
      public function get hasReward() : Boolean
      {
         if(!this.isBuy)
         {
            return false;
         }
         if(!this.hasTake)
         {
            return this._consumeDiamond >= this._baseInfo.weekDiamond;
         }
         return false;
      }
      
      public function get hasTake() : Boolean
      {
         if(this._buyInfo.rewardTime < this._lastTakeTime && this._lastTakeTime - this._buyInfo.rewardTime < 7 * 3600 * 24)
         {
            return true;
         }
         return false;
      }
      
      public function get name() : String
      {
         return this._baseInfo.name;
      }
      
      public function get return_week() : int
      {
         return this._baseInfo.rewardPkg.length;
      }
      
      public function get expireTime() : Number
      {
         if(!this.isBuy)
         {
            return -1;
         }
         var _loc1_:Date = new Date();
         _loc1_.setTime(this._buyInfo.buyTime * 1000);
         _loc1_.date += this.return_week * 7;
         var _loc2_:int = 0;
         while(_loc2_ < 10)
         {
            if(_loc1_.day == 1)
            {
               _loc1_.hours = 0;
               _loc1_.minutes = 0;
               break;
            }
            --_loc1_.date;
            _loc2_++;
         }
         return _loc1_.getTime() * 0.001;
      }
      
      public function get needConsume() : int
      {
         return this._baseInfo.weekDiamond;
      }
      
      public function get instantRatio() : int
      {
         return this._baseInfo.instantRatio;
      }
      
      public function get returnNum() : int
      {
         return this._baseInfo.instantRatio;
      }
      
      public function get rechargeNum() : int
      {
         return this._baseInfo.totalRatio;
      }
      
      public function get price() : int
      {
         return this._baseInfo.price;
      }
      
      public function get immediateReturnItemList() : Array
      {
         if(this._baseInfo.instantReward == null)
         {
            return [];
         }
         return this._baseInfo.instantReward.reward;
      }
      
      public function get curWeekIndex() : int
      {
         if(!this.isBuy)
         {
            return 0;
         }
         var _loc1_:Number = DateUtils.getInstance().getServerTime();
         var _loc2_:Number = _loc1_ - this._buyInfo.buyTime;
         var _loc3_:int = Math.ceil(_loc2_ / (7 * 24 * 3600)) - 1;
         return int(Math.max(0,_loc3_));
      }
      
      public function getThisWeekReward() : Array
      {
         var _loc2_:Dto_Fund_RewardPkg = null;
         if(this._baseInfo.rewardPkg == null)
         {
            return [];
         }
         var _loc1_:int = this.curWeekIndex;
         if(_loc1_ < this._baseInfo.rewardPkg.length)
         {
            _loc2_ = this._baseInfo.rewardPkg[_loc1_];
            return _loc2_.reward;
         }
         return [];
      }
      
      public function get isOpen() : Boolean
      {
         return this._baseInfo.isOpen == 1;
      }
   }
}
