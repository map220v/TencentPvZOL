package com.qq.modules.buy.model
{
   import PVZ.Cmd.Cmd_PayShop_GetDayTicketList_SC;
   import PVZ.Cmd.Cmd_PayShop_GetDayTicket_SC;
   import PVZ.Cmd.Cmd_PayShop_GetGiftTicketList_SC;
   import PVZ.Cmd.Cmd_PayShop_GetGiftTicket_SC;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.buy.model.vo.DailyCardRewardVO;
   import com.qq.modules.buy.model.vo.MonthCardRewardVO;
   import com.qq.modules.buy.view.BuyGlobal;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class MonthCardProxy extends BasicProxy
   {
       
      
      public var rewards:Vector.<MonthCardRewardVO>;
      
      private var m_dailyRewards:Vector.<DailyCardRewardVO>;
      
      public function MonthCardProxy()
      {
         this.rewards = new Vector.<MonthCardRewardVO>();
         this.m_dailyRewards = new Vector.<DailyCardRewardVO>();
         super();
      }
      
      override public function listMsgInterests() : Array
      {
         return [[Cmd_PayShop_GetDayTicketList_SC.$MessageID,this.onCmd_PayShop_GetDayTicketList_SC],[Cmd_PayShop_GetDayTicket_SC.$MessageID,this.onCmd_PayShop_GetDayTicket_SC],[Cmd_PayShop_GetGiftTicketList_SC.$MessageID,this.onCmd_PayShop_GetGiftTicketList_SC],[Cmd_PayShop_GetGiftTicket_SC.$MessageID,this.onCmd_PayShop_GetGiftTicket_SC]];
      }
      
      public function get dailyRewards() : Vector.<DailyCardRewardVO>
      {
         return this.m_dailyRewards;
      }
      
      private function onCmd_PayShop_GetGiftTicket_SC(param1:SocketServiceEvent) : void
      {
      }
      
      private function onCmd_PayShop_GetGiftTicketList_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_PayShop_GetGiftTicketList_SC = null;
         var _loc4_:DailyCardRewardVO = null;
         _loc2_ = param1.socketData as Cmd_PayShop_GetGiftTicketList_SC;
         var _loc3_:int = _loc2_.giftTicket.length;
         this.m_dailyRewards.length = _loc3_;
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            if((_loc4_ = this.m_dailyRewards[_loc5_]) == null)
            {
               _loc4_ = new DailyCardRewardVO();
               this.m_dailyRewards[_loc5_] = _loc4_;
            }
            _loc4_.parseFromDto(_loc2_.giftTicket[_loc5_]);
            _loc5_++;
         }
         this.dispatch(new CommonEvent(BuyGlobal.DAILY_CARD_REWARD_LIST_UPDATE));
      }
      
      private function onCmd_PayShop_GetDayTicketList_SC(param1:SocketServiceEvent) : void
      {
         var _loc3_:int = 0;
         var _loc2_:Cmd_PayShop_GetDayTicketList_SC = param1.socketData as Cmd_PayShop_GetDayTicketList_SC;
         this.rewards.length = _loc2_.dayTicket.length;
         while(_loc3_ < this.rewards.length)
         {
            this.rewards[_loc3_] = new MonthCardRewardVO(_loc2_.dayTicket[_loc3_]);
            _loc3_++;
         }
         this.dispatch(new CommonEvent(BuyGlobal.MONTH_CARD_REWARD_LIST_UPDATED,this.rewards));
      }
      
      private function onCmd_PayShop_GetDayTicket_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_PayShop_GetDayTicket_SC = param1.socketData as Cmd_PayShop_GetDayTicket_SC;
      }
      
      public function getDailyCardRewardVOByGoodsID(param1:uint) : DailyCardRewardVO
      {
         var _loc2_:DailyCardRewardVO = null;
         for each(_loc2_ in this.m_dailyRewards)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getMonthCardRewardVOByGoodsId(param1:uint) : MonthCardRewardVO
      {
         var _loc2_:int = 0;
         var _loc3_:int = this.rewards.length;
         while(_loc2_ < _loc3_)
         {
            if(this.rewards[_loc2_].goodsId == param1)
            {
               return this.rewards[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
   }
}
