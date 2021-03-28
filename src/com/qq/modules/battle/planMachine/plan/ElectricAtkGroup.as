package com.qq.modules.battle.planMachine.plan
{
   import com.qq.modules.battle.model.vo.FightDamageVo;
   import tencent.tools.planMachine.ICallBack;
   import tencent.tools.planMachine.ParallelPlan;
   
   public class ElectricAtkGroup extends BattleBasePlan
   {
       
      
      protected var effectName:String;
      
      protected var linkWidth:int;
      
      protected var offsetX:Number;
      
      protected var offsetY:Number;
      
      protected var time:int;
      
      public function ElectricAtkGroup()
      {
         super();
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         super.setDynamicParams(param1);
         this.effectName = param1[0];
         this.linkWidth = param1[1];
         this.offsetX = param1[2];
         this.offsetY = param1[3];
         this.time = param1[4];
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         var _loc4_:BattleBasePlan = null;
         var _loc6_:InjuredPlanNomal = null;
         var _loc9_:Array = null;
         super.doPlan(param1);
         var _loc2_:int = damageList.length;
         var _loc3_:Array = [];
         var _loc5_:int = 0;
         var _loc7_:int = 0;
         while(_loc7_ < _loc2_)
         {
            _loc4_ = new ElectricAtkPlan();
            _loc9_ = [damageList[_loc7_]];
            if(_loc7_ > 0)
            {
               _loc5_ = FightDamageVo(damageList[_loc7_ - 1]).targetIndex;
            }
            _loc4_.setStaticParams([actor,_loc9_,planGroup]);
            _loc4_.setDynamicParams([this.effectName,this.linkWidth,this.offsetX,this.offsetY,_loc5_]);
            _loc4_.isDebug = isDebug;
            if(_loc7_ >= 1)
            {
               _loc4_ = new BattleDelayPlan(_loc4_,this.time * _loc7_);
            }
            _loc3_.push(_loc4_);
            (_loc6_ = new InjuredPlanNomal()).setStaticParams([actor,[damageList[_loc7_]],planGroup]);
            _loc6_.setDynamicParams([1,this.time * (1 + _loc7_)]);
            _loc6_.isDebug = isDebug;
            _loc3_.push(_loc6_);
            _loc7_++;
         }
         var _loc8_:ParallelPlan;
         (_loc8_ = new ParallelPlan(_loc3_)).doPlan(this);
      }
   }
}
