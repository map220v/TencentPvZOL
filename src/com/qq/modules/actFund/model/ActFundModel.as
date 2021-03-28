package com.qq.modules.actFund.model
{
   import PVZ.Cmd.Dto_Fund_BaseInfo;
   import PVZ.Cmd.Dto_Fund_BuyInfo;
   import PVZ.Cmd.FlexibleActivity_19;
   import PVZ.Cmd.FlexibleActivity_23;
   import PVZ.Cmd.GrowReturnConf;
   import com.qq.GameGloble;
   import com.qq.modules.actFund.ActFundConst;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.DateUtils;
   
   public class ActFundModel
   {
       
      
      public var tryInfo:FlexibleActivity_23;
      
      public var consumeActID:int;
      
      public var consume_fund_hasReward:Boolean;
      
      public var consume_diamond:int;
      
      public var consume_Fund_List:Array;
      
      public var hasConsumeReward:Boolean;
      
      public var grow_actID:int;
      
      public var grow_canBuyDay:int;
      
      public var grow_openBuy:int;
      
      public var grow_price:int;
      
      public var grow_totalValue:int;
      
      public var grow_Fund_List:Array;
      
      public var hasGrowReward:Boolean;
      
      public var grow_buyTime:Number = 0;
      
      public var grow_getList:Array;
      
      private var _grow_fund_limit_time:Number = 0;
      
      public function ActFundModel()
      {
         super();
      }
      
      public function loadConsumeFundInfo(param1:FlexibleActivity_19) : void
      {
         var _loc4_:Dto_Fund_BaseInfo = null;
         var _loc5_:int = 0;
         var _loc6_:Dto_Fund_BuyInfo = null;
         var _loc7_:int = 0;
         var _loc8_:ActConsumeFundInfo = null;
         var _loc9_:Dto_Fund_BuyInfo = null;
         this.hasConsumeReward = false;
         this.consume_diamond = param1.curWeekDiamond;
         this.consume_Fund_List = new Array();
         var _loc2_:int = param1.confInfo.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.confInfo[_loc3_];
            _loc5_ = param1.buyInfo.length;
            _loc6_ = null;
            _loc7_ = 0;
            while(_loc7_ < _loc5_)
            {
               if((_loc9_ = param1.buyInfo[_loc7_]).fundId == _loc4_.fundId)
               {
                  _loc6_ = _loc9_;
                  break;
               }
               _loc7_++;
            }
            _loc8_ = new ActConsumeFundInfo(_loc4_,_loc6_,this.consume_diamond);
            this.consume_Fund_List.push(_loc8_);
            if(_loc8_.hasReward)
            {
               this.hasConsumeReward = true;
            }
            CommandDispatcher.send(ActFundConst.FUND_HAS_REWARD,[0,this.hasConsumeReward]);
            _loc3_++;
         }
      }
      
      public function loadGrowFundInfo(param1:Array) : void
      {
         var _loc4_:GrowReturnConf = null;
         var _loc5_:ActGrowFundInfo = null;
         this.grow_Fund_List = new Array();
         var _loc2_:int = param1.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1[_loc3_];
            _loc5_ = new ActGrowFundInfo(this.grow_actID,_loc4_);
            this.grow_Fund_List.push(_loc5_);
            _loc3_++;
         }
      }
      
      public function updateGrowFundState(param1:Array) : void
      {
         var _loc4_:ActGrowFundInfo = null;
         if(this.grow_Fund_List == null)
         {
            return;
         }
         this.hasGrowReward = false;
         var _loc2_:int = this.grow_Fund_List.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = this.grow_Fund_List[_loc3_];
            if(param1.indexOf(_loc4_.id) != -1)
            {
               _loc4_.isTake = true;
            }
            else
            {
               _loc4_.isTake = false;
            }
            if(this.isBuyGrowFund && _loc4_.hasReward)
            {
               this.hasGrowReward = true;
            }
            _loc3_++;
         }
         CommandDispatcher.send(ActFundConst.FUND_HAS_REWARD,[1,this.hasGrowReward]);
      }
      
      public function get isAllowBuy() : Boolean
      {
         if(this.isBuyGrowFund)
         {
            return false;
         }
         if(!this.grow_openBuy)
         {
            return false;
         }
         var _loc1_:Number = DateUtils.getInstance().getServerTime();
         return _loc1_ < this.grow_fund_limit_time * 0.001;
      }
      
      public function get grow_fund_limit_time() : Number
      {
         var _loc1_:Date = null;
         if(this._grow_fund_limit_time == 0)
         {
            _loc1_ = new Date();
            _loc1_.setTime(GameGloble.actorModel.serverOpenTime * 1000);
            _loc1_.hours = 0;
            _loc1_.minutes = 0;
            _loc1_.seconds = 0;
            _loc1_.milliseconds = 0;
            _loc1_.date += this.grow_canBuyDay;
            this._grow_fund_limit_time = _loc1_.getTime();
         }
         return this._grow_fund_limit_time;
      }
      
      public function get isBuyGrowFund() : Boolean
      {
         return this.grow_buyTime != 0;
      }
   }
}
