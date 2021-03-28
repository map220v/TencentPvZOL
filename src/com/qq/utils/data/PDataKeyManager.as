package com.qq.utils.data
{
   import flash.utils.Dictionary;
   import org.as3commons.logging.api.getLogger;
   
   public class PDataKeyManager
   {
      
      private static var _instance:PDataKeyManager;
       
      
      private var _keyList:Dictionary;
      
      private var _counter:int;
      
      public function PDataKeyManager()
      {
         super();
         this._counter = 0;
         this._keyList = new Dictionary();
         this.generateNewKey();
      }
      
      public static function getInstance() : PDataKeyManager
      {
         if(_instance == null)
         {
            _instance = new PDataKeyManager();
         }
         return _instance;
      }
      
      private function addKey(param1:PDataKey) : void
      {
         this._keyList[param1.id] = param1;
      }
      
      private function getKey(param1:int) : PDataKey
      {
         return this._keyList[param1];
      }
      
      private function getKeyValue(param1:int) : Number
      {
         var _loc2_:PDataKey = this.getKey(param1);
         return _loc2_.key;
      }
      
      public function getLastestKeyID() : int
      {
         return this._counter;
      }
      
      public function generateNewKey() : void
      {
         ++this._counter;
         var _loc1_:PDataKey = new PDataKey(this._counter,this.generateOffsetNum());
         getLogger().info("产生新key" + _loc1_.toString());
         this.addKey(_loc1_);
      }
      
      private function generateOffsetNum() : int
      {
         var _loc1_:Array = new Array();
         var _loc2_:int = 0;
         while(_loc2_ < 16)
         {
            if(Math.random() > 0.5)
            {
               _loc1_[_loc2_] = 1;
            }
            else
            {
               _loc1_[_loc2_] = 0;
            }
            _loc2_++;
         }
         var _loc3_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < 16)
         {
            if(_loc1_[_loc2_] == 1)
            {
               _loc3_ += Math.pow(2,_loc2_);
            }
            _loc2_++;
         }
         return _loc3_;
      }
      
      private function doEncrypt_Offset(param1:Number, param2:Number) : Number
      {
         return param1 ^ param2;
      }
      
      private function doDecryption_Offset(param1:Number, param2:Number) : Number
      {
         return param1 ^ param2;
      }
      
      public function encrypt(param1:int, param2:Number) : Number
      {
         return this.doEncrypt_Offset(param2,this.getKeyValue(param1));
      }
      
      public function decryption(param1:int, param2:Number) : Number
      {
         return this.doDecryption_Offset(param2,this.getKeyValue(param1));
      }
   }
}
