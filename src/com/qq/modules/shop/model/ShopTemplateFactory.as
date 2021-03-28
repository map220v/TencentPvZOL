package com.qq.modules.shop.model
{
   import com.qq.data.DataCacheManager;
   import com.qq.modules.shop.model.templates.ce.ShopItemTemplateCE;
   import com.qq.modules.shop.model.templates.ce.ShortcutPayTemplateCE;
   import com.qq.utils.db.ClientDBTableName;
   
   public class ShopTemplateFactory
   {
      
      private static var _instance:ShopTemplateFactory;
       
      
      private var _items:Array;
      
      private var _shortcuts:Array;
      
      public function ShopTemplateFactory()
      {
         super();
         this._items = DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.MallItemTemplateTable,ShopItemTemplateCE);
         this._shortcuts = DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.Table_SHORTCUT_PAY,ShortcutPayTemplateCE);
      }
      
      public static function get instance() : ShopTemplateFactory
      {
         if(!_instance)
         {
            _instance = new ShopTemplateFactory();
         }
         return _instance;
      }
      
      public function hasItemInMall(param1:uint) : Boolean
      {
         var _loc2_:ShopItemTemplateCE = this.getMallItemTemplateByItemID(param1);
         return _loc2_ != null;
      }
      
      public function getMallItemTemplateByItemID(param1:uint) : ShopItemTemplateCE
      {
         var _loc2_:ShopItemTemplateCE = null;
         for each(_loc2_ in this._items)
         {
            if(_loc2_.itemID == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getMallItemPriceByItemID(param1:uint) : int
      {
         var _loc2_:ShopItemTemplateCE = null;
         for each(_loc2_ in this._items)
         {
            if(_loc2_.itemID == param1)
            {
               return _loc2_.price;
            }
         }
         return 0;
      }
      
      public function getMallItemTemplateByShopID(param1:uint) : ShopItemTemplateCE
      {
         var _loc2_:ShopItemTemplateCE = null;
         for each(_loc2_ in this._items)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getMallItemsByType(param1:uint) : Vector.<ShopItemTemplateCE>
      {
         var _loc3_:ShopItemTemplateCE = null;
         var _loc2_:Vector.<ShopItemTemplateCE> = new Vector.<ShopItemTemplateCE>();
         for each(_loc3_ in this._items)
         {
            if(_loc3_.pageType == param1)
            {
               _loc2_.push(_loc3_);
            }
         }
         return _loc2_;
      }
      
      public function getHotMallItems() : Vector.<ShopItemTemplateCE>
      {
         var _loc2_:ShopItemTemplateCE = null;
         var _loc1_:Vector.<ShopItemTemplateCE> = new Vector.<ShopItemTemplateCE>();
         for each(_loc2_ in this._items)
         {
            if(_loc2_.flag != 0)
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public function get shortcuts() : Array
      {
         return this._shortcuts;
      }
   }
}
