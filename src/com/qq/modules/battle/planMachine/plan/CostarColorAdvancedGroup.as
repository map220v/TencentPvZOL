package com.qq.modules.battle.planMachine.plan
{
   import com.greensock.TweenLite;
   import com.qq.modules.battle.view.unit.UnitBase;
   import flash.geom.Transform;
   import tencent.tools.planMachine.ICallBack;
   import tencent.tools.planMachine.ParallelPlan;
   
   public class CostarColorAdvancedGroup extends BattleBasePlan
   {
       
      
      protected var redOffset:Number = 0;
      
      protected var blueOffset:Number = 0;
      
      protected var greenOffset:Number = 0;
      
      protected var alphaOffset:Number = 0;
      
      protected var redMultiplier:Number = 1;
      
      protected var blueMultiplier:Number = 1;
      
      protected var greenMultiplier:Number = 1;
      
      protected var alphaMultiplier:Number = 1;
      
      protected var time:Number = 0.5;
      
      protected var loop:Number;
      
      protected var cacheLoop:int = 0;
      
      protected var cacheTransform:Transform;
      
      protected var tween:TweenLite;
      
      protected var reversed:Boolean = false;
      
      protected var target:UnitBase;
      
      protected var yoyo:Boolean = false;
      
      private var parallel:ParallelPlan;
      
      public function CostarColorAdvancedGroup()
      {
         super();
      }
      
      override protected function dispose() : void
      {
         if(this.parallel)
         {
            if(this.parallel.isDoing)
            {
               this.parallel.cancelPlan();
            }
            this.parallel = null;
         }
         super.dispose();
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
         super.setDynamicParams(param1);
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         var _loc5_:CostarColorAdvanced = null;
         super.doPlan(param1);
         var _loc2_:int = damageList.length;
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            (_loc5_ = new CostarColorAdvanced()).setStaticParams(this.staticParams);
            _loc5_.setDynamicParams(params);
            _loc5_.isDebug = isDebug;
            _loc3_.push(_loc5_);
            _loc4_++;
         }
         this.parallel = new ParallelPlan(_loc3_);
         this.parallel.doPlan(this);
      }
   }
}
