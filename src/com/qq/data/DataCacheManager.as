package com.qq.data
{
   import com.qq.utils.db.ClientDB;
   import com.qq.utils.db.ClientDBTableName;
   
   public class DataCacheManager
   {
      
      private static var _instance:DataCacheManager;
      
      public static const CacheData_TDZombieStaticInfo:int = 0;
       
      
      private var _allCaches:Array;
      
      private var _rules:Array;
      
      public function DataCacheManager()
      {
         super();
         this._allCaches = [];
         this.initRules();
      }
      
      public static function getInstance() : DataCacheManager
      {
         if(_instance == null)
         {
            _instance = new DataCacheManager();
         }
         return _instance;
      }
      
      private function initRules() : void
      {
         this._rules = new Array();
      }
      
      private function addRule(param1:String, param2:Class) : void
      {
         this._rules[param1] = param2;
      }
      
      public function getTemplateMapData(param1:String, param2:Class) : Array
      {
         var _loc7_:Object = null;
         var _loc3_:Array = this.getTemplateCacheData(param1,param2);
         var _loc4_:Array = new Array();
         var _loc5_:int = _loc3_.length;
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc7_ = _loc3_[_loc6_];
            _loc4_[_loc7_.id] = _loc7_;
            _loc6_++;
         }
         return _loc4_;
      }
      
      public function getTemplateCacheData(param1:String, param2:Class, param3:Boolean = true) : *
      {
         var _loc6_:int = 0;
         var _loc8_:Object = null;
         if(param1 == ClientDBTableName.Table_ZombieInfo || param1 == ClientDBTableName.Table_PlantTalentInfo || param1 == ClientDBTableName.Table_PlantInfo || param1 == ClientDBTableName.Table_ObjectInfo || param1 == ClientDBTableName.Table_BulletInfo || param1 == ClientDBTableName.Table_ErrorInfo || param1 == ClientDBTableName.Table_PlantTypeInfo)
         {
            param3 = false;
         }
         var _loc5_:Array;
         var _loc4_:ClientDB;
         if((_loc5_ = (_loc4_ = ClientDB.getInstance()).readAll(param1)) == null)
         {
            _loc5_ = [];
         }
         var _loc7_:int = _loc5_.length;
         while(_loc6_ < _loc7_)
         {
            (_loc8_ = new param2()).load(_loc5_[_loc6_]);
            _loc5_[_loc6_] = _loc8_;
            _loc6_++;
         }
         if(param3)
         {
            ClientDB.getInstance().deleteDB(param1);
         }
         return _loc5_;
      }
      
      public function getTemplateDataById(param1:String, param2:int, param3:Class) : *
      {
         var _loc6_:int = 0;
         var _loc8_:Object = null;
         var _loc5_:Array;
         var _loc4_:ClientDB;
         var _loc7_:int = (_loc5_ = (_loc4_ = ClientDB.getInstance()).readAll(param1)).length;
         while(_loc6_ < _loc7_)
         {
            if(_loc5_[_loc6_].id == param2)
            {
               (_loc8_ = new param3()).load(_loc5_[_loc6_]);
               return _loc8_;
            }
            _loc6_++;
         }
         return null;
      }
      
      public function removeCacheData(param1:String) : void
      {
         delete this._allCaches[param1];
      }
   }
}
