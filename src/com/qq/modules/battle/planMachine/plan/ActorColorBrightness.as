package com.qq.modules.battle.planMachine.plan
{
   import com.greensock.TweenLite;
   import com.greensock.TweenMax;
   import com.greensock.easing.Linear;
   import com.qq.modules.battle.model.BattleUnitModel;
   import com.qq.modules.battle.view.unit.UnitBase;
   import flash.geom.Transform;
   import flash.utils.setTimeout;
   import tencent.tools.planMachine.ICallBack;
   
   public class ActorColorBrightness extends BattleBasePlan
   {
       
      
      protected var luminance:Number;
      
      protected var loop:int;
      
      protected var cacheLoop:int = 0;
      
      protected var cacheTransform:Transform;
      
      protected var target:UnitBase;
      
      protected var tween:TweenLite;
      
      public var time:Number = 0.1;
      
      public function ActorColorBrightness()
      {
         super();
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         this.luminance = Number(param1[0]) / 100;
         this.loop = param1[1];
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
         var _loc4_:Number = NaN;
         var _loc1_:Number = 1 - Math.abs(this.luminance);
         var _loc2_:Number = this.luminance > 0 ? Number(this.luminance * 255) : Number(0);
         var _loc3_:Object = new Object();
         _loc3_.redOffset = _loc2_;
         _loc3_.greenOffset = _loc2_;
         _loc3_.blueOffset = _loc2_;
         _loc3_.alphaOffset = 0;
         _loc3_.redMultiplier = _loc1_;
         _loc3_.blueMultiplier = _loc1_;
         _loc3_.greenMultiplier = _loc1_;
         _loc3_.alphaMultiplier = 1;
         this.cacheTransform = this.target.display.transform;
         this.cacheLoop = this.loop;
         if(this.loop != 0)
         {
            _loc4_ = (_loc4_ = (_loc4_ = this.time * 1000) * this.loop) * 2;
            setTimeout(this.completeHandler,_loc4_);
            this.tween = TweenMax.to(this.target.animationDisplay,this.time,{
               "repeat":this.loop,
               "yoyo":true,
               "ease":Linear.easeNone,
               "colorTransform":_loc3_
            });
            BattleUnitModel.getInstance().battleTimer.addTweenLite(this.tween);
         }
         else
         {
            this.loop = Number.MAX_VALUE;
            this.tween = TweenMax.to(this.target.animationDisplay,this.time,{
               "repeat":this.loop,
               "yoyo":true,
               "ease":Linear.easeNone,
               "colorTransform":_loc3_
            });
            BattleUnitModel.getInstance().battleTimer.addTweenLite(this.tween);
            setComplete();
         }
      }
      
      protected function completeHandler() : void
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
         super.dispose();
      }
   }
}
