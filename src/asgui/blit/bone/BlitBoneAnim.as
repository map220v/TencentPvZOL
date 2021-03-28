package asgui.blit.bone
{
   import asgui.blit.Blit;
   import asgui.blit.IBlitBatchableDisplayFactory;
   import asgui.blit.bone.rules.BlitBoneDataOuterBindRule;
   import asgui.blit.bone.rules.BlitBoneVisibleRule;
   import asgui.blit.data.BlitFrameData;
   import asgui.blit.display.IBlitClip;
   import asgui.blit.display.IBlitDisplayContainer;
   import asgui.blit.display.IBlitDisplayObject;
   import asgui.core.IDisposable;
   import asgui.events.FrameEvent;
   import flash.display.BitmapData;
   import flash.display.FrameLabel;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   
   public class BlitBoneAnim extends EventDispatcher implements IDisposable
   {
       
      
      private var _asset:IBlitDisplayContainer;
      
      private var _batchAsset:IBlitDisplayContainer;
      
      private var displays:Array;
      
      private var displayHodler:BlitBoneDisplayHolder;
      
      private var _frameStart:int = -1;
      
      private var _frameEnd:int = -1;
      
      private var _curActionFrame:int = 0;
      
      private var playTimes:int;
      
      private var playCounter:int;
      
      private var lastGotoAndPlayFrame:Object;
      
      private var lastGotoAndPlayTimes:int = -1;
      
      private var lastRenderFrame:int = -1;
      
      private var lastGotoFrame:int = 0;
      
      private var factoryType:int;
      
      public var outerBindRule:BlitBoneDataOuterBindRule;
      
      private var boneVisibleRule:BlitBoneVisibleRule;
      
      private var manager:BlitBoneManager;
      
      public var reverseWhenPlaying:Boolean = false;
      
      private var _hasDisposed:Boolean;
      
      private var _data:BlitBoneData;
      
      private var _autoUpdatePosition:Boolean = true;
      
      public var offsetX:int = 0;
      
      public var offsetY:int = 0;
      
      private var _currentFrame:Number = 0;
      
      private var _frameRate:Number;
      
      private var extraPassedTime:int = 0;
      
      private var lastFrame:int;
      
      var needAFrameRender:Boolean;
      
      public var isPlaying:Boolean;
      
      public function BlitBoneAnim(param1:BlitBoneManager, param2:int = 0)
      {
         this.displays = [];
         super();
         this.manager = param1;
         this.factoryType = param2;
         this._asset = this.manager.getBlitFactory(param2).CreateBlitContainer({"smoothing":true});
         this.manager.addToJuggle(this);
         this.displayHodler = new BlitBoneDisplayHolder(param2);
         this.boneVisibleRule = new BlitBoneVisibleRule();
         this.boneVisibleRule.addEventListener(Event.CHANGE,this.boneVisibleRuleChangeHandler);
         this.outerBindRule = new BlitBoneDataOuterBindRule();
         this.outerBindRule.addEventListener(Event.CHANGE,this.boneBindRuleChangeHandler);
      }
      
      public function get hasDisposed() : Boolean
      {
         return this._hasDisposed;
      }
      
      public function Dispose() : void
      {
         if(!this.hasDisposed)
         {
            this.manager.removeFromJuggle(this);
            this.displayHodler.Dispose();
            this.manager = null;
            if(this.boneVisibleRule)
            {
               this.boneVisibleRule.removeEventListener(Event.CHANGE,this.boneVisibleRuleChangeHandler);
               this.boneVisibleRule.Dispose();
               this.boneVisibleRule = null;
            }
            if(this.outerBindRule)
            {
               this.outerBindRule.removeEventListener(Event.CHANGE,this.boneBindRuleChangeHandler);
               this.outerBindRule.Dispose();
               this.outerBindRule = null;
            }
            if(this._data != null)
            {
               this._data.removeEventListener(Event.COMPLETE,this.onFinishLoadData);
               this._data = null;
            }
            this.ClearClips();
            if(this._asset)
            {
               this._asset.Dispose();
               this._asset = null;
            }
            this._hasDisposed = true;
         }
      }
      
      public function ClearClips() : void
      {
         var _loc1_:IDisposable = null;
         var _loc2_:int = 0;
         var _loc3_:Vector.<IBlitDisplayContainer> = null;
         if(this._asset)
         {
            while(this.asset.numChildren > 0)
            {
               _loc1_ = this.asset.RemoveChildAt(0) as IDisposable;
               if(_loc1_)
               {
                  _loc1_.Dispose();
               }
            }
            this.asset.RemoveAllChildren();
         }
         for each(_loc3_ in this.displays)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc3_.length)
            {
               _loc3_[_loc2_].Dispose();
               _loc2_++;
            }
         }
         this.displays = [];
         if(this.displayHodler)
         {
            this.displayHodler.reset();
         }
      }
      
      public function get data() : BlitBoneData
      {
         return this._data;
      }
      
      public function set data(param1:BlitBoneData) : void
      {
         this.offsetX = this.offsetY = 0;
         this.ClearClips();
         this.clearAllBoneVisibleRules();
         if(this._data != null)
         {
            this._data.removeEventListener(Event.COMPLETE,this.onFinishLoadData);
         }
         this._data = param1;
         this.outerBindRule.blitBoneData = this._data;
         if(this._data != null)
         {
            if(this._data.hasLoaded)
            {
               this.onFinishLoadData(null);
            }
            else
            {
               this._data.addEventListener(Event.COMPLETE,this.onFinishLoadData);
            }
         }
      }
      
      public function get autoUpdatePosition() : Boolean
      {
         return this._autoUpdatePosition;
      }
      
      public function set autoUpdatePosition(param1:Boolean) : void
      {
         this._autoUpdatePosition = param1;
      }
      
      private function onFinishLoadData(param1:Event = null) : void
      {
         if(param1)
         {
            (param1.currentTarget as IEventDispatcher).removeEventListener(Event.COMPLETE,this.onFinishLoadData);
         }
         this.updateAutoPosition();
         if(this.lastGotoAndPlayFrame != null)
         {
            this.gotoAndPlay(this.lastGotoAndPlayFrame,this.lastGotoAndPlayTimes,this.lastGotoFrame);
         }
         else if(this.isPlaying)
         {
            this.play(this.playTimes);
         }
         else
         {
            this.render();
         }
         dispatchEvent(new Event(Event.COMPLETE));
      }
      
      public function updateAutoPosition() : void
      {
         if(this.autoUpdatePosition)
         {
            this.asset.x = (this.offsetX + this._data.offsetX) * this.asset.scaleX;
            this.asset.y = (this.offsetY + this._data.offsetY) * this.asset.scaleY;
         }
      }
      
      public function get asset() : IBlitDisplayContainer
      {
         return this._asset;
      }
      
      public function get currentFrame() : Number
      {
         return this._currentFrame;
      }
      
      public function get currentLabel() : String
      {
         return Blit.GetCurrentLabelByFrame(this.currentFrame,this.data.frameLabel,this.totalFrames);
      }
      
      public function set currentFrame(param1:Number) : void
      {
         var _loc2_:int = this.totalFrames;
         if(param1 < 0)
         {
            param1 = _loc2_ - 1;
         }
         else if(param1 >= _loc2_)
         {
            param1 = 0;
         }
         if(_loc2_ > 0 && param1 + 1 >= _loc2_)
         {
            ++this.playCounter;
         }
         this._currentFrame = param1;
      }
      
      public function get frameRate() : Number
      {
         if(isNaN(this._frameRate) || this._frameRate == Number.POSITIVE_INFINITY || this._frameRate == Number.NEGATIVE_INFINITY)
         {
            this._frameRate = this.data.frameRate;
            if(this._frameRate == 0)
            {
               this._frameRate = this.manager.frameRate;
            }
         }
         return this._frameRate;
      }
      
      public function set frameRate(param1:Number) : void
      {
         this._frameRate = param1;
      }
      
      public function advanceTime(param1:Number) : void
      {
         var _loc7_:int = 0;
         if(this.hasDisposed)
         {
            return;
         }
         var _loc2_:int = this.manager.frameRate;
         var _loc3_:Number = this.frameRate;
         var _loc4_:Number = 1000 / _loc3_;
         param1 += this.extraPassedTime;
         var _loc5_:int = int(param1 / _loc4_);
         this.extraPassedTime = param1 % _loc4_;
         var _loc6_:Boolean = this.needAFrameRender && _loc5_ == 0;
         while(_loc5_-- > 0 && this.isPlaying)
         {
            this.nextFrame();
         }
         if(_loc6_)
         {
            _loc7_ = this.render(true);
            this.needAFrameRender = false;
         }
         else
         {
            _loc7_ = this.render();
         }
         BlitBoneAnimRenderAnalyzer.instance.addFrameRenderTypeCount(_loc7_);
      }
      
      public function nextFrame() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Boolean = false;
         if(this.data == null || this.data.hasDisposed || !this.data.hasLoaded)
         {
            return;
         }
         this.currentFrame += !!this.reverseWhenPlaying ? -1 : 1;
         this._curActionFrame = this.currentFrame - this._frameStart;
         if(this._frameStart != -1 && this._frameEnd != -1)
         {
            if(this._currentFrame < this._frameStart)
            {
               this.currentFrame = this._frameStart;
            }
            else if(this._currentFrame >= this._frameEnd)
            {
               _loc2_ = true;
               ++this.playCounter;
            }
         }
         if(this.isPlaying && this.totalFrames > 0)
         {
            if(this.playCounter >= this.playTimes && this.playTimes > 0)
            {
               this.stop();
               this.dispatchEvent(new Event(Event.COMPLETE));
            }
            else if(_loc2_)
            {
               this.currentFrame = this._frameStart;
            }
         }
         this.lastFrame = this.currentFrame;
         this.checkFrameEvent();
      }
      
      public function getAllLabelName() : Array
      {
         var _loc3_:FrameLabel = null;
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         while(_loc2_ < this.frameLabel.length)
         {
            _loc3_ = this.frameLabel[_loc2_];
            _loc1_.push(_loc3_.name);
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function play(param1:int = 1, param2:Boolean = false) : void
      {
         this.playTimes = param1;
         this.playCounter = 0;
         this.isPlaying = true;
         if(!param2)
         {
            this._frameStart = -1;
            this._frameEnd = -1;
         }
         this.render();
      }
      
      public function stop() : void
      {
         this.isPlaying = false;
         this.render();
      }
      
      public function gotoAndStop(param1:Object, param2:int = -1) : void
      {
         this.gotoAndPlay(param1,1,param2);
         this._curActionFrame = this.currentFrame - this._frameStart;
         this.stop();
      }
      
      public function gotoAndPlay(param1:Object, param2:int = 1, param3:int = -1) : void
      {
         var _loc4_:String = null;
         var _loc5_:Vector.<int> = null;
         var _loc6_:int = 0;
         if(param1 == null)
         {
            return;
         }
         this.lastGotoAndPlayFrame = param1;
         this.lastGotoAndPlayTimes = param2;
         this.lastGotoFrame = param3;
         this.playTimes = param2;
         this.playCounter = 0;
         this.isPlaying = true;
         this._frameStart = -1;
         this._frameEnd = -1;
         if(this.data == null || this.data.hasDisposed)
         {
            return;
         }
         if(param1 is String)
         {
            _loc4_ = param1 as String;
            if((_loc5_ = Blit.GetFrameRangeByLabel(_loc4_,this.data.frameLabel,this.totalFrames)) == null)
            {
               return;
            }
            this._frameStart = _loc5_[0] - 1;
            this._frameEnd = _loc5_[1] - 1;
            if(param3 != -1)
            {
               this.currentFrame = this._frameStart + param3;
            }
            else
            {
               this.currentFrame = this._frameStart;
            }
         }
         else
         {
            _loc6_ = int(param1);
            this.currentFrame = _loc6_;
         }
         this.render();
      }
      
      public function getBone(param1:String) : IBlitDisplayObject
      {
         var _loc2_:int = 0;
         var _loc3_:IBlitDisplayContainer = null;
         var _loc7_:IBlitDisplayObject = null;
         var _loc4_:Array;
         var _loc5_:String = (_loc4_ = param1.split("/"))[0];
         this.render(true,true);
         if(this.data.version >= 3 && this.manager.isPreferBatch)
         {
            return this.displayHodler.getDisplay(_loc5_);
         }
         var _loc6_:Vector.<IBlitDisplayContainer>;
         if((_loc6_ = this.displays[_loc5_]) == null || _loc6_.length == 0)
         {
            return null;
         }
         _loc3_ = _loc6_[0];
         if(_loc4_.length > 1)
         {
            _loc2_ = 1;
            while(_loc2_ < _loc4_.length)
            {
               _loc3_ = _loc3_.GetChildByName(_loc4_[_loc2_]) as IBlitDisplayContainer;
               _loc2_++;
            }
         }
         return _loc3_;
      }
      
      public function getBonesByNameCompare(param1:String, param2:Boolean = false) : Vector.<IBlitDisplayObject>
      {
         var _loc3_:Array = null;
         var _loc5_:* = undefined;
         var _loc6_:IBlitDisplayObject = null;
         param1 = param1.replace("*","");
         this.render(true,true);
         if(this.data.version >= 3 && this.manager.isPreferBatch)
         {
            _loc3_ = this.displayHodler.displays;
         }
         else
         {
            _loc3_ = this.displays;
         }
         var _loc4_:Array = [];
         for each(_loc5_ in _loc3_)
         {
            if(_loc5_.length > 0)
            {
               _loc6_ = _loc5_[0];
               if(!param2 == (_loc6_.name.indexOf(param1) != -1))
               {
                  _loc4_.push(_loc6_);
               }
            }
         }
         return Vector.<IBlitDisplayObject>(_loc4_);
      }
      
      public function getBoneClone(param1:String, param2:int = -1, param3:String = null, param4:int = 0) : IBlitDisplayContainer
      {
         var _loc6_:int = 0;
         var _loc7_:Vector.<BlitBoneFrameChild> = null;
         var _loc11_:Boolean = false;
         var _loc12_:BlitFrameData = null;
         var _loc14_:String = null;
         var _loc18_:BlitBoneFrameChild = null;
         var _loc20_:IBlitClip = null;
         var _loc21_:Vector.<int> = null;
         var _loc22_:BlitBoneFrameChild = null;
         var _loc23_:Matrix = null;
         var _loc24_:Matrix = null;
         var _loc5_:* = param1.indexOf("*") != -1;
         param1 = param1.replace("*","");
         var _loc8_:Array;
         if((_loc8_ = param1.split("/")).length == 0)
         {
            return null;
         }
         var _loc9_:String = _loc8_[_loc8_.length - 1];
         var _loc10_:IBlitDisplayContainer = this.manager.getBlitFactory(param4).CreateBlitContainer({"smoothing":true});
         if(this.data.blits[_loc9_] != null)
         {
            (_loc20_ = this.manager.getBlitFactory(param4).CreateBlitClip({"smoothing":true})).autoUpdatePosition = false;
            _loc20_.dataProvider = this.data.blits[_loc9_];
            _loc10_.AddChild(_loc20_);
            _loc20_.Play();
            _loc12_ = _loc20_.dataProvider.GetFrame(_loc20_.currentFrame);
            _loc11_ = true;
         }
         else
         {
            _loc11_ = false;
         }
         if(param2 == -1)
         {
            _loc7_ = this.data.frameBatch[this.currentFrame].children;
         }
         else if(param3 == null)
         {
            _loc7_ = this.data.frameBatch[param2].children;
         }
         else
         {
            param2 = (_loc21_ = Blit.GetFrameRangeByLabel(param3,this.data.frameLabel,this.totalFrames))[0] - 1 + param2;
            _loc7_ = this.data.frameBatch[param2].children;
         }
         var _loc13_:int = _loc7_.length;
         var _loc15_:Vector.<BlitBoneFrameChild> = new Vector.<BlitBoneFrameChild>();
         while(_loc8_.length > 0)
         {
            _loc14_ = _loc8_.shift();
            _loc22_ = null;
            _loc6_ = 0;
            while(_loc6_ < _loc13_)
            {
               if(_loc7_[_loc6_].className == _loc14_)
               {
                  _loc15_.push(_loc7_[_loc6_]);
                  if(_loc7_ = _loc7_[_loc6_].getChildrenAtFrame(param2))
                  {
                     _loc13_ = _loc7_.length;
                  }
                  break;
               }
               if(_loc7_[_loc6_].className.indexOf(_loc14_) != -1)
               {
                  _loc22_ = _loc7_[_loc6_];
               }
               _loc6_++;
            }
            if(_loc5_ && _loc22_)
            {
               _loc15_.push(_loc22_);
               _loc7_ = _loc22_.children;
               _loc20_.dataProvider = this.data.blits[_loc22_.className];
            }
         }
         var _loc16_:Matrix = new Matrix();
         var _loc17_:ColorTransform = new ColorTransform();
         var _loc19_:BlitBoneFrameChild = _loc15_.length > 0 ? _loc15_[_loc15_.length - 1] : null;
         if(!_loc11_ && _loc19_)
         {
            _loc19_.updateDisplay(_loc10_,this.data,param2,false,param4,this.boneVisibleRule,this.displayHodler);
         }
         while((_loc18_ = _loc15_.pop()) != null)
         {
            _loc23_ = _loc18_.m;
            if(_loc11_ && _loc18_.className == _loc9_)
            {
               (_loc24_ = new Matrix()).scale(_loc12_.scaleX,_loc12_.scaleY);
               _loc24_.translate(_loc12_.x,_loc12_.y);
               _loc24_.concat(_loc23_);
               _loc23_ = _loc24_;
            }
            _loc16_.concat(_loc23_);
            _loc17_.concat(_loc18_.colorTransform);
            if(_loc15_.length <= 0)
            {
               _loc10_.transformationMatrix = _loc16_;
               _loc10_.alpha = _loc17_.alphaMultiplier;
               return _loc10_;
            }
         }
         return null;
      }
      
      public function get totalFrames() : int
      {
         if(this.data == null)
         {
            return 0;
         }
         return this.data.frameBatch.length;
      }
      
      public function getSnapshot(param1:Number = 1) : BitmapData
      {
         var b:BitmapData = null;
         var frame:BlitBoneFrameBatch = null;
         var numChildren:int = 0;
         var i:int = 0;
         var j:int = 0;
         var sprite:Sprite = null;
         var par:Sprite = null;
         var rect:Rectangle = null;
         var child:BlitBoneFrameChild = null;
         var textureX:Number = param1;
         try
         {
            frame = this.data.frameBatch[this.currentFrame];
            numChildren = frame.children.length;
            sprite = new Sprite();
            i = 0;
            while(i < numChildren)
            {
               child = frame.children[i];
               sprite.addChild(child.createShapeDisplay(this.data,this.currentFrame,this.boneVisibleRule,this.outerBindRule));
               i++;
            }
            par = new Sprite();
            par.addChild(sprite);
            rect = par.getBounds(sprite);
            b = new BitmapData((rect.x + rect.width) * textureX,(rect.y + rect.height) * textureX,true,0);
            b.draw(par,new Matrix(textureX,0,0,textureX),null,null,null,true);
            return b;
         }
         catch(e:Error)
         {
            return null;
         }
         return b;
      }
      
      public function render(param1:Boolean = false, param2:Boolean = false) : int
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:IBlitDisplayContainer = null;
         var _loc11_:BlitBoneFrameChild = null;
         var _loc12_:IBlitDisplayContainer = null;
         var _loc13_:int = 0;
         var _loc14_:Vector.<IBlitDisplayContainer> = null;
         var _loc15_:int = 0;
         if(this.data == null || this.data.hasDisposed || !this.data.hasLoaded)
         {
            return BlitBoneAnimRenderAnalyzer.RENDER_TYPE_NONE;
         }
         if(this.data.frameBatch.length - 1 < this.currentFrame)
         {
            return BlitBoneAnimRenderAnalyzer.RENDER_TYPE_NONE;
         }
         if(!param1)
         {
            if(this.currentFrame == this.lastRenderFrame)
            {
               return BlitBoneAnimRenderAnalyzer.RENDER_TYPE_NONE;
            }
         }
         var _loc3_:int = BlitBoneAnimRenderAnalyzer.RENDER_TYPE_NONE;
         var _loc4_:IBlitDisplayContainer = this._asset;
         this.lastRenderFrame = this.currentFrame;
         var _loc5_:Boolean = this.factoryType == BlitBone.TYPE_DEFAULT || this.manager.getBlitFactory(this.factoryType) is IBlitBatchableDisplayFactory;
         var _loc6_:BlitBoneFrameBatch;
         if(!(_loc6_ = this.data.frameBatch[this.currentFrame]))
         {
            return BlitBoneAnimRenderAnalyzer.RENDER_TYPE_NONE;
         }
         var _loc7_:int = _loc6_.children.length;
         if(this.data.version >= 3 && this.manager.isPreferBatch && _loc5_)
         {
            if(param2)
            {
               _loc4_.RemoveAllChildren();
               if(this._batchAsset == null)
               {
                  this._batchAsset = this.manager.getBlitFactory(this.factoryType).CreateBlitContainer({"batch":true});
               }
               _loc4_.AddChild(this._batchAsset);
               this._batchAsset.RemoveAllChildren();
               _loc8_ = 0;
               while(_loc8_ < _loc7_)
               {
                  (_loc11_ = _loc6_.children[_loc8_]).addFlattenedDisplays(this._batchAsset,this.data,this.currentFrame,this.boneVisibleRule,[],this.factoryType,this.displayHodler,this.outerBindRule);
                  _loc8_++;
               }
               _loc3_ = BlitBoneAnimRenderAnalyzer.RENDER_TYPE_BATCH_WITHOUT_CACHE;
            }
            else
            {
               _loc4_.RemoveAllChildren();
               if(_loc12_ = this.data.getQuadBatchAt(this.currentFrame,_loc4_,this.boneVisibleRule,this.factoryType,this.outerBindRule))
               {
                  _loc4_.AddChild(_loc12_);
               }
               _loc3_ = BlitBoneAnimRenderAnalyzer.RENDER_TYPE_BATCH_WITH_CACHE;
            }
         }
         else
         {
            _loc13_ = _loc4_.numChildren;
            _loc8_ = 0;
            while(_loc8_ < _loc7_)
            {
               _loc11_ = _loc6_.children[_loc8_];
               if(_loc13_ < _loc7_ || _loc4_.GetChildAt(_loc8_).name != _loc11_.className)
               {
                  if(this.displays[_loc11_.className] == null)
                  {
                     this.displays[_loc11_.className] = new Vector.<IBlitDisplayContainer>();
                  }
                  _loc14_ = this.displays[_loc11_.className];
                  _loc9_ = 0;
                  while(_loc9_ < _loc14_.length)
                  {
                     (_loc10_ = _loc14_[_loc9_] as IBlitDisplayContainer).visible = true;
                     if(_loc10_.GetParent() == null)
                     {
                        _loc4_.AddChildAt(_loc10_,_loc8_);
                        _loc13_ = _loc4_.numChildren;
                        break;
                     }
                     if((_loc15_ = _loc4_.GetChildIndex(_loc10_)) >= _loc8_)
                     {
                        if(_loc15_ != _loc8_)
                        {
                           _loc4_.SwapChildrenAt(_loc15_,_loc8_);
                        }
                        break;
                     }
                     _loc9_++;
                  }
                  if(_loc9_ == _loc14_.length)
                  {
                     (_loc10_ = this.manager.getBlitFactory(this.factoryType).CreateBlitContainer()).name = _loc11_.className;
                     _loc4_.AddChildAt(_loc10_,_loc8_);
                     _loc13_ = _loc4_.numChildren;
                     _loc14_.push(_loc10_);
                  }
               }
               else
               {
                  _loc10_ = _loc4_.GetChildAt(_loc8_) as IBlitDisplayContainer;
               }
               _loc11_.updateDisplay(_loc10_,this.data,this.currentFrame,false,this.factoryType,this.boneVisibleRule);
               _loc8_++;
            }
            while(_loc4_.numChildren > _loc7_)
            {
               _loc10_ = _loc4_.RemoveChildAt(_loc4_.numChildren - 1) as IBlitDisplayContainer;
            }
            _loc3_ = BlitBoneAnimRenderAnalyzer.RENDER_TYPE_BONES_UPDATE;
         }
         return _loc3_;
      }
      
      private function checkFrameEvent() : void
      {
         var _loc1_:FrameEvent = null;
         if(this.getCurFlag() != null)
         {
            _loc1_ = new FrameEvent(FrameEvent.MOVEMENT_FRAME_EVENT);
            _loc1_.frameLabel = this.getCurFlag();
            this.dispatchEvent(_loc1_);
         }
      }
      
      public function get frameLabel() : Vector.<FrameLabel>
      {
         if(this.data == null)
         {
            return null;
         }
         return this.data.frameLabel;
      }
      
      public function get curActionFrame() : int
      {
         if(this.data == null)
         {
            return -1;
         }
         return this._curActionFrame;
      }
      
      public function get flagLabel() : Array
      {
         if(this.data == null)
         {
            return null;
         }
         return this.data.flagLabel;
      }
      
      public function get attackArea() : Array
      {
         if(this.data == null)
         {
            return null;
         }
         return this.data.attackArea;
      }
      
      public function get damageArea() : Array
      {
         if(this.data == null)
         {
            return null;
         }
         return this.data.damageArea;
      }
      
      public function getCurFlag() : String
      {
         if(this.data == null)
         {
            return null;
         }
         return this.data.flagLabel[this.currentFrame];
      }
      
      public function get frameStart() : int
      {
         return this._frameStart;
      }
      
      public function get frameEnd() : int
      {
         return this._frameEnd;
      }
      
      public function get blits() : Array
      {
         if(this.data == null)
         {
            return null;
         }
         return this.data.blits;
      }
      
      public function get frameBatch() : Vector.<BlitBoneFrameBatch>
      {
         if(this.data == null)
         {
            return null;
         }
         return this.data.frameBatch;
      }
      
      public function clearAllBoneVisibleRules() : void
      {
         if(this.boneVisibleRule)
         {
            this.boneVisibleRule.clearAllBoneVisibleRules();
         }
      }
      
      public function setBoneVisibleRule(param1:String, param2:Boolean) : void
      {
         if(this.boneVisibleRule)
         {
            this.boneVisibleRule.setBoneVisibleRule(param1,param2);
         }
      }
      
      public function getBoneVisibleRule(param1:String) : Boolean
      {
         if(this.boneVisibleRule)
         {
            return this.boneVisibleRule.getBoneVisibleRule(param1) > 0;
         }
         return false;
      }
      
      public function getBounds(param1:*) : Rectangle
      {
         return this._asset.GetBounds(param1);
      }
      
      protected function boneVisibleRuleChangeHandler(param1:Event) : void
      {
         this.needAFrameRender = true;
      }
      
      protected function boneBindRuleChangeHandler(param1:Event) : void
      {
         this.needAFrameRender = true;
         this.render(true);
      }
      
      public function addBoneOuterBindRule(param1:String, param2:String) : void
      {
         this.outerBindRule.AddReadRule(param1,param2);
      }
      
      public function clearBoneOuterBindReadRule(param1:String = null) : void
      {
         this.outerBindRule.ClearReadRule(param1);
      }
   }
}
