package com.qq.modules.equipment.model.templates
{
   import com.qq.modules.bag.model.vo.ItemVO;
   import com.qq.modules.equipment.model.templates.ce.EquipmentPartTemplateCE;
   
   public class EquipmentPartTemplate extends EquipmentPartTemplateCE
   {
       
      
      private var m_material:ItemVO;
      
      public function EquipmentPartTemplate()
      {
         super();
      }
      
      public function get material() : ItemVO
      {
         if(this.m_material == null && _originalMaterial != "")
         {
            this.m_material = ItemVO.createByString(originalMaterial,":");
         }
         return this.m_material;
      }
   }
}
