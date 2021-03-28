package com.qq.modules.luckystar.model.templates
{
   import com.qq.data.DataCacheManager;
   import com.qq.utils.db.ClientDBTableName;
   
   public class LuckyStarTemplateFactory
   {
      
      private static var _instance:LuckyStarTemplateFactory;
       
      
      private var luckyStarItemsTemplates:Vector.<LuckyStarItemsTemplate>;
      
      private var luckyStarDayBuyTemplates:Vector.<LuckyStarDayBuyTemplate>;
      
      public function LuckyStarTemplateFactory()
      {
         super();
      }
      
      public static function get instance() : LuckyStarTemplateFactory
      {
         if(_instance == null)
         {
            _instance = new LuckyStarTemplateFactory();
         }
         return _instance;
      }
      
      public function getLuckyStarItemsTemplate(param1:int, param2:int) : LuckyStarItemsTemplate
      {
         var _loc3_:LuckyStarItemsTemplate = null;
         var _loc4_:LuckyStarItemsTemplate = null;
         this.build();
         for each(_loc4_ in this.luckyStarItemsTemplates)
         {
            if(_loc4_.id1 == param1 && _loc4_.id2 == param2)
            {
               return _loc4_;
            }
         }
         return null;
      }
      
      public function getLuckyStarDayBuyTemplate(param1:int, param2:int) : LuckyStarDayBuyTemplate
      {
         var _loc3_:LuckyStarDayBuyTemplate = null;
         var _loc4_:LuckyStarDayBuyTemplate = null;
         this.build();
         for each(_loc4_ in this.luckyStarDayBuyTemplates)
         {
            if(_loc4_.id1 == param1 && _loc4_.id2 == param2)
            {
               return _loc4_;
            }
         }
         return null;
      }
      
      private function build() : void
      {
         if(this.luckyStarItemsTemplates == null)
         {
            this.luckyStarItemsTemplates = Vector.<LuckyStarItemsTemplate>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.LuckyStarItemsTemplate,LuckyStarItemsTemplate));
         }
         if(this.luckyStarDayBuyTemplates == null)
         {
            this.luckyStarDayBuyTemplates = Vector.<LuckyStarDayBuyTemplate>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.LuckyStarDayBuyTemplate,LuckyStarDayBuyTemplate));
         }
      }
   }
}
