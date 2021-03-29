package com.qq.modules.levelselect.model.templates
{
   import com.qq.data.DataCacheManager;
   import com.qq.modules.levelselect.model.templates.ce.LSChallengePromoteBonusTemplateCE;
   import com.qq.modules.levelselect.model.templates.ce.LSChallengeRankBonusTemplateCE;
   import com.qq.modules.levelselect.model.templates.ce.LSChallengeScoreBonusTemplateCE;
   import com.qq.modules.td.model.templates.ce.TDChallengeAchiTemplateCE;
   import com.qq.utils.db.ClientDBTableName;
   
   public class LSChallengeFactory
   {
      
      private static var _instance:LSChallengeFactory;
       
      
      private var rankBonusCache:Vector.<LSChallengeRankBonusTemplateCE>;
      
      private var promoteBonusCache:Vector.<LSChallengePromoteBonusTemplateCE>;
      
      private var achiCache:Vector.<TDChallengeAchiTemplateCE>;
      
      private var scoreBonusCache:Vector.<LSChallengeScoreBonusTemplateCE>;
      
      public function LSChallengeFactory()
      {
         super();
      }
      
      public static function get instance() : LSChallengeFactory
      {
         if(_instance == null)
         {
            _instance = new LSChallengeFactory();
         }
         return _instance;
      }
      
      public function getRankBonusTemplateBySection(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int) : LSChallengeRankBonusTemplateCE
      {
         this.build();
         var _loc7_:int = 0;
         while(_loc7_ < this.rankBonusCache.length)
         {
            if(this.rankBonusCache[_loc7_].stageId == param1 && this.rankBonusCache[_loc7_].levelId == param2 && this.rankBonusCache[_loc7_].subLevelId == param3 && this.rankBonusCache[_loc7_].challengeLevelId == param4 && this.rankBonusCache[_loc7_].min <= param5 && this.rankBonusCache[_loc7_].max >= param6)
            {
               return this.rankBonusCache[_loc7_];
            }
            _loc7_++;
         }
         return null;
      }
      
      public function getRankBonusTemplateById(param1:int) : LSChallengeRankBonusTemplateCE
      {
         this.build();
         var _loc2_:int = 0;
         while(_loc2_ < this.rankBonusCache.length)
         {
            if(this.rankBonusCache[_loc2_].id == param1)
            {
               return this.rankBonusCache[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getPromoteBonusTemplateBySection(param1:int, param2:int) : LSChallengePromoteBonusTemplateCE
      {
         this.build();
         var _loc3_:int = 0;
         while(_loc3_ < this.promoteBonusCache.length)
         {
            if(this.promoteBonusCache[_loc3_].min <= param1 && this.promoteBonusCache[_loc3_].max >= param2)
            {
               return this.promoteBonusCache[_loc3_];
            }
            _loc3_++;
         }
         return null;
      }
      
      public function getAchiById(param1:int) : TDChallengeAchiTemplateCE
      {
         var _loc2_:TDChallengeAchiTemplateCE = null;
         this.build();
         for each(_loc2_ in this.achiCache)
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
         if(this.rankBonusCache == null)
         {
            this.rankBonusCache = Vector.<LSChallengeRankBonusTemplateCE>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_CHALLENGE_RANK_BONUS,LSChallengeRankBonusTemplateCE));
         }
         if(this.promoteBonusCache == null)
         {
            this.promoteBonusCache = Vector.<LSChallengePromoteBonusTemplateCE>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_CHALLENGE_PROMOTE_BONUS,LSChallengePromoteBonusTemplateCE));
         }
         if(this.achiCache == null)
         {
            this.achiCache = Vector.<TDChallengeAchiTemplateCE>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_CHALLENGE_ACHI,TDChallengeAchiTemplateCE));
         }
         if(this.scoreBonusCache == null)
         {
            this.scoreBonusCache = Vector.<LSChallengeScoreBonusTemplateCE>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_CHALLENGE_SCORE_BONUS,LSChallengeScoreBonusTemplateCE));
         }
      }
      
      public function getAllScoreBonus(param1:int, param2:int, param3:int, param4:int) : Vector.<LSChallengeScoreBonusTemplateCE>
      {
         var _loc6_:LSChallengeScoreBonusTemplateCE = null;
         this.build();
         var _loc5_:Vector.<LSChallengeScoreBonusTemplateCE> = new Vector.<LSChallengeScoreBonusTemplateCE>();
         for each(_loc6_ in this.scoreBonusCache)
         {
            if(_loc6_.stageID == param1 && _loc6_.levelID == param2 && _loc6_.challengeLevelID == param4 && _loc6_.subLevelID == param3)
            {
               _loc5_.push(_loc6_);
            }
         }
         return _loc5_;
      }
      
      public function getAllrankBonus(param1:int, param2:int, param3:int, param4:int) : Vector.<LSChallengeRankBonusTemplateCE>
      {
         this.build();
         var _loc5_:Vector.<LSChallengeRankBonusTemplateCE> = new Vector.<LSChallengeRankBonusTemplateCE>();
         var _loc6_:int = 0;
         while(_loc6_ < this.rankBonusCache.length)
         {
            if(this.rankBonusCache[_loc6_].stageId == param1 && this.rankBonusCache[_loc6_].levelId == param2 && this.rankBonusCache[_loc6_].subLevelId == param3 && this.rankBonusCache[_loc6_].challengeLevelId == param4)
            {
               _loc5_.push(this.rankBonusCache[_loc6_]);
            }
            _loc6_++;
         }
         return _loc5_;
      }
   }
}
