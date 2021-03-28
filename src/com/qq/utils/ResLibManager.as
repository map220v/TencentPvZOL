package com.qq.utils
{
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.media.Sound;
   import flash.system.ApplicationDomain;
   import flash.utils.Dictionary;
   
   public class ResLibManager
   {
      
      private static var _intance:ResLibManager;
       
      
      private var _libMap:Dictionary;
      
      public function ResLibManager()
      {
         super();
         this._libMap = new Dictionary();
      }
      
      public static function getInstance() : ResLibManager
      {
         if(_intance == null)
         {
            _intance = new ResLibManager();
         }
         return _intance;
      }
      
      public static function createInstance(param1:String, param2:ApplicationDomain = null) : *
      {
         var _loc3_:Class = getClass(param1,param2);
         if(_loc3_ != null)
         {
            return new _loc3_();
         }
         return null;
      }
      
      public static function getClass(param1:String, param2:ApplicationDomain = null) : Class
      {
         if(param2 == null)
         {
            param2 = ApplicationDomain.currentDomain;
         }
         return param2.getDefinition(param1) as Class;
      }
      
      public function addLib(param1:int, param2:ApplicationDomain) : void
      {
         this._libMap[param1] = param2;
      }
      
      public function getLib(param1:int) : ApplicationDomain
      {
         return this._libMap[param1];
      }
      
      public function removeLib(param1:int) : void
      {
         delete this._libMap[param1];
      }
      
      public function createDisplayObject(param1:String, param2:int) : DisplayObject
      {
         var _loc3_:ApplicationDomain = this._libMap[param2];
         return createInstance(param1,_loc3_) as DisplayObject;
      }
      
      public function createSoundObject(param1:String, param2:int) : Sound
      {
         var _loc3_:ApplicationDomain = this._libMap[param2];
         return createInstance(param1,_loc3_) as Sound;
      }
      
      public function createBitmapData(param1:String, param2:int) : BitmapData
      {
         var _loc3_:Class = this.getClassFromRes(param1,param2);
         return new _loc3_(0,0);
      }
      
      public function getClassFromRes(param1:String, param2:int) : Class
      {
         var _loc3_:ApplicationDomain = this._libMap[param2];
         if(_loc3_ == null)
         {
            _loc3_ = ApplicationDomain.currentDomain;
         }
         return getClass(param1,_loc3_);
      }
      
      public function hasClass(param1:String, param2:int) : Boolean
      {
         var _loc3_:ApplicationDomain = this._libMap[param2];
         if(_loc3_ == null)
         {
            return false;
         }
         return _loc3_.hasDefinition(param1);
      }
   }
}
