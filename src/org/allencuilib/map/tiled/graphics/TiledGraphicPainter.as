package org.allencuilib.map.tiled.graphics
{
   import asgui.managers.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.events.Event;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import org.allencuilib.map.interfaces.ITiledData;
   import org.allencuilib.map.interfaces.ITiledGraphicPainter;
   import org.allencuilib.map.tiled.TiledOrientation;
   import org.allencuilib.map.tiled.TiledResource;
   import org.allencuilib.map.tiled.display.TiledBackgroundDrawMode;
   import org.allencuilib.map.tiled.display.TiledPlot;
   
   public class TiledGraphicPainter implements ITiledGraphicPainter
   {
       
      
      protected var data:ITiledData;
      
      protected var tiledGraphicDataOption:Object;
      
      protected var thumb:BitmapData;
      
      private var _disposed:Boolean;
      
      public function TiledGraphicPainter(param1:ITiledData)
      {
         super();
         this.data = param1;
         this.tiledGraphicDataOption = param1.tiledGraphicDataOption;
         this.thumb = param1.GetThumb();
      }
      
      public function Dispose() : void
      {
         this.data = null;
         this._disposed = true;
         this.thumb = null;
      }
      
      public function get hasDisposed() : Boolean
      {
         return this._disposed;
      }
      
      public function DrawBitmapByCoordinate(param1:TiledPlot, param2:int, param3:int, param4:TiledPlotPaintedCounter = null, param5:int = 65535, param6:Number = 1, param7:Number = 1, param8:String = "rectangle") : int
      {
         var c:int = 0;
         var drawed:Boolean = false;
         var obj:TiledCopyPixelsObject = null;
         var copyPixelsObjects:Array = null;
         var i:int = 0;
         var j:int = 0;
         var fileName:String = null;
         var loader:Loader = null;
         var thumbScale:Number = NaN;
         var m:Matrix = null;
         var rect:Rectangle = null;
         var destBitmap:TiledPlot = param1;
         var x:int = param2;
         var y:int = param3;
         var counter:TiledPlotPaintedCounter = param4;
         var maxDraw:int = param5;
         var scaleX:Number = param6;
         var scaleY:Number = param7;
         var drawMode:String = param8;
         if(drawMode == TiledBackgroundDrawMode.RECTANGLE)
         {
            if(this.data.orientation == TiledOrientation.ORTHOGONAL)
            {
               return this.DrawBitmapByTile(destBitmap,x / this.data.tilewidth,y / this.data.tileheight,counter,maxDraw,scaleX,scaleY);
            }
            if(this.data.orientation == TiledOrientation.ISOMETRIC)
            {
               c = 0;
               if(counter)
               {
                  if(counter.copyPixelsObjects == null)
                  {
                     counter.copyPixelsObjects = this.data.GetCopyPixelsObjectsByArea(x,y,destBitmap.width / scaleX,destBitmap.height / scaleY);
                  }
                  counter.total = counter.copyPixelsObjects.length;
                  while(counter.amount < counter.total && c < maxDraw)
                  {
                     obj = counter.copyPixelsObjects[counter.amount] as TiledCopyPixelsObject;
                     drawed = this.DrawBitmap(destBitmap,obj.destX * scaleX,obj.destY * scaleY,obj.tileX,obj.tileY,obj.layer,scaleX,scaleY);
                     if(drawed)
                     {
                        c++;
                     }
                     ++counter.amount;
                  }
               }
               else
               {
                  copyPixelsObjects = this.data.GetCopyPixelsObjectsByArea(x,y,destBitmap.width / scaleX,destBitmap.height / scaleY);
                  while(c < maxDraw && c < copyPixelsObjects.length)
                  {
                     obj = copyPixelsObjects[c] as TiledCopyPixelsObject;
                     drawed = this.DrawBitmap(destBitmap,obj.destX * scaleX,obj.destY * scaleY,obj.tileX,obj.tileY,obj.layer,scaleX,scaleY);
                     if(drawed)
                     {
                        c++;
                     }
                  }
               }
               return c;
            }
         }
         else if(drawMode == TiledBackgroundDrawMode.BAKED)
         {
            i = int(y / destBitmap.height);
            j = int(x / destBitmap.width);
            if(i >= 0 && j >= 0)
            {
               var innerLoaderCompleteHandler:Function = function(param1:Event):void
               {
                  var _loc2_:BitmapData = Bitmap((param1.currentTarget as LoaderInfo).content).bitmapData;
                  if(destBitmap.bitmapData)
                  {
                     destBitmap.bmp.bitmapData = _loc2_;
                  }
               };
               fileName = this.tiledGraphicDataOption.copyFolder + "/" + destBitmap.width + "x" + destBitmap.height + "_" + i + "_" + j + "." + this.tiledGraphicDataOption.fileExtension;
               if(this.thumb && !LoaderManager.GetByteLoader(TiledResource.urlChangeFunc(fileName)).hasLoaded)
               {
                  if(destBitmap.bitmapData)
                  {
                     thumbScale = this.tiledGraphicDataOption.thumbScale;
                     m = new Matrix();
                     m.translate(-x * thumbScale,-y * thumbScale);
                     m.scale(1 / thumbScale,1 / thumbScale);
                     rect = new Rectangle(x * thumbScale,y * thumbScale,destBitmap.bitmapData.width * thumbScale,destBitmap.bitmapData.height * thumbScale);
                     destBitmap.bmp.bitmapData.draw(this.thumb,m);
                  }
               }
               loader = LoaderManager.GetLoader(TiledResource.urlChangeFunc(fileName));
               loader.contentLoaderInfo.addEventListener(Event.COMPLETE,innerLoaderCompleteHandler);
            }
            counter.amount = counter.total;
            return 1;
         }
         return 0;
      }
      
      public function DrawBitmapByTile(param1:TiledPlot, param2:int, param3:int, param4:TiledPlotPaintedCounter = null, param5:int = 255, param6:Number = 1, param7:Number = 1) : int
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:BitmapData = null;
         var _loc17_:int = 0;
         var _loc18_:TiledCopyPixelsObject = null;
         var _loc19_:Array = null;
         var _loc20_:int = 0;
         if(this.data.orientation == TiledOrientation.ORTHOGONAL)
         {
            _loc8_ = this.data.layerCount;
            _loc9_ = Math.ceil(param1.width / this.data.tilewidth / param6);
            _loc10_ = Math.ceil(param1.height / this.data.tileheight / param7);
            _loc17_ = 0;
            _loc19_ = [];
            _loc20_ = 0;
            _loc11_ = 0;
            while(_loc11_ < _loc8_)
            {
               _loc12_ = 0;
               while(_loc12_ < _loc9_)
               {
                  _loc13_ = 0;
                  while(_loc13_ < _loc10_)
                  {
                     if(this.HasBitmapData(param2 + _loc12_,param3 + _loc13_,_loc11_))
                     {
                        _loc18_ = new TiledCopyPixelsObject(new LayedTiledPlotData(_loc12_ * this.data.tilewidth,_loc13_ * this.data.tileheight,param2 + _loc12_,param3 + _loc13_,_loc11_),0,0);
                        _loc19_.push(_loc18_);
                        _loc20_++;
                     }
                     _loc13_++;
                  }
                  _loc12_++;
               }
               _loc11_++;
            }
            if(param4 != null)
            {
               param4.copyPixelsObjects = _loc19_;
               param4.total = _loc20_;
               while(param4.amount < param4.total && _loc17_ < param5)
               {
                  _loc18_ = param4.copyPixelsObjects[param4.amount] as TiledCopyPixelsObject;
                  this.DrawBitmap(param1,_loc18_.destX * param6,_loc18_.destY * param7,_loc18_.tileX,_loc18_.tileY,_loc18_.layer);
                  _loc17_++;
                  ++param4.amount;
               }
            }
            else
            {
               while(_loc17_ < param5 && _loc17_ < _loc19_.length)
               {
                  _loc18_ = _loc19_[_loc17_] as TiledCopyPixelsObject;
                  this.DrawBitmap(param1,_loc18_.destX * param6,_loc18_.destY * param7,_loc18_.tileX,_loc18_.tileY,_loc18_.layer,param6,param7);
                  _loc17_++;
               }
            }
            return _loc17_;
         }
         if(this.data.orientation == TiledOrientation.ISOMETRIC)
         {
            throw new Error("only \'orthogonal\' type can be drawed by TiledGraphicPainter::DrawBitmapByTile");
         }
         return 0;
      }
      
      public function DrawBitmap(param1:TiledPlot, param2:int, param3:int, param4:int, param5:int, param6:int, param7:Number = 1, param8:Number = 1) : Boolean
      {
         var _loc9_:BitmapData;
         if(_loc9_ = this.GetBitmapData(param4,param5,param6,param7,param8))
         {
            param1.bitmapData.copyPixels(_loc9_,new Rectangle(0,0,_loc9_.width,_loc9_.height),new Point(param2,param3 + this.data.tileheight * param8 - _loc9_.height),null,null,true);
            return true;
         }
         return false;
      }
      
      public function GetBitmapData(param1:int, param2:int, param3:int, param4:Number = 1, param5:Number = 1) : BitmapData
      {
         var type:int = 0;
         var flip:int = 0;
         var bmpd:BitmapData = null;
         var tileX:int = param1;
         var tileY:int = param2;
         var layer:int = param3;
         var scaleX:Number = param4;
         var scaleY:Number = param5;
         try
         {
            type = this.data.GetCellType(layer,tileX,tileY);
            flip = this.data.GetCellFlipType(layer,tileX,tileY);
         }
         catch(err:Error)
         {
            return null;
         }
         if(type == 0)
         {
            return null;
         }
         var xFlip:Boolean = int(flip & 2) > 0;
         var yFlip:Boolean = int(flip & 1) > 0;
         bmpd = this.data.GetBitmapData(tileX,tileY,layer,xFlip,yFlip,scaleX,scaleY);
         return bmpd;
      }
      
      public function HasBitmapData(param1:int, param2:int, param3:int) : Boolean
      {
         return this.data.HasBitmapData(param1,param2,param3);
      }
      
      public function GetBitmapDataAllLayers(param1:int, param2:int) : Array
      {
         var _loc5_:int = 0;
         var _loc6_:BitmapData = null;
         var _loc3_:int = this.data.layerCount;
         var _loc4_:Array = [];
         _loc5_ = 0;
         while(_loc5_ < _loc3_)
         {
            if(_loc6_ = this.GetBitmapData(param1,param2,_loc5_))
            {
               _loc4_.push(_loc6_);
            }
            _loc5_++;
         }
         return _loc4_;
      }
   }
}
