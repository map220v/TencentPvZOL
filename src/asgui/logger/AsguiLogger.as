package asgui.logger
{
   import flash.events.EventDispatcher;
   import flash.utils.getTimer;
   
   public class AsguiLogger extends EventDispatcher
   {
      
      private static var _instance:AsguiLogger;
      
      public static var ignoringPerf:Boolean = true;
       
      
      private var performs:Array;
      
      private var costs:Array;
      
      private var perfromAppendingTimes:Array;
      
      private var average:Array;
      
      public function AsguiLogger()
      {
         this.performs = [];
         this.costs = [];
         this.perfromAppendingTimes = [];
         this.average = [];
         super();
      }
      
      public static function get instance() : AsguiLogger
      {
         if(_instance == null)
         {
            _instance = new AsguiLogger();
         }
         return _instance;
      }
      
      public static function Log(param1:Object, param2:String, param3:int = 0) : void
      {
         instance.Log(param1,param2,param3);
      }
      
      public static function Debug(param1:Object, param2:String, param3:int = 0) : void
      {
         instance.Debug(param1,param2,param3);
      }
      
      public static function Warn(param1:Object, param2:String) : void
      {
         instance.Warn(param1,param2);
      }
      
      public static function Error(param1:Object, param2:String) : void
      {
         instance.Error(param1,param2);
      }
      
      public static function Perf(param1:Object, param2:String = null, param3:int = 0, param4:Boolean = false) : void
      {
         instance.Perf(param1,param2,param3,param4);
      }
      //Added missing code to log functions
      function Log(param1:Object, param2:String, param3:int = 0) : void
      {
         trace(param1.toString() + " Info: " + param2);
      }
      
      function Debug(param1:Object, param2:String, param3:int = 0) : void
      {
         trace(param1.toString() + " Debug: " + param2);
      }
      
      function Warn(param1:Object, param2:String) : void
      {
         trace(param1.toString() + " Warning: " + param2);
      }
      
      function Error(param1:Object, param2:String) : void
      {
         trace(param1.toString() + " Error: " + param2);
      }
      
      function Perf(param1:Object, param2:String = null, param3:int = 0, param4:Boolean = false) : void
      {
         var _loc5_:Number = NaN;
         if(ignoringPerf)
         {
            return;
         }
         if(param2 == null)
         {
            this.performs[param3] = getTimer();
         }
         else if((_loc5_ = getTimer() - this.performs[param3]) > 0)
         {
            if(this.costs[param3] == undefined)
            {
               this.costs[param3] = _loc5_;
            }
            else
            {
               this.costs[param3] += _loc5_;
            }
            if(param4)
            {
               if(this.perfromAppendingTimes[param3] == undefined)
               {
                  this.perfromAppendingTimes[param3] = 1;
               }
               else
               {
                  ++this.perfromAppendingTimes[param3];
               }
               this.average[param3] = this.costs[param3] / this.perfromAppendingTimes[param3];
            }
         }
      }
   }
}
