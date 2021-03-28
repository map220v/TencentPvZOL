package com.qq.utils
{
   import flash.display.Stage;
   import flash.events.KeyboardEvent;
   import flash.utils.Dictionary;
   
   public class KeyManager
   {
      
      private static var _instance:KeyManager;
       
      
      private var _map:Dictionary;
      
      public function KeyManager()
      {
         super();
         this._map = new Dictionary();
      }
      
      public static function getInstance() : KeyManager
      {
         if(_instance == null)
         {
            _instance = new KeyManager();
         }
         return _instance;
      }
      
      public function init(param1:Stage) : void
      {
         param1.addEventListener(KeyboardEvent.KEY_UP,this.onKeyDown);
      }
      
      public function onKeyDown(param1:KeyboardEvent) : void
      {
         var _loc2_:int = param1.keyCode;
         _loc2_ = this.covertToLowercase(_loc2_);
         if(this._map[_loc2_] == null)
         {
            return;
         }
         var _loc3_:Array = this._map[_loc2_];
         var _loc4_:Function = _loc3_[0];
         var _loc5_:Array = _loc3_[1];
         if(_loc4_ != null)
         {
            _loc4_.apply(null,_loc5_);
         }
      }
      
      public function register(param1:int, param2:Function, param3:Array) : void
      {
         this._map[this.covertToLowercase(param1)] = [param2,param3];
      }
      
      private function covertToLowercase(param1:int) : int
      {
         if(param1 >= 65 && param1 <= 90)
         {
            param1 += 32;
         }
         return param1;
      }
      
      public function unregister(param1:int) : void
      {
         param1 = this.covertToLowercase(param1);
         if(this._map[param1] == null)
         {
            return;
         }
         delete this._map[param1];
      }
   }
}
