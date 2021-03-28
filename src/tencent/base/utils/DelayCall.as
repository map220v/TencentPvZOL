package tencent.base.utils
{
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class DelayCall
   {
       
      
      public function DelayCall()
      {
         super();
      }
      
      public static function call(param1:Number, param2:Function, ... rest) : Timer
      {
         var _timer:Timer = null;
         var timerCompleteHandler:Function = null;
         var time:Number = param1;
         var callBackFun:Function = param2;
         var arg:Array = rest;
         timerCompleteHandler = function(param1:TimerEvent):void
         {
            _timer.removeEventListener(TimerEvent.TIMER_COMPLETE,timerCompleteHandler);
            if(callBackFun != null)
            {
               if(arg && arg.length > 0)
               {
                  callBackFun.call(null,arg);
               }
               else
               {
                  callBackFun.call();
               }
            }
         };
         _timer = new Timer(time,1);
         _timer.addEventListener(TimerEvent.TIMER_COMPLETE,timerCompleteHandler);
         _timer.start();
         return _timer;
      }
   }
}
