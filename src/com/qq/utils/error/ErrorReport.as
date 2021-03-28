package com.qq.utils.error
{
   import flash.display.LoaderInfo;
   import flash.events.ErrorEvent;
   import flash.events.IEventDispatcher;
   
   public class ErrorReport
   {
      
      private static var _instance:ErrorReport;
       
      
      private var _handler:Function;
      
      private var _lastErrStr:String;
      
      public function ErrorReport()
      {
         super();
      }
      
      public static function getInstance() : ErrorReport
      {
         if(_instance == null)
         {
            _instance = new ErrorReport();
         }
         return _instance;
      }
      
      public function init(param1:LoaderInfo, param2:Function) : void
      {
         var _loc3_:IEventDispatcher = null;
         this._handler = param2;
         if(param1.hasOwnProperty("uncaughtErrorEvents"))
         {
            _loc3_ = IEventDispatcher(param1["uncaughtErrorEvents"]);
            _loc3_.addEventListener("uncaughtError",this.uncaughtErrorHandler);
         }
      }
      
      private function uncaughtErrorHandler(param1:ErrorEvent) : void
      {
         var _loc2_:Error = null;
         var _loc3_:ErrorEvent = null;
         if(param1.hasOwnProperty("error"))
         {
            if(param1["error"] is Error)
            {
               _loc2_ = param1["error"];
               this.logger("Uncaught Error",_loc2_.name,_loc2_.toString(),_loc2_.getStackTrace());
            }
            else if(param1["error"] is ErrorEvent)
            {
               _loc3_ = param1["error"];
               this.logger("Uncaught ErrorEvent",_loc3_.type);
            }
            else
            {
               this.logger("Thrown Object",_loc3_.type);
            }
         }
      }
      
      private function logger(... rest) : void
      {
         var _loc2_:String = rest.join(",");
         if(this._lastErrStr != null && this._lastErrStr.length == _loc2_.length)
         {
            return;
         }
         this._lastErrStr = _loc2_;
         if(this._handler != null)
         {
            this._handler(_loc2_);
         }
      }
   }
}
