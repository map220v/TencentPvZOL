package com.qq.modules.battle.planMachine.plan
{
   import com.qq.modules.battle.model.BattleUnitModel;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import tencent.tools.planMachine.ICallBack;
   import tencent.tools.planMachine.IPlan;
   
   public class BattleDelayPlan extends BattleBasePlan
   {
       
      
      private var plan:IPlan;
      
      private var delayTime:Number;
      
      protected var timer:Timer;
      
      public function BattleDelayPlan(param1:IPlan, param2:Number = 1000)
      {
         super();
         this.plan = param1;
         this.delayTime = param2;
         this.timer = new Timer(param2,1);
         BattleUnitModel.getInstance().battleTimer.addTimer(this.timer);
         this.timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.timerCompleteHandler);
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         super.doPlan(param1);
         this.timer.start();
      }
      
      protected function timerCompleteHandler(param1:TimerEvent) : void
      {
         if(this.plan)
         {
            this.plan.doPlan(this);
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
            BattleUnitModel.getInstance().battleTimer.removeTimer(this.timer);
            this.timer = null;
         }
         this.plan = null;
         super.dispose();
      }
   }
}
