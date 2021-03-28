package com.qq.modules.buffActivity.model.buff
{
   import PVZ.Cmd.Dto_IdNum;
   
   public class BuffBuyPhysical
   {
       
      
      private var m_vecPrices:Vector.<int>;
      
      public var availableTimes:int;
      
      public var ignoreVip:Boolean;
      
      public function BuffBuyPhysical()
      {
         super();
         this.m_vecPrices = new Vector.<int>();
      }
      
      public function set prices(param1:Array) : void
      {
         var _loc2_:Dto_IdNum = null;
         var _loc3_:int = 0;
         if(param1)
         {
            this.m_vecPrices.length = param1.length;
            _loc3_ = 0;
            while(_loc3_ < param1.length)
            {
               _loc2_ = param1[_loc3_];
               this.m_vecPrices[_loc3_] = _loc2_.num;
               _loc3_++;
            }
         }
         else
         {
            this.m_vecPrices.length = 0;
         }
      }
      
      public function getPrice(param1:int) : int
      {
         if(param1 >= 0 && param1 < this.m_vecPrices.length)
         {
            return this.m_vecPrices[param1];
         }
         return 0;
      }
   }
}
