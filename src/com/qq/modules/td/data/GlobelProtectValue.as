package com.qq.modules.td.data
{
   import com.qq.utils.data.PData;
   import flash.utils.Dictionary;
   
   public class GlobelProtectValue
   {
      
      public static const KEY_FIGHTPOWER:int = 0;
      
      public static const KEY_VALUE_1:int = 1;
      
      public static const KEY_VALUE_001:int = 2;
      
      private static var _instance:GlobelProtectValue;
       
      
      private var _map:Dictionary;
      
      public function GlobelProtectValue()
      {
         super();
         this._map = new Dictionary();
      }
      
      public static function getInstance() : GlobelProtectValue
      {
         if(_instance == null)
         {
            _instance = new GlobelProtectValue();
         }
         return _instance;
      }
      
      public function set(param1:int, param2:Number) : void
      {
         var _loc3_:PData = null;
         if(this._map[param1] == null)
         {
            _loc3_ = new PData();
            this._map[param1] = _loc3_;
         }
         else
         {
            _loc3_ = this._map[param1];
         }
         _loc3_.set(param2);
      }
      
      public function get(param1:int) : Number
      {
         var _loc3_:PData = null;
         if(this._map[param1] == null)
         {
            _loc3_ = new PData();
            this._map[param1] = _loc3_;
            _loc3_.set(0);
         }
         var _loc2_:PData = this._map[param1];
         return _loc2_.get();
      }
   }
}
