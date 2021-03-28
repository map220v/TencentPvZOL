package com.qq.modules.td.logic.unit.basic
{
   import asgui.blit.bone.BlitBoneAnim;
   import asgui.blit.bone.BlitBoneData;
   import asgui.blit.bone.BlitBoneFrameChild;
   import asgui.blit.bone.BlitBoneManager;
   import asgui.blit.display.IBlitDisplayContainer;
   import asgui.blit.display.IBlitDisplayObject;
   import asgui.core.Application;
   import asgui.core.IDisposable;
   import asgui.utils.IAnimatable;
   import asgui.utils.WorldClock;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.utils.tqos.TQOSUtils;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.PixelSnapping;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import flash.utils.setTimeout;
   
   public class GameObjectAnimation extends EventDispatcher implements IAnimatable, IDisposable
   {
       
      
      private var parent:Object;
      
      public var bone:BlitBoneAnim;
      
      private var upperBone:BlitBoneAnim;
      
      public var lastLoop:int;
      
      private var lastLabel:String;
      
      public var url:String;
      
      private var useThumbnails:Boolean;
      
      private var eventListeners:Dictionary;
      
      private var _hasDisposed:Boolean;
      
      private var initFrameScaleForClip:Number;
      
      private var _timeScale:Number = 1;
      
      private var _frameRate:Number;
      
      public function GameObjectAnimation(param1:Object, param2:String = null, param3:Number = 1, param4:Boolean = false, param5:Boolean = false)
      {
         var parent:Object = param1;
         var url:String = param2;
         var initFrameScaleForClip:Number = param3;
         var useThumbnails:Boolean = param4;
         var isFlip:Boolean = param5;
         this.eventListeners = new Dictionary();
         super();
         this.useThumbnails = useThumbnails;
         this.url = url;
         this.parent = parent;
         this.initFrameScaleForClip = initFrameScaleForClip;
         this.bone = BlitBoneManager.impl.createBoneAnim();
         if(isFlip)
         {
            this.bone.asset.scaleX = -1;
         }
         if(url != null)
         {
            this.bone.data = BlitBoneManager.impl.getBoneDataByUrl(url);
            if(useThumbnails)
            {
               if(this.bone.data.hasLoaded)
               {
                  setTimeout(this.updateThumbnailsDisplay,1);
               }
               else
               {
                  this.bone.data.addEventListener(Event.COMPLETE,this.boneDataCompleteHandler);
               }
            }
         }
         try
         {
            if(!useThumbnails)
            {
               parent.addChild(this.bone.asset.asset);
            }
         }
         catch(err:Error)
         {
         }
         this.bone.stop();
      }
      
      protected function boneDataCompleteHandler(param1:Event) : void
      {
         (param1.currentTarget as IEventDispatcher).removeEventListener(Event.COMPLETE,this.boneDataCompleteHandler);
         this.updateThumbnailsDisplay();
      }
      
      private function updateThumbnailsDisplay() : void
      {
         var _loc1_:Bitmap = null;
         if(this.bone && this.parent)
         {
            this.bone.gotoAndStop("idle");
            _loc1_ = new Bitmap(this.bone.getSnapshot(2),PixelSnapping.AUTO,true);
            _loc1_.scaleX = _loc1_.scaleY = 0.5;
            _loc1_.x = this.bone.data.offsetX;
            _loc1_.y = this.bone.data.offsetY;
            this.parent.addChild(_loc1_);
         }
         else if(this.bone == null)
         {
            TQOSUtils.getInstance().reportMsg("loaded bone res failture:  url=" + this.url + " curMapID:" + TDStageInfo.getInstance().startParam.mapUrl + " curTdType:" + TDStageInfo.getInstance().startParam.gameType);
         }
      }
      
      public function Dispose() : void
      {
         var _loc1_:* = undefined;
         if(!this.hasDisposed)
         {
            WorldClock.clock.remove(this);
            this.eventListeners = null;
            if(this.bone)
            {
               for(_loc1_ in this.eventListeners)
               {
                  this.bone.removeEventListener(this.eventListeners[_loc1_],_loc1_);
               }
               if(this.bone.data)
               {
                  this.bone.data.removeEventListener(Event.COMPLETE,this.boneDataCompleteHandler);
               }
               this.bone.Dispose();
               this.bone = null;
            }
            if(this.upperBone)
            {
               this.upperBone.Dispose();
               this.upperBone = null;
            }
         }
         this._hasDisposed = true;
      }
      
      public function get hasDisposed() : Boolean
      {
         return this._hasDisposed;
      }
      
      public function stop() : void
      {
         this.bone.stop();
      }
      
      public function get isPlaying() : Boolean
      {
         return this.bone.isPlaying;
      }
      
      public function get timeScale() : Number
      {
         return this._timeScale;
      }
      
      public function set timeScale(param1:Number) : void
      {
         this._timeScale = param1;
         this.bone.frameRate = this.frameRate * this.timeScale;
      }
      
      public function get swfFrameRate() : int
      {
         return this.bone.data.frameRate;
      }
      
      public function get frameRate() : Number
      {
         if(isNaN(this._frameRate))
         {
            this._frameRate = this.swfFrameRate > 0 ? Number(this.swfFrameRate) : Number(Application.application.stage.frameRate);
         }
         return this._frameRate;
      }
      
      public function set frameRate(param1:Number) : void
      {
         this._frameRate = param1;
         this.bone.frameRate = this.frameRate * this.timeScale;
      }
      
      public function get display() : IBlitDisplayContainer
      {
         return this.bone.asset;
      }
      
      public function get displayX() : Number
      {
         return 0;
      }
      
      public function get displayY() : Number
      {
         return 0;
      }
      
      public function get currentTime() : Number
      {
         return NaN;
      }
      
      public function getCurrentFrameIndex() : int
      {
         return this.bone.currentFrame;
      }
      
      public function getLastLabel() : String
      {
         return this.lastLabel;
      }
      
      public function play(param1:int = 0, param2:Boolean = false) : void
      {
         this.bone.play(param1,param2);
      }
      
      public function getBone(param1:String) : IBlitDisplayObject
      {
         return this.bone.getBoneClone(param1);
      }
      
      public function getFrameChild(param1:String) : BlitBoneFrameChild
      {
         if(!this.bone || !this.bone.data)
         {
            return null;
         }
         return this.bone.data.getFrameChild(param1,this.bone.currentFrame);
      }
      
      public function getBonesByNameCompare(param1:String) : IBlitDisplayObject
      {
         var _loc2_:Vector.<IBlitDisplayObject> = this.bone.getBonesByNameCompare(param1);
         if(_loc2_.length > 0)
         {
            return _loc2_[0];
         }
         return null;
      }
      
      public function getBoneClone(param1:String, param2:int = -1, param3:String = null) : IBlitDisplayObject
      {
         return this.bone.getBoneClone(param1,param2,param3);
      }
      
      public function getSnapshot(param1:Number = 1) : BitmapData
      {
         return this.bone.getSnapshot(param1);
      }
      
      public function getAllLabelName() : Array
      {
         return this.bone.getAllLabelName();
      }
      
      public function gotoAndStop(param1:Object) : void
      {
         if(this.bone)
         {
            this.bone.gotoAndStop(param1);
         }
      }
      
      public function gotoAndPlay(param1:String, param2:* = null, param3:int = -1) : void
      {
         if(param2 == null)
         {
            param2 = 1;
         }
         else if(param2 is Boolean)
         {
            if(param2)
            {
               param2 = 0;
            }
            else
            {
               param2 = 1;
            }
         }
         this.lastLoop = param2;
         this.lastLabel = param1;
         if(this.bone)
         {
            this.bone.gotoAndPlay(param1,param2,param3);
         }
      }
      
      public function getChildFrameArray(param1:String, param2:String) : Vector.<BlitBoneFrameChild>
      {
         return this.bone.data.getChildFrameArray(param1,param2);
      }
      
      override public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         this.bone.addEventListener(param1,param2,param3,param4,param5);
         if(!param5)
         {
            this.eventListeners[param2] = param1;
         }
      }
      
      override public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         this.bone.removeEventListener(param1,param2,param3);
         if(this.eventListeners[param2] != null)
         {
            delete this.eventListeners[param2];
         }
      }
      
      public function getFrameLabelRange(param1:String) : Vector.<int>
      {
         return this.bone.data.getFrameLabelRange(param1);
      }
      
      public function advanceTime(param1:Number) : void
      {
         if(this.bone)
         {
            this.bone.render();
         }
      }
      
      public function get animationData() : BlitBoneData
      {
         return this.bone.data;
      }
      
      public function cleanFilter() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Object = null;
         if(this.bone.asset == null)
         {
            return;
         }
         if(this.bone && this.bone.asset && this.bone.asset.filters)
         {
            _loc1_ = 0;
            while(_loc1_ < this.bone.asset.filters.length)
            {
               _loc2_ = this.bone.asset.filters[_loc1_];
               if(_loc2_ && _loc2_.hasOwnProperty("dispose"))
               {
                  _loc2_.dispose();
               }
               _loc1_++;
            }
            this.bone.asset.filters = null;
         }
      }
      
      public function hasFilter() : Boolean
      {
         return true;
      }
      
      public function get currentFrame() : int
      {
         return this.bone.currentFrame;
      }
      
      public function get currentLabel() : String
      {
         return this.bone.currentLabel;
      }
      
      public function set filter(param1:Object) : void
      {
         if(param1 == null)
         {
            this.bone.asset.filters = null;
         }
         else
         {
            this.bone.asset.filters = [param1];
         }
      }
      
      public function get filter() : Object
      {
         if(this.bone == null || this.bone.asset == null)
         {
            return null;
         }
         return this.bone.asset.filters[0];
      }
      
      public function get offsetX() : int
      {
         return this.bone.data.offsetX;
      }
      
      public function get offsetY() : int
      {
         return this.bone.data.offsetY;
      }
      
      public function GetBounds(param1:* = null) : Rectangle
      {
         if(param1 == null)
         {
            param1 = this.parent;
         }
         return this.bone.getBounds(param1);
      }
      
      public function setBoneVisibleRule(param1:String, param2:Boolean) : void
      {
         this.bone.setBoneVisibleRule(param1,param2);
      }
      
      public function getBoneVisibleRule(param1:String) : Boolean
      {
         return this.bone.getBoneVisibleRule(param1);
      }
      
      public function renderForce() : void
      {
         this.bone.render(true);
      }
      
      public function upperBoneGotoAndPlay(param1:String, param2:String, param3:Boolean = false) : BlitBoneAnim
      {
         if(this.upperBone == null)
         {
            this.upperBone = BlitBoneManager.impl.createBoneAnim();
            if(!this.useThumbnails)
            {
               this.parent.addChild(this.upperBone.asset.asset);
            }
         }
         this.upperBone.data = BlitBoneManager.impl.getBoneDataByUrl(param1);
         this.upperBone.gotoAndPlay(param2,!!param3 ? 0 : 1);
         return this.upperBone;
      }
      
      public function upperBoneDispose() : void
      {
         if(this.upperBone)
         {
            this.upperBone.Dispose();
            this.upperBone = null;
         }
      }
      
      public function get totalFrames() : int
      {
         return this.bone.totalFrames;
      }
      
      public function get visible() : Boolean
      {
         return this.bone.asset.visible;
      }
      
      public function set visible(param1:Boolean) : void
      {
         this.bone.asset.visible = param1;
      }
   }
}
