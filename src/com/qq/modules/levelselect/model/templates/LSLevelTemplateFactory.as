package com.qq.modules.levelselect.model.templates
{
   import com.qq.data.DataCacheManager;
   import com.qq.modules.td.model.templates.ce.DailyTDInfoTemplateCE;
   import com.qq.utils.db.ClientDBTableName;
   
   public class LSLevelTemplateFactory
   {
      
      private static var _instance:LSLevelTemplateFactory;
       
      
      private var dailyTDcache:Vector.<DailyTDInfoTemplateCE>;
      
      private var cache:Vector.<LSLevelTemplate>;
      
      public function LSLevelTemplateFactory()
      {
         super();
      }
      
      public static function get instance() : LSLevelTemplateFactory
      {
         if(_instance == null)
         {
            _instance = new LSLevelTemplateFactory();
         }
         return _instance;
      }
      
      public function getDailyTDInfo(param1:int) : DailyTDInfoTemplateCE
      {
         var _loc2_:DailyTDInfoTemplateCE = null;
         var _loc3_:int = 0;
         if(this.dailyTDcache == null)
         {
            this.dailyTDcache = Vector.<DailyTDInfoTemplateCE>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.Table_DailyTDInfo,DailyTDInfoTemplateCE));
         }
         var _loc4_:int = this.dailyTDcache.length;
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc2_ = this.dailyTDcache[_loc3_];
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
            _loc3_++;
         }
         return null;
      }
      
      public function getTemplateByStageIdAndLevelId(param1:int, param2:int, param3:int = 1) : LSLevelTemplate
      {
         var _loc4_:LSLevelTemplate = null;
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
      
      public function getTemplateByChallengeId(param1:int, param2:int, param3:int = 1, param4:int = 1) : LSLevelTemplate
      {
         var _loc5_:LSLevelTemplate = null;
         var _loc6_:int = 0;
         this.build();
         var _loc7_:int = this.cache.length;
         _loc6_ = 0;
         while(_loc6_ < _loc7_)
         {
            if((_loc5_ = this.cache[_loc6_]).stageId == param1 && _loc5_.levelId == param2 && _loc5_.subLevelId == param3 && _loc5_.challengeLevelId == param4)
            {
               return _loc5_;
            }
            _loc6_++;
         }
         return null;
      }
      
      public function getMaxChallengeStageId() : int
      {
         var _loc1_:LSLevelTemplate = null;
         var _loc2_:int = 0;
         this.build();
         var _loc3_:int = this.cache.length;
         var _loc4_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc1_ = this.cache[_loc2_];
            if(_loc1_.challengeLevelId > 0 && _loc1_.stageId > _loc4_)
            {
               _loc4_ = _loc1_.stageId;
            }
            _loc2_++;
         }
         return _loc4_;
      }
      
      public function getStageTotalLevelByStageId(param1:int) : uint
      {
         var _loc2_:LSLevelTemplate = null;
         var _loc3_:int = 0;
         this.build();
         var _loc4_:int = this.cache.length;
         var _loc5_:uint = 0;
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc2_ = this.cache[_loc3_];
            if(_loc2_.stageId == param1)
            {
               _loc5_ = Math.max(_loc2_.levelId,_loc5_);
            }
            _loc3_++;
         }
         return _loc5_;
      }
      
      public function getTemplatesByStageId(param1:int) : Vector.<LSLevelTemplate>
      {
         var _loc2_:LSLevelTemplate = null;
         var _loc3_:int = 0;
         this.build();
         var _loc4_:int = this.cache.length;
         var _loc5_:Vector.<LSLevelTemplate> = new Vector.<LSLevelTemplate>();
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
            this.cache = Vector.<LSLevelTemplate>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.Table_TDLevelSelectInfo,LSLevelTemplate));
         }
      }
   }
}
