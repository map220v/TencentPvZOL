package com.qq.modules.buy.model.vo
{
   import PVZ.Cmd.DtoPayShopItem;
   import com.qq.modules.buy.model.templates.BuyMallTemplate;
   import com.qq.modules.buy.model.templates.BuyTemplateFactory;
   
   public class BuyMallItemVO
   {
       
      
      private var _template:BuyMallTemplate;
      
      private var dto:DtoPayShopItem;
      
      public function BuyMallItemVO(param1:DtoPayShopItem = null)
      {
         super();
         if(param1)
         {
            this.load(param1);
         }
      }
      
      public function load(param1:DtoPayShopItem) : void
      {
         this.dto = param1;
      }
      
      public function get canBuy() : Boolean
      {
         return this.dto.canBuy;
      }
      
      public function get goodsId() : int
      {
         return this.dto.goodsId;
      }
      
      public function get template() : BuyMallTemplate
      {
         if(!this._template)
         {
            this._template = BuyTemplateFactory.instance.getBuyTemplateById(this.dto.goodsId);
         }
         return this._template;
      }
   }
}
