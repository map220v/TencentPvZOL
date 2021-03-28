package com.qq.modules.equipment.model.templates
{
   import com.qq.modules.equipment.model.templates.ce.EquipmentPoolTemplateCE;
   
   public class EquipmentPoolTemplate extends EquipmentPoolTemplateCE
   {
       
      
      public function EquipmentPoolTemplate()
      {
         super();
      }
      
      public function get realRecover() : Number
      {
         return this.recover / 100;
      }
      
      public function get hourRecover() : Number
      {
         return this.realRecover * 60;
      }
   }
}
