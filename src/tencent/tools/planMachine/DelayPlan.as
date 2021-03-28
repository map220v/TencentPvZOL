package tencent.tools.planMachine
{
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class DelayPlan extends Plan implements IPlan
   {
       
      
      private var plan:IPlan;
      
      private var delayTime:Number;
      
      protected var timer:Timer;
      
      public function DelayPlan(param1:IPlan, param2:Number = 1000)
      {
         super();
         this.plan = param1;
         this.delayTime = param2;
         this.timer = new Timer(param2,1);
         this.timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.timerCompleteHandler);
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         super.doPlan(param1);
         this.timer.start();
      }
      
      protected function timerCompleteHandler(param1:TimerEvent) : void
      {
         this.timer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.timerCompleteHandler);
         this.timer = null;
         if(this.plan)
         {
            this.plan.doPlan(this);
         }
         else
         {
            this.setComplete();
         }
      }
      
      override protected function dispose() : void
      {
         if(this.plan)
         {
            this.plan.cancelPlan();
         }
         if(this.timer)
         {
            this.timer.stop();
            this.timer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.timerCompleteHandler);
            this.timer = null;
         }
         this.plan = null;
      }
   }
}
