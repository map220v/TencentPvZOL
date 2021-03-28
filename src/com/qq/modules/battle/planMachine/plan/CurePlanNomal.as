package com.qq.modules.battle.planMachine.plan
{
   import com.qq.modules.battle.model.BattleUnitModel;
   import com.qq.modules.battle.model.vo.FightDamageVo;
   import com.qq.modules.battle.view.unit.UnitBase;
   import tencent.tools.planMachine.ICallBack;
   
   public class CurePlanNomal extends BattleBasePlan
   {
       
      
      public function CurePlanNomal()
      {
         super();
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         super.doPlan(param1);
         var _loc2_:FightDamageVo = damageList[0];
         var _loc3_:UnitBase = BattleUnitModel.getInstance().getUnitByPosIndex(_loc2_.targetIndex);
         var _loc4_:CostarChangeHP;
         (_loc4_ = new CostarChangeHP()).setStaticParams([actor,[damageList[0]],planGroup]);
         _loc4_.setDynamicParams([]);
         _loc4_.doPlan(this);
      }
   }
}
