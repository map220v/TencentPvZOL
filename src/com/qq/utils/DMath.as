package com.qq.utils
{
   import flash.geom.Point;
   
   public class DMath
   {
      
      private static var pt1:Point = new Point();
      
      private static var pt2:Point = new Point();
       
      
      public function DMath()
      {
         super();
      }
      
      public static function randNum(param1:int, param2:int) : int
      {
         return int(Math.floor(Math.random() * (param2 - param1 + 1)) + param1);
      }
      
      public static function degreesToRandinas(param1:Number) : Number
      {
         return Number(param1 * Math.PI / 180);
      }
      
      public static function getRadianXY(param1:Number, param2:Number) : Array
      {
         param1 %= 360;
         var _loc3_:Number = Math.cos(degreesToRandinas(param1)) * param2;
         var _loc4_:Number = Math.sin(degreesToRandinas(param1)) * param2;
         return [_loc3_,_loc4_];
      }
      
      public static function getDistance(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         pt1.x = param1;
         pt1.y = param2;
         pt2.x = param3;
         pt2.y = param4;
         return Point.distance(pt1,pt2);
      }
      
      public static function getAngle(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         return Math.atan2(param2 - param4,param1 - param3) * 180 / Math.PI;
      }
      
      public static function radiansTodegrees(param1:Number) : Number
      {
         var _loc2_:Number = param1 * 180 / Math.PI;
         if(_loc2_ < 0)
         {
            _loc2_ += 360;
         }
         return _loc2_;
      }
      
      public static function calculateExpression(param1:String) : Number
      {
         return Arithmetic.exec(param1);
      }
      
      public static function getDiscountValue(param1:Number, param2:Number) : Number
      {
         var _loc3_:Number = Math.round(param2 / param1 * 100);
         if(_loc3_ == 0)
         {
            return 0;
         }
         if(_loc3_ % 10 == 0)
         {
            _loc3_ = int(_loc3_ / 10);
         }
         else
         {
            _loc3_ /= 10;
         }
         return _loc3_;
      }
   }
}
