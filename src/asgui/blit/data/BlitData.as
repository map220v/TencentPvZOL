package asgui.blit.data
{
   import asgui.blit.Blit;
   import asgui.core.IDisposable;
   import asgui.logger.AsguiLogger;
   import asgui.managers.LoaderManager;
   import asgui.serialization.graphics.EncoderUtil;
   import asgui.utils.ColorUtil;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.FrameLabel;
   import flash.display.IBitmapDrawable;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.display.MovieClip;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.filters.BlurFilter;
   import flash.filters.DropShadowFilter;
   import flash.filters.GlowFilter;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.ByteArray;
   import flash.utils.getTimer;
   
   public class BlitData extends EventDispatcher implements IDisposable
   {
      
      private static var _BITMAPDATA_BLANK:BitmapData;
       
      
      public var name:String = "";
      
      private var frames:Array;
      
      var allwaysSustained:Boolean;
      
      private var maxTotalFrame:int;
      
      private var trans:Number;
      
      public var frameRate:int = -1;
      
      public var currentLabels:Vector.<FrameLabel>;
      
      private var _completeTime:Number = 0;
      
      private var drawFromZero:Boolean;
      
      private var scaleRate:Number = 1;
      
      private var colorTransform:ColorTransform;
      
      public var outputMaxScaleX:Number = 1;
      
      public var outputMaxScaleY:Number = 1;
      
      var accessTime:int;
      
      private var _disposed:Boolean;
      
      private var _hasUseBatchBitmapData:Boolean;
      
      private var _bmpdVector:Vector.<BitmapData>;
      
      private var _offsetVector:Vector.<Point>;
      
      private var externalCache:Object;
      
      private var _url:String;
      
      private var _totalFrame:int;
      
      private var _hasContent:Boolean;
      
      public function BlitData(param1:int = 65535, param2:Boolean = false, param3:ColorTransform = null)
      {
         this.colorTransform = param3;
         this.drawFromZero = param2;
         this.maxTotalFrame = param1;
         this.frames = [];
         this.accessTime = getTimer();
         super();
      }
      
      public static function get BITMAPDATA_BLANK() : BitmapData
      {
         if(!_BITMAPDATA_BLANK)
         {
            _BITMAPDATA_BLANK = new BitmapData(1,1,true,0);
         }
         return _BITMAPDATA_BLANK;
      }
      
      public function Dispose() : void
      {
         if(!this._disposed)
         {
            this.externalCache = null;
            this.RemoveVector();
            this.ClearData();
            this._disposed = true;
         }
      }
      
      public function get hasDisposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get hasUseBatchBitmapData() : Boolean
      {
         return this._hasUseBatchBitmapData;
      }
      
      protected function ClearData() : void
      {
         while(this.frames.length > 0)
         {
            (this.frames.pop() as BlitFrameData).Dispose();
         }
         this._hasContent = false;
      }
      
      public function IdentityMatrix() : void
      {
         var _loc1_:int = 0;
         var _loc3_:BlitFrameData = null;
         var _loc2_:int = this.frames.length;
         while(_loc1_ < _loc2_)
         {
            _loc3_ = this.frames[_loc1_];
            _loc3_.IdentityMatrix();
            _loc1_++;
         }
      }
      
      public function ConcatMatrix(param1:Matrix) : void
      {
         var _loc2_:int = 0;
         var _loc4_:BlitFrameData = null;
         var _loc3_:int = this.frames.length;
         while(_loc2_ < _loc3_)
         {
            (_loc4_ = this.frames[_loc2_]).ConcatMatrix(param1);
            _loc2_++;
         }
      }
      
      public function UpdateFrameBlitsUsingOutputScale() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:BlitFrameData = null;
         if(this.outputMaxScaleX != 1 || this.outputMaxScaleY != 1)
         {
            _loc1_ = this.totalFrames;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               _loc3_ = this.frames[_loc2_];
               _loc3_.ConcatBlitScale(this.outputMaxScaleX,this.outputMaxScaleY);
               _loc2_++;
            }
            this.outputMaxScaleX = 1;
            this.outputMaxScaleY = 1;
         }
      }
      
      public function GetFrame(param1:int) : BlitFrameData
      {
         this.accessTime = getTimer();
         if(this.frames[param1] == null)
         {
            return this.frames[0];
         }
         return this.frames[param1] as BlitFrameData;
      }
      
      public function LoadByUrl(param1:String, param2:Number = NaN, param3:Number = 1) : void
      {
         var _loc6_:BlitDataStarlingInfo = null;
         var _loc7_:BlitDataPlistInfo = null;
         var _loc8_:Loader = null;
         this.scaleRate = param3;
         this.RemoveVector();
         this._url = param1;
         this.trans = param2;
         var _loc4_:Array = String(param1.split("?")[0]).split("/");
         var _loc5_:String;
         if((_loc5_ = String(_loc4_[_loc4_.length - 1]).split(".")[1]) == "xml")
         {
            (_loc6_ = new BlitDataStarlingInfo()).addEventListener(Event.COMPLETE,this.LoadCompletedHandler);
            _loc6_.addEventListener(IOErrorEvent.IO_ERROR,this.IoErrorHandler);
            _loc6_.LoadByUrl(param1);
         }
         else if(_loc5_ == "plist")
         {
            (_loc7_ = new BlitDataPlistInfo()).addEventListener(Event.COMPLETE,this.LoadCompletedHandler);
            _loc7_.addEventListener(IOErrorEvent.IO_ERROR,this.IoErrorHandler);
            _loc7_.LoadByUrl(param1);
         }
         else
         {
            (_loc8_ = LoaderManager.GetLoader(param1,0)).contentLoaderInfo.addEventListener(Event.COMPLETE,this.LoadCompletedHandler);
            _loc8_.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.IoErrorHandler);
         }
      }
      
      public function LoadByClass(param1:Class, param2:Number = NaN, param3:Number = 1) : BlitData
      {
         this.scaleRate = param3;
         this.RemoveVector();
         this.trans = param2;
         this.SetContent(new param1());
         return this;
      }
      
      public function LoadByObject(param1:DisplayObject, param2:Number = NaN, param3:Number = 1) : BlitData
      {
         this.scaleRate = param3;
         this.RemoveVector();
         this.trans = param2;
         this.SetContent(param1);
         return this;
      }
      
      public function LoadByBitmapData(param1:BitmapData, param2:Number = NaN, param3:Number = 1) : BlitData
      {
         this.scaleRate = param3;
         this.RemoveVector();
         this.trans = param2;
         this.SetContent(param1);
         return this;
      }
      
      public function GetContentBytes(param1:int = 255, param2:int = 100) : ByteArray
      {
         var _loc5_:int = 0;
         var _loc7_:BlitFrameData = null;
         var _loc3_:ByteArray = new ByteArray();
         var _loc4_:Array = this.frames;
         var _loc6_:int = Math.min(param1,this.totalFrames);
         _loc3_.writeUTF(this.name);
         _loc3_.writeInt(_loc6_);
         _loc5_ = 0;
         while(_loc5_ < _loc6_)
         {
            if((_loc7_ = _loc4_[_loc5_]).bitmapDataId >= 0)
            {
               _loc3_.writeByte(255);
               _loc3_.writeShort(_loc7_.bitmapDataId);
               _loc3_.writeShort(_loc7_.bitmapDataRect.x);
               _loc3_.writeShort(_loc7_.bitmapDataRect.y);
               _loc3_.writeShort(_loc7_.bitmapDataRect.width);
               _loc3_.writeShort(_loc7_.bitmapDataRect.height);
               _loc3_.writeFloat(_loc7_.x);
               _loc3_.writeFloat(_loc7_.y);
               _loc3_.writeFloat(_loc7_.scaleX);
               _loc3_.writeFloat(_loc7_.scaleY);
               _loc3_.writeFloat(_loc7_.rotation);
            }
            else
            {
               _loc3_.writeInt(_loc7_.width);
               _loc3_.writeInt(_loc7_.height);
               if(param2 >= 100)
               {
                  _loc3_.writeBytes(_loc7_.bitmapData.getPixels(new Rectangle(0,0,_loc7_.width,_loc7_.height)));
               }
               else
               {
                  _loc3_.writeBytes(EncoderUtil.EncoderJPEG(_loc7_.bitmapData,param2));
               }
               _loc3_.writeDouble(_loc7_.x);
               _loc3_.writeDouble(_loc7_.y);
               _loc3_.writeDouble(_loc7_.scaleX);
               _loc3_.writeDouble(_loc7_.scaleY);
               _loc3_.writeDouble(_loc7_.rotation);
            }
            _loc5_++;
         }
         return _loc3_;
      }
      
      public function SetContent(param1:Object, param2:Array = null) : void
      {
         var i:int = 0;
         var j:int = 0;
         var frameInfo:BlitDataSpritesheetFrameInfo = null;
         var total:int = 0;
         var blendMode:String = null;
         var bmpd:BitmapData = null;
         var slInfo:BlitDataSpritesheetInfo = null;
         var bytes:ByteArray = null;
         var w:int = 0;
         var h:int = 0;
         var bb:BitmapData = null;
         var f:BlitFrameData = null;
         var totalRead:int = 0;
         var type:int = 0;
         var bitmapDataId:int = 0;
         var bitmapDataOffsetX:int = 0;
         var bitmapDataOffsetY:int = 0;
         var mc:MovieClip = null;
         var loader:Loader = null;
         var needChildrenGoto:Boolean = false;
         var d:DisplayObject = null;
         var content:Object = param1;
         var displayObjectList:Array = param2;
         this.accessTime = getTimer();
         var t1:int = getTimer();
         this.frames = [];
         if(!displayObjectList)
         {
            displayObjectList = [];
         }
         if(content is BlitDataSpritesheetInfo)
         {
            slInfo = content as BlitDataSpritesheetInfo;
            total = Math.min(this.maxTotalFrame,slInfo.frameRects.length);
            i = 0;
            while(i < total)
            {
               frameInfo = slInfo.frameRects[i];
               bmpd = new BitmapData(frameInfo.rect.width,frameInfo.rect.height,true,0);
               bmpd.copyPixels(slInfo.bitmapData,frameInfo.rect,new Point());
               bmpd = this.UpdateTrans(bmpd);
               this.frames[i] = new BlitFrameData(bmpd,null,frameInfo.offset);
               i++;
            }
            this._hasContent = true;
            this._completeTime = getTimer();
            this.dispatchEvent(new Event(Event.COMPLETE));
         }
         else if(content is ByteArray)
         {
            bytes = content as ByteArray;
            this.name = bytes.readUTF();
            totalRead = bytes.readInt();
            i = 0;
            while(i < totalRead)
            {
               type = bytes.readByte();
               if(type == -1)
               {
                  bitmapDataId = bytes.readShort();
                  bitmapDataOffsetX = bytes.readShort();
                  bitmapDataOffsetY = bytes.readShort();
                  w = bytes.readShort();
                  h = bytes.readShort();
                  f = new BlitFrameData();
                  f.SetData(displayObjectList[bitmapDataId],bitmapDataId,new Rectangle(bitmapDataOffsetX,bitmapDataOffsetY,w,h));
                  f.xOrg = bytes.readFloat();
                  f.yOrg = bytes.readFloat();
                  f.scaleXOrg = bytes.readFloat();
                  f.scaleYOrg = bytes.readFloat();
                  f.rotation = bytes.readFloat();
                  this._hasUseBatchBitmapData = true;
               }
               else
               {
                  --bytes.position;
                  w = bytes.readInt();
                  h = bytes.readInt();
                  bb = new BitmapData(w,h,true,0);
                  bb.setPixels(new Rectangle(0,0,w,h),bytes);
                  f = new BlitFrameData(bb);
                  f.x = bytes.readDouble();
                  f.y = bytes.readDouble();
                  f.scaleX = bytes.readDouble();
                  f.scaleY = bytes.readDouble();
                  f.rotation = bytes.readDouble();
               }
               this.frames[i] = f;
               i++;
            }
            this._hasContent = true;
            this._completeTime = getTimer();
            this.dispatchEvent(new Event(Event.COMPLETE));
         }
         else if(content is MovieClip)
         {
            mc = content as MovieClip;
            if(mc.numChildren == 1 && mc.totalFrames <= 1)
            {
               if(mc.getChildAt(0) is MovieClip && (mc.getChildAt(0) as MovieClip).totalFrames > 1)
               {
                  this.SetContent(mc.getChildAt(0),displayObjectList);
               }
               else if(mc.getChildAt(0) is Loader)
               {
                  loader = mc.getChildAt(0) as Loader;
                  loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.LoadCompletedHandler);
                  loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.IoErrorHandler);
               }
               else
               {
                  blendMode = mc.blendMode;
                  this.frames[0] = this.GetBlitFrameDataByInnerMc(mc,displayObjectList);
                  this._hasContent = true;
                  this._completeTime = getTimer();
                  this.dispatchEvent(new Event(Event.COMPLETE));
               }
            }
            else if(mc.numChildren > 0 || mc.totalFrames > 1)
            {
               var nextFrameToBottom:Function = function(param1:MovieClip):void
               {
                  var _loc2_:int = 0;
                  var _loc3_:MovieClip = null;
                  param1.nextFrame();
                  _loc2_ = 0;
                  while(_loc2_ < param1.numChildren)
                  {
                     _loc3_ = param1.getChildAt(_loc2_) as MovieClip;
                     if(_loc3_)
                     {
                        nextFrameToBottom(_loc3_);
                     }
                     _loc2_++;
                  }
               };
               AsguiLogger.Perf(this,"Draw : %0",10);
               total = Math.min(mc.totalFrames,50);
               needChildrenGoto = false;
               if(total == 1)
               {
                  j = 0;
                  while(j < mc.numChildren)
                  {
                     if(mc.getChildAt(j) is MovieClip && (mc.getChildAt(j) as MovieClip).totalFrames > total)
                     {
                        total = (mc.getChildAt(j) as MovieClip).totalFrames;
                        needChildrenGoto = true;
                     }
                     j++;
                  }
               }
               total = Math.min(this.maxTotalFrame,total);
               i = 0;
               while(i < total)
               {
                  if(i != 0)
                  {
                     nextFrameToBottom(mc);
                  }
                  if(needChildrenGoto)
                  {
                     j = 0;
                     while(j < mc.numChildren)
                     {
                        if(mc.getChildAt(j) is MovieClip)
                        {
                           mc.nextFrame();
                        }
                        j++;
                     }
                  }
                  if(mc.numChildren == 0)
                  {
                     this.frames[i] = new BlitFrameData();
                  }
                  else if(mc.numChildren == 1)
                  {
                     d = mc.getChildAt(0);
                     blendMode = mc.blendMode;
                     if(d is Bitmap)
                     {
                        this.frames[i] = new BlitFrameData(this.UpdateTrans((d as Bitmap).bitmapData),displayObjectList.concat(mc,d));
                     }
                     else if(d is IBitmapDrawable)
                     {
                        this.frames[i] = this.GetBlitFrameDataByInnerMc(mc,displayObjectList);
                     }
                  }
                  else
                  {
                     blendMode = mc.blendMode;
                     this.frames[i] = this.GetBlitFrameDataByInnerMc(mc,displayObjectList);
                  }
                  i++;
               }
               this.currentLabels = Vector.<FrameLabel>(mc.currentLabels);
               this._hasContent = true;
               this._completeTime = getTimer();
               this.dispatchEvent(new Event(Event.COMPLETE));
               AsguiLogger.Perf(this,"Draw : %0",10);
            }
            else
            {
               this.frames = [new BlitFrameData()];
               this._hasContent = true;
               this._completeTime = getTimer();
               this.dispatchEvent(new Event(Event.COMPLETE));
            }
         }
         else if(content is BitmapData)
         {
            this.frames = [new BlitFrameData(this.UpdateTrans(content as BitmapData),displayObjectList.concat(content))];
            this._hasContent = true;
            this._completeTime = getTimer();
            this.dispatchEvent(new Event(Event.COMPLETE));
         }
         else if(content is Bitmap)
         {
            this.SetContent((content as Bitmap).bitmapData);
         }
         else if(content is IBitmapDrawable)
         {
            this.frames = [this.GetBlitFrameDataByInnerMc(content as IBitmapDrawable,displayObjectList)];
            this._hasContent = true;
            this._completeTime = getTimer();
            this.dispatchEvent(new Event(Event.COMPLETE));
         }
         else
         {
            AsguiLogger.Warn(this,"SetContent type is not supported. " + this.url + " : " + content);
         }
         this._totalFrame = this.frames.length;
      }
      
      public function GetAtEventFrames() : Vector.<FrameLabel>
      {
         return Blit.GetAtEventFrames(this.currentLabels);
      }
      
      public function GetFrameRangeByLabel(param1:String) : Vector.<int>
      {
         return Blit.GetFrameRangeByLabel(param1,this.currentLabels,this.totalFrames);
      }
      
      private function GetBlitFrameDataByInnerMc(param1:IBitmapDrawable, param2:Array) : BlitFrameData
      {
         var i:int = 0;
         var j:int = 0;
         var rect:Rectangle = null;
         var bmpd:BitmapData = null;
         var displayObjectContainer:DisplayObjectContainer = null;
         var xAdd:Number = NaN;
         var yAdd:Number = NaN;
         var sprite:Sprite = null;
         var child:DisplayObject = null;
         var m:Matrix = null;
         var object:IBitmapDrawable = param1;
         var displayObjectList:Array = param2;
         var checkAdd:Function = function(param1:DisplayObject):void
         {
            var _loc2_:GlowFilter = null;
            var _loc3_:BlurFilter = null;
            var _loc4_:DropShadowFilter = null;
            if(param1.filters[i] is GlowFilter)
            {
               _loc2_ = param1.filters[i] as GlowFilter;
               if(xAdd < _loc2_.blurX)
               {
                  xAdd = _loc2_.blurX;
               }
               if(yAdd < _loc2_.blurY)
               {
                  yAdd = _loc2_.blurY;
               }
            }
            else if(param1.filters[i] is BlurFilter)
            {
               _loc3_ = param1.filters[i] as BlurFilter;
               if(xAdd < _loc3_.blurX)
               {
                  xAdd = _loc3_.blurX;
               }
               if(yAdd < _loc3_.blurY)
               {
                  yAdd = _loc3_.blurY;
               }
            }
            else if(param1.filters[i] is DropShadowFilter)
            {
               _loc4_ = param1.filters[i] as DropShadowFilter;
               if(xAdd < _loc4_.blurX)
               {
                  xAdd = _loc4_.blurX;
               }
               if(yAdd < _loc4_.blurY)
               {
                  yAdd = _loc4_.blurY;
               }
            }
         };
         var displayObject:DisplayObject = object as DisplayObject;
         var scaleRate:Number = this.scaleRate;
         if(displayObject.parent == null)
         {
            sprite = new Sprite();
            sprite.addChild(displayObject);
         }
         rect = displayObject.parent.getBounds(displayObject);
         xAdd = 0;
         yAdd = 0;
         checkAdd(displayObject);
         if(displayObject is DisplayObjectContainer)
         {
            displayObjectContainer = displayObject as DisplayObjectContainer;
            j = 0;
            while(j < displayObjectContainer.numChildren)
            {
               child = (displayObject as DisplayObjectContainer).getChildAt(j);
               if(child.filters.length > 0)
               {
                  i = 0;
                  while(i < child.filters.length)
                  {
                     checkAdd(child);
                     i++;
                  }
               }
               j++;
            }
         }
         if(xAdd == 0)
         {
            xAdd = 2;
         }
         if(yAdd == 0)
         {
            yAdd = 2;
         }
         if(rect.width == 0 || rect.height == 0)
         {
            rect = new Rectangle(0,0,1,1);
         }
         rect.x = Math.floor(rect.x - xAdd);
         rect.y = Math.floor(rect.y - yAdd);
         rect.width = Math.ceil(rect.width + xAdd * 2);
         rect.height = Math.ceil(rect.height + yAdd * 2);
         if(displayObject is Shape)
         {
            displayObjectList = [rect];
         }
         else
         {
            displayObjectList = displayObjectList.concat(rect);
         }
         if(rect.width > 2048 || rect.height > 2048)
         {
            AsguiLogger.Warn(this,"Texture too big  : " + this.url);
            bmpd = BITMAPDATA_BLANK;
         }
         else
         {
            bmpd = new BitmapData((rect.width - 0) * scaleRate,(rect.height - 0) * scaleRate,true,0);
            m = new Matrix(1,0,0,1,-rect.x,-rect.y);
            m.scale(scaleRate,scaleRate);
            bmpd.draw(object,m,null,null,null,false);
            bmpd = this.UpdateTrans(bmpd);
         }
         var bfd:BlitFrameData = new BlitFrameData(bmpd,displayObjectList);
         bfd.scaleX = 1 / scaleRate;
         bfd.scaleY = 1 / scaleRate;
         return bfd;
      }
      
      private function UpdateTrans(param1:BitmapData) : BitmapData
      {
         var _loc3_:BitmapData = null;
         var _loc4_:Boolean = false;
         var _loc2_:Boolean = this.colorTransform == null || ColorUtil.IsColorTransformDefault(this.colorTransform);
         if(isNaN(this.trans) && _loc2_)
         {
            return param1;
         }
         if(param1.transparent)
         {
            _loc3_ = param1;
            _loc4_ = false;
         }
         else
         {
            _loc3_ = new BitmapData(param1.width,param1.height,true,0);
            _loc4_ = true;
         }
         if(isNaN(this.trans))
         {
            _loc3_.threshold(param1,new Rectangle(0,0,param1.width,param1.height),new Point(),"==",this.trans,0,16777215,_loc4_);
         }
         if(!_loc2_)
         {
            _loc3_.draw(_loc3_,null,this.colorTransform);
         }
         return _loc3_;
      }
      
      public function GetBmpdVector() : Vector.<BitmapData>
      {
         if(this._bmpdVector == null)
         {
            this.BuildVector();
         }
         return this._bmpdVector;
      }
      
      public function GetOffsetVector() : Vector.<Point>
      {
         if(this._offsetVector == null)
         {
            this.BuildVector();
         }
         return this._offsetVector;
      }
      
      public function GetExternalCacheData(param1:Function = null, param2:Boolean = true) : Object
      {
         this.accessTime = getTimer();
         if(this.externalCache == null && param1 != null)
         {
            this.externalCache = param1(this,param2);
         }
         return this.externalCache;
      }
      
      private function BuildVector() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = this.totalFrames;
         this._bmpdVector = new Vector.<BitmapData>(_loc2_,true);
         this._offsetVector = new Vector.<Point>(_loc2_,true);
         _loc1_ = 0;
         while(_loc1_ < _loc2_)
         {
            this._bmpdVector[_loc1_] = this.GetFrame(_loc1_).getBitmapData();
            this._offsetVector[_loc1_] = new Point(this.GetFrame(_loc1_).x,this.GetFrame(_loc1_).y);
            _loc1_++;
         }
      }
      
      private function RemoveVector() : void
      {
         this._bmpdVector = null;
         this._offsetVector = null;
      }
      
      public function GetTotalPixelSize() : int
      {
         var _loc1_:int = 0;
         var _loc3_:BlitFrameData = null;
         var _loc2_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < this.totalFrames)
         {
            _loc3_ = this.frames[_loc1_] as BlitFrameData;
            _loc2_ += _loc3_.width * _loc3_.height;
            _loc1_++;
         }
         return _loc2_;
      }
      
      public function get url() : String
      {
         return this._url;
      }
      
      public function set url(param1:String) : void
      {
         this._url = param1;
      }
      
      public function get totalFrames() : int
      {
         if(this._totalFrame > 0)
         {
            return this._totalFrame;
         }
         if(this.frames)
         {
            this._totalFrame = this.frames.length;
            return this.frames.length;
         }
         return 0;
      }
      
      public function get hasContent() : Boolean
      {
         this.accessTime = getTimer();
         return this._hasContent;
      }
      
      public function get updateTime() : Number
      {
         return this._completeTime;
      }
      
      public function UpdateTime() : void
      {
         this._completeTime = getTimer();
      }
      
      private function LoadCompletedHandler(param1:Event) : void
      {
         (param1.currentTarget as IEventDispatcher).removeEventListener(Event.COMPLETE,this.LoadCompletedHandler);
         (param1.currentTarget as IEventDispatcher).removeEventListener(IOErrorEvent.IO_ERROR,this.IoErrorHandler);
         if(param1.currentTarget is LoaderInfo)
         {
            if((param1.currentTarget as LoaderInfo).contentType == "application/x-shockwave-flash")
            {
               this.frameRate = (param1.currentTarget as LoaderInfo).frameRate;
            }
            this.SetContent((param1.currentTarget as LoaderInfo).content);
         }
         else
         {
            this.SetContent(param1.currentTarget);
         }
      }
      
      private function IoErrorHandler(param1:IOErrorEvent) : void
      {
         (param1.currentTarget as IEventDispatcher).removeEventListener(Event.COMPLETE,this.LoadCompletedHandler);
         (param1.currentTarget as IEventDispatcher).removeEventListener(IOErrorEvent.IO_ERROR,this.IoErrorHandler);
         AsguiLogger.Warn(this,"" + param1.text);
         this.dispatchEvent(param1.clone());
      }
      
      public function UnbatchData() : void
      {
         var _loc1_:int = 0;
         var _loc2_:BlitFrameData = null;
         _loc1_ = 0;
         while(_loc1_ < this.totalFrames)
         {
            _loc2_ = this.frames[_loc1_] as BlitFrameData;
            _loc2_.UnbatchData();
            _loc1_++;
         }
      }
   }
}
