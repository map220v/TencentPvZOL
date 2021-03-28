package com.qq.modules.map.model.vo
{
   import PVZ.Cmd.Dto_WorldMap_CellInfo;
   import com.qq.modules.map.model.templates.MapTemplateFactory;
   import com.qq.modules.map.model.templates.MapTempleTemplate;
   import com.tencent.protobuf.Int64;
   
   public class MapTempleCellVO extends MapBasicCellVO
   {
       
      
      private var _templateTemple:MapTempleTemplate;
      
      public function MapTempleCellVO(param1:Dto_WorldMap_CellInfo = null, param2:Int64 = null)
      {
         super(param1,param2);
      }
      
      public function get templateTemple() : MapTempleTemplate
      {
         if(!this._templateTemple)
         {
            this._templateTemple = MapTemplateFactory.instance.getMapTempleTemplateById(dto.templeId);
         }
         return this._templateTemple;
      }
   }
}
