package com.qq.modules.battle.planMachine.plan
{
   import com.qq.modules.battle.planMachine.core.PlanGroupEvent;
   import org.as3commons.logging.api.getLogger;
   import tencent.tools.planMachine.ICallBack;
   import tencent.tools.planMachine.ParallelPlan;
   
   public class TriggerReceivePlan extends BattleBasePlan
   {
       
      
      private var planList:Array;
      
      private var eventName:String;
      
      private var eventData:String;
      
      public function TriggerReceivePlan(param1:Array)
      {
         super();
         this.planList = param1;
      }
      
      override protected function dispose() : void
      {
         this.planGroup.removeEventListener(this.eventName,this.triggerHandler);
         this.planGroup = null;
         super.dispose();
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         this.eventName = param1[0];
         this.eventData = param1[1];
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         super.doPlan(param1);
         this.planGroup.addEventListener(this.eventName,this.triggerHandler);
      }
      
      private function triggerHandler(param1:PlanGroupEvent) : void
      {
         getLogger("battle").debug("receive a trigger : " + this.eventName);
         if(this.eventData != "" || this.eventData != null)
         {
            if(this.eventData != param1.eventData)
            {
               return;
            }
         }
         this.planGroup.removeEventListener(this.eventName,this.triggerHandler);
         var _loc2_:ParallelPlan = new ParallelPlan(this.planList);
         _loc2_.doPlan(this);
      }
   }
}
