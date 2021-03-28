package com.qq.utils
{
   import flash.geom.Point;
   
   public class GeomUtils
   {
      
      public static const PI_180:Number = Math.PI / 180;
      
      public static const ONE80_PI:Number = 180 / Math.PI;
       
      
      public function GeomUtils()
      {
         super();
      }
      
      public static function getPointDegrees(param1:Point, param2:Point) : Number
      {
         return radiansToDegrees(getPointRadians(param1,param2));
      }
      
      public static function getPointRadians(param1:Point, param2:Point) : Number
      {
         return Math.atan2(param2.y - param1.y,param2.x - param1.x);
      }
      
      public static function radiansToDegrees(param1:Number) : Number
      {
         return param1 * ONE80_PI;
      }
      
      public static function degreesToRadians(param1:Number) : Number
      {
         return param1 * PI_180;
      }
      
      public static function pointDistance(param1:Point, param2:Point) : Number
      {
         return Point.distance(param1,param2);
      }
   }
}
