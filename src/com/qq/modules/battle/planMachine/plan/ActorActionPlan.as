package com.qq.modules.battle.planMachine.plan
{
   import com.qq.modules.battle.model.BattleUnitModel;
   import com.qq.modules.battle.view.unit.UnitBase;
   import flash.events.Event;
   import org.as3commons.logging.api.getLogger;
   import tencent.tools.planMachine.ICallBack;
   import tencent.tools.planMachine.IPlan;
   
   public class ActorActionPlan extends BattleBasePlan implements IPlan
   {
       
      
      protected var actionName:String;
      
      protected var defaultActionName:String;
      
      protected var loop:int;
      
      protected var timeScale:Number;
      
      protected var lastTimeScale:Number;
      
      private var fromTarget:UnitBase;
      
      public function ActorActionPlan()
      {
         super();
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         if(!param1)
         {
            getLogger().error("PlayActionPlan setDynamicParams error!");
            return;
         }
         this.actionName = param1[0];
         this.loop = param1[1];
         this.timeScale = param1[2];
         if(param1[3])
         {
            this.defaultActionName = param1[3];
         }
         else
         {
            this.defaultActionName = "idle";
         }
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         super.doPlan(param1);
         this.fromTarget = this.getTarget();
         if(this.fromTarget == null || !this.fromTarget.animation)
         {
            setComplete();
         }
         if(this.timeScale != 0)
         {
            this.fromTarget.animaRate = 1;
            this.lastTimeScale = this.fromTarget.animation.frameRate;
            this.fromTarget.animation.frameRate = this.timeScale;
            this.fromTarget.animaRate = BattleUnitModel.getInstance().battleTimer.timeRate;
         }
         if(this.loop == 0)
         {
            setComplete();
         }
         else
         {
            this.fromTarget.animation.addEventListener(Event.COMPLETE,this.playCompleteHandler);
         }
         this.fromTarget.animation.gotoAndPlay(this.actionName,this.loop);
      }
      
      protected function getTarget() : UnitBase
      {
         return BattleUnitModel.getInstance().getUnitByPosIndex(actor.actorIndex) as UnitBase;
      }
      
      override protected function dispose() : void
      {
         if(this.fromTarget && this.fromTarget.animation)
         {
            this.fromTarget.animation.removeEventListener(Event.COMPLETE,this.playCompleteHandler);
         }
         super.dispose();
      }
      
      private function FrameEventHandler(param1:Event) : void
      {
      }
      
      private function playCompleteHandler(param1:Event) : void
      {
         this.fromTarget.animation.gotoAndPlay(this.defaultActionName,0);
         if(this.timeScale != 0)
         {
            this.fromTarget.animaRate = 1;
            this.fromTarget.animation.frameRate = this.lastTimeScale;
            this.fromTarget.animaRate = BattleUnitModel.getInstance().battleTimer.timeRate;
         }
         setComplete();
      }
   }
}
