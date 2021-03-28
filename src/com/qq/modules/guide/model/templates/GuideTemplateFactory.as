package com.qq.modules.guide.model.templates
{
   import com.qq.data.DataCacheManager;
   import com.qq.modules.guide.model.templates.ce.OpenButtonInfoTemplateCE;
   import com.qq.utils.db.ClientDBTableName;
   
   public class GuideTemplateFactory
   {
      
      private static var _instance:GuideTemplateFactory;
       
      
      private var cacheGuideProcessTemplate:Vector.<GuideProcessTemplate>;
      
      public var cacheOpenButtonInfoTemplate:Vector.<OpenButtonInfoTemplateCE>;
      
      public function GuideTemplateFactory()
      {
         super();
         this.build();
      }
      
      public static function get instance() : GuideTemplateFactory
      {
         if(_instance == null)
         {
            _instance = new GuideTemplateFactory();
         }
         return _instance;
      }
      
      public function getOpenButtonListByCheckPanelName(param1:String) : Array
      {
         var _loc3_:int = 0;
         var _loc2_:Array = new Array();
         var _loc4_:int = this.cacheOpenButtonInfoTemplate.length;
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            if(this.cacheOpenButtonInfoTemplate[_loc3_].checkPanelName == param1)
            {
               _loc2_.push(this.cacheOpenButtonInfoTemplate[_loc3_]);
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function getOpenButtonById(param1:int) : OpenButtonInfoTemplateCE
      {
         var _loc2_:int = this.cacheOpenButtonInfoTemplate.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if(this.cacheOpenButtonInfoTemplate[_loc3_].id == param1)
            {
               return this.cacheOpenButtonInfoTemplate[_loc3_];
            }
            _loc3_++;
         }
         return null;
      }
      
      public function getGuideProcessTemplateByOrderID(param1:int) : GuideProcessTemplate
      {
         var _loc2_:GuideProcessTemplate = null;
         var _loc3_:int = this.cacheGuideProcessTemplate.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this.cacheGuideProcessTemplate[_loc4_];
            if(_loc2_.order == param1)
            {
               return _loc2_;
            }
            _loc4_++;
         }
         return null;
      }
      
      private function build() : void
      {
         if(this.cacheGuideProcessTemplate == null)
         {
            this.cacheGuideProcessTemplate = Vector.<GuideProcessTemplate>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.GuideProcessTemplate,GuideProcessTemplate));
            this.cacheGuideProcessTemplate = this.cacheGuideProcessTemplate.sort(GuideProcessTemplate.sortByOrderID);
         }
         if(this.cacheOpenButtonInfoTemplate == null)
         {
            this.cacheOpenButtonInfoTemplate = Vector.<OpenButtonInfoTemplateCE>(DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.Table_OpenButtonInfo,OpenButtonInfoTemplateCE));
         }
      }
   }
}
