package com.qq.modules.levelselect.model.templates
{
   import com.qq.data.DataCacheManager;
   import com.qq.modules.levelselect.model.templates.ce.LSStageSoundInfoCE;
   import com.qq.utils.db.ClientDBTableName;
   
   public class LSDataFactory
   {
      
      private static var _instance:LSDataFactory;
       
      
      private var cache:Vector.<LSStageSoundInfoCE>;
      
      public function LSDataFactory()
      {
         super();
      }
      
      public static function get instance() : LSDataFactory
      {
         if(_instance == null)
         {
            _instance = new LSDataFactory();
         }
         return _instance;
      }
      
      public function getStageSoundInfoByStageID(param1:int) : LSStageSoundInfoCE
      {
         var _loc2_:LSStageSoundInfoCE = null;
         var _loc3_:int = 0;
         if(this.cache == null)
         {
            this.cache = Vector.<LSStageSoundInfoCE>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.LSStageSound,LSStageSoundInfoCE));
         }
         var _loc4_:int = this.cache.length;
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc2_ = this.cache[_loc3_];
            if(_loc2_.stageID == param1)
            {
               return _loc2_;
            }
            _loc3_++;
         }
         return null;
      }
   }
}
