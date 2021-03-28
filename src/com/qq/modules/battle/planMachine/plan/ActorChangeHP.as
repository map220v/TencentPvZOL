package com.qq.modules.battle.planMachine.plan
{
   import com.qq.modules.battle.model.BattleFightModel;
   import com.qq.modules.battle.model.BattleUnitInfo;
   import com.qq.modules.battle.model.BattleUnitModel;
   import com.qq.modules.battle.view.control.BaseUnitControler;
   import com.qq.modules.battle.view.control.UnitProgressCtr;
   import com.qq.modules.battle.view.control.UnitRageCtr;
   import com.qq.modules.battle.view.unit.UnitBase;
   import tencent.tools.planMachine.ICallBack;
   
   public class ActorChangeHP extends BattleBasePlan
   {
       
      
      public function ActorChangeHP()
      {
         super();
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         var _loc4_:Number = NaN;
         var _loc6_:UnitRageCtr = null;
         super.doPlan(param1);
         var _loc2_:UnitBase = BattleUnitModel.getInstance().getUnitByPosIndex(actor.actorIndex) as UnitBase;
         var _loc3_:BattleUnitInfo = BattleFightModel.getInstance().getFightCardByPosIndex(actor.actorIndex);
         if(_loc3_.rage + actor.changeRage > _loc3_.maxRage)
         {
            actor.changeRage = _loc3_.maxRage - _loc3_.rage;
         }
         if(_loc3_.rage + actor.changeRage < 0)
         {
            actor.changeRage = -_loc3_.rage;
         }
         _loc4_ = (_loc3_.rage + actor.changeRage) / _loc3_.maxRage;
         var _loc5_:UnitProgressCtr;
         if((_loc5_ = _loc2_.getControlByType(BaseUnitControler.TYPE_PROGRESS) as UnitProgressCtr) != null)
         {
            _loc5_.changeRage(_loc4_);
         }
         BattleFightModel.getInstance().updateCardRage(actor.actorIndex,actor.changeRage);
         if((_loc6_ = _loc2_.getControlByType(BaseUnitControler.TYPE_RAGE) as UnitRageCtr) != null)
         {
            if(_loc3_.rage >= _loc3_.maxRage)
            {
               _loc6_.showMaxRageEffect();
            }
            else
            {
               _loc6_.removeMaxRageEffect();
            }
         }
         setComplete();
      }
   }
}
