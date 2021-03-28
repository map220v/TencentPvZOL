package com.qq.modules.map.model.templates
{
   import com.qq.modules.map.model.templates.ce.MapLevelTemplateCE;
   
   public class MapLevelTemplate extends MapLevelTemplateCE
   {
       
      
      public function MapLevelTemplate()
      {
         super();
      }
      
      public function getDesc(param1:Boolean) : String
      {
         return desc.replace("{levelMin}",!!param1 ? levelMinForOldUser : levelMin);
      }
   }
}
