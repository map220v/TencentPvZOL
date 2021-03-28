package com.qq.utils.db
{
   import flash.net.SharedObject;
   
   public class ShareObjectDB
   {
      
      private static var _instance:ShareObjectDB;
       
      
      public function ShareObjectDB()
      {
         super();
      }
      
      public static function getInstance() : ShareObjectDB
      {
         if(_instance == null)
         {
            _instance = new ShareObjectDB();
         }
         return _instance;
      }
      
      private function getDB() : SharedObject
      {
         return SharedObject.getLocal("PVZ");
      }
      
      public function hasData(param1:String) : Boolean
      {
         var _loc2_:SharedObject = this.getDB();
         if(_loc2_ == null)
         {
            return false;
         }
         return _loc2_.data[param1] != null;
      }
      
      public function readData(param1:String, param2:Object = null) : Object
      {
         var _loc3_:SharedObject = this.getDB();
         if(_loc3_ == null)
         {
            return null;
         }
         if(_loc3_.data[param1] == null)
         {
            _loc3_.data[param1] = param2;
         }
         return _loc3_.data[param1];
      }
      
      public function writeData(param1:String, param2:Object, param3:Boolean = false) : void
      {
         var _loc4_:SharedObject;
         if((_loc4_ = this.getDB()) == null)
         {
            return;
         }
         _loc4_.data[param1] = param2;
         if(param3)
         {
            _loc4_.flush();
         }
      }
   }
}
