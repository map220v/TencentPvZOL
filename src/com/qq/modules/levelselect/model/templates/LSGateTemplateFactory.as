package com.qq.modules.levelselect.model.templates
{
   import com.qq.data.DataCacheManager;
   import com.qq.utils.db.ClientDBTableName;
   
   public class LSGateTemplateFactory
   {
      
      private static var _instance:LSGateTemplateFactory;
       
      
      private var cache:Vector.<LSGateTemplate>;
      
      public function LSGateTemplateFactory()
      {
         super();
      }
      
      public static function get instance() : LSGateTemplateFactory
      {
         if(_instance == null)
         {
            _instance = new LSGateTemplateFactory();
         }
         return _instance;
      }
      
      public function getTemplateByStageIdAndLevelId(param1:int, param2:int, param3:int = 1) : LSGateTemplate
      {
         var _loc4_:LSGateTemplate = null;
         var _loc5_:int = 0;
         this.build();
         var _loc6_:int = this.cache.length;
         _loc5_ = 0;
         while(_loc5_ < _loc6_)
         {
            if((_loc4_ = this.cache[_loc5_]).stageId == param1 && _loc4_.levelId == param2 && _loc4_.subLevelId == param3)
            {
               return _loc4_;
            }
            _loc5_++;
         }
         return null;
      }
      
      public function getTemplatesByStageId(param1:int) : Vector.<LSGateTemplate>
      {
         var _loc2_:LSGateTemplate = null;
         var _loc3_:int = 0;
         this.build();
         var _loc4_:int = this.cache.length;
         var _loc5_:Vector.<LSGateTemplate> = new Vector.<LSGateTemplate>();
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc2_ = this.cache[_loc3_];
            if(_loc2_.stageId == param1)
            {
               _loc5_.push(_loc2_);
            }
            _loc3_++;
         }
         return _loc5_;
      }
      
      private function build() : void
      {
         if(this.cache == null)
         {
            this.cache = Vector.<LSGateTemplate>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.Table_TDLevelGateInfo,LSGateTemplate));
         }
      }
   }
}
