package com.qq.modules.battle.planMachine.plan
{
   import com.qq.modules.battle.model.BattleUnitModel;
   import com.qq.modules.battle.view.unit.UnitBase;
   import tencent.tools.planMachine.ICallBack;
   
   public class ActorMirrorPlan extends BattleBasePlan
   {
       
      
      public function ActorMirrorPlan()
      {
         super();
      }
      
      override protected function dispose() : void
      {
         super.dispose();
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         super.doPlan(param1);
         var _loc2_:UnitBase = BattleUnitModel.getInstance().getUnitByPosIndex(actor.actorIndex);
         _loc2_.mirror();
         setComplete();
      }
   }
}
