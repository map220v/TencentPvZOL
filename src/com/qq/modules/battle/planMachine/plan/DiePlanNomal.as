package com.qq.modules.battle.planMachine.plan
{
   import com.qq.modules.battle.constant.BattleConst;
   import com.qq.modules.battle.constant.BattleEvent;
   import com.qq.modules.battle.model.BattleFightModel;
   import com.qq.modules.battle.model.BattleUnitModel;
   import com.qq.modules.battle.model.vo.FightDamageVo;
   import com.qq.modules.battle.view.unit.UnitBase;
   import com.qq.utils.CommandDispatcher;
   import flash.geom.Point;
   import tencent.tools.planMachine.ICallBack;
   import tencent.tools.planMachine.ParallelPlan;
   
   public class DiePlanNomal extends BattleBasePlan
   {
       
      
      private var fromTarget:UnitBase;
      
      public function DiePlanNomal()
      {
         super();
      }
      
      override protected function dispose() : void
      {
         super.dispose();
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         super.setDynamicParams(param1);
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         var _loc2_:FightDamageVo = null;
         super.doPlan(param1);
         _loc2_ = damageList[0] as FightDamageVo;
         this.fromTarget = BattleUnitModel.getInstance().getUnitByPosIndex(_loc2_.targetIndex) as UnitBase;
         var _loc3_:Array = [];
         var _loc4_:CostarAddEffect;
         (_loc4_ = new CostarAddEffect()).setStaticParams(staticParams);
         _loc4_.setDynamicParams([1,"die_effect_smoke",2000,"idle",0,0]);
         _loc3_.push(_loc4_);
         var _loc5_:CostarColorAdvanced;
         (_loc5_ = new CostarColorAdvanced()).time = 2;
         _loc5_.setStaticParams(staticParams);
         _loc5_.setDynamicParams([1,1,1,1,255,255,255,-255,1,"false"]);
         _loc3_.push(_loc5_);
         var _loc6_:ParallelPlan;
         (_loc6_ = new ParallelPlan(_loc3_)).doPlan(this);
         setComplete();
      }
      
      override public function planCallBack() : void
      {
         var _loc1_:BattleEvent = null;
         var _loc2_:Point = null;
         if(BattleFightModel.getInstance().getDropItem((damageList[0] as FightDamageVo).targetIndex))
         {
            _loc1_ = new BattleEvent(BattleConst.BATTLE_FLY_CHEST);
            _loc1_.posIndex = (damageList[0] as FightDamageVo).targetIndex;
            _loc2_ = this.fromTarget.getGlobolPoint();
            _loc1_.posPoint = _loc2_;
            CommandDispatcher.sendEvent(_loc1_);
         }
         this.fromTarget.clear();
         this.fromTarget.display.visible = false;
         this.fromTarget = null;
      }
      
      private function dieComplete() : void
      {
      }
   }
}
