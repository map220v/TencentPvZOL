package com.qq.modules.actPennyShop.model
{
   import PVZ.Cmd.Dto_ExchangeItem;
   
   public class ActPennyShopModel
   {
       
      
      public var list:Array;
      
      public function ActPennyShopModel()
      {
         super();
         this.list = new Array();
      }
      
      public function updateExchangeInfo(param1:int, param2:int) : void
      {
         if(this.list == null || param1 >= this.list.length)
         {
            return;
         }
         var _loc3_:Dto_ExchangeItem = this.list[param1];
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.times = param2;
      }
   }
}
