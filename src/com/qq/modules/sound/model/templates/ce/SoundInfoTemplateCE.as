package com.qq.modules.sound.model.templates.ce
{
   public class SoundInfoTemplateCE
   {
       
      
      protected var _id:Number;
      
      protected var _url:String;
      
      protected var _isLoop:Number;
      
      protected var _maxSound:Number;
      
      protected var _moduleID:Number;
      
      protected var _volume:Number;
      
      protected var _loopEffect:String;
      
      protected var _isFadeOut:Number;
      
      public function SoundInfoTemplateCE()
      {
         super();
      }
      
      public function load(param1:Object) : void
      {
         this._id = param1.id;
         this._url = param1.url;
         this._isLoop = param1.isLoop;
         this._maxSound = param1.maxSound;
         this._moduleID = param1.moduleID;
         this._volume = param1.volume;
         this._loopEffect = param1.loopEffect;
         this._isFadeOut = param1.isFadeOut;
      }
      
      public function get id() : Number
      {
         return this._id;
      }
      
      public function get url() : String
      {
         return this._url;
      }
      
      public function get isLoop() : Number
      {
         return this._isLoop;
      }
      
      public function get maxSound() : Number
      {
         return this._maxSound;
      }
      
      public function get moduleID() : Number
      {
         return this._moduleID;
      }
      
      public function get volume() : Number
      {
         return this._volume;
      }
      
      public function get loopEffect() : String
      {
         return this._loopEffect;
      }
      
      public function get isFadeOut() : Number
      {
         return this._isFadeOut;
      }
   }
}
