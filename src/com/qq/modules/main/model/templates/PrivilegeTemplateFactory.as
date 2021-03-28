package com.qq.modules.main.model.templates
{
   import com.qq.data.DataCacheManager;
   import com.qq.modules.main.model.templates.ce.PrivilegeConditoinCE;
   import com.qq.modules.main.model.templates.ce.PrivilegeInfoCE;
   import com.qq.utils.db.ClientDBTableName;
   
   public class PrivilegeTemplateFactory
   {
      
      private static var _instance:PrivilegeTemplateFactory;
       
      
      private var _vipPrivilegeInfoList:Vector.<PrivilegeInfoCE>;
      
      private var _privilegeConditionList:Vector.<PrivilegeConditoinCE>;
      
      public function PrivilegeTemplateFactory()
      {
         super();
         this._vipPrivilegeInfoList = Vector.<PrivilegeInfoCE>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.Table_PrivilegeInfo,PrivilegeInfoCE));
         this._privilegeConditionList = Vector.<PrivilegeConditoinCE>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.Table_PrivilegeConditoin,PrivilegeConditoinCE));
      }
      
      public static function get instance() : PrivilegeTemplateFactory
      {
         if(!_instance)
         {
            _instance = new PrivilegeTemplateFactory();
         }
         return _instance;
      }
      
      public function getPrivilegeTempById(param1:uint) : PrivilegeInfoCE
      {
         var _loc2_:PrivilegeInfoCE = null;
         for each(_loc2_ in this._vipPrivilegeInfoList)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getPrivilegeConditionById(param1:uint) : PrivilegeConditoinCE
      {
         var _loc2_:PrivilegeConditoinCE = null;
         for each(_loc2_ in this._privilegeConditionList)
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
