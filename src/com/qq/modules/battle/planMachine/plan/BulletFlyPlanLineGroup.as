package com.qq.modules.battle.planMachine.plan
{
   import tencent.tools.planMachine.ICallBack;
   import tencent.tools.planMachine.ParallelPlan;
   
   public class BulletFlyPlanLineGroup extends BattleBasePlan
   {
       
      
      protected var bulletName:String;
      
      protected var bulletEffectName:String;
      
      protected var offsetX:Number;
      
      protected var offsetY:Number;
      
      protected var flySpeed:Number;
      
      private var isWaitHit:Boolean;
      
      private var hitFrameName:String;
      
      public function BulletFlyPlanLineGroup()
      {
         super();
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         super.setDynamicParams(param1);
         this.bulletName = param1[0];
         this.offsetX = param1[1];
         if(isRightSide)
         {
            this.offsetX = -this.offsetX;
         }
         this.offsetY = param1[2];
         this.bulletEffectName = param1[3];
         this.flySpeed = param1[4];
         if(param1.length >= 6)
         {
            this.isWaitHit = param1[5] == 1;
         }
         else
         {
            this.isWaitHit = false;
         }
         if(param1.length >= 7)
         {
            this.hitFrameName = param1[6];
         }
         else
         {
            this.hitFrameName = null;
         }
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         var _loc6_:BulletFlyPlanLine = null;
         var _loc7_:Array = null;
         super.doPlan(param1);
         var _loc2_:int = damageList.length;
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc6_ = new BulletFlyPlanLine();
            (_loc7_ = staticParams.concat())[BattleBasePlan.Param_Targets] = [damageList[_loc4_]];
            _loc6_.setStaticParams(_loc7_);
            _loc6_.setDynamicParams([this.bulletName,this.offsetX,this.offsetY,this.flySpeed,this.isWaitHit,this.hitFrameName]);
            _loc3_.push(_loc6_);
            _loc4_++;
         }
         var _loc5_:ParallelPlan;
         (_loc5_ = new ParallelPlan(_loc3_)).doPlan(this);
      }
   }
}
