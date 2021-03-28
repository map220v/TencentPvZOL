package com.qq.modules.equipment.model
{
   import com.qq.modules.main.model.vo.Attribute;
   import com.qq.templates.font.FontHKHB;
   
   public class EquipmentAttribute extends Attribute
   {
       
      
      public function EquipmentAttribute()
      {
         super();
      }
      
      public static function getAttributeName(param1:int) : String
      {
         var _loc2_:String = "ATTRIBUTE_" + param1;
         return String(FontHKHB[_loc2_]);
      }
      
      public function parseProperty(param1:String, param2:String) : void
      {
         var _loc3_:Array = param1.split(param2);
         setAttribute(_loc3_[0],_loc3_[1]);
      }
   }
}
