package com.qq.modules.battle.planMachine.plan
{
   import asgui.events.FrameEvent;
   import com.qq.modules.battle.model.BattleUnitModel;
   import com.qq.modules.battle.view.unit.UnitBase;
   import flash.events.Event;
   import tencent.tools.planMachine.ICallBack;
   import tencent.tools.planMachine.IPlan;
   import tencent.tools.planMachine.ParallelPlan;
   
   public class ActorFrameEventPlan extends BattleBasePlan
   {
       
      
      private var targetPlan:IPlan;
      
      private var targetUnit:UnitBase;
      
      private var frameLabel:String;
      
      private var isInsure:Boolean = true;
      
      public function ActorFrameEventPlan(param1:Array)
      {
         super();
         this.targetPlan = new ParallelPlan(param1);
      }
      
      override protected function dispose() : void
      {
         super.dispose();
         if(this.targetUnit && this.targetUnit.animation)
         {
            this.targetUnit.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.FrameEventHandler);
            this.targetUnit.animation.removeEventListener(Event.COMPLETE,this.FrameOverHandler);
            this.targetUnit = null;
         }
         this.targetPlan = null;
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         this.frameLabel = param1[0];
         if(param1[1] != undefined)
         {
            this.isInsure = param1[1] == "false" ? false : true;
         }
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         super.doPlan(param1);
         this.targetUnit = BattleUnitModel.getInstance().getUnitByPosIndex(actor.actorIndex) as UnitBase;
         this.targetUnit.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.FrameEventHandler);
         if(this.isInsure)
         {
            this.targetUnit.animation.addEventListener(Event.COMPLETE,this.FrameOverHandler);
         }
      }
      
      protected function FrameOverHandler(param1:Event) : void
      {
         if(!this.targetPlan.isDoing)
         {
            this.targetPlan.doPlan(this);
         }
      }
      
      protected function FrameEventHandler(param1:FrameEvent) : void
      {
         if(param1.frameLabel == this.frameLabel && this.targetPlan.isDoing == false)
         {
            this.targetPlan.doPlan(this);
         }
      }
   }
}
