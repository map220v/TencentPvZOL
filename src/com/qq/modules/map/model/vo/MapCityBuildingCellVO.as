package com.qq.modules.map.model.vo
{
   import flash.geom.Point;
   import org.allencuilib.map.tiled.graphics.TiledObjectData;
   
   public class MapCityBuildingCellVO extends MapBasicCellVO
   {
       
      
      public function MapCityBuildingCellVO(param1:TiledObjectData)
      {
         _type = 11;
         super();
         _pos = new Point(param1.cellX,param1.cellY);
         _name = "cell_" + _pos.toString();
         isRealCell = true;
      }
   }
}
