package com.qq.modules.td.logic.action.plant.boomerang
{
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import flash.events.Event;
   import tencent.tools.planMachine.ICallBack;
   import tencent.tools.planMachine.Plan;
   
   public class PlanPlayAnimation extends Plan
   {
       
      
      private var target:IGameObject;
      
      private var animationTag:String;
      
      public function PlanPlayAnimation(param1:IGameObject, param2:String)
      {
         super();
         this.target = param1;
         this.animationTag = param2;
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         super.doPlan(param1);
         this.target.animation.gotoAndPlay(this.animationTag,false);
         this.target.animation.addEventListener(Event.COMPLETE,this.completeHandler);
      }
      
      protected function completeHandler(param1:Event) : void
      {
         if(this.target && this.target.animation)
         {
            this.target.animation.removeEventListener(Event.COMPLETE,this.completeHandler);
         }
         setComplete();
      }
      
      override protected function dispose() : void
      {
         if(this.target && this.target.animation)
         {
            this.target.animation.removeEventListener(Event.COMPLETE,this.completeHandler);
         }
         this.target = null;
         super.dispose();
      }
   }
}
