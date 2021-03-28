package com.qq.modules.qzoneShare.model.templates
{
   import com.qq.data.DataCacheManager;
   import com.qq.modules.qzoneShare.model.templates.ce.QZoneShareTemplate;
   import com.qq.utils.db.ClientDBTableName;
   
   public class QZoneShareTempFactory
   {
      
      private static var _instance:QZoneShareTempFactory;
       
      
      private var shareInfos:Vector.<QZoneShareTemplate>;
      
      public function QZoneShareTempFactory()
      {
         super();
         this.shareInfos = Vector.<QZoneShareTemplate>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_QZONE_SHARE,QZoneShareTemplate));
      }
      
      public static function get instance() : QZoneShareTempFactory
      {
         if(!_instance)
         {
            _instance = new QZoneShareTempFactory();
         }
         return _instance;
      }
      
      public function getQZoneShareTempsByType(param1:uint) : Vector.<QZoneShareTemplate>
      {
         var _loc2_:Vector.<QZoneShareTemplate> = new Vector.<QZoneShareTemplate>();
         var _loc3_:int = 0;
         while(_loc3_ < this.shareInfos.length)
         {
            if(this.shareInfos[_loc3_].type == param1)
            {
               _loc2_.push(this.shareInfos[_loc3_]);
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function getQZoneShareTempById(param1:uint) : QZoneShareTemplate
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.shareInfos.length)
         {
            if(this.shareInfos[_loc2_].id == param1)
            {
               return this.shareInfos[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
   }
}
