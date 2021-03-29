package org.allencuilib.map.tiled.graphics
{
   import asgui.blit.data.BlitData;
   import asgui.blit.data.BlitDataManager;
   import asgui.blit.data.BlitFrameData;
   import asgui.core.IDisposable;
   import asgui.geom.Rhomb;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   import org.allencuilib.map.interfaces.ITiledData;
   import org.allencuilib.map.interfaces.ITiledPlotData;
   import org.allencuilib.map.tiled.TiledOrientation;
   import org.allencuilib.map.tiled.TiledResource;
   import org.allencuilib.map.tiled.tmx.TmxCell;
   import org.allencuilib.map.tiled.tmx.TmxLayer;
   import org.allencuilib.map.tiled.tmx.TmxObject;
   import org.allencuilib.map.tiled.tmx.TmxObjectgroup;
   import org.allencuilib.map.tiled.tmx.TmxTemplate;
   import org.allencuilib.map.tiled.tmx.TmxTileset;
   
   public class TiledGraphicData extends EventDispatcher implements ITiledData, IDisposable
   {
       
      
      public var ignoredResource:Vector.<String>;
      
      public var imageSourceReturnFunc:Function;
      
      protected var _layers:Vector.<Vector.<Vector.<int>>>;
      
      protected var _layerFlips:Vector.<Vector.<Vector.<int>>>;
      
      public var _tiles:Vector.<TiledPlotData>;
      
      public var _objects:Vector.<TiledObjectData>;
      
      private var _maxBmpWidth:int;
      
      private var _maxBmpHeight:int;
      
      private var _tilelength:Number;
      
      private var resourceFolder:String;
      
      private var loadTimer:Timer;
      
      private var tmx:TmxTemplate;
      
      protected var layedPlotDatas:Array;
      
      public var ignoreBitmapDataSource:Boolean = false;
      
      private var coordByIsomTiledCellCache:Array;
      
      private var _tiledGraphicDataOption:Object;
      
      private var _hasDisposed:Boolean;
      
      private var _rhombZero:Rhomb;
      
      private var _hasCompleted:Boolean;
      
      protected var _width:int;
      
      protected var _height:int;
      
      private var _tilewidth:int;
      
      private var _tileheight:int;
      
      private var _orientation:String;
      
      private var tmxTilesetLoading:Array;
      
      private var blitDataLoading:Array;
      
      private var _thumb:BitmapData;
      
      private var needLoadThumb:Boolean;
      
      public function TiledGraphicData(param1:Object = null)
      {
         var _loc2_:BlitData = null;
         this.ignoredResource = new Vector.<String>();
         this.imageSourceReturnFunc = this.defaultImageSourceReturnFunc;
         this._layers = new Vector.<Vector.<Vector.<int>>>();
         this._layerFlips = new Vector.<Vector.<Vector.<int>>>();
         this._tiles = new Vector.<TiledPlotData>();
         this._objects = new Vector.<TiledObjectData>();
         this.coordByIsomTiledCellCache = [];
         this.tmxTilesetLoading = [];
         this.blitDataLoading = [];
         super();
         this._tiledGraphicDataOption = param1;
         if(param1)
         {
            if(param1.hasOwnProperty("width"))
            {
               this._width = param1.width;
            }
            if(param1.hasOwnProperty("height"))
            {
               this._height = param1.height;
            }
            if(param1.hasOwnProperty("tilewidth"))
            {
               this._tilewidth = param1.tilewidth;
            }
            if(param1.hasOwnProperty("tileheight"))
            {
               this._tileheight = param1.tileheight;
            }
            if(param1.hasOwnProperty("tilelength"))
            {
               this._tilelength = param1.tilelength;
            }
            if(param1.hasOwnProperty("orientation"))
            {
               this._orientation = param1.orientation;
            }
            if(param1.hasOwnProperty("resourceFolder"))
            {
               this.resourceFolder = param1.resourceFolder;
            }
            if(param1.hasOwnProperty("ignoreBitmapDataSource"))
            {
               this.ignoreBitmapDataSource = param1.ignoreBitmapDataSource;
            }
            if(param1.hasOwnProperty("thumbUrl"))
            {
               _loc2_ = BlitDataManager.GetBlitDataByUrl(param1.thumbUrl);
               if(_loc2_.hasContent)
               {
                  if(_loc2_.totalFrames > 0)
                  {
                     this._thumb = _loc2_.GetFrame(0).bitmapData;
                  }
               }
               else
               {
                  _loc2_.addEventListener(Event.COMPLETE,this.ThumbLoadCompleteHandler);
                  _loc2_.addEventListener(IOErrorEvent.IO_ERROR,this.ThumbLoadIoErrorHandler);
                  this.needLoadThumb = true;
                  this.CheckLoadTimerStart();
               }
            }
         }
         this.InitVector();
      }
      
      private function defaultImageSourceReturnFunc(param1:String) : String
      {
         return param1;
      }
      
      public function GetCellType(param1:int, param2:int, param3:int) : int
      {
         return this._layers[param1][param2][param3];
      }
      
      public function GetCellFlipType(param1:int, param2:int, param3:int) : int
      {
         return this._layerFlips[param1][param2][param3];
      }
      
      public function get tiles() : Vector.<TiledPlotData>
      {
         return this._tiles;
      }
      
      public function get objects() : Vector.<TiledObjectData>
      {
         return this._objects;
      }
      
      public function get tiledGraphicDataOption() : Object
      {
         return this._tiledGraphicDataOption;
      }
      
      public function LoadTmx(param1:XML, param2:String = "") : void
      {
         var _loc3_:int = 0;
         var _loc4_:String = "";
         var _loc5_:TmxTemplate = new TmxTemplate(param1,param2);
         this._width = _loc5_.width;
         this._height = _loc5_.height;
         this._tilewidth = _loc5_.tilewidth;
         this._tileheight = _loc5_.tileheight;
         this._tilelength = _loc5_.tileheight;
         this._orientation = _loc5_.orientation;
         this.resourceFolder = param2;
         _loc3_ = 0;
         while(_loc3_ < _loc5_.layers.length)
         {
            this.AddTmxLayer(_loc5_.layers[_loc3_] as TmxLayer);
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < _loc5_.tilesets.length)
         {
            this.AddTmxTileset(_loc5_.tilesets[_loc3_] as TmxTileset);
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < _loc5_.objectgroups.length)
         {
            this.AddTmxObjectgroup(_loc5_.objectgroups[_loc3_] as TmxObjectgroup);
            _loc3_++;
         }
         this.tmx = _loc5_;
         this.InitVector();
      }
      
      public function InitVector() : void
      {
      }
      
      public function get hasDisposed() : Boolean
      {
         return this._hasDisposed;
      }
      
      public function Dispose() : void
      {
         if(this.loadTimer != null)
         {
            this.loadTimer.removeEventListener(TimerEvent.TIMER,this.LoadTimerHandler);
            this.loadTimer.stop();
            this.loadTimer = null;
         }
         this._layers = null;
         this._tiles = null;
         this._objects = null;
         this.tmx = null;
         this.layedPlotDatas = null;
         this._thumb = null;
         this._hasDisposed = true;
      }
      
      public function GetTiledPlotDataMemSize() : int
      {
         var _loc1_:int = 0;
         var _loc3_:int = 0;
         var _loc2_:int = this.tiles.length;
         _loc1_ = 1;
         while(_loc1_ < _loc2_)
         {
            if(this.tiles[_loc1_] != null)
            {
               _loc3_ += (this.tiles[_loc1_] as TiledPlotData).GetMemSize();
            }
            _loc1_++;
         }
         return _loc3_;
      }
      
      public function GetGridsByCheckFunction(param1:Function) : Vector.<TmxCell>
      {
         return this.tmx.GetGridsByCheckFunction(param1);
      }
      
      public function get rhombZero() : Rhomb
      {
         if(!this._rhombZero)
         {
            this._rhombZero = new Rhomb(this.height * this.tilewidth / 2,0,this.tilewidth,this.tileheight,this.yLength);
         }
         return this._rhombZero;
      }
      
      public function get hasCompleted() : Boolean
      {
         return this._hasCompleted;
      }
      
      public function get layerCount() : int
      {
         return this._layers.length;
      }
      
      public function get width() : int
      {
         return this._width;
      }
      
      public function get height() : int
      {
         return this._height;
      }
      
      public function get tilewidth() : int
      {
         return this._tilewidth;
      }
      
      public function get tileheight() : int
      {
         return this._tileheight;
      }
      
      public function get xLength() : Number
      {
         switch(this.orientation)
         {
            case TiledOrientation.ORTHOGONAL:
               return this.tilewidth;
            case TiledOrientation.ISOMETRIC:
               return this._tilelength;
            default:
               return 1;
         }
      }
      
      public function get yLength() : Number
      {
         switch(this.orientation)
         {
            case TiledOrientation.ORTHOGONAL:
               return this.tileheight;
            case TiledOrientation.ISOMETRIC:
               return this._tilelength;
            default:
               return 1;
         }
      }
      
      public function get stagewidth() : int
      {
         return this.tilewidth * this.width;
      }
      
      public function get stageheight() : int
      {
         return this.tileheight * this.height;
      }
      
      public function get orientation() : String
      {
         return this._orientation;
      }
      
      public function AddTmxLayer(param1:TmxLayer) : void
      {
         this._layers.push(param1.GetTileIntArray());
         this._layerFlips.push(param1.GetFlipIntArray());
      }
      
      private function CheckLoadTimerStart() : void
      {
         if(this.loadTimer == null)
         {
            this.loadTimer = new Timer(100);
            this.loadTimer.addEventListener(TimerEvent.TIMER,this.LoadTimerHandler);
            this.loadTimer.start();
         }
      }
      
      public function AddTmxTileset(param1:TmxTileset, param2:BlitData = null) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:TiledPlotData = null;
         var _loc6_:BitmapData = null;
         var _loc9_:BlitFrameData = null;
         this.CheckLoadTimerStart();
         if(!param1.hasLoaded)
         {
            param1.addEventListener(Event.COMPLETE,this.TilesetCompleteHandler,false,0,true);
            this.tmxTilesetLoading.push(param1);
            return;
         }
         var _loc7_:Rectangle = new Rectangle();
         var _loc8_:Boolean = false;
         if(this.ignoreBitmapDataSource)
         {
            _loc8_ = true;
         }
         else
         {
            _loc3_ = 0;
            while(_loc3_ < this.ignoredResource.length)
            {
               if(param1.imageSource == this.ignoredResource[_loc3_])
               {
                  _loc8_ = true;
                  break;
               }
               _loc3_++;
            }
         }
         if(_loc8_)
         {
            this.UpdateTiledSetData(param1);
         }
         else
         {
            if(param2 == null)
            {
               param2 = BlitDataManager.GetBlitDataByUrl(TiledResource.urlChangeFunc(this.resourceFolder + this.imageSourceReturnFunc(param1.imageSource)),false,65535,false,param1.trans);
            }
            if(param2.hasContent)
            {
               _loc9_ = param2.GetFrame(0);
               this.UpdateTiledSetData(param1,_loc9_.bitmapData);
            }
            else
            {
               param2.addEventListener(Event.COMPLETE,this.TmxBlitDataCompleteHandler);
               this.blitDataLoading.push(param1);
            }
         }
      }
      
      protected function UpdateTiledSetData(param1:TmxTileset, param2:BitmapData = null, param3:Boolean = true) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:TiledPlotData = null;
         var _loc7_:BitmapData = null;
         var _loc11_:int = 0;
         if(this.hasDisposed)
         {
            return;
         }
         var _loc8_:Rectangle = new Rectangle();
         var _loc9_:int = param1.imageWidth / param1.tilewidth;
         var _loc10_:int = param1.imageHeight / param1.tileheight;
         _loc4_ = 0;
         while(_loc4_ < _loc9_)
         {
            _loc5_ = 0;
            while(_loc5_ < _loc10_)
            {
               _loc8_.x = param1.margin + _loc4_ * (param1.tilewidth + param1.spacing);
               _loc8_.y = param1.margin + _loc5_ * (param1.tileheight + param1.spacing);
               _loc8_.width = param1.tilewidth;
               _loc8_.height = param1.tileheight;
               if(param3 && param2 != null)
               {
                  (_loc7_ = new BitmapData(param1.tilewidth,param1.tileheight,true,0)).copyPixels(param2,_loc8_,new Point(0,0),null,null,true);
                  if(_loc7_.width > this._maxBmpWidth)
                  {
                     this._maxBmpWidth = _loc7_.width;
                  }
                  if(_loc7_.height > this._maxBmpHeight)
                  {
                     this._maxBmpHeight = _loc7_.height;
                  }
               }
               (_loc6_ = new TiledPlotData(_loc7_)).LoadTmxTileset(param1);
               _loc6_.LoadTmxTile(param1.GetTmxTileByIndex(_loc4_ + _loc5_ * _loc9_));
               _loc11_ = param1.firstgid + _loc4_ + _loc5_ * _loc9_;
               if(this._tiles.length < _loc11_)
               {
                  this._tiles.length = _loc11_;
               }
               this._tiles[_loc11_] = _loc6_;
               _loc5_++;
            }
            _loc4_++;
         }
      }
      
      public function AddTmxObjectgroup(param1:TmxObjectgroup) : void
      {
         var _loc2_:int = 0;
         var _loc3_:TmxObject = null;
         var _loc4_:TiledObjectData = null;
         _loc2_ = 0;
         while(_loc2_ < param1.objects.length)
         {
            _loc3_ = param1.objects[_loc2_] as TmxObject;
            (_loc4_ = new TiledObjectData()).LoadTmxObjectgroup(param1);
            _loc4_.LoadTmxObject(_loc3_);
            this._objects.push(_loc4_);
            _loc2_++;
         }
      }
      
      public function GetObjectDatas(param1:int, param2:int) : Vector.<TiledObjectData>
      {
         var _loc3_:int = 0;
         var _loc4_:TiledObjectData = null;
         var _loc5_:int = this._objects.length;
         var _loc6_:Vector.<TiledObjectData> = new Vector.<TiledObjectData>();
         var _loc7_:Point = new Point(param1 * this.xLength,param2 * this.yLength);
         _loc3_ = 0;
         while(_loc3_ < _loc5_)
         {
            if((_loc4_ = this._objects[_loc3_] as TiledObjectData).rect.containsPoint(_loc7_))
            {
               _loc6_.push(_loc4_);
            }
            _loc3_++;
         }
         return _loc6_;
      }
      
      public function GetObjectDatasByRangeAndType(param1:Rectangle = null, param2:String = null) : Vector.<TiledObjectData>
      {
         var _loc4_:int = 0;
         var _loc5_:TiledObjectData = null;
         var _loc3_:Vector.<TiledObjectData> = new Vector.<TiledObjectData>();
         var _loc6_:int = this._objects.length;
         _loc4_ = 0;
         for(; _loc4_ < _loc6_; _loc4_++)
         {
            _loc5_ = this._objects[_loc4_] as TiledObjectData;
            if(param1)
            {
               if(!param1.contains(_loc5_.cellX,_loc5_.cellY))
               {
                  continue;
               }
            }
            if(param2 != null)
            {
               if(param2 != _loc5_.type)
               {
                  continue;
               }
            }
            _loc3_.push(_loc5_);
         }
         return _loc3_;
      }
      
      public function GetBitmapData(param1:int, param2:int, param3:int, param4:Boolean = false, param5:Boolean = false, param6:Number = 1, param7:Number = 1) : BitmapData
      {
         var _loc8_:ITiledPlotData;
         if((_loc8_ = this.GetTiledPlotData(param1,param2,param3)) != null)
         {
            return _loc8_.GetBitmapData(param4,param5,param6,param7);
         }
         return null;
      }
      
      public function GetTiledPlotData(param1:int, param2:int, param3:int) : ITiledPlotData
      {
         var _loc4_:int;
         if((_loc4_ = this.GetCellType(param3,param1,param2)) == 0)
         {
            return null;
         }
         if(this._tiles[_loc4_] == null)
         {
            return null;
         }
         return this._tiles[_loc4_];
      }
      
      public function HasBitmapData(param1:int, param2:int, param3:int) : Boolean
      {
         return this.GetCellType(param3,param1,param2) > 0;
      }
      
      public function GetTilesArrayPropertyValue(param1:String, param2:int = 0) : Vector.<Vector.<String>>
      {
         return this.tmx.GetTilesArrayPropertyValue(param1,param2);
      }
      
      public function GetThumb() : BitmapData
      {
         return this._thumb;
      }
      
      public function GetCopyPixelsObjectsByArea(param1:int, param2:int, param3:int, param4:int) : Array
      {
         return this.GetCopyPixelsObjectsByAreaORTHOGONAL(param1,param2,param3,param4);
      }
      
      protected function GetCopyPixelsObjectsByAreaORTHOGONAL(param1:int, param2:int, param3:int, param4:int) : Array
      {
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:ITiledPlotData = null;
         var _loc17_:LayedTiledPlotData = null;
         var _loc5_:int = getTimer();
         var _loc6_:Array = [];
         if(param3 == 0 || param4 == 0)
         {
            return _loc6_;
         }
         var _loc7_:int = this.layerCount;
         var _loc8_:int = this.tilewidth;
         var _loc9_:int = this.tileheight;
         var _loc10_:int = this.width;
         var _loc11_:int = this.height;
         var _loc16_:Point = new Point();
         var _loc18_:Rectangle = new Rectangle();
         var _loc19_:Rectangle = new Rectangle(param1,param2,param3,param4);
         var _loc20_:Point = this.rhombZero.CoordToIsometric(param1 - this._maxBmpWidth,param2);
         var _loc21_:Point = this.rhombZero.CoordToIsometric(param1 + param3,param2);
         var _loc22_:Point = this.rhombZero.CoordToIsometric(param1 + param3,param2 + param4 + this._maxBmpHeight);
         var _loc23_:Point = this.rhombZero.CoordToIsometric(param1 - this._maxBmpWidth,param2 + param4 + this._maxBmpHeight);
         var _loc24_:int = Math.min(Math.max(Math.floor(_loc20_.x / this.xLength),0),_loc10_);
         var _loc25_:int = Math.min(Math.max(Math.floor(_loc21_.y / this.yLength),0),_loc11_);
         var _loc26_:int = Math.min(Math.max(Math.ceil(_loc22_.x / this.xLength),0),_loc10_);
         var _loc27_:int = Math.min(Math.max(Math.ceil(_loc23_.y / this.yLength),0),_loc11_);
         _loc12_ = 0;
         while(_loc12_ < _loc7_)
         {
            _loc13_ = _loc24_;
            while(_loc13_ <= _loc26_)
            {
               _loc14_ = _loc25_;
               while(_loc14_ <= _loc27_)
               {
                  if(!((_loc17_ = this.GetLayedPlotData(_loc13_,_loc14_,_loc12_)) == null || !_loc17_.hasData))
                  {
                     if(_loc19_.intersects(_loc17_.recForStage))
                     {
                        _loc6_.push(new TiledCopyPixelsObject(_loc17_,param1,param2));
                     }
                  }
                  _loc14_++;
               }
               _loc13_++;
            }
            _loc12_++;
         }
         var _loc28_:int = getTimer();
         var _loc29_:int = (_loc26_ - _loc24_ + 1) * (_loc27_ - _loc25_ + 1);
         return _loc6_;
      }
      
      public function GetCoordByIsomTiledCell(param1:int, param2:int) : Point
      {
         var _loc3_:Point = null;
         if(this.coordByIsomTiledCellCache[param1] == null)
         {
            this.coordByIsomTiledCellCache[param1] = [];
         }
         if(this.coordByIsomTiledCellCache[param1][param2] == null)
         {
            _loc3_ = TiledOrientation.GetCoordByIsomTiledCell(param1,param2,this.width,this.height,this.tilewidth,this.tileheight);
            this.coordByIsomTiledCellCache[param1][param2] = _loc3_;
         }
         return this.coordByIsomTiledCellCache[param1][param2];
      }
      
      public function GetLayedPlotData(param1:int, param2:int, param3:int) : LayedTiledPlotData
      {
         var _loc4_:LayedTiledPlotData = null;
         var _loc5_:ITiledPlotData = null;
         var _loc6_:Point = null;
         if(param3 >= this.layerCount || param1 >= this.width || param2 >= this.height)
         {
            return null;
         }
         if(this.layedPlotDatas == null)
         {
            this.layedPlotDatas = [];
         }
         if(this.layedPlotDatas[param3] == null)
         {
            this.layedPlotDatas[param3] = [];
         }
         if(this.layedPlotDatas[param3][param1] == null)
         {
            this.layedPlotDatas[param3][param1] = [];
         }
         if(this.layedPlotDatas[param3][param1][param2] == null)
         {
            _loc5_ = this.GetTiledPlotData(param1,param2,param3);
            _loc6_ = this.GetCoordByIsomTiledCell(param1,param2);
            if(_loc5_)
            {
               _loc4_ = new LayedTiledPlotData(_loc6_.x,_loc6_.y,param1,param2,param3,-this.tilewidth / 2,this.tileheight - _loc5_.height,_loc5_.width,_loc5_.height);
            }
            else
            {
               _loc4_ = new LayedTiledPlotData(_loc6_.x,_loc6_.y,param1,param2,param3,-this.tilewidth / 2,this.tileheight);
            }
            this.layedPlotDatas[param3][param1][param2] = _loc4_;
         }
         else
         {
            _loc4_ = this.layedPlotDatas[param3][param1][param2];
         }
         return _loc4_;
      }
      
      private function Update() : void
      {
         var _loc3_:int = 0;
         var _loc1_:Boolean = true;
         var _loc2_:Boolean = false;
         var _loc4_:Array = this.blitDataLoading;
         if(this.tmxTilesetLoading.length > 0 || _loc4_.length > 0 || this.width == 0 || this.height == 0 || this.tileheight == 0 || this.tilewidth == 0 || this.needLoadThumb)
         {
            _loc1_ = false;
         }
         if(_loc1_)
         {
            this.dispatchEvent(new Event(Event.CHANGE));
            _loc4_ = [];
            this.tmxTilesetLoading = [];
            if(this.loadTimer != null)
            {
               this.loadTimer.removeEventListener(TimerEvent.TIMER,this.LoadTimerHandler);
               this.loadTimer.stop();
               this.loadTimer = null;
            }
            this._hasCompleted = true;
            this.dispatchEvent(new Event(Event.COMPLETE));
         }
         else if(_loc2_)
         {
            this.dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      private function TmxBlitDataCompleteHandler(param1:Event) : void
      {
         var _loc3_:TmxTileset = null;
         var _loc4_:BlitData = null;
         var _loc5_:int = 0;
         var _loc2_:Array = this.blitDataLoading;
         (param1.currentTarget as IEventDispatcher).removeEventListener(Event.COMPLETE,this.TmxBlitDataCompleteHandler);
         _loc4_ = param1.currentTarget as BlitData;
         _loc5_ = 0;
         while(_loc5_ < _loc2_.length)
         {
            _loc3_ = _loc2_[_loc5_] as TmxTileset;
            if(_loc4_.url == TiledResource.urlChangeFunc(this.resourceFolder + this.imageSourceReturnFunc(_loc3_.imageSource)))
            {
               _loc2_.splice(_loc5_,1);
               this.AddTmxTileset(_loc3_,_loc4_);
               _loc5_--;
            }
            _loc5_++;
         }
      }
      
      private function TilesetCompleteHandler(param1:Event) : void
      {
         var _loc3_:int = 0;
         (param1.currentTarget as IEventDispatcher).removeEventListener(Event.COMPLETE,this.TilesetCompleteHandler);
         var _loc2_:TmxTileset = param1.currentTarget as TmxTileset;
         _loc3_ = 0;
         while(_loc3_ < this.tmxTilesetLoading.length)
         {
            if(_loc2_ == this.tmxTilesetLoading[_loc3_])
            {
               this.tmxTilesetLoading.splice(_loc3_,1);
               break;
            }
            _loc3_++;
         }
         this.AddTmxTileset(_loc2_);
      }
      
      private function LoadTimerHandler(param1:TimerEvent) : void
      {
         this.Update();
      }
      
      private function ThumbLoadIoErrorHandler(param1:IOErrorEvent) : void
      {
         var _loc2_:BlitData = param1.currentTarget as BlitData;
         _loc2_.removeEventListener(Event.COMPLETE,this.ThumbLoadCompleteHandler);
         _loc2_.removeEventListener(IOErrorEvent.IO_ERROR,this.ThumbLoadIoErrorHandler);
         this.needLoadThumb = false;
      }
      
      private function ThumbLoadCompleteHandler(param1:Event) : void
      {
         var _loc2_:BlitData = param1.currentTarget as BlitData;
         _loc2_.removeEventListener(Event.COMPLETE,this.ThumbLoadCompleteHandler);
         _loc2_.removeEventListener(IOErrorEvent.IO_ERROR,this.ThumbLoadIoErrorHandler);
         if(_loc2_.hasContent)
         {
            if(_loc2_.totalFrames > 0)
            {
               this._thumb = _loc2_.GetFrame(0).bitmapData;
            }
         }
         this.needLoadThumb = false;
      }
   }
}
