package com.qq.sound
{
   import com.greensock.TweenMax;
   import com.qq.utils.db.ShareObjectConst;
   import com.qq.utils.db.ShareObjectDB;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   
   public class AudioManager
   {
      
      public static const FADE_TIME:Number = 0.2;
      
      private static var _instance:AudioManager;
       
      
      private var _playerList:Array;
      
      private var _cache:Dictionary;
      
      private var _soundCounter:Dictionary;
      
      private var _isMusicMute:Boolean;
      
      private var _isSoundEffMute:Boolean;
      
      private var _timer:Timer;
      
      private var _stage:Stage;
      
      public function AudioManager()
      {
         super();
         this._cache = new Dictionary();
         this._soundCounter = new Dictionary();
         this._playerList = new Array();
         this._timer = new Timer(10000);
         this._timer.addEventListener(TimerEvent.TIMER,this.onTime);
         this.isMusicMute = Boolean(ShareObjectDB.getInstance().readData(ShareObjectConst.KEY_IsMute));
         this.isSoundEffMute = Boolean(ShareObjectDB.getInstance().readData(ShareObjectConst.KEY_SoundEffect_IsMute));
      }
      
      public static function getInstance() : AudioManager
      {
         if(_instance == null)
         {
            _instance = new AudioManager();
         }
         return _instance;
      }
      
      public function getPlayerList() : Array
      {
         return this._playerList.concat();
      }
      
      public function get isMusicMute() : Boolean
      {
         return this._isMusicMute;
      }
      
      public function set isMusicMute(param1:Boolean) : void
      {
         this._isMusicMute = param1;
      }
      
      public function get isSoundEffMute() : Boolean
      {
         return this._isSoundEffMute;
      }
      
      public function set isSoundEffMute(param1:Boolean) : void
      {
         this._isSoundEffMute = param1;
      }
      
      public function init(param1:Stage) : void
      {
         this._stage = param1;
      }
      
      private function addSoundCounter(param1:String) : void
      {
         if(this._soundCounter[param1] == null)
         {
            this._soundCounter[param1] = 0;
         }
         //++this._soundCounter[param1];
      }
      
      public function removeSoundCounter(param1:String) : void
      {
         if(this._soundCounter[param1] == null)
         {
            this._soundCounter[param1] = 0;
         }
         if(this._soundCounter[param1] > 0)
         {
            //--this._soundCounter[param1];
         }
      }
      
      private function isMaxSoundNum(param1:AudioSource) : Boolean
      {
         if(this._soundCounter[param1.key] == null)
         {
            this._soundCounter[param1.key] = 0;
         }
         return int(this._soundCounter[param1.key]) + 1 > param1.maxSound;
      }
      
      public function pauseAllSound() : void
      {
         var _loc1_:AudioPlayer = null;
         for each(_loc1_ in this._playerList)
         {
            _loc1_.pause();
         }
      }
      
      public function resumeAllSound() : void
      {
         var _loc1_:AudioPlayer = null;
         if(this.isMusicMute)
         {
            return;
         }
         for each(_loc1_ in this._playerList)
         {
            if(_loc1_.config.isBackSound)
            {
               _loc1_.resume();
            }
         }
      }
      
      public function stopSoundBySoundFlag(param1:int) : void
      {
         var _loc2_:AudioPlayer = null;
         for each(_loc2_ in this._playerList)
         {
            if(_loc2_.config.soundFlag == param1)
            {
               this.stopSoundImmediately(_loc2_);
            }
         }
      }
      
      public function playSound(param1:AudioSource, param2:AudioConfig, param3:int) : void
      {
         if(this.isSoundEffMute && !param2.isBackSound)
         {
            return;
         }
         if(this.isMaxSoundNum(param1))
         {
            return;
         }
         var _loc4_:AudioPlayer = this.getAudioPlayer(param1,param2);
         if(param2.isBackSound && !this.isMusicMute)
         {
            _loc4_.play(param3);
         }
         if(!param2.isBackSound && !this.isSoundEffMute)
         {
            _loc4_.play(param3);
         }
         this.addSoundCounter(param1.key);
      }
      
      public function stopSound(param1:int, param2:Boolean = false) : void
      {
         var _loc6_:AudioPlayer = null;
         var _loc7_:Boolean = false;
         var _loc3_:Array = this._playerList.concat();
         var _loc4_:int = _loc3_.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = _loc3_[_loc5_];
            _loc7_ = param2;
            if(_loc6_.source.id == param1)
            {
               if(!_loc7_)
               {
                  _loc7_ = _loc6_.config.isFadeOut;
               }
               if(_loc7_)
               {
                  this.stopSoundFadeout(_loc6_);
               }
               else
               {
                  this.stopSoundImmediately(_loc6_);
               }
            }
            _loc5_++;
         }
      }
      
      private function stopSoundImmediately(param1:AudioPlayer) : void
      {
         param1.stop();
         param1.recycle();
      }
      
      private function stopSoundFadeout(param1:AudioPlayer) : void
      {
         if(param1.isVaild())
         {
            TweenMax.to(param1.channel.soundTransform,FADE_TIME,{
               "volume":0,
               "onComplete":this.stopSoundImmediately,
               "onCompleteParams":[param1]
            });
         }
         else
         {
            this.stopSoundImmediately(param1);
         }
      }
      
      public function stopSoundByModuleID(param1:int) : void
      {
         var _loc3_:AudioPlayer = null;
         var _loc2_:Array = this._playerList.concat();
         for each(_loc3_ in _loc2_)
         {
            if(_loc3_.source.moduleID == param1)
            {
               _loc3_.stop();
               _loc3_.recycle();
            }
         }
      }
      
      private function getAudioPlayer(param1:AudioSource, param2:AudioConfig) : AudioPlayer
      {
         var _loc5_:AudioPlayer = null;
         var _loc3_:String = param1.key;
         var _loc4_:Array;
         if((_loc4_ = this._cache[_loc3_]) == null)
         {
            _loc4_ = new Array();
            this._cache[_loc3_] = _loc4_;
         }
         if(_loc4_.length > 0)
         {
            (_loc5_ = _loc4_.pop()).reset();
         }
         if(_loc5_ == null)
         {
            (_loc5_ = new AudioPlayer(param1,param2,this._stage)).reset();
         }
         this._playerList.push(_loc5_);
         return _loc5_;
      }
      
      public function addPlayerToCache(param1:AudioPlayer) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:String = param1.source.key;
         var _loc3_:Array = this._cache[_loc2_];
         if(_loc3_ == null)
         {
            _loc3_ = new Array();
            this._cache[_loc2_] = _loc3_;
         }
         _loc3_.push(param1);
         var _loc4_:int;
         if((_loc4_ = this._playerList.indexOf(param1)) != -1)
         {
            this._playerList.splice(_loc4_,1);
         }
         if(!this._timer.running)
         {
            this._timer.start();
         }
      }
      
      private function onTime(param1:Event) : void
      {
         this.checkSoundExist();
      }
      
      private function checkSoundExist() : void
      {
         var _loc2_:Array = null;
         var _loc3_:AudioPlayer = null;
         var _loc4_:int = 0;
         var _loc1_:int = 0;
         for each(_loc2_ in this._cache)
         {
            for each(_loc3_ in _loc2_)
            {
               if(!_loc3_.isVaild())
               {
                  if((_loc4_ = _loc2_.indexOf(_loc3_)) != -1)
                  {
                     _loc2_.splice(_loc3_,1);
                     _loc3_.dispose();
                  }
               }
               else
               {
                  _loc1_++;
               }
            }
         }
         if(_loc1_ == 0)
         {
            if(this._timer.running)
            {
               this._timer.reset();
            }
         }
      }
   }
}
