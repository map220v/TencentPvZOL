package com.qq.modules.map.model.templates
{
   import com.qq.modules.map.model.templates.ce.MapCellPropTemplateCE;
   
   public class MapCellPropTemplate extends MapCellPropTemplateCE
   {
       
      
      private var _skinTemplate:MapCellSkinTemplate;
      
      public function MapCellPropTemplate()
      {
         super();
      }
      
      public function get skinTemplate() : MapCellSkinTemplate
      {
         if(this._skinTemplate == null)
         {
            this._skinTemplate = MapTemplateFactory.instance.getMapCellSkinTemplateById(skin);
         }
         return this._skinTemplate;
      }
   }
}
