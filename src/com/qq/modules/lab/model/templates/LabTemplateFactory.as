package com.qq.modules.lab.model.templates
{
   import com.qq.data.DataCacheManager;
   import com.qq.utils.db.ClientDBTableName;
   
   public class LabTemplateFactory
   {
      
      private static var _instance:LabTemplateFactory;
       
      
      private var _cacheLabTemplate:Vector.<LabTemplate>;
      
      public function LabTemplateFactory()
      {
         super();
      }
      
      public static function get instance() : LabTemplateFactory
      {
         if(_instance == null)
         {
            _instance = new LabTemplateFactory();
         }
         return _instance;
      }
      
      public function getLabTemplate(param1:int, param2:int) : LabTemplate
      {
         var _loc3_:int = 0;
         this.build();
         var _loc4_:int = this._cacheLabTemplate.length;
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            if(this._cacheLabTemplate[_loc3_].bottleId == param1 && this._cacheLabTemplate[_loc3_].level == param2)
            {
               return this._cacheLabTemplate[_loc3_];
            }
            _loc3_++;
         }
         return null;
      }
      
      private function build() : void
      {
         if(this._cacheLabTemplate == null)
         {
            this._cacheLabTemplate = Vector.<LabTemplate>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.LabTemplate,LabTemplate));
         }
      }
   }
}
