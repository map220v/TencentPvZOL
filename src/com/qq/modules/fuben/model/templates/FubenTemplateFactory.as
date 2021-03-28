package com.qq.modules.fuben.model.templates
{
   import com.qq.data.DataCacheManager;
   import com.qq.modules.fuben.model.templates.ce.FubenChapterForUnionRankRewardTemplateCE;
   import com.qq.modules.fuben.model.templates.ce.FubenChapterForUnionTemplateCE;
   import com.qq.utils.db.ClientDBTableName;
   
   public class FubenTemplateFactory
   {
      
      private static var _instance:FubenTemplateFactory;
       
      
      private var cacheFubenTemplate:Vector.<FubenTemplate>;
      
      private var cacheFubenChapterTemplate:Vector.<FubenChapterTemplate>;
      
      private var cacheFubenBonusTemplate:Vector.<FubenBonusTemplate>;
      
      private var cacheFubenEnargysTemplate:Vector.<FubenEnargysTemplate>;
      
      private var cacheHDFubenTemplate:Vector.<HDFubenTemplate>;
      
      private var cacheFubenChapterForUnionTemplate:Vector.<FubenChapterForUnionTemplateCE>;
      
      private var cacheFubenChapterForUnionRankRewardTemplate:Vector.<FubenChapterForUnionRankRewardTemplateCE>;
      
      public function FubenTemplateFactory()
      {
         super();
      }
      
      public static function get instance() : FubenTemplateFactory
      {
         if(_instance == null)
         {
            _instance = new FubenTemplateFactory();
         }
         return _instance;
      }
      
      public function getFubenTemplateById(param1:int) : FubenTemplate
      {
         var _loc2_:int = 0;
         this.build();
         var _loc3_:int = this.cacheFubenTemplate.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if(this.cacheFubenTemplate[_loc2_].id == param1)
            {
               return this.cacheFubenTemplate[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getFubenTemplatesByChapterId(param1:int) : Vector.<FubenTemplate>
      {
         var _loc3_:int = 0;
         this.build();
         var _loc2_:Vector.<FubenTemplate> = new Vector.<FubenTemplate>();
         var _loc4_:int = this.cacheFubenTemplate.length;
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            if(this.cacheFubenTemplate[_loc3_].chapterId == param1)
            {
               _loc2_.push(this.cacheFubenTemplate[_loc3_]);
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function getFubenChapterTemplateById(param1:int) : FubenChapterTemplate
      {
         var _loc2_:int = 0;
         this.build();
         var _loc3_:int = this.cacheFubenChapterTemplate.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if(this.cacheFubenChapterTemplate[_loc2_].id == param1)
            {
               return this.cacheFubenChapterTemplate[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getFubenStageTemplateByChapterAndMode(param1:int, param2:int) : Vector.<FubenTemplate>
      {
         var _loc4_:int = 0;
         this.build();
         var _loc3_:Vector.<FubenTemplate> = new Vector.<FubenTemplate>();
         var _loc5_:int = this.cacheFubenTemplate.length;
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            if(this.cacheFubenTemplate[_loc4_].chapterId == param1 && this.cacheFubenTemplate[_loc4_].mode == param2)
            {
               _loc3_.push(this.cacheFubenTemplate[_loc4_]);
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function getAllFubenChapterTemplates() : Vector.<FubenChapterTemplate>
      {
         this.build();
         return this.cacheFubenChapterTemplate;
      }
      
      public function getFubenBonusTemplateByChapterId(param1:int, param2:int) : FubenBonusTemplate
      {
         var _loc3_:int = 0;
         this.build();
         var _loc4_:int = this.cacheFubenBonusTemplate.length;
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            if(this.cacheFubenBonusTemplate[_loc3_].id == param1 && this.cacheFubenBonusTemplate[_loc3_].mode == param2)
            {
               return this.cacheFubenBonusTemplate[_loc3_];
            }
            _loc3_++;
         }
         return null;
      }
      
      public function getFubenEnargysTemplateByBuyNum(param1:int) : FubenEnargysTemplate
      {
         var _loc2_:int = 0;
         this.build();
         var _loc3_:int = this.cacheFubenEnargysTemplate.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if(this.cacheFubenEnargysTemplate[_loc2_].id == param1)
            {
               return this.cacheFubenEnargysTemplate[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getHDFubenTemplateById(param1:int) : HDFubenTemplate
      {
         var _loc2_:int = 0;
         this.build();
         var _loc3_:int = this.cacheHDFubenTemplate.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if(this.cacheHDFubenTemplate[_loc2_].id == param1)
            {
               return this.cacheHDFubenTemplate[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getFubenChapterForUnionWithId(param1:uint) : FubenChapterForUnionTemplateCE
      {
         var _loc2_:int = 0;
         this.build();
         var _loc3_:int = this.cacheFubenChapterForUnionTemplate.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if(this.cacheFubenChapterForUnionTemplate[_loc2_].id == param1)
            {
               return this.cacheFubenChapterForUnionTemplate[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getFubenChapterForUnionList() : Vector.<FubenChapterForUnionTemplateCE>
      {
         this.build();
         return this.cacheFubenChapterForUnionTemplate;
      }
      
      public function getMinChapterIDForUnionFuben() : int
      {
         var _loc1_:FubenChapterForUnionTemplateCE = null;
         this.build();
         if(this.cacheFubenChapterForUnionTemplate.length > 0)
         {
            _loc1_ = this.cacheFubenChapterForUnionTemplate[0];
            return _loc1_.id;
         }
         return 1;
      }
      
      public function getUnionFubenSingleRankRewardWithIdAndRank(param1:uint, param2:uint) : FubenChapterForUnionRankRewardTemplateCE
      {
         var _loc5_:int = 0;
         this.build();
         var _loc3_:FubenChapterForUnionTemplateCE = this.getFubenChapterForUnionWithId(param1);
         var _loc4_:int = parseInt(_loc3_.oneReward);
         var _loc6_:int = this.cacheFubenChapterForUnionRankRewardTemplate.length;
         _loc5_ = 0;
         while(_loc5_ < _loc6_)
         {
            if(this.cacheFubenChapterForUnionRankRewardTemplate[_loc5_].id == _loc4_)
            {
               if(this.cacheFubenChapterForUnionRankRewardTemplate[_loc5_].regionStart <= param2 && param2 <= this.cacheFubenChapterForUnionRankRewardTemplate[_loc5_].regionEnd)
               {
                  return this.cacheFubenChapterForUnionRankRewardTemplate[_loc5_];
               }
            }
            _loc5_++;
         }
         return null;
      }
      
      public function getUnionFubenTotalRankRewardWithIdAndRank(param1:uint, param2:uint) : FubenChapterForUnionRankRewardTemplateCE
      {
         var _loc5_:int = 0;
         this.build();
         var _loc3_:FubenChapterForUnionTemplateCE = this.getFubenChapterForUnionWithId(param1);
         var _loc4_:int = parseInt(_loc3_.totalReward);
         var _loc6_:int = this.cacheFubenChapterForUnionRankRewardTemplate.length;
         _loc5_ = 0;
         while(_loc5_ < _loc6_)
         {
            if(this.cacheFubenChapterForUnionRankRewardTemplate[_loc5_].id == _loc4_)
            {
               if(this.cacheFubenChapterForUnionRankRewardTemplate[_loc5_].regionStart <= param2 && param2 <= this.cacheFubenChapterForUnionRankRewardTemplate[_loc5_].regionEnd)
               {
                  return this.cacheFubenChapterForUnionRankRewardTemplate[_loc5_];
               }
            }
            _loc5_++;
         }
         return null;
      }
      
      private function build() : void
      {
         if(this.cacheFubenTemplate == null)
         {
            this.cacheFubenTemplate = Vector.<FubenTemplate>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.FubenTemplate,FubenTemplate));
         }
         if(this.cacheFubenChapterTemplate == null)
         {
            this.cacheFubenChapterTemplate = Vector.<FubenChapterTemplate>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.FubenChapterTemplate,FubenChapterTemplate));
         }
         if(this.cacheFubenBonusTemplate == null)
         {
            this.cacheFubenBonusTemplate = Vector.<FubenBonusTemplate>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.FubenBonusTemplate,FubenBonusTemplate));
         }
         if(this.cacheFubenEnargysTemplate == null)
         {
            this.cacheFubenEnargysTemplate = Vector.<FubenEnargysTemplate>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.FubenEnargysTemplate,FubenEnargysTemplate));
         }
         if(this.cacheHDFubenTemplate == null)
         {
            this.cacheHDFubenTemplate = Vector.<HDFubenTemplate>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.HDFubenTemplate,HDFubenTemplate));
         }
         if(this.cacheFubenChapterForUnionTemplate == null)
         {
            this.cacheFubenChapterForUnionTemplate = Vector.<FubenChapterForUnionTemplateCE>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.FubenChapterForUnionTemplate,FubenChapterForUnionTemplateCE));
         }
         if(this.cacheFubenChapterForUnionRankRewardTemplate == null)
         {
            this.cacheFubenChapterForUnionRankRewardTemplate = Vector.<FubenChapterForUnionRankRewardTemplateCE>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.FubenChapterForUnionRankRewardTemplate,FubenChapterForUnionRankRewardTemplateCE));
         }
      }
   }
}
