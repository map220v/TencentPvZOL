package com.qq.modules.dailyTD.model
{
   import PVZ.Cmd.Cmd_DailyTD_GetInfo_SC;
   import PVZ.Cmd.Cmd_DailyTD_GetTokenShop_SC;
   import PVZ.Cmd.Dto_DailyTDCard;
   import PVZ.Cmd.Dto_DailyTDInfo;
   import PVZ.Cmd.Dto_LotteryInfo;
   import com.qq.TDPrivilegeInfo;
   
   public class DailyTdData
   {
       
      
      private var _infoDto:Dto_DailyTDInfo;
      
      private var _lotteryDto:Dto_LotteryInfo;
      
      private var _remainTime:int;
      
      private var _talentList:Array;
      
      public var result:int;
      
      private var _doLotteryItems:Array;
      
      private var _tradeList:Array;
      
      private var _bIsTradeList:Array;
      
      private var _iNextRefresh:int;
      
      private var _iNeedTimeCoin:int;
      
      private var _iRefreshByHand:int;
      
      public function DailyTdData()
      {
         super();
      }
      
      public function get info() : Dto_DailyTDInfo
      {
         return this._infoDto;
      }
      
      public function get remainTime() : int
      {
         return this._remainTime;
      }
      
      public function get talentList() : Array
      {
         return this._talentList;
      }
      
      public function get currentStageId() : int
      {
         return this._infoDto.stageId;
      }
      
      public function get currentStageStatus() : int
      {
         return this._infoDto.eProcess;
      }
      
      public function get plantList() : Array
      {
         return this._infoDto.plantInfo;
      }
      
      public function get plantCard() : Array
      {
         return this._infoDto.plantCard;
      }
      
      public function get iTDSeqId() : int
      {
         return this._infoDto.iTDSeqId;
      }
      
      public function get randomCardItem() : Dto_DailyTDCard
      {
         return this._infoDto.cardItem;
      }
      
      public function get lotteryIndex() : int
      {
         return this._lotteryDto.stageId;
      }
      
      public function get iRemainLottery() : int
      {
         return this._lotteryDto.iRemainLottery;
      }
      
      public function get doLotteryItems() : Array
      {
         return this._doLotteryItems;
      }
      
      public function doOnceLottery(param1:Array) : void
      {
         this._doLotteryItems = param1;
      }
      
      public function get tradeList() : Array
      {
         return this._tradeList;
      }
      
      public function get bIsTradeList() : Array
      {
         return this._bIsTradeList;
      }
      
      public function get iNextRefresh() : int
      {
         return this._iNextRefresh;
      }
      
      public function get iNeedTimeCoin() : int
      {
         return this._iNeedTimeCoin;
      }
      
      public function get iRefreshByHand() : int
      {
         return this._iRefreshByHand;
      }
      
      public function loadInfo(param1:Cmd_DailyTD_GetInfo_SC) : void
      {
         this._infoDto = param1.stDailyTD;
         this._lotteryDto = param1.stLottery;
         this._remainTime = param1.iRemainChallenge;
         this._talentList = param1.talentIdList;
         TDPrivilegeInfo.getInstance().hasTDPrivilege = param1.hasPrivilege;
         TDPrivilegeInfo.getInstance().privilegeRemainTime = param1.remainTime;
         TDPrivilegeInfo.getInstance().unlockPlantIDList = param1.plantId;
      }
      
      public function loadTradeInfo(param1:Cmd_DailyTD_GetTokenShop_SC) : void
      {
         this._tradeList = param1.tradeList;
         this._bIsTradeList = param1.bIsTradeList;
         this._iNextRefresh = param1.iNextRefresh;
         this._iNeedTimeCoin = param1.iNeedTimeCoin;
         this._iRefreshByHand = param1.iRefreshByHand;
      }
      
      public function setExtractCardInfo(param1:Dto_DailyTDCard) : void
      {
         this._infoDto.cardItem = param1;
      }
      
      public function doTrade(param1:int) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this._tradeList.length)
         {
            if(this._tradeList[_loc2_] == param1)
            {
               this.bIsTradeList[_loc2_] = true;
            }
            _loc2_++;
         }
      }
   }
}
