package com.qq.modules.main.model.templates
{
   import com.qq.data.DataCacheManager;
   import com.qq.utils.db.ClientDBTableName;
   
   public class ExitGameTipsFactory
   {
      
      private static var _instance:ExitGameTipsFactory;
       
      
      private var _allTips:Vector.<ExitGameTipsTemplate>;
      
      public function ExitGameTipsFactory()
      {
         super();
         this._allTips = Vector.<ExitGameTipsTemplate>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_EXIT_TIPS,ExitGameTipsTemplate));
         this._allTips.sort(this.sortFunc);
      }
      
      public static function get instance() : ExitGameTipsFactory
      {
         if(!_instance)
         {
            _instance = new ExitGameTipsFactory();
         }
         return _instance;
      }
      
      private function sortFunc(param1:ExitGameTipsTemplate, param2:ExitGameTipsTemplate) : int
      {
         if(param1.order > param2.order)
         {
            return 1;
         }
         if(param1.order < param2.order)
         {
            return -1;
         }
         return 0;
      }
      
      public function get allTips() : Vector.<ExitGameTipsTemplate>
      {
         return this._allTips;
      }
   }
}
