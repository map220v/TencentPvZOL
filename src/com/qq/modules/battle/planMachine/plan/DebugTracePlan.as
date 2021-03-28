package com.qq.modules.battle.planMachine.plan
{
   import org.as3commons.logging.api.getLogger;
   import tencent.tools.planMachine.ICallBack;
   
   public class DebugTracePlan extends BattleBasePlan
   {
       
      
      private var traceTxt:String;
      
      public function DebugTracePlan()
      {
         super();
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         this.traceTxt = param1[0];
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         super.doPlan(param1);
         getLogger("battle").debug(this.traceTxt);
         setComplete();
      }
   }
}
