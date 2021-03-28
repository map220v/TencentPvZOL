package asgui.blit.display
{
   import asgui.blit.data.BlitData;
   import asgui.blit.data.BlitFrameData;
   import asgui.events.FrameEvent;
   import asgui.logger.AsguiLogger;
   import asgui.managers.SystemManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.FrameLabel;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class BlitClip extends Bitmap implements IBlitClip, IBlitStageClip
   {
       
      
      public var outputPerform:Boolean = false;
      
      private var playTimes:int;
      
      private var playCounter:int;
      
      private var thisRect:Rectangle;
      
      private var currentBmpd:BlitFrameData;
      
      private var frameStart:int = -1;
      
      private var frameEnd:int = -1;
      
      private var _frameCount:Number = 0;
      
      private var _disposed:Boolean;
      
      private var lastGotoAndPlayFrame:Object;
      
      private var lastGotoAndPlayTimes:int;
      
      private var lastFrame:int;
      
      public var defaultDataProvider:BlitData;
      
      private var _blitStage:IBlitStage;
      
      private var _isPlaying:Boolean;
      
      private var _boundary:Rectangle;
      
      private var _autoUpdatePosition:Boolean;
      
      private var __currentFrame:Number = 0;
      
      private var currentFrameChanged:Boolean = true;
      
      private var settedFrame:int;
      
      private var _dataProvider:BlitData;
      
      private var _frameRateScale:Number = 1;
      
      public function BlitClip(param1:Boolean = false)
      {
         this.thisRect = new Rectangle();
         super();
         this.smoothing = param1;
      }
      
      public function get frameCount() : Number
      {
         return this._frameCount;
      }
      
      public function set frameCount(param1:Number) : void
      {
         this._frameCount = param1;
      }
      
      public function Dispose() : void
      {
         if(this.isPlaying)
         {
            this.Stop();
         }
         if(this.dataProvider)
         {
            this.dataProvider.removeEventListener(Event.COMPLETE,this.DataProviderCompletedHandler);
         }
         this.blitStage = null;
         this._dataProvider = null;
         this.currentBmpd = null;
         bitmapData = null;
         this._disposed = true;
      }
      
      public function get hasDisposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get asset() : *
      {
         return this;
      }
      
      public function get assetType() : int
      {
         return BlitAssetType.BITMAP;
      }
      
      public function Play(param1:int = 0) : void
      {
         this.playTimes = param1;
         this.playCounter = 0;
         if(this.blitStage == null)
         {
            BlitStage.abstractStage.AddChild(this);
            this.blitStage = BlitStage.abstractStage;
         }
         this._isPlaying = true;
         this.frameStart = -1;
         this.frameEnd = -1;
         this.Render();
      }
      
      public function GotoAndPlay(param1:Object, param2:int = 1) : void
      {
         var _loc3_:String = null;
         var _loc4_:Vector.<int> = null;
         var _loc5_:int = 0;
         this.lastGotoAndPlayFrame = param1;
         this.lastGotoAndPlayTimes = param2;
         this.Play(param2);
         if(this.dataProvider.hasContent)
         {
            if(param1 is String)
            {
               _loc3_ = param1 as String;
               _loc4_ = this.dataProvider.GetFrameRangeByLabel(_loc3_);
               this.frameStart = _loc4_[0];
               this.frameEnd = _loc4_[1];
               this.currentFrame = _loc4_[0];
            }
            else
            {
               _loc5_ = int(param1);
               this.currentFrame = _loc5_;
            }
         }
         else
         {
            this.Render();
         }
      }
      
      public function Stop() : void
      {
         if(!this.isPlaying)
         {
            return;
         }
         if(this.blitStage == null)
         {
            BlitStage.abstractStage.RemoveChild(this);
            this.blitStage = null;
         }
         this._isPlaying = false;
      }
      
      public function AdvanceTime(param1:Number) : void
      {
         var _loc2_:int = 0;
         var _loc4_:Vector.<FrameLabel> = null;
         var _loc5_:FrameEvent = null;
         if(this.root == null && SystemManager.instance == null)
         {
            return;
         }
         var _loc3_:int = !!this.root ? int(this.root.stage.frameRate) : int(SystemManager.instance.stage.frameRate);
         this._currentFrame += 1;
         if(this.isPlaying)
         {
            if(this.frameStart != -1 && this.frameEnd != -1)
            {
               if(this._currentFrame < this.frameStart - 1)
               {
                  this.currentFrame = this.frameStart - 1;
               }
               else if(this._currentFrame > this.frameEnd - 1)
               {
                  this.currentFrame = this.frameStart - 1;
                  ++this.playCounter;
               }
            }
            if(this.dataProvider.hasContent)
            {
               if((_loc4_ = this.dataProvider.GetAtEventFrames()) != null && _loc4_.length > 0)
               {
                  _loc2_ = 0;
                  while(_loc2_ < _loc4_.length)
                  {
                     if(_loc4_[_loc2_].frame == this.currentFrame || this.currentFrame > _loc4_[_loc2_].frame && this.lastFrame < _loc4_[_loc2_].frame)
                     {
                        (_loc5_ = new FrameEvent(FrameEvent.MOVEMENT_FRAME_EVENT)).frameLabel = _loc4_[_loc2_].name.replace("@","");
                        this.dispatchEvent(_loc5_);
                     }
                     _loc2_++;
                  }
               }
            }
            this.lastFrame = this.currentFrame;
         }
         if(this.isPlaying && this.totalFrames > 0)
         {
            if(this.playCounter >= this.playTimes && this.playTimes > 0)
            {
               this.Stop();
               this.dispatchEvent(new Event(Event.COMPLETE));
            }
         }
         this.Render();
      }
      
      public function Render() : void
      {
         var _loc1_:Rectangle = null;
         var _loc2_:BlitData = null;
         var _loc3_:BlitFrameData = null;
         _loc2_ = this.dataProvider;
         if(_loc2_)
         {
            if(!_loc2_.hasContent)
            {
               _loc2_.addEventListener(Event.COMPLETE,this.DataProviderCompletedHandler);
               _loc2_ = this.defaultDataProvider;
               if(_loc2_ != null && !_loc2_.hasContent)
               {
                  _loc2_.addEventListener(Event.COMPLETE,this.DataProviderCompletedHandler);
               }
            }
         }
         if(_loc2_ == null)
         {
            return;
         }
         if(this.isPlaying && _loc2_.totalFrames < 2 && _loc2_ != this.defaultDataProvider)
         {
            this.Stop();
         }
         if(this.outputPerform)
         {
            AsguiLogger.Perf(this,null,21100 + 1,true);
         }
         _loc3_ = _loc2_.GetFrame(this.currentFrame);
         if(this.currentBmpd != _loc3_)
         {
            this.currentBmpd = _loc3_;
            this._boundary = null;
         }
         _loc3_ = null;
         if(this.outputPerform)
         {
            AsguiLogger.Perf(this,"dataProvider.GetFrame",21100 + 1,true);
         }
         if(this.currentBmpd)
         {
            if(this.outputPerform)
            {
               AsguiLogger.Perf(this,null,21100 + 2,true);
            }
            if(this.autoUpdatePosition)
            {
               this.x = this.currentBmpd.x;
               this.y = this.currentBmpd.y;
            }
            this.blendMode = this.currentBmpd.blendMode;
            if(this.blitStage)
            {
               _loc1_ = this.blitStage.stageRect;
            }
            else
            {
               _loc1_ = BlitStage.abstractStage.stageRect;
            }
            if(this.outputPerform)
            {
               AsguiLogger.Perf(this,"stageRect",21100 + 2,true);
            }
            if(this.outputPerform)
            {
               AsguiLogger.Perf(this,null,21100 + 3,true);
            }
            if(this.currentBmpd.bitmapDataRect != null)
            {
               if(this.bitmapData == null || this.bitmapData.width != this.currentBmpd.bitmapDataRect.width || this.bitmapData.height != this.currentBmpd.bitmapDataRect.height)
               {
                  if(this.bitmapData)
                  {
                     this.bitmapData.dispose();
                  }
                  this.bitmapData = new BitmapData(this.currentBmpd.bitmapDataRect.width,this.currentBmpd.bitmapDataRect.height,true,0);
                  this.bitmapData.copyPixels(this.currentBmpd.bitmapData,this.currentBmpd.bitmapDataRect,new Point());
               }
            }
            else if(this.bitmapData != this.currentBmpd.bitmapData)
            {
               this.bitmapData = this.currentBmpd.bitmapData;
            }
            this.currentFrameChanged = false;
            if(this.outputPerform)
            {
               AsguiLogger.Perf(this,"currentFrameChanged",21100 + 3,true);
            }
         }
      }
      
      public function GetPixelAt(param1:int, param2:int) : uint
      {
         if(bitmapData)
         {
            return bitmapData.getPixel32(param1,param2);
         }
         return 0;
      }
      
      public function GetParent() : IBlitDisplayContainer
      {
         return this.parent as IBlitDisplayContainer;
      }
      
      public function get blitStage() : IBlitStage
      {
         return this._blitStage;
      }
      
      public function set blitStage(param1:IBlitStage) : void
      {
         this._blitStage = param1;
      }
      
      public function get isPlaying() : Boolean
      {
         return this._isPlaying;
      }
      
      public function get boundary() : Rectangle
      {
         var _loc1_:Point = null;
         if(!this._boundary)
         {
            if(this.blitStage)
            {
               this._boundary = new Rectangle(x,y,this.currentBmpd.width,this.currentBmpd.height);
            }
            else if(stage)
            {
               _loc1_ = this.stage.localToGlobal(new Point(x,y));
               this._boundary = new Rectangle(_loc1_.x,_loc1_.y,this.currentBmpd.width,this.currentBmpd.height);
            }
            else
            {
               this._boundary = new Rectangle();
               this.Dispose();
            }
         }
         return this._boundary;
      }
      
      public function AddChild(param1:IBlitDisplayObject) : IBlitDisplayObject
      {
         return param1;
      }
      
      public function RemoveChild(param1:IBlitDisplayObject) : IBlitDisplayObject
      {
         return param1;
      }
      
      public function get autoUpdatePosition() : Boolean
      {
         return this._autoUpdatePosition;
      }
      
      public function set autoUpdatePosition(param1:Boolean) : void
      {
         this._autoUpdatePosition = param1;
      }
      
      public function get totalFrames() : int
      {
         if(this.dataProvider)
         {
            return this.dataProvider.totalFrames;
         }
         return 0;
      }
      
      private function get _currentFrame() : Number
      {
         return this.__currentFrame;
      }
      
      private function set _currentFrame(param1:Number) : void
      {
         this.settedFrame = param1;
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 < 0)
         {
            param1 = this.totalFrames - 1;
         }
         else if(param1 >= this.totalFrames)
         {
            param1 = 0;
         }
         if(this.totalFrames > 0 && param1 + 1 == this.totalFrames)
         {
            ++this.playCounter;
         }
         if(this.__currentFrame == param1)
         {
            return;
         }
         this.__currentFrame = param1;
         this.currentFrameChanged = true;
      }
      
      public function get currentFrame() : int
      {
         return this._currentFrame;
      }
      
      public function set currentFrame(param1:int) : void
      {
         this._currentFrame = param1;
      }
      
      public function set dataProvider(param1:BlitData) : void
      {
         if(this._dataProvider == param1)
         {
            return;
         }
         this._dataProvider = param1;
         this.currentFrame = 0;
         this.Render();
      }
      
      public function get dataProvider() : BlitData
      {
         return this._dataProvider;
      }
      
      override public function set x(param1:Number) : void
      {
         super.x = param1;
         this._boundary = null;
      }
      
      override public function set y(param1:Number) : void
      {
         super.y = param1;
         this._boundary = null;
      }
      
      public function get frameRateScale() : Number
      {
         return this._frameRateScale;
      }
      
      public function set frameRateScale(param1:Number) : void
      {
         this._frameRateScale = param1;
      }
      
      public function get transformationMatrix() : Matrix
      {
         return this.transform.matrix;
      }
      
      public function set transformationMatrix(param1:Matrix) : void
      {
         this.transform.matrix = param1;
      }
      
      public function GetBounds(param1:*) : Rectangle
      {
         if(param1 is IBlitDisplayObject)
         {
            return getBounds((param1 as IBlitDisplayObject).asset);
         }
         return getBounds(param1);
      }
      
      public function get colorTransform() : ColorTransform
      {
         return this.transform.colorTransform;
      }
      
      public function set colorTransform(param1:ColorTransform) : void
      {
         this.transform.colorTransform = param1;
      }
      
      private function DataProviderCompletedHandler(param1:Event) : void
      {
         (param1.currentTarget as IEventDispatcher).removeEventListener(Event.COMPLETE,this.DataProviderCompletedHandler);
         this.currentFrame = this.settedFrame;
         if(this.lastGotoAndPlayFrame)
         {
            this.GotoAndPlay(this.lastGotoAndPlayFrame,this.lastGotoAndPlayTimes);
         }
         else
         {
            this.Render();
         }
      }
   }
}
