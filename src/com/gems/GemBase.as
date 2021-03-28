package com.gems
{
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   
   public class GemBase
   {
       
      
      private var _lastType:int;
      
      private var _type:int;
      
      private var _randomRate:int;
      
      private var _gemWidth:int;
      
      private var _gemHeight:int;
      
      private var _idx:int;
      
      private var _idy:int;
      
      private var _lock:Boolean = false;
      
      private var _empty:Boolean = false;
      
      private var _analogIdx:int = -1;
      
      private var _analogIdy:int = -1;
      
      protected var _isMove:Boolean = false;
      
      public function GemBase(param1:int, param2:int, param3:int, param4:int)
      {
         super();
         this._type = param1;
         this._lastType = param1;
         this._randomRate = param2;
         this._gemWidth = param3;
         this._gemHeight = param4;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get randomRate() : int
      {
         return this._randomRate;
      }
      
      public function get gemWidth() : int
      {
         return this._gemWidth;
      }
      
      public function get gemHeight() : int
      {
         return this._gemHeight;
      }
      
      public function get idx() : int
      {
         if(this._analogIdx != -1)
         {
            return this._analogIdx;
         }
         return this._idx;
      }
      
      public function get idy() : int
      {
         if(this._analogIdy != -1)
         {
            return this._analogIdy;
         }
         return this._idy;
      }
      
      public function get lock() : Boolean
      {
         return this._lock;
      }
      
      public function set lock(param1:Boolean) : void
      {
         this._lock = param1;
         this.updateLock();
      }
      
      public function get empty() : Boolean
      {
         return this._empty;
      }
      
      public function set empty(param1:Boolean) : void
      {
         if(this._empty == param1)
         {
            return;
         }
         this._empty = param1;
         this._type = !!param1 ? 0 : int(this._lastType);
         this.updateEmpty();
      }
      
      public function create(param1:int, param2:int, param3:Boolean = false) : void
      {
         this._idx = param1;
         this._idy = param2;
         if(param3)
         {
            this.updateView();
         }
      }
      
      public final function analogCreate(param1:int = -1, param2:int = -1) : void
      {
         this._analogIdx = param1;
         this._analogIdy = param2;
      }
      
      protected function updateLock() : void
      {
         throw new Error("should override this function:  updateLock");
      }
      
      protected function updateEmpty() : void
      {
         throw new Error("should override this function:  updateLock");
      }
      
      public function getEffectTarget() : Object
      {
         throw new Error("should override this function:  getEffectTarget");
      }
      
      protected function updateView() : void
      {
         throw new Error("should override this function:  updateView");
      }
      
      public function isEqual(param1:GemBase) : Boolean
      {
         if(this.idx == param1.idx && this.idy == param1.idy)
         {
            return true;
         }
         return false;
      }
      
      public function isNear(param1:GemBase) : Boolean
      {
         if(Math.abs(this.idx - param1.idx) == 1 && this.idy == param1.idy)
         {
            return true;
         }
         if(Math.abs(this.idy - param1.idy) == 1 && this.idx == param1.idx)
         {
            return true;
         }
         return false;
      }
      
      public function set isMove(param1:Boolean) : void
      {
         this._isMove = param1;
      }
      
      public function get isMove() : Boolean
      {
         return this._isMove;
      }
      
      public function onMoving() : void
      {
      }
      
      public function debug() : void
      {
      }
      
      public function clone() : GemBase
      {
         var _loc1_:String = getQualifiedClassName(this);
         var _loc2_:Class = getDefinitionByName(_loc1_) as Class;
         return new _loc2_(this._type,this._randomRate,this._gemWidth,this._gemHeight);
      }
      
      public function dispose() : void
      {
      }
   }
}
