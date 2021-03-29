package org.allencuilib.map.tiled.tmx
{
   public class TmxCell
   {
       
      
      private var _x:int;
      
      private var _y:int;
      
      private var _layer:int;
      
      private var _tile:TmxTile;
      
      public function TmxCell(param1:int, param2:int, param3:int, param4:TmxTile)
      {
         super();
         this._x = param1;
         this._y = param2;
         this._layer = param3;
         this._tile = param4;
      }
      
      public function get x() : int
      {
         return this._x;
      }
      
      public function get y() : int
      {
         return this._y;
      }
      
      public function get layer() : int
      {
         return this._layer;
      }
      
      public function get tile() : TmxTile
      {
         return this._tile;
      }
   }
}
