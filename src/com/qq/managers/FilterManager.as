package com.qq.managers
{
   import com.qq.display.ColorMatrix;
   import flash.display.DisplayObject;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.BlurFilter;
   import flash.filters.ColorMatrixFilter;
   import flash.filters.DropShadowFilter;
   import flash.filters.GlowFilter;
   
   public final class FilterManager
   {
       
      
      public function FilterManager()
      {
         super();
      }
      
      public static function addHueEffect(param1:DisplayObject, param2:Number) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc3_:ColorMatrix = new ColorMatrix();
         _loc3_.adjustHue(param2);
         var _loc4_:ColorMatrixFilter = new ColorMatrixFilter(_loc3_);
         param1.filters = [_loc4_];
      }
      
      public static function addMonoChrome(param1:Object, param2:Boolean = true) : void
      {
         var _loc3_:DisplayObject = null;
         var _loc4_:ColorMatrix = null;
         var _loc5_:ColorMatrixFilter = null;
         if(param1 is DisplayObject)
         {
            _loc3_ = param1 as DisplayObject;
            (_loc4_ = new ColorMatrix()).adjustSaturation(-100);
            _loc5_ = new ColorMatrixFilter(_loc4_);
            if(param2)
            {
               _loc3_.filters = [_loc5_];
            }
            else
            {
               _loc3_.filters.push(_loc5_);
            }
         }
      }
      
      public static function clean(param1:Object) : void
      {
         var _loc2_:DisplayObject = null;
         if(param1 == null)
         {
            return;
         }
         if(param1 is DisplayObject)
         {
            _loc2_ = param1 as DisplayObject;
            _loc2_.filters = null;
         }
      }
      
      public static function getGlow(param1:int = 70) : ColorMatrixFilter
      {
         var _loc2_:ColorMatrix = new ColorMatrix();
         _loc2_.adjustBrightness(param1);
         return new ColorMatrixFilter(_loc2_);
      }
      
      public static function getGlowLine() : GlowFilter
      {
         return new GlowFilter(16776960,1,5,5,4);
      }
      
      public static function getBlur(param1:int = 4) : BlurFilter
      {
         return new BlurFilter(param1,param1);
      }
      
      public static function getBlackFilter() : ColorMatrixFilter
      {
         return new ColorMatrixFilter([1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,0,1,0]);
      }
      
      public static function getBlackShader() : DropShadowFilter
      {
         return new DropShadowFilter(2,45,0,1);
      }
      
      public static function getGaryFilter() : ColorMatrixFilter
      {
         return new ColorMatrixFilter([0.3086,0.6094,0.082,0,0,0.3086,0.6094,0.082,0,0,0.3086,0.6094,0.082,0,0,0,0,0,1,0]);
      }
      
      public static function addTextFilters(param1:DisplayObject) : void
      {
         var _loc2_:Number = 0;
         var _loc3_:Number = 1;
         var _loc4_:Number = 2;
         var _loc5_:Number = 2;
         var _loc6_:Number = 10;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:Number = BitmapFilterQuality.LOW;
         var _loc10_:GlowFilter = new GlowFilter(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc9_,_loc7_,_loc8_);
         param1.filters = [_loc10_];
      }
   }
}
