package asgui.utils
{
   import flash.geom.Point;
   
   public class LineMath
   {
       
      
      public function LineMath()
      {
         super();
      }
      
      public static function Degree(param1:Point, param2:Point) : Number
      {
         var _loc3_:Number = Radian(param1,param2);
         return _loc3_ * 180 / Math.PI;
      }
      
      public static function Radian(param1:Point, param2:Point) : Number
      {
         var _loc3_:Number = Math.atan((param2.y - param1.y) / (param2.x - param1.x));
         if(param2.x - param1.x < 0)
         {
            _loc3_ += Math.PI;
         }
         while(_loc3_ < 0)
         {
            _loc3_ += 2 * Math.PI;
         }
         while(_loc3_ > 2 * Math.PI)
         {
            _loc3_ -= 2 * Math.PI;
         }
         return _loc3_;
      }
      
      public static function GetDistanceByPoints(param1:Point, param2:Array) : Number
      {
         var _loc4_:int = 0;
         var _loc3_:Number = 0;
         var _loc5_:Point = param1;
         _loc4_ = 0;
         while(_loc4_ < param2.length)
         {
            _loc3_ += Point.distance(_loc5_,param2[_loc4_] as Point);
            _loc5_ = param2[_loc4_] as Point;
            _loc4_++;
         }
         return _loc3_;
      }
   }
}
