package asgui.blit.display
{
   import asgui.logger.AsguiLogger;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getTimer;
   
   public class BlitStage extends Bitmap implements IBlitStage
   {
      
      protected static var _abstractStage:BlitStage;
       
      
      protected var displayList:Vector.<IBlitDisplayObject>;
      
      public var outputPerform:Boolean = false;
      
      public var isPlaying:Boolean = true;
      
      private var invalidateStageRectFlag:Boolean;
      
      private var _disposed:Boolean;
      
      private var _bgcolor:uint;
      
      private var _stageRect:Rectangle;
      
      private var _stageWidth:int;
      
      private var _stageHeight:int;
      
      private var lastFrameTime:int;
      
      public function BlitStage(param1:int, param2:int)
      {
         super();
         this._stageWidth = param1;
         this._stageHeight = param2;
         this.invalidateStageRectFlag = true;
         this.displayList = new Vector.<IBlitDisplayObject>();
         this.addJuggle();
      }
      
      public static function get abstractStage() : BlitStage
      {
         if(_abstractStage == null)
         {
            _abstractStage = new BlitStage(400,300);
         }
         return _abstractStage;
      }
      
      public static function set stageRect(param1:Rectangle) : void
      {
         abstractStage.stageRect = param1;
      }
      
      public function Dispose() : void
      {
         this.removeJuggle();
         this._disposed = true;
      }
      
      public function get asset() : *
      {
         return this;
      }
      
      public function get assetType() : int
      {
         return BlitAssetType.BITMAP;
      }
      
      protected function addJuggle() : void
      {
         this.addEventListener(Event.ENTER_FRAME,this.EnterFrameHandler);
      }
      
      protected function removeJuggle() : void
      {
         this.removeEventListener(Event.ENTER_FRAME,this.EnterFrameHandler);
      }
      
      public function get hasDisposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get bgcolor() : uint
      {
         return this._bgcolor;
      }
      
      public function set bgcolor(param1:uint) : void
      {
         this._bgcolor = param1;
      }
      
      public function get transformationMatrix() : Matrix
      {
         return this.transform.matrix;
      }
      
      public function set transformationMatrix(param1:Matrix) : void
      {
         this.transform.matrix = param1;
      }
      
      public function Render() : void
      {
         var _loc1_:int = 0;
         var _loc2_:IBlitClip = null;
         var _loc3_:Rectangle = null;
         var _loc4_:Point = null;
         var _loc5_:int = 0;
         if(this.root)
         {
            if(this.outputPerform)
            {
               AsguiLogger.Perf(this,null,21000 + 1);
            }
            this.bitmapData.lock();
            this.bitmapData.fillRect(this.stageRect,this.bgcolor);
            _loc3_ = new Rectangle();
            _loc4_ = new Point();
            _loc5_ = this.displayList.length;
            _loc1_ = 0;
            while(_loc1_ < _loc5_)
            {
               _loc2_ = this.displayList[_loc1_] as IBlitClip;
               if(_loc2_ && _loc2_.bitmapData && _loc2_.visible)
               {
                  _loc3_.width = _loc2_.width;
                  _loc3_.height = _loc2_.height;
                  _loc4_.x = _loc2_.x;
                  _loc4_.y = _loc2_.y;
                  this.bitmapData.copyPixels(_loc2_.bitmapData,_loc3_,_loc4_,null,null,true);
               }
               _loc1_++;
            }
            this.bitmapData.unlock();
            if(this.outputPerform)
            {
               AsguiLogger.Perf(this,"Render %0",21000 + 1);
            }
         }
      }
      
      public function AdvanceTime(param1:Number) : int
      {
         var _loc2_:int = 0;
         var _loc3_:IBlitStageClip = null;
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         if(this.invalidateStageRectFlag)
         {
            this.UpdateStageRect();
            this.invalidateStageRectFlag = false;
         }
         if(!this.isPlaying)
         {
            return 0;
         }
         if(this.outputPerform)
         {
            AsguiLogger.Perf(this,null,21000 + 2);
         }
         _loc2_ = 0;
         while(_loc2_ < this.displayList.length)
         {
            _loc3_ = this.displayList[_loc2_] as IBlitStageClip;
            if(_loc3_ == null || _loc3_.hasDisposed)
            {
               this.displayList.splice(_loc2_,1);
               _loc2_--;
            }
            else if(_loc3_ && _loc3_.isPlaying && _loc3_.totalFrames > 0)
            {
               _loc4_ = _loc3_.frameCount + _loc3_.frameRateScale;
               _loc5_ = int(_loc4_) - int(_loc3_.frameCount)
               if(_loc5_ > 1)
               {
                  while(_loc5_ > _loc3_.totalFrames)
                  {
                     _loc5_ -= _loc3_.totalFrames;
                  }
                  _loc3_.currentFrame += _loc5_ - 1;
               }
               _loc3_.AdvanceTime(param1);
               _loc3_.frameCount = _loc4_;
            }
            _loc2_++;
         }
         if(this.outputPerform)
         {
            AsguiLogger.Perf(this,"NextFrame %0",21000 + 2);
         }
         this.Render();
         return this.displayList.length;
      }
      
      private function UpdateStageRect() : void
      {
         this._stageRect = new Rectangle(x,y,this.stageWidth,this.stageHeight);
         if(this.root)
         {
            this.bitmapData = new BitmapData(this.stageWidth,this.stageHeight,true,this.bgcolor);
         }
      }
      
      public function get blitStage() : IBlitStage
      {
         return this;
      }
      
      public function set blitStage(param1:IBlitStage) : void
      {
      }
      
      public function get stageRect() : Rectangle
      {
         if(!this._stageRect)
         {
            this.UpdateStageRect();
         }
         return this._stageRect;
      }
      
      public function set stageRect(param1:Rectangle) : void
      {
         super.x = param1.x;
         super.y = param1.y;
         this._stageWidth = param1.width;
         this._stageHeight = param1.height;
         this.invalidateStageRectFlag = true;
      }
      
      public function get stageWidth() : int
      {
         return this._stageWidth;
      }
      
      public function set stageWidth(param1:int) : void
      {
         this._stageWidth = param1;
         this.invalidateStageRectFlag = true;
      }
      
      public function get stageHeight() : int
      {
         return this._stageHeight;
      }
      
      public function set stageHeight(param1:int) : void
      {
         this._stageHeight = param1;
         this.invalidateStageRectFlag = true;
      }
      
      override public function set x(param1:Number) : void
      {
         super.x = param1;
         this.invalidateStageRectFlag = true;
      }
      
      override public function set y(param1:Number) : void
      {
         super.y = param1;
         this.invalidateStageRectFlag = true;
      }
      
      override public function set scrollRect(param1:Rectangle) : void
      {
         super.scrollRect = param1;
         this.invalidateStageRectFlag = true;
      }
      
      public function AddChild(param1:IBlitDisplayObject) : IBlitDisplayObject
      {
         if(param1.blitStage && param1.blitStage != this)
         {
            param1.blitStage.RemoveChild(param1);
         }
         if(abstractStage != this)
         {
            param1.blitStage = this;
         }
         if(this.Contains(param1))
         {
            this.RemoveChild(param1);
         }
         this.displayList.push(param1);
         return param1;
      }
      
      public function AddChildAt(param1:IBlitDisplayObject, param2:int) : IBlitDisplayObject
      {
         if(param1.blitStage && param1.blitStage != this)
         {
            param1.blitStage.RemoveChild(param1);
         }
         if(abstractStage != this)
         {
            param1.blitStage = this;
         }
         if(this.Contains(param1))
         {
            this.RemoveChild(param1);
         }
         if(param2 > this.numChildren - 1)
         {
            param2 = this.numChildren - 1;
         }
         this.displayList.splice(param2,0,param1);
         return param1;
      }
      
      public function GetChildAt(param1:int) : IBlitDisplayObject
      {
         return this.displayList[param1];
      }
      
      public function GetChildIndex(param1:IBlitDisplayObject) : int
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < this.displayList.length)
         {
            if(this.displayList[_loc2_] == param1)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      public function GetChildByName(param1:String) : IBlitDisplayObject
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < this.displayList.length)
         {
            if((this.displayList[_loc2_] as IBlitDisplayObject).name == param1)
            {
               return this.displayList[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function get numChildren() : int
      {
         return this.displayList.length;
      }
      
      public function Contains(param1:IBlitDisplayObject) : Boolean
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < this.displayList.length)
         {
            if(this.displayList[_loc2_] == param1)
            {
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      public function RemoveChildAt(param1:int) : IBlitDisplayObject
      {
         if(param1 < 0 && param1 >= this.numChildren)
         {
            return null;
         }
         var _loc2_:IBlitDisplayObject = this.displayList.splice(param1,1)[0];
         _loc2_.blitStage = null;
         return _loc2_;
      }
      
      public function RemoveChild(param1:IBlitDisplayObject) : IBlitDisplayObject
      {
         return this.RemoveChildAt(this.GetChildIndex(param1));
      }
      
      public function RemoveAllChildren() : void
      {
         while(this.numChildren > 0)
         {
            this.RemoveChildAt(0);
         }
      }
      
      public function SwapChildren(param1:IBlitClip, param2:IBlitClip) : void
      {
         this.SwapChildrenAt(this.GetChildIndex(param1),this.GetChildIndex(param2));
      }
      
      public function SwapChildrenAt(param1:int, param2:int) : void
      {
         var _loc3_:IBlitDisplayObject = null;
         if(param1 >= 0 && param1 < this.numChildren && param2 >= 0 && param2 < this.numChildren)
         {
            _loc3_ = this.displayList[param1];
            this.displayList[param1] = this.displayList[param2];
            this.displayList[param2] = _loc3_;
         }
      }
      
      public function GetParent() : IBlitDisplayContainer
      {
         return null;
      }
      
      public function GetBounds(param1:*) : Rectangle
      {
         return null;
      }
      
      public function get colorTransform() : ColorTransform
      {
         return this.transform.colorTransform;
      }
      
      public function set colorTransform(param1:ColorTransform) : void
      {
         this.transform.colorTransform = param1;
      }
      
      private function EnterFrameHandler(param1:Event) : void
      {
         var _loc2_:int = getTimer();
         if(this.lastFrameTime != 0)
         {
            this.AdvanceTime(_loc2_ - this.lastFrameTime);
         }
         this.lastFrameTime = _loc2_;
      }
      
      public function get mouseEnabled() : Boolean
      {
         return false;
      }
      
      public function set mouseEnabled(param1:Boolean) : void
      {
      }
   }
}
