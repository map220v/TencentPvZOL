package com.qq.modules.entryIcon.model.templates
{
   import com.qq.data.DataCacheManager;
   import com.qq.utils.db.ClientDBTableName;
   
   public class EntryIconTemplateFactory
   {
      
      private static var s_instance:EntryIconTemplateFactory;
       
      
      private var m_vecSysIcon:Vector.<SystemIconTemplate>;
      
      private var m_vecActIcon:Vector.<ActivityIconTemplate>;
      
      public function EntryIconTemplateFactory()
      {
         super();
         var _loc1_:DataCacheManager = DataCacheManager.getInstance();
         this.m_vecActIcon = Vector.<ActivityIconTemplate>(_loc1_.getTemplateCacheData(ClientDBTableName.TABLE_ACTIVITY_ICON,ActivityIconTemplate));
         this.m_vecSysIcon = Vector.<SystemIconTemplate>(_loc1_.getTemplateCacheData(ClientDBTableName.TABLE_SYSTEM_ICON,SystemIconTemplate));
      }
      
      public static function get instance() : EntryIconTemplateFactory
      {
         if(s_instance == null)
         {
            s_instance = new EntryIconTemplateFactory();
         }
         return s_instance;
      }
      
      public function getActivityIconTemplate(param1:uint) : ActivityIconTemplate
      {
         var _loc2_:ActivityIconTemplate = null;
         for each(_loc2_ in this.m_vecActIcon)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getSystemIconTemplate(param1:uint) : SystemIconTemplate
      {
         var _loc2_:SystemIconTemplate = null;
         for each(_loc2_ in this.m_vecSysIcon)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function get allSystemIcon() : Vector.<SystemIconTemplate>
      {
         return this.m_vecSysIcon;
      }
   }
}
