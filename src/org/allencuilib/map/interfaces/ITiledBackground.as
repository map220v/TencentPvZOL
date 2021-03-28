package org.allencuilib.map.interfaces
{
   import asgui.core.IDisposable;
   import flash.geom.Point;
   
   public interface ITiledBackground extends IDisposable
   {
       
      
      function TileToCoord(param1:Point) : Point;
      
      function CoordToTile(param1:Point) : Point;
      
      function get overTileCell() : Point;
      
      function get overTilePoint() : Point;
      
      function get rows() : int;
      
      function get columns() : int;
      
      function get stageWidth() : int;
      
      function get stageHeight() : int;
      
      function get x() : Number;
      
      function set x(param1:Number) : void;
      
      function get y() : Number;
      
      function set y(param1:Number) : void;
   }
}
