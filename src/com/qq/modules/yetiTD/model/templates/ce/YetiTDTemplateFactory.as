package com.qq.modules.yetiTD.model.templates.ce
{
   import com.qq.data.DataCacheManager;
   import com.qq.utils.db.ClientDBTableName;
   
   public class YetiTDTemplateFactory
   {
      
      private static var _instance:YetiTDTemplateFactory;
       
      
      private var cacheYetiTDModeTemplate:Vector.<YetiTDModeTemplate>;
      
      private var cacheYetiTDMapTemplate:Vector.<YetiTDMapTemplateCE>;
      
      public function YetiTDTemplateFactory()
      {
         super();
      }
      
      public static function get instance() : YetiTDTemplateFactory
      {
         if(_instance == null)
         {
            _instance = new YetiTDTemplateFactory();
         }
         return _instance;
      }
      
      public function getModeTemplate(param1:int) : YetiTDModeTemplate
      {
         var _loc2_:YetiTDModeTemplate = null;
         this.build();
         for each(_loc2_ in this.cacheYetiTDModeTemplate)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getMapTemplate(param1:int) : YetiTDMapTemplateCE
      {
         var _loc2_:YetiTDMapTemplateCE = null;
         this.build();
         for each(_loc2_ in this.cacheYetiTDMapTemplate)
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
         if(this.cacheYetiTDModeTemplate == null)
         {
            this.cacheYetiTDModeTemplate = Vector.<YetiTDModeTemplate>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_YETI_TD_MODE,YetiTDModeTemplate));
         }
         if(this.cacheYetiTDMapTemplate == null)
         {
            this.cacheYetiTDMapTemplate = Vector.<YetiTDMapTemplateCE>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_YETI_TD_MAP,YetiTDMapTemplateCE));
         }
      }
   }
}
