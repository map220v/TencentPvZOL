package net.sakri.flash.math
{
   public class MathUtil
   {
      
      public static const PI_180:Number = Math.PI / 180;
      
      public static const ONE80_PI:Number = 180 / Math.PI;
       
      
      public function MathUtil()
      {
         super();
      }
      
      public static function constrainDegreeTo360(param1:Number) : Number
      {
         return (360 + param1 % 360) % 360;
      }
      
      public static function constrainNumber(param1:Number, param2:Number = 0, param3:Number = 1) : Number
      {
         if(param1 < param2)
         {
            return param2;
         }
         if(param1 > param3)
         {
            return param3;
         }
         return param1;
      }
      
      public static function radiansToDegrees(param1:Number) : Number
      {
         return param1 * ONE80_PI;
      }
      
      public static function degreesToRadians(param1:Number) : Number
      {
         return param1 * PI_180;
      }
      
      public static function getRandomNumberInRange(param1:Number, param2:Number) : Number
      {
         return param1 + Math.random() * (param2 - param1);
      }
      
      public static function getRandomIntInRange(param1:int, param2:int) : int
      {
         return Math.round(param1 + Math.random() * (param2 - param1));
      }
      
      public static function getRandomUintInRange(param1:uint, param2:uint) : uint
      {
         return uint(Math.round(param1 + Math.random() * (param2 - param1)));
      }
      
      public static function getCircumeferenceOfEllipse(param1:Number, param2:Number) : Number
      {
         return Math.sqrt(0.5 * (param1 * param1 + param2 * param2)) * (Math.PI * 2) / 2;
      }
      
      public static function normalize(param1:Number, param2:Number, param3:Number) : Number
      {
         return (param1 - param2) / (param3 - param2);
      }
      
      public static function interpolate(param1:Number, param2:Number, param3:Number) : Number
      {
         return param2 + (param3 - param2) * param1;
      }
      
      public static function map(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : Number
      {
         return interpolate(normalize(param1,param2,param3),param4,param5);
      }
   }
}
