package com.qq.modules.dragonBoat.model.vo
{
   import PVZ.Cmd.Dto_DragonBoatExchange;
   import com.qq.modules.bag.model.vo.ItemVO;
   
   public class DragonBoatExchangeVO
   {
       
      
      private var m_exchangeID:uint;
      
      private var m_totalCount:uint;
      
      private var m_costScore:uint;
      
      private var m_exchangedCount:uint;
      
      private var m_vecItems:Vector.<ItemVO>;
      
      public function DragonBoatExchangeVO(param1:Dto_DragonBoatExchange)
      {
         var _loc2_:ItemVO = null;
         super();
         this.m_exchangeID = param1.exchangeid;
         this.m_totalCount = param1.exchangetimeslimit;
         this.m_costScore = param1.needcredit;
         this.m_exchangedCount = param1.exchangetimes;
         this.m_vecItems = new Vector.<ItemVO>();
         _loc2_ = new ItemVO(param1.item.id,param1.item.num);
         this.m_vecItems.push(_loc2_);
      }
      
      public function get items() : Vector.<ItemVO>
      {
         return this.m_vecItems;
      }
      
      public function get exchangeID() : uint
      {
         return this.m_exchangeID;
      }
      
      public function get costScore() : uint
      {
         return this.m_costScore;
      }
      
      public function get totalCount() : uint
      {
         return this.m_totalCount;
      }
      
      public function set exchangedCount(param1:uint) : void
      {
         this.m_exchangedCount = param1;
      }
      
      public function get exchangedCount() : uint
      {
         return this.m_exchangedCount;
      }
   }
}
