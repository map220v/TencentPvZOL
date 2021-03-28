package com.qq.sound
{
   import asgui.managers.LoaderManager;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundLoaderContext;
   import flash.media.SoundTransform;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.utils.getTimer;
   import org.as3commons.logging.api.getLogger;
   
   public class AudioPlayer
   {
       
      
      public var source:AudioSource;
      
      public var config:AudioConfig;
      
      public var lastActivityTime:Number;
      
      public var loadStartTime:Number;
      
      private var _sound:Sound;
      
      private var _channel:SoundChannel;
      
      private var _loader:Loader;
      
      private var _isFinshLoad:Boolean;
      
      private var _isReadyPlay:Boolean;
      
      public var isPause:Boolean;
      
      private var _pausePos:Number;
      
      private var _stopPos:Number = 0;
      
      private var _stage:Stage;
      
      private var _isCheckLoopInside:Boolean;
      
      private var _loopInsideIndex:int;
      
      public function AudioPlayer(param1:AudioSource, param2:AudioConfig, param3:Stage)
      {
         super();
         this.source = param1;
         this.config = param2;
         this._stage = param3;
         this.init();
      }
      
      private function init() : void
      {
         var _loc2_:SoundLoaderContext = null;
         var _loc3_:LoaderContext = null;
         var _loc4_:Loader = null;
         this._isFinshLoad = false;
         this.isPause = false;
         var _loc1_:URLRequest = new URLRequest(this.source.url);
         if(this.source.souceType == AudioSource.SOUNDTYPE_MUSIC_FILE)
         {
            if(LoaderManager.impl.isOpening)
            {
               LoaderManager.impl.AddCompleteCallback(this.init);
               return;
            }
            this._sound = new Sound();
            _loc2_ = new SoundLoaderContext(1000,false);
            this._sound.addEventListener(IOErrorEvent.IO_ERROR,this.onIOError);
            this._sound.addEventListener(ProgressEvent.PROGRESS,this.onSoundLoadProgress);
            this._sound.addEventListener(Event.COMPLETE,this.onSoundLoadCompete);
            this._sound.load(_loc1_,_loc2_);
            if(this._isReadyPlay)
            {
               this.play();
            }
         }
         else
         {
            _loc3_ = new LoaderContext(false,new ApplicationDomain());
            (_loc4_ = new Loader()).contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.onIOError);
            _loc4_.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onLoadSwfComplete);
            _loc4_.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,this.onSoundLoadProgress);
            _loc4_.load(_loc1_,_loc3_);
         }
         this.loadStartTime = getTimer();
         this.lastActivityTime = getTimer();
      }
      
      public function reset() : void
      {
         this.loadStartTime = getTimer();
         this.isPause = false;
         this._pausePos = 0;
         this.lastActivityTime = getTimer();
         this.resetLoopInside();
      }
      
      private function resetLoopInside() : void
      {
         if(this.config.loopInsideData != null)
         {
            this._isCheckLoopInside = true;
            this._loopInsideIndex = 0;
         }
         else
         {
            this._isCheckLoopInside = false;
         }
      }
      
      public function isVaild() : Boolean
      {
         if(this.isPause)
         {
            return false;
         }
         if(this.channel == null)
         {
            return false;
         }
         if(this._isFinshLoad && getTimer() - this.lastActivityTime <= this.config.existTime)
         {
            return true;
         }
         return false;
      }
      
      public function play(param1:Number = -1) : void
      {
         this._isReadyPlay = true;
         if(this._sound == null)
         {
            return;
         }
         var _loc2_:Number = getTimer() - this.loadStartTime;
         if(this.source.souceType != AudioSource.SOUNDTYPE_MUSIC_FILE && _loc2_ > this.config.vaildPlayTimeLimit)
         {
            this.recycle();
            return;
         }
         var _loc3_:Number = 0;
         if(param1 == -1)
         {
            if(this.config.isLoop && this._stopPos != 0)
            {
               _loc3_ = this._stopPos;
            }
         }
         else
         {
            _loc3_ = param1;
         }
         this._channel = this._sound.play(_loc3_);
         if(this._channel != null)
         {
            this._channel.soundTransform = new SoundTransform(this.source.volume);
            this._channel.addEventListener(Event.SOUND_COMPLETE,this.onSoundComplete);
            if(this.config.loopInsideData != null)
            {
               this._stage.addEventListener(Event.ENTER_FRAME,this.onLoopInsideHandler);
            }
         }
      }
      
      private function onLoopInsideHandler(param1:Event) : void
      {
         if(this.isPause)
         {
            return;
         }
         if(!this._isCheckLoopInside)
         {
            return;
         }
         var _loc2_:Array = this.config.loopInsideData[this._loopInsideIndex];
         if(this._channel != null && this._channel.position > _loc2_[0])
         {
            ++this._loopInsideIndex;
            this._channel.stop();
            this._channel.removeEventListener(Event.SOUND_COMPLETE,this.onSoundComplete);
            this._channel = null;
            this._channel = this._sound.play(_loc2_[1]);
            this._channel.addEventListener(Event.SOUND_COMPLETE,this.onSoundComplete);
            if(this._loopInsideIndex >= this.config.loopInsideData.length)
            {
               this._isCheckLoopInside = false;
            }
         }
      }
      
      public function stop() : void
      {
         if(this._channel != null)
         {
            if(this.config.isLoop)
            {
               this._stopPos = this._channel.position;
            }
            if(this.config.loopInsideData != null)
            {
               this._stage.removeEventListener(Event.ENTER_FRAME,this.onLoopInsideHandler);
            }
            this._channel.removeEventListener(Event.SOUND_COMPLETE,this.onSoundComplete);
            this._channel.stop();
            this._channel = null;
         }
      }
      
      public function resume() : void
      {
         if(this._sound != null)
         {
            if(this._channel != null)
            {
               this._channel.removeEventListener(Event.SOUND_COMPLETE,this.onSoundComplete);
            }
            this._channel = this._sound.play(this._pausePos);
            if(this._channel != null)
            {
               this._channel.addEventListener(Event.SOUND_COMPLETE,this.onSoundComplete);
            }
         }
         this._pausePos = 0;
         this.isPause = false;
      }
      
      public function pause() : void
      {
         if(this._channel != null)
         {
            this._pausePos = this._channel.position;
            this._channel.stop();
         }
         this.isPause = true;
      }
      
      public function get channel() : SoundChannel
      {
         return this._channel;
      }
      
      public function recycle() : void
      {
         this._isReadyPlay = false;
         AudioManager.getInstance().addPlayerToCache(this);
         AudioManager.getInstance().removeSoundCounter(this.source.key);
      }
      
      public function dispose() : void
      {
         this.stop();
         if(this._sound != null)
         {
            this._sound.removeEventListener(IOErrorEvent.IO_ERROR,this.onIOError);
            this._sound.removeEventListener(ProgressEvent.PROGRESS,this.onSoundLoadProgress);
            this._sound.removeEventListener(Event.COMPLETE,this.onSoundLoadCompete);
            if(this.config.loopInsideData != null)
            {
               this._stage.removeEventListener(Event.ENTER_FRAME,this.onLoopInsideHandler);
            }
            this._sound = null;
         }
         if(this._loader != null)
         {
            this._loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,this.onIOError);
            this._loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.onLoadSwfComplete);
            this._loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS,this.onSoundLoadProgress);
            this._loader = null;
         }
         if(this._channel != null)
         {
            this._channel.removeEventListener(Event.SOUND_COMPLETE,this.onSoundComplete);
            this._channel = null;
         }
      }
      
      private function onIOError(param1:IOErrorEvent) : void
      {
         this._isFinshLoad = true;
         getLogger().debug(param1.text);
      }
      
      private function onLoadSwfComplete(param1:Event) : void
      {
         var _loc3_:Loader = null;
         var _loc4_:ApplicationDomain = null;
         var _loc5_:Class = null;
         var _loc2_:LoaderInfo = param1.currentTarget as LoaderInfo;
         if(_loc2_ != null)
         {
            _loc3_ = _loc2_.loader;
            if(_loc3_ != null && _loc3_.content != null)
            {
               if((_loc4_ = _loc3_.contentLoaderInfo.applicationDomain).hasDefinition("sound"))
               {
                  _loc5_ = _loc4_.getDefinition("sound") as Class;
                  this._sound = new _loc5_();
                  this._isFinshLoad = true;
                  if(this._isReadyPlay)
                  {
                     this.play();
                  }
               }
               else
               {
                  getLogger().debug("没有找到sound命名的音效" + this.source.url);
               }
            }
         }
      }
      
      private function onSoundLoadCompete(param1:Event) : void
      {
         this._isFinshLoad = true;
      }
      
      private function onSoundComplete(param1:Event) : void
      {
         if(this._sound != null)
         {
            this.resetLoopInside();
            if(this._channel != null)
            {
               this._channel.removeEventListener(Event.SOUND_COMPLETE,this.onSoundComplete);
               this._channel.stop();
               this._channel = null;
            }
            this.lastActivityTime = getTimer();
            if(this.config.isLoop)
            {
               this._channel = this._sound.play();
               this._channel.addEventListener(Event.SOUND_COMPLETE,this.onSoundComplete);
            }
            else
            {
               this.recycle();
            }
         }
      }
      
      private function onSoundLoadProgress(param1:ProgressEvent) : void
      {
      }
   }
}
