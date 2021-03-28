package com.qq.utils
{
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   
   public class DelayManager
   {
      
      public static const Param_intervalID:int = 0;
      
      public static const Param_RunFunc:int = 1;
      
      public static const Param_isLoop:int = 2;
      
      public static const Param_FuncParam:int = 3;
      
      private static var _instance:DelayManager;
       
      
      private var _counter:int;
      
      private var _map:HashMap;
      
      public function DelayManager()
      {
         super();
         this._map = new HashMap();
         this._counter = 1;
      }
      
      public static function getInstance() : DelayManager
      {
         if(_instance == null)
         {
            _instance = new DelayManager();
         }
         return _instance;
      }
      
      public function addDelay(param1:int, param2:Function, param3:Boolean = false, param4:Array = null) : int
      {
         var _loc5_:int = 0;
         var _loc6_:Array = null;
         if(param1 < 0)
         {
            return 0;
         }
         if(param2 == null)
         {
            return 0;
         }
         ++this._counter;
         if(param1 == 0)
         {
            param2.apply(null,param4);
            return this._counter;
         }
         if(!this._map.containsKey(this._counter))
         {
            _loc5_ = setInterval(this.runDelayFunc,param1,this._counter);
            (_loc6_ = new Array())[Param_intervalID] = _loc5_;
            _loc6_[Param_RunFunc] = param2;
            _loc6_[Param_isLoop] = param3;
            _loc6_[Param_FuncParam] = param4;
            this._map.put(this._counter,_loc6_);
         }
         return this._counter;
      }
      
      public function removeDelay(param1:int) : void
      {
         var _loc2_:Object = null;
         if(this._map.containsKey(param1))
         {
            _loc2_ = this._map.remove(param1);
            clearInterval(_loc2_[Param_intervalID]);
         }
      }
      
      private function getDelay(param1:int) : Array
      {
         return this._map.get(param1);
      }
      
      private function runDelayFunc(param1:int) : void
      {
         var _loc3_:Function = null;
         var _loc4_:Array = null;
         var _loc2_:Array = this.getDelay(param1);
         if(_loc2_ != null)
         {
            if(!_loc2_[Param_isLoop])
            {
               this.removeDelay(param1);
            }
            _loc3_ = _loc2_[Param_RunFunc];
            if(_loc3_ != null)
            {
               _loc4_ = _loc2_[Param_FuncParam];
               _loc3_.apply(null,_loc4_);
            }
         }
      }
   }
}
