package asgui.styles
{
   import asgui.core.Align;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   
   class SkinDataInfo
   {
       
      
      public var sourceName:String;
      
      public var symbolName:String;
      
      public var type:uint;
      
      public var alpha:Number;
      
      public var scaleGridTop:int;
      
      public var scaleGridBottom:int;
      
      public var scaleGridLeft:int;
      
      public var scaleGridRight:int;
      
      private var hcenter:Number;
      
      private var vcenter:Number;
      
      private var left:Number;
      
      private var right:Number;
      
      private var top:Number;
      
      private var bottom:Number;
      
      private var width:Number;
      
      private var height:Number;
      
      public var tile:Boolean;
      
      public var frameStart:int = 0;
      
      public var frameEnd:int = 255;
      
      public var animation:String = "stop";
      
      public var paddingLeft:int;
      
      public var paddingBottom:int;
      
      public var paddingTop:int;
      
      public var paddingRight:int;
      
      function SkinDataInfo(param1:String, param2:Object)
      {
         var _loc4_:int = 0;
         var _loc5_:uint = 0;
         super();
         var _loc3_:Array = param1.split("_");
         this.type = 0;
         _loc4_ = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc5_ = uint(Align[_loc3_[_loc4_].toString().toUpperCase()]);
            this.type |= _loc5_;
            _loc4_++;
         }
         this.sourceName = param2["source"];
         this.symbolName = param2["symbol"];
         this.alpha = param2["alpha"];
         this.paddingLeft = param2["paddingLeft"];
         this.paddingBottom = param2["paddingBottom"];
         this.paddingTop = param2["paddingTop"];
         this.paddingRight = param2["paddingRight"];
         this.hcenter = param2["hcenter"];
         this.vcenter = param2["vcenter"];
         this.left = param2["left"];
         this.right = param2["right"];
         this.top = param2["top"];
         this.bottom = param2["bottom"];
         this.width = param2["width"];
         this.height = param2["height"];
         this.scaleGridTop = param2["scaleGridTop"];
         this.scaleGridBottom = param2["scaleGridBottom"];
         this.scaleGridLeft = param2["scaleGridLeft"];
         this.scaleGridRight = param2["scaleGridRight"];
         this.tile = param2["tile"] == "true";
         if(param2.hasOwnProperty("frames"))
         {
            _loc3_ = param2["frames"].toString().split("-");
            this.frameStart = _loc3_[0];
            if(_loc3_.length > 1)
            {
               this.frameEnd = _loc3_[1];
            }
         }
         if(param2.hasOwnProperty("animation"))
         {
            this.animation = param2["animation"];
         }
      }
      
      public function GetLayoutMatrix(param1:BitmapData, param2:int, param3:int, param4:int, param5:int, param6:Boolean) : Matrix
      {
         var _loc7_:* = this.type & 15;
         var _loc8_:* = this.type & 240;
         var _loc9_:Matrix = new Matrix();
         var _loc10_:Rectangle = this.GetLayoutRect(param1,param2,param3,param4,param5,param6);
         var _loc11_:Number = 1;
         var _loc12_:Number = 1;
         if(!param6)
         {
            _loc11_ = _loc10_.width / param1.width;
            _loc12_ = _loc10_.height / param1.height;
            _loc9_.tx = _loc10_.x / _loc11_;
            _loc9_.ty = _loc10_.y / _loc12_;
            _loc9_.scale(_loc11_,_loc12_);
         }
         else
         {
            switch(_loc7_)
            {
               case Align.LEFT:
                  _loc9_.tx = _loc10_.x;
                  break;
               case Align.RIGHT:
                  _loc9_.tx = _loc10_.x - param1.width + _loc10_.width;
                  break;
               case Align.HCENTER:
                  _loc9_.tx = _loc10_.x - param1.width / 2 + _loc10_.width / 2;
            }
            switch(_loc8_)
            {
               case Align.TOP:
                  _loc9_.ty = _loc10_.y;
                  break;
               case Align.BOTTOM:
                  _loc9_.ty = _loc10_.y - param1.height + _loc10_.height;
                  break;
               case Align.VCENTER:
                  _loc9_.ty = _loc10_.y - param1.height / 2 + _loc10_.height / 2;
            }
         }
         return _loc9_;
      }
      
      public function GetLayoutRect(param1:BitmapData, param2:int, param3:int, param4:int, param5:int, param6:Boolean) : Rectangle
      {
         var _loc7_:Rectangle = new Rectangle();
         if(!isNaN(this.left) && !isNaN(this.right))
         {
            _loc7_.width = param4 - this.left - this.right;
         }
         else if(!isNaN(this.width))
         {
            _loc7_.width = Math.min(this.width,param4);
         }
         else if(param6)
         {
            _loc7_.width = param4;
         }
         else
         {
            _loc7_.width = Math.min(param4,param1.width);
         }
         if(!isNaN(this.left))
         {
            _loc7_.x = param2 + this.left;
         }
         else if(!isNaN(this.right))
         {
            _loc7_.x = param4 - _loc7_.width - param2 - this.right;
         }
         else if(!isNaN(this.hcenter))
         {
            _loc7_.x = (param4 - _loc7_.width) / 2 + this.hcenter;
         }
         else
         {
            _loc7_.x = param2;
         }
         if(!isNaN(this.top) && !isNaN(this.bottom))
         {
            _loc7_.height = param5 - this.top - this.bottom;
         }
         else if(!isNaN(this.height))
         {
            _loc7_.height = Math.min(this.height,param4);
         }
         else if(param6)
         {
            _loc7_.height = param5;
         }
         else
         {
            _loc7_.height = Math.min(param5,param1.height);
         }
         if(!isNaN(this.top))
         {
            _loc7_.y = param3 + this.top;
         }
         else if(!isNaN(this.bottom))
         {
            _loc7_.y = param5 - _loc7_.height - param3 - this.bottom;
         }
         else if(!isNaN(this.vcenter))
         {
            _loc7_.y = (param5 - _loc7_.height) / 2 + this.vcenter;
         }
         else
         {
            _loc7_.y = param3;
         }
         _loc7_.x += this.paddingLeft;
         _loc7_.width += -this.paddingLeft - this.paddingRight;
         _loc7_.y += this.paddingTop;
         _loc7_.height += -this.paddingTop - this.paddingBottom;
         return _loc7_;
      }
   }
}
