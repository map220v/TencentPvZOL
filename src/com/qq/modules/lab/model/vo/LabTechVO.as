package com.qq.modules.lab.model.vo
{
   import PVZ.Cmd.Dto_LabItem;
   import com.qq.modules.lab.model.templates.LabTemplate;
   import com.qq.modules.lab.model.templates.LabTemplateFactory;
   
   public class LabTechVO
   {
       
      
      private var _dto:Dto_LabItem;
      
      private var _labTechTemplate:LabTemplate;
      
      public function LabTechVO(param1:Dto_LabItem)
      {
         super();
         this._dto = param1;
      }
      
      public function set dto(param1:Dto_LabItem) : void
      {
         this._dto = param1;
      }
      
      public function get dto() : Dto_LabItem
      {
         return this._dto;
      }
      
      public function get labTechTemplate() : LabTemplate
      {
         if(!this._labTechTemplate)
         {
            this._labTechTemplate = LabTemplateFactory.instance.getLabTemplate(this._dto.labId,this._dto.labLevel);
         }
         return this._labTechTemplate;
      }
      
      public function get isMaxLv() : Boolean
      {
         return this._dto.labLevel >= this._labTechTemplate.maxLevel;
      }
   }
}
