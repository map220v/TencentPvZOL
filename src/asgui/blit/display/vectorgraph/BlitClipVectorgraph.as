package asgui.blit.display.vectorgraph
{
   import asgui.blit.data.BlitData;
   import asgui.blit.data.BlitFrameData;
   import asgui.blit.display.BlitAssetType;
   import asgui.blit.display.BlitStage;
   import asgui.blit.display.IBlitClip;
   import asgui.blit.display.IBlitDisplayContainer;
   import asgui.blit.display.IBlitStage;
   import asgui.blit.display.IBlitStageClip;
   import asgui.events.FrameEvent;
   import asgui.managers.SystemManager;
   import asgui.utils.MatrixUtil;
   import flash.display.BitmapData;
   import flash.display.FrameLabel;
   import flash.display.GraphicsBitmapFill;
   import flash.display.GraphicsPath;
   import flash.display.IGraphicsData;
   import flash.display.Shape;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class BlitClipVectorgraph extends Shape implements IBlitClip, IBlitStageClip
   {
       
      
      private var currentBmpd:BlitFrameData;
      
      private var playTimes:int;
      
      private var playCounter:int;
      
      private var thisRect:Rectangle;
      
      private var frameStart:int = -1;
      
      private var frameEnd:int = -1;
      
      private var settedFrame:int;
      
      private var _frameCount:Number = 0;
      
      private var _hasDisposed:Boolean;
      
      private var lastGotoAndPlayFrame:Object;
      
      private var lastGotoAndPlayTimes:int;
      
      private var lastFrame:int;
      
      private var graphicsDatas:Vector.<IGraphicsData>;
      
      private var _isPlaying:Boolean;
      
      private var _currentFrame:int;
      
      private var _frameRateScale:Number = 1;
      
      private var _autoUpdatePosition:Boolean;
      
      private var _dataProvider:BlitData;
      
      public function BlitClipVectorgraph()
      {
         this.thisRect = new Rectangle();
         super();
         this.cacheAsBitmap = true;
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
         this.graphicsDatas = null;
         this._hasDisposed = true;
      }
      
      public function get hasDisposed() : Boolean
      {
         return this._hasDisposed;
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

      //Causes lag temporary disabled
      public function AdvanceTime(param1:Number) : void
      {
         /*var _loc2_:int = 0;
         var _loc4_:Vector.<FrameLabel> = null;
         var _loc5_:FrameEvent = null;
         if(this.root == null && SystemManager.instance == null)
         {
            return;
         }
         var _loc3_:int = !!this.root ? int(this.root.stage.frameRate) : int(SystemManager.instance.stage.frameRate);
         this.currentFrame += 1;
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
               _loc4_ = this.dataProvider.GetAtEventFrames()
               if(_loc4_ != null && _loc4_.length > 0)
               {
                  _loc2_ = 0;
                  while(_loc2_ < _loc4_.length)
                  {
                     if(_loc4_[_loc2_].frame == this.currentFrame || this.currentFrame > _loc4_[_loc2_].frame && this.lastFrame < _loc4_[_loc2_].frame)
                     {
                        _loc5_ = new FrameEvent(FrameEvent.MOVEMENT_FRAME_EVENT)
                        _loc5_.frameLabel = _loc4_[_loc2_].name.replace("@","");
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
         this.Render();*/
      }
      
      public function Render() : void
      {
         var _loc3_:Vector.<IGraphicsData> = null;
         var _loc1_:BlitData = this.dataProvider;
         if(_loc1_)
         {
            if(!_loc1_.hasContent)
            {
               _loc1_.addEventListener(Event.COMPLETE,this.DataProviderCompletedHandler);
               if(_loc1_ != null && !_loc1_.hasContent)
               {
                  _loc1_.addEventListener(Event.COMPLETE,this.DataProviderCompletedHandler);
               }
            }
         }
         if(_loc1_ == null)
         {
            return;
         }
         var _loc2_:BlitFrameData = _loc1_.GetFrame(this.currentFrame);
         if(this.currentBmpd != _loc2_)
         {
            this.currentBmpd = _loc2_;
         }
         _loc2_ = null;
         if(this.currentBmpd)
         {
            this.cacheAsBitmap = _loc1_.totalFrames == 1 || !this.isPlaying;
            this.cacheAsBitmap = false;
            if(this.autoUpdatePosition)
            {
               this.x = this.currentBmpd.x;
               this.y = this.currentBmpd.y;
            }
            this.blendMode = this.currentBmpd.blendMode;
            _loc3_ = this.GetGraphicsDatas();
            graphics.clear();
            graphics.drawGraphicsData(_loc3_);
            graphics.endFill();
         }
      }
      
      public function GetGraphicsDatas(param1:Boolean = false) : Vector.<IGraphicsData>
      {
         var _loc4_:Matrix = null;
         var _loc5_:Point = null;
         var _loc6_:Point = null;
         var _loc7_:Point = null;
         var _loc8_:Point = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:GraphicsPath = null;
         var _loc2_:Vector.<IGraphicsData> = new Vector.<IGraphicsData>();
         var _loc3_:BlitFrameData = this.dataProvider.GetFrame(this.currentFrame);
         if(this.currentBmpd != _loc3_)
         {
            this.currentBmpd = _loc3_;
         }
         _loc3_ = null;
         if(this.currentBmpd.bitmapData != null && this.alpha > 0.1 && this.visible)
         {
            _loc4_ = new Matrix();
            if(this.currentBmpd.bitmapDataRect)
            {
               _loc9_ = this.currentBmpd.bitmapDataRect.width;
               _loc10_ = this.currentBmpd.bitmapDataRect.height;
               _loc4_.translate(-this.currentBmpd.bitmapDataRect.x,-this.currentBmpd.bitmapDataRect.y);
            }
            else
            {
               _loc9_ = this.currentBmpd.bitmapData.width;
               _loc10_ = this.currentBmpd.bitmapData.height;
            }
            if(param1)
            {
               _loc4_.concat(this.transformationMatrix);
            }
            _loc2_.push(new GraphicsBitmapFill(this.currentBmpd.bitmapData,_loc4_,true,true));
            _loc11_ = new GraphicsPath();
            if(param1)
            {
               _loc5_ = MatrixUtil.transformCoords(this.transformationMatrix,0,0);
               _loc6_ = MatrixUtil.transformCoords(this.transformationMatrix,_loc9_,0);
               _loc7_ = MatrixUtil.transformCoords(this.transformationMatrix,_loc9_,_loc10_);
               _loc8_ = MatrixUtil.transformCoords(this.transformationMatrix,0,_loc10_);
            }
            else
            {
               _loc5_ = new Point();
               _loc6_ = new Point(_loc9_,0);
               _loc7_ = new Point(_loc9_,_loc10_);
               _loc8_ = new Point(0,_loc10_);
            }
            _loc11_.moveTo(_loc5_.x,_loc5_.y);
            _loc11_.lineTo(_loc6_.x,_loc6_.y);
            _loc11_.lineTo(_loc7_.x,_loc7_.y);
            _loc11_.lineTo(_loc8_.x,_loc8_.y);
            _loc11_.lineTo(_loc5_.x,_loc5_.y);
            _loc2_.push(_loc11_);
         }
         return _loc2_;
      }
      
      public function get isPlaying() : Boolean
      {
         return this._isPlaying;
      }
      
      public function get totalFrames() : int
      {
         return this.dataProvider.totalFrames;
      }
      
      public function get currentFrame() : int
      {
         return this._currentFrame;
      }
      
      public function set currentFrame(param1:int) : void
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
         if(this._currentFrame == param1)
         {
            return;
         }
         this._currentFrame = param1;
      }
      
      public function get frameRateScale() : Number
      {
         return this._frameRateScale;
      }
      
      public function set frameRateScale(param1:Number) : void
      {
         this._frameRateScale = param1;
      }
      
      public function get autoUpdatePosition() : Boolean
      {
         return this._autoUpdatePosition;
      }
      
      public function set autoUpdatePosition(param1:Boolean) : void
      {
         this._autoUpdatePosition = param1;
      }
      
      public function get boundary() : Rectangle
      {
         return null;
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
      
      public function get bitmapData() : BitmapData
      {
         return null;
      }
      
      public function get blitStage() : IBlitStage
      {
         return null;
      }
      
      public function set blitStage(param1:IBlitStage) : void
      {
      }
      
      public function GetParent() : IBlitDisplayContainer
      {
         return this.parent as IBlitDisplayContainer;
      }
      
      public function get transformationMatrix() : Matrix
      {
         return this.transform.matrix;
      }
      
      public function set transformationMatrix(param1:Matrix) : void
      {
         this.transform.matrix = param1;
      }
      
      public function get colorTransform() : ColorTransform
      {
         return this.transform.colorTransform;
      }
      
      public function set colorTransform(param1:ColorTransform) : void
      {
         this.transform.colorTransform = param1;
      }
      
      public function get asset() : *
      {
         return this;
      }
      
      public function get assetType() : int
      {
         return BlitAssetType.VECTORGRAPH;
      }
      
      public function GetBounds(param1:*) : Rectangle
      {
         return super.getBounds(param1);
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
