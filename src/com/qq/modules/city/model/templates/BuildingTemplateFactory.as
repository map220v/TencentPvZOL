package com.qq.modules.city.model.templates
{
   import com.qq.data.DataCacheManager;
   import com.qq.modules.city.model.templates.ce.BuildingTemplateCE;
   import com.qq.utils.db.ClientDBTableName;
   
   public class BuildingTemplateFactory
   {
      
      private static var s_instance:BuildingTemplateFactory;
       
      
      private var m_vecBuilding:Vector.<BuildingTemplateCE>;
      
      public function BuildingTemplateFactory()
      {
         super();
         this.m_vecBuilding = Vector.<BuildingTemplateCE>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.Table_BuildingInfo,BuildingTemplateCE));
      }
      
      public static function get instance() : BuildingTemplateFactory
      {
         if(s_instance == null)
         {
            s_instance = new BuildingTemplateFactory();
         }
         return s_instance;
      }
      
      public function getBuilding(param1:uint) : BuildingTemplateCE
      {
         var _loc2_:BuildingTemplateCE = null;
         for each(_loc2_ in this.m_vecBuilding)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
