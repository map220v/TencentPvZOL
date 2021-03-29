package org.allencuilib.map.tiled.display
{
   import asgui.geom.Rhomb;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import org.allencuilib.map.events.MapTiledEvent;
   import org.allencuilib.map.interfaces.IEveryModeMapBackground;
   import org.allencuilib.map.interfaces.IMapBackground;
   import org.allencuilib.map.interfaces.ITiledData;
   import org.allencuilib.map.interfaces.ITiledGraphicPainter;
   import org.allencuilib.map.tiled.TiledOrientation;
   import org.allencuilib.map.tiled.graphics.LayedTiledPlotData;
   import org.allencuilib.map.tiled.graphics.TiledGraphicData;
   import org.allencuilib.map.tiled.graphics.TiledGraphicPainter;
   import org.allencuilib.map.tiled.graphics.TiledObjectData;
   import org.allencuilib.map.tiled.graphics.TiledPlotData;
   import org.allencuilib.map.tiled.graphics.TiledPlotPaintedCounter;
   
   public class TiledBackground extends Sprite implements IMapBackground, IEveryModeMapBackground
   {
       
      
      private var _stageWidth:int;
      
      private var _stageHeight:int;
      
      private var plotWidth:int;
      
      private var plotHeight:int;
      
      private var plotDefaultColor:uint;
      
      private var plotTransparent:Boolean;
      
      public var _painter:ITiledGraphicPainter;
      
      private var plots:Array;
      
      private var painteds:Array;
      
      private var rhombZero:Rhomb;
      
      protected var plotLay:Sprite;
      
      protected var objectLay:Shape;
      
      protected var drawLay:Shape;
      
      protected var grapLay:Shape;
      
      public var maxDrawPerFrame:int = -1;
      
      private var rowMinAdd:int = 0;
      
      private var columnMinAdd:int = 0;
      
      private var rowMax:int = 0;
      
      private var columnMax:int = 0;
      
      private var _isOver:Boolean = true;
      
      private var _isShowRedRec:Boolean;
      
      private var _disposed:Boolean;
      
      public var zProperty:String = null;
      
      private var _data:ITiledData;
      
      private var _autoDisposeOutofRangedPlot:Boolean = true;
      
      private var _alwaysDrawOverTile:Boolean;
      
      public var alwaysDrawAllPlotsEdge:Boolean;
      
      public var alwaysDrawAllTiles:Boolean;
      
      private var _alwaysDrawObjectRect:Boolean;
      
      private var _autoScroll:Boolean = true;
      
      private var scrollChanged:Boolean = true;
      
      private var _scrollX:int;
      
      private var _scrollY:int;
      
      private var _minScrollX:int = 0;
      
      private var _minScrollY:int = 0;
      
      private var _maxScrollX:int;
      
      private var _maxScrollY:int;
      
      private var _overTileCell:Point;
      
      private var _overPlot:TiledPlot;
      
      public var _drawMode:String;
      
      private var _overTilePoint:Point;
      
      private var invalidateViewFlag:Boolean;
      
      private var forceUpdate:Boolean;
      
      private var invalidateObjectViewFlag:Boolean;
      
      private var invalidateOverFlag:Boolean;
      
      private var lastOverCell:Point;
      
      private var lastOverPlot:TiledPlot;
      
      public function TiledBackground(param1:int, param2:int, param3:int, param4:int, param5:uint = 0, param6:Boolean = false, param7:TiledGraphicData = null, param8:String = "rectangle", param9:Boolean = true)
      {
         super();
         this._stageWidth = param1;
         this._stageHeight = param2;
         this.plotDefaultColor = param5;
         this.plotTransparent = param6;
         this.plotLay = new Sprite();
         this.plotLay.mouseChildren = false;
         this.addChild(this.plotLay);
         this.objectLay = new Shape();
         this.objectLay.cacheAsBitmap = true;
         this.addChild(this.objectLay);
         this.drawLay = new Shape();
         this.addChild(this.drawLay);
         this.grapLay = new Shape();
         this.addChild(this.grapLay);
         this._drawMode = param8;
         this.plotWidth = param3;
         this.plotHeight = param4;
         if(param7)
         {
            this.SetData(param7);
         }
         this.addEventListener(Event.ENTER_FRAME,this.EnterFrameHandler);
         this.addEventListener(MouseEvent.ROLL_OVER,this.onOver);
         this.addEventListener(MouseEvent.ROLL_OUT,this.onOut);
         this._isShowRedRec = param9;
      }
      
      public function get painter() : ITiledGraphicPainter
      {
         return this._painter;
      }
      
      public function get isOver() : Boolean
      {
         return this._isOver;
      }
      
      protected function onOut(param1:MouseEvent) : void
      {
         this._isOver = false;
      }
      
      protected function onOver(param1:MouseEvent) : void
      {
         this._isOver = true;
      }
      
      public function Dispose() : void
      {
         var _loc1_:Bitmap = null;
         this.plots = null;
         this.lastOverPlot = null;
         this._overPlot = null;
         this.removeEventListener(Event.ENTER_FRAME,this.EnterFrameHandler);
         this.removeEventListener(MouseEvent.ROLL_OVER,this.onOver);
         this.removeEventListener(MouseEvent.ROLL_OUT,this.onOut);
         if(this.painter)
         {
            this.painter.Dispose();
            this._painter = null;
         }
         if(this.data)
         {
            this.data.removeEventListener(Event.COMPLETE,this.DataCompleteHandler);
            this._data.Dispose();
            this._data = null;
         }
         while(this.plotLay.numChildren > 0)
         {
            _loc1_ = this.plotLay.removeChildAt(0) as Bitmap;
            if(_loc1_)
            {
               _loc1_.bitmapData.dispose();
            }
         }
         while(this.numChildren > 0)
         {
            this.removeChildAt(0);
         }
         this._disposed = true;
      }
      
      public function get hasDisposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get data() : ITiledData
      {
         return this._data;
      }
      
      public function get autoDisposeOutofRangedPlot() : Boolean
      {
         return this._autoDisposeOutofRangedPlot;
      }
      
      public function set autoDisposeOutofRangedPlot(param1:Boolean) : void
      {
         this._autoDisposeOutofRangedPlot = param1;
      }
      
      public function get alwaysDrawOverTile() : Boolean
      {
         return this._alwaysDrawOverTile;
      }
      
      public function set alwaysDrawOverTile(param1:Boolean) : void
      {
         this._alwaysDrawOverTile = param1;
         this.InvalidateObjectView();
      }
      
      public function get alwaysDrawObjectRect() : Boolean
      {
         return this._alwaysDrawObjectRect;
      }
      
      public function set alwaysDrawObjectRect(param1:Boolean) : void
      {
         this._alwaysDrawObjectRect = param1;
      }
      
      public function get rows() : int
      {
         return this.data.width;
      }
      
      public function get columns() : int
      {
         return this.data.height;
      }
      
      public function get stageWidth() : int
      {
         return this._stageWidth;
      }
      
      public function get stageHeight() : int
      {
         return this._stageHeight;
      }
      
      public function get autoScroll() : Boolean
      {
         return this._autoScroll;
      }
      
      public function set autoScroll(param1:Boolean) : void
      {
         if(this._autoScroll != param1)
         {
            this._autoScroll = param1;
            if(!param1 && this.scrollRect != null)
            {
               this.scrollRect = null;
            }
         }
      }
      
      public function get scrollX() : int
      {
         return this._scrollX;
      }
      
      public function set scrollX(param1:int) : void
      {
         if(this._scrollX != param1)
         {
            this._scrollX = param1;
            this.InvalidateView();
            this.scrollChanged = true;
         }
      }
      
      public function get scrollY() : int
      {
         return this._scrollY;
      }
      
      public function set scrollY(param1:int) : void
      {
         if(this._scrollY != param1)
         {
            this._scrollY = param1;
            this.InvalidateView();
            this.scrollChanged = true;
         }
      }
      
      public function get minScrollX() : int
      {
         return this._minScrollX;
      }
      
      public function get minScrollY() : int
      {
         return this._minScrollY;
      }
      
      public function get maxScrollX() : int
      {
         return this._maxScrollX - this.stageWidth;
      }
      
      public function get maxScrollY() : int
      {
         return this._maxScrollY - this.stageHeight;
      }
      
      public function get overTileCell() : Point
      {
         return this._overTileCell;
      }
      
      public function set overTileCell(param1:Point) : void
      {
         if(!this._overTileCell || !param1 || !this._overTileCell.equals(param1))
         {
            this._overTileCell = param1;
            this.InvalidateOver();
         }
      }
      
      public function get overPlot() : TiledPlot
      {
         return this._overPlot;
      }
      
      public function get drawMode() : String
      {
         return this._drawMode;
      }
      
      public function get overTilePoint() : Point
      {
         return this._overTilePoint;
      }
      
      public function SetStageSize(param1:int, param2:int) : void
      {
         this._stageWidth = param1;
         this._stageHeight = param2;
         this.InvalidateView();
         this.dispatchEvent(new MapTiledEvent(MapTiledEvent.STAGE_SIZE_CHANGED));
      }
      
      public function GetTiledPlot(param1:int) : TiledPlot
      {
         if(param1 < 0 || param1 >= this.plotLay.numChildren)
         {
            return null;
         }
         return this.plotLay.getChildAt(param1) as TiledPlot;
      }
      
      public function Clear() : void
      {
         this.invalidateViewFlag = false;
         this.grapLay.graphics.clear();
         this.objectLay.graphics.clear();
         this.drawLay.graphics.clear();
         this.plots = [];
         this.painteds = [];
         while(this.plotLay.numChildren > 0)
         {
            (this.plotLay.removeChildAt(0) as TiledPlot).Dispose();
         }
      }
      
      public function SetData(param1:ITiledData, param2:int = 0, param3:int = 0, param4:int = 0, param5:int = 0) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         this.Clear();
         this._data = param1;
         this.data.addEventListener(Event.COMPLETE,this.DataCompleteHandler,false,0,true);
         this._painter = new TiledGraphicPainter(param1);
         if(param1.orientation == TiledOrientation.ORTHOGONAL)
         {
            this._maxScrollX = param1.width * param1.tilewidth;
            this._maxScrollY = param1.height * param1.tileheight;
         }
         else if(param1.orientation == TiledOrientation.ISOMETRIC)
         {
            this._maxScrollX = param1.height * param1.tilewidth / 2 + param1.width * param1.tilewidth / 2;
            this._maxScrollY = param1.width * param1.tileheight / 2 + param1.height * param1.tileheight / 2;
            this.rhombZero = new Rhomb(param1.height * param1.tilewidth / 2,0,param1.tilewidth,param1.tileheight,param1.yLength);
         }
         if(this.drawMode == TiledBackgroundDrawMode.EVERY)
         {
            _loc8_ = param1.width;
            _loc9_ = param1.height;
            this.plotWidth = param1.tilewidth;
            this.plotHeight = param1.tileheight;
         }
         else
         {
            _loc8_ = Math.ceil(this._maxScrollX / this.plotWidth);
            _loc9_ = Math.ceil(this._maxScrollY / this.plotHeight);
         }
         this._minScrollX = param2;
         this._minScrollY = param3;
         this._maxScrollX += param4;
         this._maxScrollY += param5;
         this.rowMinAdd = Math.floor(param2 / this.plotWidth);
         this.columnMinAdd = Math.floor(param3 / this.plotHeight);
         this.rowMax = _loc8_ + Math.ceil(param4 / this.plotWidth);
         this.columnMax = _loc9_ + Math.ceil(param5 / this.plotHeight);
         _loc6_ = this.rowMinAdd;
         while(_loc6_ < this.rowMax)
         {
            this.plots[_loc6_] = [];
            this.painteds[_loc6_] = [];
            _loc7_ = this.columnMinAdd;
            while(_loc7_ < this.columnMax)
            {
               this.plots[_loc6_][_loc7_] = null;
               this.painteds[_loc6_][_loc7_] = new TiledPlotPaintedCounter(_loc6_,_loc7_);
               _loc7_++;
            }
            _loc6_++;
         }
      }
      
      public function DrawAllTiles() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:TiledPlotData = null;
         _loc1_ = 0;
         while(_loc1_ < this.data.width)
         {
            _loc2_ = 0;
            while(_loc2_ < height)
            {
               if((_loc4_ = this.columns[_loc2_]) > 0)
               {
                  _loc6_ = this.data.tiles[_loc4_] as TiledPlotData;
                  if(this.zProperty)
                  {
                     _loc3_ = _loc6_.properties[this.zProperty];
                  }
                  this.DrawTile(_loc1_,_loc2_,true,_loc3_,2566979583,0,this.drawLay.graphics);
               }
               _loc2_++;
            }
            _loc1_++;
         }
      }
      
      public function DrawTile(param1:int, param2:int, param3:Boolean = true, param4:int = 0, param5:uint = 4.29490176E9, param6:uint = 0, param7:Graphics = null) : void
      {
         var _loc8_:* = 0;
         var _loc9_:Number = NaN;
         var _loc10_:Rhomb = null;
         if(!param7)
         {
            param7 = this.grapLay.graphics;
         }
         if(!param3)
         {
            param7.clear();
         }
         _loc8_ = param6 & 16777215;
         if((_loc9_ = int(param6 / 16777216) / 255) > 0)
         {
            param7.beginFill(_loc8_,_loc9_);
         }
         _loc8_ = param5 & 16777215;
         _loc9_ = int(param5 / 16777216) / 255;
         param7.lineStyle(3,_loc8_,_loc9_);
         if(this.data.orientation == TiledOrientation.ORTHOGONAL)
         {
            param7.drawRect(param1 * this.data.tilewidth,param2 * this.data.tileheight,this.data.tilewidth,this.data.tileheight);
         }
         else if(this.data.orientation == TiledOrientation.ISOMETRIC)
         {
            _loc10_ = this.rhombZero.OffsetRhombByTile(param1,param2);
            if(param4 == 0)
            {
               param7.moveTo(_loc10_.top.x,_loc10_.top.y);
               param7.lineTo(_loc10_.left.x,_loc10_.left.y);
               param7.lineTo(_loc10_.bottom.x,_loc10_.bottom.y);
               param7.lineTo(_loc10_.right.x,_loc10_.right.y);
               param7.lineTo(_loc10_.top.x,_loc10_.top.y);
            }
            else
            {
               param7.moveTo(_loc10_.top.x,_loc10_.top.y - param4);
               param7.lineTo(_loc10_.left.x,_loc10_.left.y - param4);
               param7.lineTo(_loc10_.bottom.x,_loc10_.bottom.y - param4);
               param7.lineTo(_loc10_.right.x,_loc10_.right.y - param4);
               param7.lineTo(_loc10_.top.x,_loc10_.top.y - param4);
               param7.lineStyle(1,_loc8_,_loc9_);
               param7.moveTo(_loc10_.top.x,_loc10_.top.y);
               param7.lineTo(_loc10_.left.x,_loc10_.left.y);
               param7.lineTo(_loc10_.bottom.x,_loc10_.bottom.y);
               param7.lineTo(_loc10_.right.x,_loc10_.right.y);
               param7.lineTo(_loc10_.top.x,_loc10_.top.y);
               param7.moveTo(_loc10_.top.x,_loc10_.top.y);
               param7.lineTo(_loc10_.top.x,_loc10_.top.y - param4);
               param7.moveTo(_loc10_.left.x,_loc10_.left.y);
               param7.lineTo(_loc10_.left.x,_loc10_.left.y - param4);
               param7.moveTo(_loc10_.bottom.x,_loc10_.bottom.y);
               param7.lineTo(_loc10_.bottom.x,_loc10_.bottom.y - param4);
               param7.moveTo(_loc10_.right.x,_loc10_.right.y);
               param7.lineTo(_loc10_.right.x,_loc10_.right.y - param4);
            }
         }
         param7.endFill();
      }
      
      public function DrawAllPlotsEdge(param1:Boolean = true) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = Math.ceil((this.maxScrollX + this.stageWidth) / this.plotWidth);
         var _loc5_:int = Math.ceil((this.maxScrollY + this.stageHeight) / this.plotHeight);
         _loc2_ = 0;
         while(_loc2_ < _loc4_)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc5_)
            {
               this.DrawPlotEdge(_loc2_,_loc3_,param1);
               _loc3_++;
            }
            _loc2_++;
         }
      }
      
      public function DrawPlotEdge(param1:int, param2:int, param3:Boolean = true, param4:uint = 4.278255615E9, param5:uint = 0, param6:Graphics = null) : void
      {
         var _loc9_:* = 0;
         var _loc10_:Number = NaN;
         var _loc7_:int = param1 * this.plotWidth;
         var _loc8_:int = param2 * this.plotHeight;
         if(param6 == null)
         {
            param6 = this.drawLay.graphics;
         }
         if(!param3)
         {
            param6.clear();
         }
         _loc9_ = param5 & 16777215;
         if((_loc10_ = int(param5 / 16777216) / 255) > 0)
         {
            param6.beginFill(_loc9_,_loc10_);
         }
         _loc9_ = param4 & 16777215;
         _loc10_ = int(param4 / 16777216) / 255;
         param6.lineStyle(1,_loc9_,_loc10_);
         param6.drawRect(_loc7_,_loc8_,this.plotWidth,this.plotHeight);
      }
      
      public function DrawRange(param1:Number, param2:Number, param3:Number, param4:Number = NaN, param5:Number = NaN, param6:Boolean = true) : void
      {
         var _loc7_:Point = null;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         if(!param6)
         {
            this.drawLay.graphics.clear();
         }
         if(this.data.orientation == TiledOrientation.ORTHOGONAL)
         {
            this.drawLay.graphics.lineStyle(2,16711680,0.8);
            this.drawLay.graphics.drawCircle(param1,param2,param3);
         }
         else if(this.data.orientation == TiledOrientation.ISOMETRIC)
         {
            this.drawLay.graphics.lineStyle(2,16711680,0.8);
            _loc7_ = this.TileToCoord(new Point(param1,param2));
            param3 *= Math.sqrt(this.data.tilewidth / this.data.tileheight);
            _loc8_ = param3 * this.data.tilewidth / this.data.tileheight;
            _loc9_ = param3;
            this.drawLay.graphics.drawEllipse(_loc7_.x - _loc8_ / 2,_loc7_.y - _loc9_ / 2,_loc8_,_loc9_);
         }
      }
      
      public function ClearDraw() : void
      {
         this.drawLay.graphics.clear();
      }
      
      public function DrawGrid(param1:Boolean = true) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Rhomb = null;
         var _loc6_:Rhomb = null;
         var _loc2_:Graphics = this.drawLay.graphics;
         if(!param1)
         {
            _loc2_.clear();
         }
         _loc2_.lineStyle(1,16776960);
         if(this.data.orientation == TiledOrientation.ORTHOGONAL)
         {
            _loc3_ = 0;
            while(_loc3_ < this.data.width)
            {
               _loc2_.moveTo(_loc3_ * this.data.tilewidth,0);
               _loc2_.lineTo(_loc3_ * this.data.tilewidth,this.data.stageheight);
               _loc3_++;
            }
            _loc4_ = 0;
            while(_loc4_ < this.data.height)
            {
               _loc2_.moveTo(0,_loc4_ * this.data.tileheight);
               _loc2_.lineTo(this.data.stagewidth,_loc4_ * this.data.tileheight);
               _loc4_++;
            }
         }
         else if(this.data.orientation == TiledOrientation.ISOMETRIC)
         {
            _loc3_ = 0;
            while(_loc3_ < this.data.width)
            {
               _loc5_ = this.rhombZero.OffsetRhombByTile(_loc3_,0);
               _loc6_ = this.rhombZero.OffsetRhombByTile(_loc3_,this.data.height);
               _loc2_.moveTo(_loc5_.x,_loc5_.y);
               _loc2_.lineTo(_loc6_.x,_loc6_.y);
               _loc3_++;
            }
            _loc3_ = 0;
            while(_loc3_ < this.data.height)
            {
               _loc5_ = this.rhombZero.OffsetRhombByTile(0,_loc3_);
               _loc6_ = this.rhombZero.OffsetRhombByTile(this.data.width,_loc3_);
               _loc2_.moveTo(_loc5_.x,_loc5_.y);
               _loc2_.lineTo(_loc6_.x,_loc6_.y);
               _loc3_++;
            }
         }
      }
      
      public function TileToCoord(param1:Point) : Point
      {
         if(this.data == null)
         {
            return null;
         }
         if(this.data.orientation == TiledOrientation.ORTHOGONAL)
         {
            return param1.clone();
         }
         if(this.data.orientation == TiledOrientation.ISOMETRIC)
         {
            return TiledOrientation.GetCoordByIsomTiledCell(param1.x / this.data.xLength,param1.y / this.data.yLength,this.data.width,this.data.height,this.data.tilewidth,this.data.tileheight);
         }
         return null;
      }
      
      public function CoordToTile(param1:Point) : Point
      {
         if(this.data == null)
         {
            return null;
         }
         if(this.data.orientation == TiledOrientation.ORTHOGONAL)
         {
            return param1.clone();
         }
         if(this.data.orientation == TiledOrientation.ISOMETRIC)
         {
            return this.rhombZero.CoordToIsometric(param1.x,param1.y);
         }
         return null;
      }
      
      public function UpdateOverTile() : void
      {
         this._overTilePoint = this.CoordToTile(new Point(this.mouseX,this.mouseY));
         if(this.data.orientation == TiledOrientation.ORTHOGONAL)
         {
            this.overTileCell = new Point(int(this._overTilePoint.x / this.data.tilewidth),int(this._overTilePoint.y / this.data.tileheight));
         }
         else if(this.data.orientation == TiledOrientation.ISOMETRIC)
         {
            this.overTileCell = this.rhombZero.OffsetTileByIsometric(this._overTilePoint.x,this._overTilePoint.y);
         }
      }
      
      public function GetTiledPlotByPixel(param1:int, param2:int) : TiledPlot
      {
         var _loc3_:int = 0;
         var _loc4_:TiledPlot = null;
         var _loc5_:int;
         _loc3_ = (_loc5_ = this.plotLay.numChildren) - 1;
         while(_loc3_ >= 0)
         {
            if((_loc4_ = this.plotLay.getChildAt(_loc3_) as TiledPlot).GetPixel(param1 - _loc4_.x,param2 - _loc4_.y) > 0)
            {
               return _loc4_;
            }
            _loc3_--;
         }
         return null;
      }
      
      public function InvalidateView(param1:Boolean = false) : void
      {
         this.forceUpdate = param1;
         this.invalidateViewFlag = true;
      }
      
      public function ValidateView() : void
      {
         var _loc1_:Point = null;
         var _loc2_:int = 0;
         var _loc3_:TiledPlotPaintedCounter = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:TiledPlot = null;
         var _loc12_:Array = null;
         var _loc13_:Rectangle = null;
         var _loc14_:int = 0;
         var _loc15_:Array = null;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:LayedTiledPlotData = null;
         if(this.invalidateViewFlag)
         {
            _loc2_ = 0;
            if(!this.data || !this.data.hasCompleted)
            {
               return;
            }
            if(this.painter)
            {
               if(this.scrollChanged)
               {
                  if(this.autoScroll)
                  {
                     _loc13_ = new Rectangle(this.scrollX,this.scrollY,this.stageWidth,this.stageHeight);
                     if(this.scrollRect == null || !this.scrollRect.equals(_loc13_))
                     {
                        this.scrollRect = _loc13_;
                     }
                  }
                  this.dispatchEvent(new MapTiledEvent(MapTiledEvent.SCROLLING));
                  this.scrollChanged = false;
               }
               _loc4_ = Math.floor(this.scrollX / this.plotWidth);
               _loc5_ = Math.floor(this.scrollY / this.plotHeight);
               _loc6_ = Math.ceil((this.scrollX + this.stageWidth) / this.plotWidth);
               _loc7_ = Math.ceil((this.scrollY + this.stageHeight) / this.plotHeight);
               _loc12_ = this.plots;
               if(this.drawMode == TiledBackgroundDrawMode.RECTANGLE || this.drawMode == TiledBackgroundDrawMode.BAKED)
               {
                  _loc8_ = _loc4_ - 3;
                  while(_loc8_ < _loc6_ + 4)
                  {
                     _loc9_ = _loc5_ - 3;
                     while(_loc9_ < _loc7_ + 4)
                     {
                        if(!(_loc8_ < 0 || _loc9_ < 0 || _loc12_[_loc8_] == null))
                        {
                           _loc11_ = _loc12_[_loc8_][_loc9_] as TiledPlot;
                           _loc3_ = this.painteds[_loc8_][_loc9_] as TiledPlotPaintedCounter;
                           if(_loc3_ != null)
                           {
                              if(this.forceUpdate)
                              {
                                 _loc3_.Reset();
                              }
                              if(_loc8_ >= _loc4_ && _loc8_ < _loc6_ && _loc9_ >= _loc5_ && _loc9_ < _loc7_)
                              {
                                 _loc14_ = this.maxDrawPerFrame > 0 ? int(this.maxDrawPerFrame - _loc2_) : 16777215;
                                 _loc1_ = new Point(_loc8_ * this.plotWidth,_loc9_ * this.plotHeight);
                                 if(!_loc11_)
                                 {
                                    (_loc11_ = new TiledPlot(new BitmapData(this.plotWidth,this.plotHeight,this.plotTransparent,this.plotDefaultColor),_loc8_,_loc9_)).SetRectanglePosition(_loc1_);
                                    _loc12_[_loc8_][_loc9_] = _loc11_;
                                    this.plotLay.addChild(_loc11_);
                                 }
                                 if(_loc14_ > 0)
                                 {
                                    if(!_loc3_.meeted)
                                    {
                                       _loc2_ += this.painter.DrawBitmapByCoordinate(_loc11_,_loc1_.x,_loc1_.y,_loc3_,_loc14_,1,1,this.drawMode);
                                    }
                                 }
                              }
                              else if(this.autoDisposeOutofRangedPlot && _loc11_)
                              {
                                 (this.plotLay.removeChild(_loc11_) as TiledPlot).Dispose();
                                 _loc12_[_loc8_][_loc9_] = null;
                                 _loc3_.Reset();
                              }
                           }
                        }
                        _loc9_++;
                     }
                     _loc8_++;
                  }
                  _loc8_ = 0;
                  while(_loc8_ < this.plotLay.numChildren)
                  {
                     if((_loc11_ = this.plotLay.getChildAt(_loc8_) as TiledPlot).row < _loc4_ || _loc11_.row >= _loc6_ || _loc11_.column < _loc5_ || _loc11_.column >= _loc7_)
                     {
                        _loc11_.Dispose();
                        _loc3_ = this.painteds[_loc11_.row][_loc11_.column] as TiledPlotPaintedCounter;
                        _loc12_[_loc11_.row][_loc11_.column] = null;
                        _loc3_.Reset();
                        this.plotLay.removeChild(_loc11_);
                        _loc8_--;
                     }
                     _loc8_++;
                  }
                  if(this.maxDrawPerFrame < 0 || _loc2_ < this.maxDrawPerFrame)
                  {
                     this.invalidateViewFlag = false;
                     this.forceUpdate = false;
                  }
               }
               else if(this.drawMode == TiledBackgroundDrawMode.EVERY)
               {
                  this.rowMax = _loc12_.length;
                  _loc8_ = 0;
                  while(_loc8_ < this.rowMax)
                  {
                     this.columnMax = (_loc12_[_loc8_] as Array).length;
                     _loc9_ = 0;
                     while(_loc9_ < this.columnMax)
                     {
                        if(!(_loc11_ = _loc12_[_loc8_][_loc9_] as TiledPlot))
                        {
                           if(this.maxDrawPerFrame < 0 || _loc2_ < this.maxDrawPerFrame)
                           {
                              _loc15_ = [];
                              _loc16_ = 0;
                              _loc17_ = 0;
                              _loc10_ = 0;
                              while(_loc10_ < this.data.layerCount)
                              {
                                 _loc18_ = this.data.GetLayedPlotData(_loc8_,_loc9_,_loc10_);
                                 _loc15_.push(_loc18_);
                                 if(_loc16_ < _loc18_.bmpdWidth)
                                 {
                                    _loc16_ = _loc18_.bmpdWidth;
                                 }
                                 if(_loc17_ < _loc18_.bmpdHeight)
                                 {
                                    _loc17_ = _loc18_.bmpdHeight;
                                 }
                                 _loc10_++;
                              }
                              if(!(_loc16_ == 0 && _loc17_ == 0))
                              {
                                 _loc11_ = new TiledPlot(new BitmapData(_loc16_,_loc17_,this.plotTransparent,this.plotDefaultColor),_loc8_,_loc9_);
                                 _loc10_ = 0;
                                 while(_loc10_ < this.data.layerCount)
                                 {
                                    _loc18_ = _loc15_[_loc10_];
                                    this.painter.DrawBitmap(_loc11_,0,-this.data.tileheight + _loc17_,_loc8_,_loc9_,_loc10_);
                                    _loc10_++;
                                 }
                                 _loc1_ = this.TileToCoord(new Point((_loc8_ + 0) * this.data.xLength,(_loc9_ + 1) * this.data.yLength));
                                 _loc11_.SetEveryPosition(_loc1_,this.data.tileheight);
                                 _loc12_[_loc8_][_loc9_] = _loc11_;
                                 this.plotLay.addChild(_loc11_);
                                 (this.painteds[_loc8_][_loc9_] as TiledPlotPaintedCounter).SetMeeted();
                                 _loc2_++;
                              }
                           }
                        }
                        _loc9_++;
                     }
                     _loc8_++;
                  }
                  if(this.maxDrawPerFrame < 0 || _loc2_ < this.maxDrawPerFrame)
                  {
                     this.invalidateViewFlag = false;
                     this.forceUpdate = false;
                  }
               }
               else if(this.drawMode == TiledBackgroundDrawMode.BAKED)
               {
               }
            }
         }
      }
      
      public function InvalidateObjectView() : void
      {
         this.invalidateObjectViewFlag = true;
      }
      
      public function ValidateObjectView() : void
      {
         var _loc1_:int = 0;
         var _loc2_:TiledObjectData = null;
         var _loc3_:int = 0;
         var _loc4_:Vector.<int> = null;
         this.objectLay.graphics.clear();
         if(this.alwaysDrawObjectRect)
         {
            _loc3_ = this.data.objects.length;
            _loc1_ = 0;
            while(_loc1_ < _loc3_)
            {
               _loc2_ = this.data.objects[_loc1_] as TiledObjectData;
               this.objectLay.graphics.lineStyle(3,_loc2_.color,1);
               this.objectLay.graphics.beginFill(_loc2_.color,0.3);
               (_loc4_ = new Vector.<int>(5,true))[0] = 1;
               _loc4_[1] = 2;
               _loc4_[2] = 2;
               _loc4_[3] = 2;
               _loc4_[4] = 2;
               this.objectLay.graphics.drawPath(_loc4_,_loc2_.GetDrawDataVector(this.TileToCoord));
               _loc1_++;
            }
            this.objectLay.graphics.endFill();
         }
         this.invalidateObjectViewFlag = false;
      }
      
      public function InvalidateOver() : void
      {
         this.invalidateOverFlag = true;
         var _loc1_:Point = new Point(int(this.overTileCell.x),int(this.overTileCell.y));
         if(this.lastOverCell == null || !this.lastOverCell.equals(_loc1_))
         {
            this.DispatchMapTiledEvent(MapTiledEvent.OVER_CELL_CHANGED);
            this.lastOverCell = _loc1_;
         }
         var _loc2_:TiledPlot = this.GetTiledPlotByPixel(mouseX,mouseY);
         if(_loc2_ == null || this.lastOverPlot != _loc2_)
         {
            this._overPlot = _loc2_;
            this.DispatchMapTiledEvent(MapTiledEvent.OVER_PLOT_CHANGED);
            this.lastOverPlot = _loc2_;
         }
      }
      
      public function ValidateOver() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(!this.data.hasCompleted)
         {
            return;
         }
         if(this.alwaysDrawOverTile)
         {
            _loc1_ = 0;
            _loc2_ = this.overTileCell.x;
            _loc3_ = this.overTileCell.y;
            if(this.zProperty)
            {
               if(_loc2_ >= 0 && _loc3_ >= 0)
               {
                  if((_loc4_ = this.data.GetCellType(0,_loc2_,_loc3_)) > 0 && this.data.tiles.length > _loc4_)
                  {
                     _loc1_ = int((this.data.tiles[_loc4_] as TiledPlotData).properties.Get(this.zProperty));
                  }
               }
            }
            if(this._isShowRedRec)
            {
               this.DrawTile(_loc2_,_loc3_,false,_loc1_);
            }
         }
         this.invalidateOverFlag = false;
      }
      
      private function DispatchMapTiledEvent(param1:String) : void
      {
         var _loc2_:MapTiledEvent = new MapTiledEvent(param1);
         _loc2_.overCell = new Point(int(this.overTileCell.x),int(this.overTileCell.y));
         _loc2_.overPlot = this.overPlot;
         _loc2_.lastOverCell = this.lastOverCell;
         _loc2_.lastOverPlot = this.lastOverPlot;
         this.dispatchEvent(_loc2_);
      }
      
      private function DataUpdateHandler(param1:Event) : void
      {
         this.InvalidateView();
      }
      
      private function DataCompleteHandler(param1:Event) : void
      {
         if(this.alwaysDrawAllTiles)
         {
            this.DrawGrid();
         }
         if(this.alwaysDrawAllPlotsEdge)
         {
            this.DrawAllPlotsEdge();
         }
         this.InvalidateView();
      }
      
      private function EnterFrameHandler(param1:Event) : void
      {
         if(!this.data)
         {
            return;
         }
         this.UpdateOverTile();
         if(this.invalidateOverFlag)
         {
            this.ValidateOver();
         }
         if(this.invalidateObjectViewFlag)
         {
            this.ValidateObjectView();
         }
         this.ValidateView();
      }
   }
}
