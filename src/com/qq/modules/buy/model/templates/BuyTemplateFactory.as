package com.qq.modules.buy.model.templates
{
   import com.qq.data.DataCacheManager;
   import com.qq.utils.db.ClientDBTableName;
   
   public class BuyTemplateFactory
   {
      
      private static var _instance:BuyTemplateFactory;
       
      
      private var _buyMallTemplates:Vector.<BuyMallTemplate>;
      
      public function BuyTemplateFactory()
      {
         super();
      }
      
      public static function get instance() : BuyTemplateFactory
      {
         if(_instance == null)
         {
            _instance = new BuyTemplateFactory();
         }
         return _instance;
      }
      
      public function getBuyTemplateById(param1:int) : BuyMallTemplate
      {
         var _loc2_:BuyMallTemplate = null;
         this.build();
         for each(_loc2_ in this._buyMallTemplates)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function build() : void
      {
         if(this._buyMallTemplates == null)
         {
            this._buyMallTemplates = Vector.<BuyMallTemplate>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.BuyMallTemplate,BuyMallTemplate));
         }
      }
   }
}
