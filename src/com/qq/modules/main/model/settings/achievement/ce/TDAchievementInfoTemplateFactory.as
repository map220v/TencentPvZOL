package com.qq.modules.main.model.settings.achievement.ce
{
   import com.qq.data.DataCacheManager;
   import com.qq.utils.db.ClientDBTableName;
   
   public class TDAchievementInfoTemplateFactory
   {
      
      private static var _instance:TDAchievementInfoTemplateFactory;
       
      
      public var cache:Vector.<TDAchievementInfoTemplate>;
      
      public function TDAchievementInfoTemplateFactory()
      {
         super();
         this.build();
      }
      
      public static function get instance() : TDAchievementInfoTemplateFactory
      {
         if(_instance == null)
         {
            _instance = new TDAchievementInfoTemplateFactory();
         }
         return _instance;
      }
      
      public function getTemplateById(param1:int) : TDAchievementInfoTemplate
      {
         var _loc2_:TDAchievementInfoTemplate = null;
         var _loc3_:int = 0;
         this.build();
         var _loc4_:int = this.cache.length;
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc2_ = this.cache[_loc3_];
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
            _loc3_++;
         }
         return null;
      }
      
      private function build() : void
      {
         if(this.cache == null)
         {
            this.cache = Vector.<TDAchievementInfoTemplate>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.Table_AchievementInfo,TDAchievementInfoTemplate));
         }
      }
   }
}
