package com.qq.modules.thanksgiving.model
{
   import PVZ.Cmd.Cmd_ThanksGiving_GetInfo_SC;
   import PVZ.Cmd.Cmd_ThanksGiving_Lottery_SC;
   import PVZ.Cmd.Dto_ThanksGiving_GlobalReward;
   import PVZ.Cmd.Dto_ThanksGiving_MyInfo;
   import PVZ.Cmd.Dto_ThanksGiving_RewardItem;
   import PVZ.Cmd.FlexibleActivity_8;
   import PVZ.Cmd.ThanksGiving_ItemType;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.thanksgiving.ThanksgivingConst;
   import flash.events.Event;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class ThanksgivingProxy extends BasicProxy
   {
       
      
      public var myInfo:Dto_ThanksGiving_MyInfo;
      
      public var otherRoleList:Array;
      
      public var nextSecKillTime:uint;
      
      public var secKillOver:Boolean;
      
      public var lotteryItem:Dto_ThanksGiving_RewardItem;
      
      private var m_lotteryTimes:int;
      
      private var m_lotteryTicket:int;
      
      public function ThanksgivingProxy()
      {
         super();
      }
      
      override public function listMsgInterests() : Array
      {
         return [[Cmd_ThanksGiving_Lottery_SC.$MessageID,this.on_ThanksGiving_Lottery_SC],[Cmd_ThanksGiving_GetInfo_SC.$MessageID,this.on_ThanksGiving_GetInfo_SC],[FlexibleActivity_8.$MessageID,this.onFlexibleActivity_8]];
      }
      
      private function onFlexibleActivity_8(param1:SocketServiceEvent) : void
      {
         var _loc2_:FlexibleActivity_8 = param1.socketData as FlexibleActivity_8;
         this.m_lotteryTimes = _loc2_.lotteryTimes;
         this.m_lotteryTicket = _loc2_.consumeTicket[0];
         dispatch(new Event(ThanksgivingConst.THANSKGIVING_LOTTERY_TIMES));
      }
      
      private function on_ThanksGiving_Lottery_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_ThanksGiving_Lottery_SC = param1.socketData as Cmd_ThanksGiving_Lottery_SC;
         this.lotteryItem = _loc2_.item;
         dispatch(new Event(ThanksgivingConst.THANSKGIVING_LOTTERY_BACK));
      }
      
      public function get lotteryIndex() : int
      {
         return !!this.lotteryItem ? int(this.lotteryItem.id) : 5;
      }
      
      public function get lotteryBounds() : int
      {
         return this.m_lotteryTimes;
      }
      
      public function get lotteryTicket() : int
      {
         return this.m_lotteryTicket;
      }
      
      public function get leftLotteryCount() : int
      {
         return this.myInfo.totalLotteryTimes - this.myInfo.remainLotteryTimes;
      }
      
      private function on_ThanksGiving_GetInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc3_:Dto_ThanksGiving_GlobalReward = null;
         var _loc4_:Dto_ThanksGiving_GlobalReward = null;
         var _loc2_:Cmd_ThanksGiving_GetInfo_SC = param1.socketData as Cmd_ThanksGiving_GetInfo_SC;
         this.otherRoleList = _loc2_.rewardList;
         this.myInfo = _loc2_.myInfo;
         this.nextSecKillTime = _loc2_.secKillTimes;
         this.secKillOver = _loc2_.secKillOver;
         var _loc5_:int = 0;
         while(_loc5_ < this.otherRoleList.length)
         {
            if((_loc4_ = this.otherRoleList[_loc5_]).items.type == ThanksGiving_ItemType.ItemType_Iphone)
            {
               _loc3_ = _loc4_;
               this.otherRoleList.splice(_loc5_,1);
               _loc5_--;
            }
            _loc5_++;
         }
         if(_loc3_)
         {
            this.otherRoleList.unshift(_loc3_);
         }
         dispatch(new Event(ThanksgivingConst.THANSKGIVING_GET_INFO));
      }
   }
}
