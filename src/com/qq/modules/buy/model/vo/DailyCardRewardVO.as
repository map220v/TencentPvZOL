package com.qq.modules.buy.model.vo
{
   import PVZ.Cmd.DtoPayShopGiftTicket;
   import com.qq.utils.DateUtils;
   
   public class DailyCardRewardVO
   {
       
      
      private var m_id:uint;
      
      private var m_remainTimes:uint;
      
      private var m_lastGetTime:uint;
      
      private var m_diamondCount:uint;
      
      public function DailyCardRewardVO()
      {
         super();
      }
      
      public function get id() : uint
      {
         return this.m_id;
      }
      
      public function get remainTimes() : uint
      {
         return this.m_remainTimes;
      }
      
      public function get lastGetTime() : uint
      {
         return this.m_lastGetTime;
      }
      
      public function get diamondCount() : uint
      {
         return this.m_diamondCount;
      }
      
      public function parseFromDto(param1:DtoPayShopGiftTicket) : void
      {
         this.m_id = param1.goodsId;
         this.m_remainTimes = param1.remainTimes;
         this.m_lastGetTime = param1.lastGetTime;
         this.m_diamondCount = param1.ticketNum;
      }
      
      public function get canGet() : Boolean
      {
         var _loc3_:Date = null;
         var _loc4_:Date = null;
         var _loc1_:Number = DateUtils.getInstance().getServerTime();
         var _loc2_:Number = _loc1_ - this.m_lastGetTime;
         if(_loc2_ > 24 * 3660)
         {
            return true;
         }
         _loc3_ = new Date();
         _loc3_.time = _loc1_ * 1000;
         (_loc4_ = new Date()).time = this.m_lastGetTime * 1000 + 24 * 3600 * 1000;
         _loc4_.hours = _loc4_.minutes = _loc4_.seconds = _loc4_.milliseconds = 0;
         _loc2_ = (_loc3_.time - _loc4_.time) / 1000;
         return _loc2_ > 0;
      }
   }
}
