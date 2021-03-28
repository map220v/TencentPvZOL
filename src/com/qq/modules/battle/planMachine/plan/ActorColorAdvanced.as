package com.qq.modules.battle.planMachine.plan
{
   import com.greensock.TweenLite;
   import com.greensock.TweenMax;
   import com.greensock.easing.Linear;
   import com.qq.modules.battle.model.BattleUnitModel;
   import com.qq.modules.battle.view.unit.UnitBase;
   import flash.events.TimerEvent;
   import flash.geom.Transform;
   import flash.utils.Timer;
   import tencent.tools.planMachine.ICallBack;
   
   public class ActorColorAdvanced extends BattleBasePlan
   {
       
      
      protected var redOffset:Number = 0;
      
      protected var blueOffset:Number = 0;
      
      protected var greenOffset:Number = 0;
      
      protected var alphaOffset:Number = 0;
      
      protected var redMultiplier:Number = 1;
      
      protected var blueMultiplier:Number = 1;
      
      protected var greenMultiplier:Number = 1;
      
      protected var alphaMultiplier:Number = 1;
      
      public var time:Number = 0.25;
      
      protected var loop:Number;
      
      protected var cacheLoop:int = 0;
      
      protected var cacheTransform:Transform;
      
      protected var tween:TweenLite;
      
      protected var reversed:Boolean = false;
      
      protected var target:UnitBase;
      
      protected var yoyo:Boolean = false;
      
      protected var timer:Timer;
      
      public function ActorColorAdvanced()
      {
         super();
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         this.redMultiplier = param1[0];
         this.greenMultiplier = param1[1];
         this.blueMultiplier = param1[2];
         this.alphaMultiplier = param1[3];
         this.redOffset = param1[4];
         this.greenOffset = param1[5];
         this.blueOffset = param1[6];
         this.alphaOffset = param1[7];
         this.loop = param1[8];
         this.yoyo = param1[9] == "true" ? true : false;
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         super.doPlan(param1);
         this.target = this.getTarget();
         this.setTween();
      }
      
      protected function getTarget() : UnitBase
      {
         return BattleUnitModel.getInstance().getUnitByPosIndex(actor.actorIndex) as UnitBase;
      }
      
      protected function setTween() : void
      {
         var _loc2_:Number = NaN;
         var _loc1_:Object = new Object();
         _loc1_.redOffset = this.redOffset;
         _loc1_.blueOffset = this.blueOffset;
         _loc1_.greenOffset = this.greenOffset;
         _loc1_.alphaOffset = this.alphaOffset;
         _loc1_.redMultiplier = this.redMultiplier;
         _loc1_.blueMultiplier = this.blueMultiplier;
         _loc1_.greenMultiplier = this.greenMultiplier;
         _loc1_.alphaMultiplier = this.alphaMultiplier;
         this.cacheTransform = this.target.display.transform;
         this.cacheLoop = this.loop;
         if(this.loop == 1)
         {
            this.tween = TweenMax.to(this.target.animationDisplay,this.time,{
               "yoyo":this.yoyo,
               "ease":Linear.easeNone,
               "colorTransform":_loc1_
            });
            _loc2_ = this.time * 1000;
            BattleUnitModel.getInstance().battleTimer.addTweenLite(this.tween);
            if(this.yoyo)
            {
               _loc2_ *= 2;
            }
            this.timer = new Timer(_loc2_,1);
            BattleUnitModel.getInstance().battleTimer.addTimer(this.timer);
            this.timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.completeHandler);
            this.timer.start();
         }
         else if(this.loop == 0)
         {
            this.loop = Number.MAX_VALUE;
            this.tween = TweenMax.to(this.target.animationDisplay,this.time,{
               "repeat":this.loop,
               "yoyo":this.yoyo,
               "ease":Linear.easeNone,
               "colorTransform":_loc1_
            });
            BattleUnitModel.getInstance().battleTimer.addTweenLite(this.tween);
            setComplete();
         }
         else
         {
            this.tween = TweenMax.to(this.target.animationDisplay,this.time,{
               "repeat":this.loop,
               "yoyo":this.yoyo,
               "ease":Linear.easeNone,
               "colorTransform":_loc1_
            });
            BattleUnitModel.getInstance().battleTimer.addTweenLite(this.tween);
            _loc2_ = this.time * 1000;
            _loc2_ *= this.loop;
            if(this.yoyo)
            {
               _loc2_ *= 2;
            }
            this.timer = new Timer(_loc2_,1);
            BattleUnitModel.getInstance().battleTimer.addTimer(this.timer);
            this.timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.completeHandler);
            this.timer.start();
         }
      }
      
      protected function completeHandler(param1:TimerEvent) : void
      {
         if(!isCanceled)
         {
            setComplete();
         }
      }
      
      override protected function dispose() : void
      {
         if(this.tween)
         {
            BattleUnitModel.getInstance().battleTimer.removeTweenLite(this.tween);
            this.tween.kill();
         }
         this.tween = null;
         if(this.timer)
         {
            this.timer.stop();
            BattleUnitModel.getInstance().battleTimer.removeTimer(this.timer);
            this.timer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.completeHandler);
         }
         this.timer = null;
         super.dispose();
      }
   }
}
