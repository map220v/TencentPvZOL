package com.qq.modules.map.model.vo
{
   import PVZ.Cmd.Dto_WorldMap_MineCar;
   import flash.geom.Point;
   
   public class MapMineCartVO
   {
       
      
      private var dto:Dto_WorldMap_MineCar;
      
      protected var _pos:Point;
      
      public var city:MapCityCellVO;
      
      public function MapMineCartVO(param1:Dto_WorldMap_MineCar, param2:MapCityCellVO)
      {
         super();
         this.city = param2;
         if(param1)
         {
            this.loadDto(param1);
         }
      }
      
      private function loadDto(param1:Dto_WorldMap_MineCar) : void
      {
         this.dto = param1;
         this._pos = new Point(param1.minePos.posX,param1.minePos.posY);
      }
      
      public function getGoldFlag() : int
      {
         return Math.round(3 * (this.dto.harverst / this.dto.maxHarverst));
      }
      
      public function get pos() : Point
      {
         return this._pos;
      }
      
      public function get roleName() : String
      {
         return this.city.roleName;
      }
   }
}
