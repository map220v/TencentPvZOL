package com.qq.modules.battle.planMachine.plan
{
   import com.qq.modules.battle.planMachine.core.PlanGroupEvent;
   import org.as3commons.logging.api.getLogger;
   import tencent.tools.planMachine.ICallBack;
   
   public class TriggerSendPlan extends BattleBasePlan
   {
       
      
      protected var eventName:String;
      
      public function TriggerSendPlan()
      {
         super();
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         this.eventName = param1[0];
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         super.doPlan(param1);
         getLogger("battle").debug("send a trigger : " + this.eventName);
         this.planGroup.dispatchEvent(new PlanGroupEvent(this.eventName));
         setComplete();
      }
   }
}
