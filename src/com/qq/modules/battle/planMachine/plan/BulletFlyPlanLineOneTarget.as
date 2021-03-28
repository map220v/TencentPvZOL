package com.qq.modules.battle.planMachine.plan
{
   import com.qq.utils.DMath;
   import flash.utils.Timer;
   import tencent.tools.planMachine.ICallBack;
   import tencent.tools.planMachine.IPlan;
   import tencent.tools.planMachine.ParallelPlan;
   
   public class BulletFlyPlanLineOneTarget extends BattleBasePlan
   {
       
      
      private var bulletName:String;
      
      private var offsetX:Number;
      
      private var offsetY:Number;
      
      private var flySpeed:Number;
      
      private var amount:int;
      
      private var shootTime:Number;
      
      private var timer:Timer;
      
      public function BulletFlyPlanLineOneTarget()
      {
         super();
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         super.setDynamicParams(param1);
         this.bulletName = param1[0];
         this.offsetX = param1[1];
         this.offsetY = param1[2];
         this.flySpeed = param1[3];
         this.amount = param1[4];
         this.shootTime = param1[5];
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         var _loc7_:IPlan = null;
         super.doPlan(param1);
         var _loc2_:int = this.shootTime / this.amount;
         var _loc3_:Number = 0;
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < this.amount)
         {
            _loc7_ = this.createOneFrameBullet(1,_loc3_);
            _loc3_ += _loc2_;
            _loc4_.push(_loc7_);
            _loc5_++;
         }
         var _loc6_:IPlan;
         (_loc6_ = new ParallelPlan(_loc4_)).doPlan(this);
      }
      
      override public function planCallBack() : void
      {
         super.planCallBack();
      }
      
      private function createOneFrameBullet(param1:int, param2:Number) : IPlan
      {
         var _loc3_:IPlan = null;
         var _loc6_:BulletFlyPlanLine = null;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < param1)
         {
            (_loc6_ = new BulletFlyPlanLine()).setStaticParams(this.staticParams);
            _loc7_ = DMath.randNum(0,10) + this.offsetX;
            _loc8_ = DMath.randNum(-20,20) + this.offsetY;
            _loc9_ = DMath.randNum(-100,100) + this.flySpeed;
            _loc6_.setDynamicParams([this.bulletName,_loc7_,_loc8_,_loc9_]);
            _loc6_.isDebug = isDebug;
            _loc4_.push(_loc6_);
            _loc5_++;
         }
         _loc3_ = new ParallelPlan(_loc4_);
         if(param2 >= 0)
         {
            _loc3_ = new BattleDelayPlan(_loc3_,param2);
         }
         return _loc3_;
      }
   }
}
