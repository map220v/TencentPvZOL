package com.qq.modules.union.view
{
   import asgui.blit.data.BlitData;
   import asgui.blit.data.BlitDataManager;
   import com.qq.constant.union.UnionConstant;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class UnionFlagCacheManager
   {
      
      private static var _instance:UnionFlagCacheManager;
       
      
      private var dict:Array;
      
      public function UnionFlagCacheManager()
      {
         this.dict = [];
         super();
      }
      
      public static function get instance() : UnionFlagCacheManager
      {
         if(!_instance)
         {
            _instance = new UnionFlagCacheManager();
         }
         return _instance;
      }
      
      public function getFlagBitmapData(param1:int, param2:int, param3:int, param4:int, param5:Boolean) : BitmapData
      {
         var w:int = 0;
         var h:int = 0;
         var b:BitmapData = null;
         var bd1:BlitData = null;
         var bd2:BlitData = null;
         var _signID:int = param1;
         var _signColorID:int = param2;
         var _surfaceID:int = param3;
         var _surfaceColorID:int = param4;
         var _isSmall:Boolean = param5;
         var update:Function = function():void
         {
            var _loc1_:BitmapData = null;
            var _loc2_:Bitmap = null;
            var _loc3_:BitmapData = null;
            if(bd1.hasContent && bd2.hasContent)
            {
               _loc1_ = bd2.GetFrame(0).bitmapData;
               b.copyPixels(_loc1_,_loc1_.rect,new Point((w - _loc1_.width) * 0.5,(h - _loc1_.height) * 0.5));
               _loc2_ = new Bitmap(b);
               _loc2_.filters = [UnionConstant.getColorFilter(_surfaceColorID)];
               b.draw(_loc2_);
               _loc2_.filters = [];
               _loc3_ = bd1.GetFrame(0).bitmapData;
               _loc2_.bitmapData = _loc3_;
               _loc2_.filters = [UnionConstant.getColorFilter(_signColorID)];
               b.draw(_loc2_,new Matrix(1,0,0,1,(w - _loc3_.width) * 0.5,(h - _loc3_.height) * 0.5));
            }
         };
         var s:String = _signID + "_" + _signColorID + "_" + _surfaceID + "_" + _surfaceColorID + "_" + (!!_isSmall ? 0 : 1);
         if(!this.dict[s])
         {
            if(_isSmall)
            {
               w = 28;
               h = 28;
            }
            else
            {
               w = 50;
               h = 50;
            }
            b = new BitmapData(w,h,true,0);
            this.dict[s] = b;
            bd1 = BlitDataManager.GetBlitDataByUrl(UnionConstant.getSignUrl(_signID,_isSmall));
            bd2 = BlitDataManager.GetBlitDataByUrl(UnionConstant.getSurfaceUrl(_surfaceID,_isSmall));
            if(bd1.hasContent && bd2.hasContent)
            {
               update();
            }
            else
            {
               if(!bd1.hasContent)
               {
                  bd1.addEventListener(Event.COMPLETE,function(param1:Event):void
                  {
                     update();
                  });
               }
               if(!bd2.hasContent)
               {
                  bd2.addEventListener(Event.COMPLETE,function(param1:Event):void
                  {
                     update();
                  });
               }
            }
         }
         return this.dict[s];
      }
   }
}
