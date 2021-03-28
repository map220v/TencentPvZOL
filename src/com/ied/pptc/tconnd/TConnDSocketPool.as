package com.ied.pptc.tconnd
{
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   class TConnDSocketPool
   {
       
      
      private var _host:String;
      
      private var _port:uint;
      
      private var _timer:Timer;
      
      private var _pool:Vector.<TConnDSocketHandler>;
      
      function TConnDSocketPool(param1:String, param2:uint)
      {
         super();
         this._host = param1;
         this._port = param2;
         this._pool = new Vector.<TConnDSocketHandler>();
         this._timer = new Timer(10000);
         this._timer.addEventListener(TimerEvent.TIMER,this.onTimer,false,0,true);
         this._timer.start();
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         var _loc2_:TConnDSocketHandler = null;
         var _loc3_:uint = 0;
         while(_loc3_ < this._pool.length)
         {
            _loc2_ = this._pool[_loc3_];
            _loc2_.checkClose();
            _loc3_++;
         }
      }
      
      public function getSocketHandler() : TConnDSocketHandler
      {
         var _loc1_:TConnDSocketHandler = null;
         var _loc2_:uint = 0;
         while(_loc2_ < this._pool.length)
         {
            _loc1_ = this._pool[_loc2_];
            if(!_loc1_.isUsing())
            {
               return _loc1_;
            }
            _loc2_++;
         }
         _loc1_ = new TConnDSocketHandler(this._host,this._port);
         this._pool.push(_loc1_);
         return _loc1_;
      }
   }
}
