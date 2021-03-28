package com.qq.utils
{
   import flash.utils.Dictionary;
   
   public class HashMap
   {
       
      
      private var length:int;
      
      private var content:Dictionary;
      
      public function HashMap()
      {
         super();
         this.length = 0;
         this.content = new Dictionary();
      }
      
      public function size() : int
      {
         return this.length;
      }
      
      public function isEmpty() : Boolean
      {
         return this.length == 0;
      }
      
      public function keys() : Array
      {
         var _loc3_:* = undefined;
         var _loc1_:Array = new Array(this.length);
         var _loc2_:int = 0;
         for(_loc1_[_loc2_] in this.content)
         {
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function eachKey(param1:Function) : void
      {
         var _loc2_:* = undefined;
         for(_loc2_ in this.content)
         {
            param1(_loc2_);
         }
      }
      
      public function eachValue(param1:Function) : void
      {
         var _loc2_:* = undefined;
         for each(_loc2_ in this.content)
         {
            param1(_loc2_);
         }
      }
      
      public function values() : Array
      {
         var _loc3_:* = undefined;
         var _loc1_:Array = new Array(this.length);
         var _loc2_:int = 0;
         for each(_loc3_ in this.content)
         {
            _loc1_[_loc2_] = _loc3_;
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function containsValue(param1:*) : Boolean
      {
         var _loc2_:* = undefined;
         for each(_loc2_ in this.content)
         {
            if(_loc2_ === param1)
            {
               return true;
            }
         }
         return false;
      }
      
      public function containsKey(param1:*) : Boolean
      {
         if(this.content[param1] != undefined)
         {
            return true;
         }
         return false;
      }
      
      public function get(param1:*) : *
      {
         var _loc2_:* = this.content[param1];
         if(_loc2_ !== undefined)
         {
            return _loc2_;
         }
         return null;
      }
      
      public function getValue(param1:*) : *
      {
         return this.get(param1);
      }
      
      public function put(param1:*, param2:*) : *
      {
         var _loc3_:Boolean = false;
         var _loc4_:* = undefined;
         if(param1 == null)
         {
            throw new ArgumentError("cannot put a value with undefined or null key!");
         }
         if(param2 == null)
         {
            return this.remove(param1);
         }
         _loc3_ = this.containsKey(param1);
         if(!_loc3_)
         {
            ++this.length;
         }
         _loc4_ = this.get(param1);
         this.content[param1] = param2;
         return _loc4_;
      }
      
      public function remove(param1:*) : *
      {
         var _loc2_:Boolean = this.containsKey(param1);
         if(!_loc2_)
         {
            return null;
         }
         var _loc3_:* = this.content[param1];
         delete this.content[param1];
         --this.length;
         return _loc3_;
      }
      
      public function clear() : void
      {
         this.length = 0;
         this.content = new Dictionary();
      }
      
      public function clone() : HashMap
      {
         var _loc2_:* = undefined;
         var _loc1_:HashMap = new HashMap();
         for(_loc2_ in this.content)
         {
            _loc1_.put(_loc2_,this.content[_loc2_]);
         }
         return _loc1_;
      }
      
      public function toString() : String
      {
         var _loc1_:Array = this.keys();
         var _loc2_:Array = this.values();
         var _loc3_:String = "HashMap Content:\n";
         var _loc4_:int = 0;
         while(_loc4_ < _loc1_.length)
         {
            _loc3_ += _loc1_[_loc4_] + " -> " + _loc2_[_loc4_] + "\n";
            _loc4_++;
         }
         return _loc3_;
      }
   }
}
