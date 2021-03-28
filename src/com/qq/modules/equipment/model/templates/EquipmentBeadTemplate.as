package com.qq.modules.equipment.model.templates
{
   import com.qq.modules.equipment.model.templates.ce.EquipmentBeadTemplateCE;
   
   public class EquipmentBeadTemplate extends EquipmentBeadTemplateCE
   {
       
      
      public function EquipmentBeadTemplate()
      {
         super();
      }
      
      public function get buyCount() : int
      {
         return id;
      }
   }
}
