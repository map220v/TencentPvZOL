package org.allencuilib.map.tiled
{
   import flash.geom.Point;
   
   public class TiledOrientation
   {
      
      public static const ISOMETRIC:String = "isometric";
      
      public static const ORTHOGONAL:String = "orthogonal";
      
      public static const RAD_ISO:Number = Math.PI / 6;
       
      
      public function TiledOrientation()
      {
         super();
      }
      
      public static function GetCoordByIsomTiledCell(param1:Number, param2:Number, param3:int, param4:int, param5:int, param6:int) : Point
      {
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc7_:Number = param4 * param5 / 2;
         var _loc8_:Number = 0;
         _loc9_ = _loc7_ + (param1 - param2) * param5 / 2;
         _loc10_ = _loc8_ + (param1 + param2) * param6 / 2;
         return new Point(_loc9_,_loc10_);
      }
      
      public static function GetIsomTiledCoordByCoord(param1:Number, param2:Number, param3:int, param4:int, param5:int, param6:int) : Point
      {
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc7_:Number = param4 * param5 / 2;
         var _loc8_:Number = 0;
         var _loc9_:Number = param6 / (2 * Math.sin(RAD_ISO));
         var _loc12_:Number = param1 - _loc7_;
         var _loc13_:Number;
         _loc10_ = (_loc13_ = param2 - _loc8_) - _loc12_ * (Math.cos(RAD_ISO) - Math.tan(RAD_ISO));
         _loc11_ = _loc13_ - _loc12_ * Math.tan(RAD_ISO);
         return new Point(int(_loc10_ / _loc9_),int(_loc11_ / _loc9_));
      }
   }
}
