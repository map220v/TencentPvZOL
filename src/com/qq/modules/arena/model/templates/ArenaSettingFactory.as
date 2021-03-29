package com.qq.modules.arena.model.templates
{
   import com.qq.data.DataCacheManager;
   import com.qq.utils.db.ClientDBTableName;
   
   public class ArenaSettingFactory
   {
      
      private static var _instance:ArenaSettingFactory;
       
      
      private var _winLevelSettings:Vector.<ArenaWinLevelSetting>;
      
      private var _groupSettings:Vector.<ArenaGroupSetting>;
      
      public function ArenaSettingFactory()
      {
         super();
      }
      
      public static function get instance() : ArenaSettingFactory
      {
         if(_instance == null)
         {
            _instance = new ArenaSettingFactory();
         }
         return _instance;
      }
      
      private function build() : void
      {
         if(this._winLevelSettings == null)
         {
            this._winLevelSettings = Vector.<ArenaWinLevelSetting>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.ArenaWinLevelSetting,ArenaWinLevelSetting));
         }
         if(this._groupSettings == null)
         {
            this._groupSettings = Vector.<ArenaGroupSetting>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.ArenaGroupSetting,ArenaGroupSetting));
         }
      }
      
      public function getWinLevelSettingById(param1:uint) : ArenaWinLevelSetting
      {
         this.build();
         var _loc2_:int = this._winLevelSettings.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this._winLevelSettings[_loc3_].id == param1)
            {
               return this._winLevelSettings[_loc3_];
            }
            _loc3_++;
         }
         return null;
      }
      
      public function getGroupSettingById(param1:uint) : ArenaGroupSetting
      {
         this.build();
         var _loc2_:int = this._groupSettings.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this._groupSettings[_loc3_].id == param1)
            {
               return this._groupSettings[_loc3_];
            }
            _loc3_++;
         }
         return null;
      }
      
      public function getAllGroupSetting() : Vector.<ArenaGroupSetting>
      {
         return this._groupSettings;
      }
   }
}
