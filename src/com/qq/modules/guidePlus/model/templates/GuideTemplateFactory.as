package com.qq.modules.guidePlus.model.templates
{
   import com.qq.data.DataCacheManager;
   import com.qq.modules.guidePlus.model.templates.ce.GuideTemplateCE;
   import com.qq.modules.guidePlus.model.templates.ce.GuideTextTemplateCE;
   import com.qq.utils.db.ClientDBTableName;
   
   public class GuideTemplateFactory
   {
      
      private static var s_instance:GuideTemplateFactory;
       
      
      private var m_vecTemplate:Vector.<GuideTemplateCE>;
      
      private var m_vecText:Vector.<GuideTextTemplateCE>;
      
      public function GuideTemplateFactory()
      {
         super();
         this.m_vecTemplate = Vector.<GuideTemplateCE>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_GUIDE_DATA,GuideTemplateCE));
         this.m_vecText = Vector.<GuideTextTemplateCE>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_GUIDE_TEXT,GuideTextTemplateCE));
      }
      
      public static function get instance() : GuideTemplateFactory
      {
         if(s_instance == null)
         {
            s_instance = new GuideTemplateFactory();
         }
         return s_instance;
      }
      
      public function get allTemplate() : Vector.<GuideTemplateCE>
      {
         return this.m_vecTemplate;
      }
      
      public function getTemplate(param1:int) : GuideTemplateCE
      {
         var _loc2_:GuideTemplateCE = null;
         for each(_loc2_ in this.m_vecTemplate)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getTextTemplate(param1:int) : GuideTextTemplateCE
      {
         var _loc2_:GuideTextTemplateCE = null;
         for each(_loc2_ in this.m_vecText)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getGroup(param1:int, param2:Boolean = true) : Vector.<GuideTemplateCE>
      {
         var _loc4_:GuideTemplateCE = null;
         var _loc3_:Vector.<GuideTemplateCE> = new Vector.<GuideTemplateCE>();
         for each(_loc4_ in this.m_vecTemplate)
         {
            if(_loc4_.groupID == param1)
            {
               _loc3_.push(_loc4_);
            }
         }
         if(param2)
         {
            return _loc3_.sort(sortGuideTemplateByOrder);
         }
         return _loc3_;
      }
      
      public function getText(param1:int) : String
      {
         var _loc2_:GuideTextTemplateCE = this.getTextTemplate(param1);
         if(_loc2_)
         {
            return _loc2_.text;
         }
         return "";
      }
   }
}
