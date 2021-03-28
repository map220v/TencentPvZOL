package com.qq.modules.battle.planMachine.plan
{
   import com.qq.modules.battle.model.BattleUnitModel;
   import com.qq.modules.battle.model.vo.FightDamageVo;
   import com.qq.modules.battle.view.unit.UnitBase;
   
   public class CostarColorAdvanced extends ActorColorAdvanced
   {
       
      
      public function CostarColorAdvanced()
      {
         super();
      }
      
      override protected function getTarget() : UnitBase
      {
         var _loc1_:FightDamageVo = damageList[0];
         return BattleUnitModel.getInstance().getUnitByPosIndex(_loc1_.targetIndex) as UnitBase;
      }
   }
}
