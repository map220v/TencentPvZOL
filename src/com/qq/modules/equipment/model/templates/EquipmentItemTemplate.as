package com.qq.modules.equipment.model.templates
{
   import com.qq.modules.bag.model.vo.ItemVO;
   import com.qq.modules.equipment.model.EquipmentAttribute;
   import com.qq.modules.equipment.model.templates.ce.EquipmentItemTemplateCE;
   
   public class EquipmentItemTemplate extends EquipmentItemTemplateCE
   {
       
      
      private var m_material:ItemVO;
      
      private var m_property:EquipmentAttribute;
      
      public function EquipmentItemTemplate()
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
      
      public function get property() : EquipmentAttribute
      {
         var _loc1_:Array = null;
         var _loc2_:String = null;
         if(this.m_property == null)
         {
            this.m_property = new EquipmentAttribute();
            _loc1_ = originalProperty.split(";");
            for each(_loc2_ in _loc1_)
            {
               this.m_property.parseProperty(_loc2_,",");
            }
         }
         return this.m_property;
      }
   }
}
