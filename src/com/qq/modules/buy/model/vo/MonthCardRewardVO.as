package com.qq.modules.buy.model.vo
{
   import PVZ.Cmd.DtoPayShopDayTicket;
   import com.qq.constant.ItemID;
   import com.qq.modules.bag.model.vo.ItemVO;
   import com.qq.utils.DateUtils;
   
   public class MonthCardRewardVO
   {
       
      
      private var dto:DtoPayShopDayTicket;
      
      public function MonthCardRewardVO(param1:DtoPayShopDayTicket = null)
      {
         super();
         if(param1)
         {
            this.load(param1);
         }
      }
      
      public function load(param1:DtoPayShopDayTicket) : void
      {
         this.dto = param1;
      }
      
      public function get goodsId() : uint
      {
         return this.dto.goodsId;
      }
      
      public function get canGet() : Boolean
      {
         var _loc1_:int = DateUtils.getInstance().getServerTime();
         var _loc2_:int = _loc1_ - this.dto.lastGetTime;
         if(_loc2_ > 24 * 3600)
         {
            return true;
         }
         var _loc3_:Date = new Date();
         _loc3_.time = _loc1_ * 1000;
         var _loc4_:Date;
         (_loc4_ = new Date()).time = this.dto.lastGetTime * 1000 + 24 * 3600 * 1000;
         _loc4_.hours = _loc4_.minutes = _loc4_.seconds = _loc4_.milliseconds = 0;
         _loc2_ = (_loc3_.time - _loc4_.time) / 1000;
         return _loc2_ > 0;
      }
      
      public function getItem() : ItemVO
      {
         return new ItemVO(ItemID.GiftDiamond2,this.dto.ticketNum);
      }
      
      public function getValidateLeftDays() : int
      {
         var _loc1_:int = this.dto.endTime - DateUtils.getInstance().getServerTime();
         return int(Math.ceil(_loc1_ / 3600 / 24));
      }
   }
}
