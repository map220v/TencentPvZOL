package com.qq.modules.battle.planMachine.core
{
   import flash.events.EventDispatcher;
   
   public class PlanGroup
   {
       
      
      private var eventDispatcher:EventDispatcher;
      
      public function PlanGroup()
      {
         super();
         this.eventDispatcher = new EventDispatcher();
      }
      
      public function dispatchEvent(param1:PlanGroupEvent) : Boolean
      {
         return this.eventDispatcher.dispatchEvent(param1);
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         this.eventDispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         this.eventDispatcher.removeEventListener(param1,param2,param3);
      }
   }
}
