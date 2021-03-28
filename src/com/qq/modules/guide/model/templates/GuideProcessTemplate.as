package com.qq.modules.guide.model.templates
{
   import com.qq.modules.guide.model.templates.ce.GuideProcessTemplateCE;
   
   public class GuideProcessTemplate extends GuideProcessTemplateCE
   {
       
      
      public function GuideProcessTemplate()
      {
         super();
      }
      
      public static function sortByOrderID(param1:GuideProcessTemplate, param2:GuideProcessTemplate) : int
      {
         return param1.order - param2.order;
      }
      
      override public function load(param1:Object) : void
      {
         super.load(param1);
      }
   }
}
