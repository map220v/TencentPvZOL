package org.allencuilib.map.interfaces
{
   import flash.geom.Point;
   
   public interface IPathFinder
   {
       
      
      function CalcPaths(param1:Point, param2:Point) : Vector.<Point>;
   }
}
