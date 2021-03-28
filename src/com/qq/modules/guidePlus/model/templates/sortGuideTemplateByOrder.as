package com.qq.modules.guidePlus.model.templates
{
   import com.qq.modules.guidePlus.model.templates.ce.GuideTemplateCE;
   
   public function sortGuideTemplateByOrder(param1:GuideTemplateCE, param2:GuideTemplateCE) : int
   {
      return param1.order - param2.order;
   }
}
