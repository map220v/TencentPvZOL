package asgui.blit
{
   import asgui.blit.data.BlitData;
   import asgui.blit.data.BlitFrameData;
   import asgui.blit.display.BlitDisplayFactory;
   import flash.display.FrameLabel;
   import flash.display.MovieClip;
   import flash.filters.BlurFilter;
   import flash.filters.DropShadowFilter;
   import flash.filters.GlowFilter;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public final class Blit
   {
      
      public static const COLOR_TRANSPARENT:uint = 0;
      
      private static var _instance:Blit;
      
      public static var updateBlitDataFuncExtend:Function = null;
       
      
      private var _displayObjectFactory:IBlitDisplayFactory;
      
      public function Blit()
      {
         super();
      }
      
      public static function get instance() : Blit
      {
         if(_instance == null)
         {
            _instance = new Blit();
         }
         return _instance;
      }
      
      public static function get factory() : IBlitDisplayFactory
      {
         return instance.factory;
      }
      
      public static function GetAtEventFrames(param1:Vector.<FrameLabel>) : Vector.<FrameLabel>
      {
         var _loc3_:int = 0;
         var _loc2_:Vector.<FrameLabel> = new Vector.<FrameLabel>();
         if(param1 != null)
         {
            _loc3_ = 0;
            while(_loc3_ < param1.length)
            {
               if(param1[_loc3_].name.substr(0,1) == "@")
               {
                  _loc2_.push(param1[_loc3_]);
               }
               _loc3_++;
            }
         }
         return _loc2_;
      }
      
      public static function GetFrameRangeByLabel(param1:String, param2:Vector.<FrameLabel>, param3:int) : Vector.<int>
      {
         var _loc5_:int = 0;
         var _loc4_:Vector.<int> = new Vector.<int>(2,true);
         var _loc6_:Vector.<FrameLabel> = new Vector.<FrameLabel>();
         _loc5_ = 0;
         while(_loc5_ < param2.length)
         {
            _loc6_.push(param2[_loc5_]);
            _loc5_++;
         }
         _loc5_ = 0;
         while(_loc5_ < _loc6_.length)
         {
            if(_loc6_[_loc5_].name == param1)
            {
               _loc4_[0] = _loc6_[_loc5_].frame;
               if(_loc5_ + 1 < _loc6_.length)
               {
                  _loc4_[1] = _loc6_[_loc5_ + 1].frame - 1;
               }
               else
               {
                  _loc4_[1] = param3;
               }
               break;
            }
            _loc5_++;
         }
         if(_loc5_ == _loc6_.length)
         {
            return null;
         }
         return _loc4_;
      }
      
      public static function GetCurrentLabelByFrame(param1:int, param2:Vector.<FrameLabel>, param3:int) : String
      {
         var _loc4_:int = 0;
         var _loc5_:String = null;
         _loc4_ = 0;
         while(_loc4_ < param2.length)
         {
            _loc5_ = param2[_loc4_].name;
            if(param2[_loc4_].frame < param1 - 1)
            {
               break;
            }
            _loc4_++;
         }
         return _loc5_;
      }
      
      public static function GetFiltersDesc(param1:Array) : String
      {
         var _loc2_:int = 0;
         var _loc5_:GlowFilter = null;
         var _loc6_:BlurFilter = null;
         var _loc7_:DropShadowFilter = null;
         var _loc3_:int = param1.length;
         var _loc4_:String = "";
         while(_loc2_ < _loc3_)
         {
            if(param1[_loc2_] is GlowFilter)
            {
               _loc5_ = param1[_loc2_] as GlowFilter;
               _loc4_ += "[glowFilter " + _loc5_.blurX + " " + _loc5_.color + " " + _loc5_.strength;
            }
            else if(param1[_loc2_] is BlurFilter)
            {
               _loc6_ = param1[_loc2_] as BlurFilter;
               _loc4_ += "[blurFilter " + _loc6_.blurX + " " + _loc6_.blurY;
            }
            else if(param1[_loc2_] is DropShadowFilter)
            {
               _loc7_ = param1[_loc2_] as DropShadowFilter;
               _loc4_ += "[glowFilter " + _loc7_.blurX + " " + _loc7_.color + " " + _loc7_.strength;
            }
            else
            {
               _loc4_ += param1[_loc2_];
            }
            _loc2_++;
         }
         return _loc4_;
      }
      
      public static function updateBlitDataFunc(param1:BlitData, param2:BlitData) : void
      {
         var _loc3_:BlitFrameData = param1.GetFrame(0);
         var _loc4_:BlitFrameData;
         (_loc4_ = param2.GetFrame(0)).bitmapData.fillRect(_loc4_.bitmapDataRect,COLOR_TRANSPARENT);
         _loc4_.bitmapData.copyPixels(_loc3_.bitmapData,new Rectangle(0,0,_loc3_.width,_loc3_.height),new Point(_loc4_.bitmapDataRect.x,_loc4_.bitmapDataRect.y));
         param2.IdentityMatrix();
         param2.ConcatMatrix(new Matrix(_loc3_.scaleX,0,0,_loc3_.scaleY,_loc3_.x,_loc3_.y));
         if(updateBlitDataFuncExtend != null)
         {
            updateBlitDataFuncExtend(param1,param2);
         }
      }
      
      public static function CheckIfMcToBlitBoneHasChildren(param1:MovieClip) : Boolean
      {
         return param1.numChildren > 1 || param1.numChildren == 1 && param1.getChildAt(0) is MovieClip;
      }
      
      public function get factory() : IBlitDisplayFactory
      {
         if(this._displayObjectFactory == null)
         {
            this._displayObjectFactory = new BlitDisplayFactory();
         }
         return this._displayObjectFactory;
      }
      
      public function set factory(param1:IBlitDisplayFactory) : void
      {
         this._displayObjectFactory = param1;
      }
   }
}
