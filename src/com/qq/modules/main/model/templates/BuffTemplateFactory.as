package com.qq.modules.main.model.templates
{
   import com.qq.data.DataCacheManager;
   import com.qq.utils.db.ClientDBTableName;
   
   public class BuffTemplateFactory
   {
      
      private static var _instance:BuffTemplateFactory;
       
      
      private var _cacheBuffItemTemplate:Vector.<BuffTemplate>;
      
      public function BuffTemplateFactory()
      {
         super();
      }
      
      public static function get instance() : BuffTemplateFactory
      {
         if(_instance == null)
         {
            _instance = new BuffTemplateFactory();
         }
         return _instance;
      }
      
      public function getBuffTemplate(param1:int) : BuffTemplate
      {
         var _loc2_:int = 0;
         this.build();
         var _loc3_:int = this._cacheBuffItemTemplate.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if(this._cacheBuffItemTemplate[_loc2_].id == param1)
            {
               return this._cacheBuffItemTemplate[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      private function build() : void
      {
         if(this._cacheBuffItemTemplate == null)
         {
            this._cacheBuffItemTemplate = Vector.<BuffTemplate>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.Table_Buff,BuffTemplate));
         }
      }
   }
}
