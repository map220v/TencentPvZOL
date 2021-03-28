package com.qq.modules.quest
{
   import com.qq.data.DataCacheManager;
   import com.qq.modules.quest.model.templates.ce.DailyActInfoTemplateCE;
   import com.qq.modules.quest.model.templates.ce.DailyQuestInfoTemplateCE;
   import com.qq.modules.quest.model.templates.ce.QuestInfoTemplateCE;
   import com.qq.utils.db.ClientDBTableName;
   
   public class QuestDataFactory
   {
      
      private static var _instace:QuestDataFactory;
       
      
      private var questInfoCache:Vector.<QuestInfoTemplateCE>;
      
      private var dailyQuestInfoCache:Vector.<DailyQuestInfoTemplateCE>;
      
      private var dailyActInfoCache:Vector.<DailyActInfoTemplateCE>;
      
      public function QuestDataFactory()
      {
         super();
      }
      
      public static function getInstance() : QuestDataFactory
      {
         if(_instace == null)
         {
            _instace = new QuestDataFactory();
         }
         return _instace;
      }
      
      public function getDailyActInfoByID(param1:int) : DailyActInfoTemplateCE
      {
         var _loc2_:int = 0;
         var _loc4_:DailyActInfoTemplateCE = null;
         if(this.dailyActInfoCache == null)
         {
            this.dailyActInfoCache = Vector.<DailyActInfoTemplateCE>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.Table_DailyActInfo,DailyActInfoTemplateCE));
         }
         var _loc3_:int = this.dailyActInfoCache.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if((_loc4_ = this.dailyActInfoCache[_loc2_]).id == param1)
            {
               return _loc4_;
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getDailyQuestList() : Vector.<DailyQuestInfoTemplateCE>
      {
         if(this.dailyQuestInfoCache == null)
         {
            this.dailyQuestInfoCache = Vector.<DailyQuestInfoTemplateCE>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.Table_DailyQuestInfo,DailyQuestInfoTemplateCE));
         }
         return this.dailyQuestInfoCache;
      }
      
      public function getDailyQuestDataByID(param1:int) : DailyQuestInfoTemplateCE
      {
         var _loc2_:int = 0;
         var _loc4_:DailyQuestInfoTemplateCE = null;
         if(this.dailyQuestInfoCache == null)
         {
            this.dailyQuestInfoCache = Vector.<DailyQuestInfoTemplateCE>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.Table_DailyQuestInfo,DailyQuestInfoTemplateCE));
         }
         var _loc3_:int = this.dailyQuestInfoCache.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if((_loc4_ = this.dailyQuestInfoCache[_loc2_]).id == param1)
            {
               return _loc4_;
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getQuestDataByID(param1:int) : QuestInfoTemplateCE
      {
         var _loc2_:int = 0;
         var _loc4_:QuestInfoTemplateCE = null;
         if(this.questInfoCache == null)
         {
            this.questInfoCache = Vector.<QuestInfoTemplateCE>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.Table_QuestInfo,QuestInfoTemplateCE));
         }
         var _loc3_:int = this.questInfoCache.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if((_loc4_ = this.questInfoCache[_loc2_]).id == param1)
            {
               return _loc4_;
            }
            _loc2_++;
         }
         return null;
      }
   }
}
