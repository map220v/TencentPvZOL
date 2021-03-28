package asgui.utils
{
   import flash.geom.ColorTransform;
   
   public class ColorUtil
   {
       
      
      public function ColorUtil()
      {
         super();
      }
      
      public static function AdjustBrightness(param1:uint, param2:Number) : uint
      {
         var _loc3_:Number = Math.max(Math.min((param1 >> 16 & 255) + param2,255),0);
         var _loc4_:Number = Math.max(Math.min((param1 >> 8 & 255) + param2,255),0);
         var _loc5_:Number = Math.max(Math.min((param1 & 255) + param2,255),0);
         return _loc3_ << 16 | _loc4_ << 8 | _loc5_;
      }
      
      public static function AdjustBrightness2(param1:uint, param2:Number) : uint
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         if(param2 == 0)
         {
            return param1;
         }
         if(param2 < 0)
         {
            param2 = (100 + param2) / 100;
            _loc3_ = (param1 >> 16 & 255) * param2;
            _loc4_ = (param1 >> 8 & 255) * param2;
            _loc5_ = (param1 & 255) * param2;
         }
         else
         {
            param2 /= 100;
            _loc3_ = param1 >> 16 & 255;
            _loc4_ = param1 >> 8 & 255;
            _loc5_ = param1 & 255;
            _loc3_ += (255 - _loc3_) * param2;
            _loc4_ += (255 - _loc4_) * param2;
            _loc5_ += (255 - _loc5_) * param2;
            _loc3_ = Math.min(_loc3_,255);
            _loc4_ = Math.min(_loc4_,255);
            _loc5_ = Math.min(_loc5_,255);
         }
         return _loc3_ << 16 | _loc4_ << 8 | _loc5_;
      }
      
      public static function RgbMultiply(param1:uint, param2:uint) : uint
      {
         var _loc3_:Number = param1 >> 16 & 255;
         var _loc4_:Number = param1 >> 8 & 255;
         var _loc5_:Number = param1 & 255;
         var _loc6_:Number = param2 >> 16 & 255;
         var _loc7_:Number = param2 >> 8 & 255;
         var _loc8_:Number = param2 & 255;
         return _loc3_ * _loc6_ / 255 << 16 | _loc4_ * _loc7_ / 255 << 8 | _loc5_ * _loc8_ / 255;
      }
      
      public static function GetUintByCss(param1:String) : uint
      {
         if(param1.substr(0,1) == "#")
         {
            param1 = param1.replace("#","");
         }
         return uint("0x" + param1);
      }
      
      public static function IsColorTransformDefault(param1:ColorTransform, param2:Boolean = false) : Boolean
      {
         if(param1 == null)
         {
            return true;
         }
         return Boolean((param2 || param1.alphaMultiplier == 1) && param1.alphaOffset == 0 && param1.blueMultiplier == 1 && param1.blueOffset == 0 && param1.greenMultiplier == 1 && param1.greenOffset == 0 && param1.redMultiplier == 1 && param1.redOffset == 0);
      }
   }
}
