package asgui.blit.data
{
   import asgui.core.IDisposable;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.display.DisplayObject;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class BlitFrameData implements IDisposable
   {
       
      
      public var bitmapData:BitmapData;
      
      private var _xOrg:Number = 0;
      
      private var _yOrg:Number = 0;
      
      private var _scaleXOrg:Number = 1;
      
      private var _scaleYOrg:Number = 1;
      
      public var x:Number = 0;
      
      public var y:Number = 0;
      
      public var scaleX:Number = 1;
      
      public var scaleY:Number = 1;
      
      public var rotation:Number = 0;
      
      public var blendMode:String = "normal";
      
      private var _disposed:Boolean;
      
      public var bitmapDataId:int;
      
      public var bitmapDataRect:Rectangle;
      
      public function BlitFrameData(param1:BitmapData = null, param2:Array = null, param3:Point = null)
      {
         var _loc4_:int = 0;
         var _loc5_:DisplayObject = null;
         var _loc6_:Rectangle = null;
         super();
         this.SetData(param1);
         if(param2)
         {
            _loc4_ = 0;
            while(_loc4_ < param2.length)
            {
               if(param2[_loc4_] is DisplayObject)
               {
                  _loc5_ = param2[_loc4_] as DisplayObject;
                  this.x += _loc5_.x;
                  this.y += _loc5_.y;
                  this.rotation += _loc5_.rotation;
                  if(_loc5_.blendMode != BlendMode.NORMAL && this.blendMode == BlendMode.NORMAL)
                  {
                     this.blendMode = _loc5_.blendMode;
                  }
               }
               else if(param2[_loc4_] is Rectangle)
               {
                  _loc6_ = param2[_loc4_] as Rectangle;
                  this.x += _loc6_.x;
                  this.y += _loc6_.y;
               }
               _loc4_++;
            }
         }
         this.x = int(this.x);
         this.y = int(this.y);
         if(param3)
         {
            this.x += param3.x;
            this.y += param3.y;
         }
         if(this.bitmapData)
         {
            this.bitmapData.lock();
         }
         this.xOrg = this.x;
         this.yOrg = this.y;
      }
      
      public function get scaleYOrg() : Number
      {
         return this._scaleYOrg;
      }
      
      public function set scaleYOrg(param1:Number) : void
      {
         this._scaleYOrg = param1;
         this.scaleY = param1;
      }
      
      public function get scaleXOrg() : Number
      {
         return this._scaleXOrg;
      }
      
      public function set scaleXOrg(param1:Number) : void
      {
         this._scaleXOrg = param1;
         this.scaleX = param1;
      }
      
      public function get yOrg() : Number
      {
         return this._yOrg;
      }
      
      public function set yOrg(param1:Number) : void
      {
         this._yOrg = param1;
         this.y = param1;
      }
      
      public function get xOrg() : Number
      {
         return this._xOrg;
      }
      
      public function set xOrg(param1:Number) : void
      {
         this._xOrg = param1;
         this.x = param1;
      }
      
      public function ConcatMatrix(param1:Matrix) : void
      {
         this.x += param1.tx;
         this.y += param1.ty;
         this.scaleX *= param1.a;
         this.scaleY *= param1.d;
      }
      
      public function IdentityMatrix() : void
      {
         this.x = this.xOrg;
         this.y = this.yOrg;
         this.scaleX = this.scaleXOrg;
         this.scaleY = this.scaleYOrg;
      }
      
      public function ConcatBlitScale(param1:Number, param2:Number) : void
      {
         if(param1 < 1 / 4)
         {
            param1 = 1 / 4;
         }
         else if(param1 < 1 / 2)
         {
            param1 = 1 / 2;
         }
         else
         {
            param1 = 1;
         }
         if(param2 < 1 / 4)
         {
            param2 = 1 / 4;
         }
         else if(param2 < 1 / 2)
         {
            param2 = 1 / 2;
         }
         else
         {
            param2 = 1;
         }
         this.scaleX /= param1;
         this.scaleY /= param2;
         if(param1 == 1 && param2 == 1)
         {
            return;
         }
         var _loc3_:BitmapData = new BitmapData(this.bitmapData.width * param1,this.bitmapData.height * param2,true,0);
         var _loc4_:Matrix;
         (_loc4_ = new Matrix()).scale(param1,param2);
         _loc3_.draw(this.bitmapData,_loc4_);
         this.bitmapData = _loc3_;
      }
      
      public function UpdateBitmapDataRemovingGap() : void
      {
         var _loc2_:BitmapData = null;
         if(this.bitmapData == null)
         {
            this.bitmapData = new BitmapData(1,1,true,0);
         }
         if(this.bitmapData.width <= 4 && this.bitmapData.height <= 4)
         {
            return;
         }
         var _loc1_:Rectangle = this.bitmapData.getColorBoundsRect(4278190080,0,false);
         if(_loc1_.width == 0 || _loc1_.height == 0)
         {
            return;
         }
         if(_loc1_.width != this.bitmapData.width || _loc1_.height != this.bitmapData.height)
         {
            _loc2_ = new BitmapData(_loc1_.width,_loc1_.height,true,0);
            _loc2_.copyPixels(this.bitmapData,_loc1_,new Point());
            this.bitmapData = _loc2_;
            this.x += _loc1_.x * this.scaleX;
            this.y += _loc1_.y * this.scaleY;
         }
      }
      
      public function UpdateBitmapDataUsingScale() : void
      {
         if(this.scaleX == 1 && this.scaleY == 1)
         {
            return;
         }
         var _loc1_:BitmapData = new BitmapData(this.bitmapData.width / this.scaleX,this.bitmapData.height / this.scaleY,true,0);
         var _loc2_:Matrix = new Matrix();
         _loc2_.scale(1 / this.scaleX,1 / this.scaleY);
         _loc1_.draw(this.bitmapData,_loc2_);
         this.bitmapData = _loc1_;
         this.scaleX = 1;
         this.scaleY = 1;
      }
      
      public function SetData(param1:BitmapData, param2:int = -1, param3:Rectangle = null) : void
      {
         this.bitmapDataRect = param3;
         this.bitmapDataId = param2;
         this.bitmapData = param1;
      }
      
      public function UnbatchData() : void
      {
         var _loc1_:BitmapData = null;
         if(this.bitmapDataId >= 0 && this.bitmapDataRect)
         {
            _loc1_ = new BitmapData(this.bitmapDataRect.width,this.bitmapDataRect.height,true,0);
            _loc1_.copyPixels(this.bitmapData,this.bitmapDataRect,new Point());
            this.bitmapData = _loc1_;
            this.bitmapDataId = -1;
            this.bitmapDataRect = null;
         }
      }
      
      public function Dispose() : void
      {
         if(this.bitmapData)
         {
            this.bitmapData.dispose();
            this.bitmapData = null;
         }
         this._disposed = true;
      }
      
      public function get hasDisposed() : Boolean
      {
         return this._disposed;
      }
      
      public function getBitmapData() : BitmapData
      {
         var _loc1_:BitmapData = null;
         if(this.bitmapDataRect)
         {
            _loc1_ = new BitmapData(this.bitmapDataRect.width,this.bitmapDataRect.height);
            _loc1_.copyPixels(this.bitmapData,this.bitmapDataRect,new Point());
            return _loc1_;
         }
         return this.bitmapData;
      }
      
      public function get width() : int
      {
         if(this.bitmapDataRect)
         {
            return this.bitmapDataRect.width;
         }
         if(this.bitmapData)
         {
            return this.bitmapData.width;
         }
         return 0;
      }
      
      public function get height() : int
      {
         if(this.bitmapDataRect)
         {
            return this.bitmapDataRect.height;
         }
         if(this.bitmapData)
         {
            return this.bitmapData.height;
         }
         return 0;
      }
   }
}
