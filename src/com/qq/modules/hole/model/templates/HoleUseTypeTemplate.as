package com.qq.modules.hole.model.templates
{
   import com.qq.modules.hole.model.templates.ce.HoleUseTypeTemplateCE;
   
   public class HoleUseTypeTemplate extends HoleUseTypeTemplateCE
   {
       
      
      public function HoleUseTypeTemplate()
      {
         super();
      }
      
      public static function sortByCostTime(param1:HoleUseTypeTemplate, param2:HoleUseTypeTemplate) : int
      {
         return param1.costTime - param2.costTime;
      }
   }
}
