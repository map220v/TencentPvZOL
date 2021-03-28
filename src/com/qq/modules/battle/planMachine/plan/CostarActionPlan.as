package com.qq.modules.battle.planMachine.plan
{
   import com.qq.modules.battle.model.BattleUnitModel;
   import com.qq.modules.battle.model.vo.FightDamageVo;
   import com.qq.modules.battle.view.unit.UnitBase;
   
   public class CostarActionPlan extends ActorActionPlan
   {
       
      
      public function CostarActionPlan()
      {
         super();
      }
      
      override protected function getTarget() : UnitBase
      {
         return BattleUnitModel.getInstance().getUnitByPosIndex((damageList[0] as FightDamageVo).targetIndex) as UnitBase;
      }
   }
}
