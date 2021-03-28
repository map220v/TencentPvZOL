package org.as3commons.logging.api
{
   public class LoggerFactory
   {
       
      
      private const _allLoggers:Array = [];
      
      private const _loggers:Object = {};
      
      private var _setup:ILogSetup;
      
      private var _duringSetup:Boolean;
      
      public function LoggerFactory(param1:ILogSetup = null)
      {
         super();
         this.setup = param1;
      }
      
      public function get setup() : ILogSetup
      {
         return this._setup;
      }
      
      public function set setup(param1:ILogSetup) : void
      {
         var _loc3_:int = 0;
         this._setup = param1;
         var _loc2_:int = this._allLoggers.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            Logger(this._allLoggers[_loc3_]).allTargets = null;
            _loc3_++;
         }
         if(param1)
         {
            _loc3_ = 0;
            this._duringSetup = true;
            while(_loc3_ < _loc2_)
            {
               while(_loc3_ < _loc2_)
               {
                  param1.applyTo(Logger(this._allLoggers[_loc3_]));
                  _loc3_++;
               }
               _loc2_ = this._allLoggers.length;
            }
            this._duringSetup = false;
         }
      }
      
      public function getNamedLogger(param1:String = null, param2:String = null) : ILogger
      {
         param1 = param1 || "";
         var _loc3_:Object = this._loggers[param1] = this._loggers[param1] || {};
         var _loc4_:Logger;
         if(!(_loc4_ = _loc3_[param2]))
         {
            _loc4_ = new Logger(param1,param2);
            _loc3_[param2] = _loc4_;
            this._allLoggers[this._allLoggers.length] = _loc4_;
            if(this._setup && !this._duringSetup)
            {
               this._setup.applyTo(_loc4_);
            }
         }
         return _loc4_;
      }
   }
}
