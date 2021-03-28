package com.qq.modules.fuben.model.templates
{
   import com.qq.modules.fuben.model.templates.ce.FubenChapterTemplateCE;
   
   public class FubenChapterTemplate extends FubenChapterTemplateCE
   {
       
      
      private var _bonusTemplate:Array;
      
      public function FubenChapterTemplate()
      {
         this._bonusTemplate = [];
         super();
      }
      
      public function getBonusTemplate(param1:int) : FubenBonusTemplate
      {
         if(this._bonusTemplate[param1] == null)
         {
            this._bonusTemplate[param1] = FubenTemplateFactory.instance.getFubenBonusTemplateByChapterId(id,param1);
         }
         return this._bonusTemplate[param1];
      }
   }
}
