package com.qq.modules.battle.planMachine.plan
{
   import PVZ.Cmd.E_DamageType;
   import com.qq.modules.battle.model.BattleFightModel;
   import com.qq.modules.battle.model.BattleRoundStateModel;
   import com.qq.modules.battle.model.BattleUnitInfo;
   import com.qq.modules.battle.model.BattleUnitModel;
   import com.qq.modules.battle.model.vo.FightDamageVo;
   import com.qq.modules.battle.view.control.BaseUnitControler;
   import com.qq.modules.battle.view.control.UnitBloodCtr;
   import com.qq.modules.battle.view.control.UnitBuffCtr;
   import com.qq.modules.battle.view.control.UnitProgressCtr;
   import com.qq.modules.battle.view.control.UnitRageCtr;
   import com.qq.modules.battle.view.control.UnitShiedCtr;
   import com.qq.modules.battle.view.unit.UnitBase;
   import com.qq.modules.main.model.settings.battle.planSettings.PlanSetting;
   import com.qq.tooltip.PlantCardToolTip;
   import flash.geom.ColorTransform;
   import tencent.tools.planMachine.ICallBack;
   import tencent.tools.planMachine.ParallelPlan;
   
   public class RelivePlan extends BattleBasePlan
   {
       
      
      public function RelivePlan()
      {
         super();
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         super.setDynamicParams(param1);
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         var _loc2_:FightDamageVo = null;
         var _loc3_:UnitBase = null;
         var _loc4_:BattleUnitInfo = null;
         var _loc5_:PlanSetting = null;
         var _loc9_:UnitProgressCtr = null;
         var _loc10_:UnitRageCtr = null;
         var _loc11_:UnitBuffCtr = null;
         var _loc12_:UnitBloodCtr = null;
         var _loc13_:UnitShiedCtr = null;
         super.doPlan(param1);
         var _loc6_:Array = [];
         var _loc7_:int = 0;
         while(_loc7_ < damageList.length)
         {
            _loc2_ = damageList[_loc7_];
            if(_loc2_.damageType != E_DamageType.E_DamageType_BlankPos)
            {
               _loc3_ = BattleUnitModel.getInstance().getUnitByPosIndex(_loc2_.targetIndex);
               _loc4_ = BattleFightModel.getInstance().getFightCardByPosIndex(_loc2_.targetIndex);
               _loc5_ = BattleRoundStateModel.getInstance().planFactory.getPlanSetting(_loc2_.targetIndex);
               if(_loc9_ = _loc3_.getControlByType(BaseUnitControler.TYPE_PROGRESS) as UnitProgressCtr)
               {
                  _loc9_.dispose();
                  _loc3_.removeControl(BaseUnitControler.TYPE_PROGRESS);
               }
               (_loc9_ = new UnitProgressCtr()).hasShield = _loc4_.maxShield.toNumber() == 0 ? false : true;
               _loc9_.rageMax = _loc4_.maxRage;
               _loc9_.baseRage = _loc4_.rage;
               _loc3_.addControl(_loc9_);
               _loc9_.changeHP(1);
               _loc9_.changeRage((_loc4_.rage + _loc2_.changeRage) / _loc4_.maxRage);
               if(_loc10_ = _loc3_.getControlByType(BaseUnitControler.TYPE_RAGE) as UnitRageCtr)
               {
                  _loc10_.dispose();
                  _loc3_.removeControl(BaseUnitControler.TYPE_RAGE);
               }
               (_loc10_ = new UnitRageCtr()).setRageEffect(_loc5_.rageEffectType);
               _loc3_.addControl(_loc10_);
               if(_loc11_ = _loc3_.getControlByType(BaseUnitControler.TYPE_BUFF) as UnitBuffCtr)
               {
                  _loc11_.dispose();
                  _loc3_.removeControl(BaseUnitControler.TYPE_BUFF);
               }
               _loc11_ = new UnitBuffCtr();
               _loc3_.addControl(_loc11_);
               if(_loc12_ = _loc3_.getControlByType(BaseUnitControler.TYPE_BLOOD) as UnitBloodCtr)
               {
                  _loc12_.dispose();
                  _loc3_.removeControl(BaseUnitControler.TYPE_BLOOD);
               }
               _loc12_ = new UnitBloodCtr();
               _loc3_.addControl(_loc12_);
               _loc12_.changeBlood(_loc2_.changeHp,false);
               if(_loc13_ = _loc3_.getControlByType(BaseUnitControler.TYPE_SHIED) as UnitShiedCtr)
               {
                  _loc13_.dispose();
                  _loc3_.removeControl(BaseUnitControler.TYPE_SHIED);
               }
               _loc13_ = new UnitShiedCtr();
               _loc3_.addControl(_loc13_);
               _loc13_.changeBlood(_loc2_.changeShield);
               BattleFightModel.getInstance().updateCardHP(_loc2_.targetIndex,_loc2_.changeHp);
               BattleFightModel.getInstance().updateCardRage(_loc2_.targetIndex,_loc2_.changeRage);
               BattleFightModel.getInstance().updateCardShield(_loc2_.targetIndex,_loc2_.changeShield);
               _loc3_.animatCav.toolTip = _loc4_;
               _loc3_.animatCav.toolTipClass = PlantCardToolTip;
               _loc3_.display.visible = true;
               _loc3_.animationDisplay.transform.colorTransform = new ColorTransform();
            }
            _loc7_++;
         }
         var _loc8_:ParallelPlan;
         (_loc8_ = new ParallelPlan(_loc6_)).doPlan(this);
         setComplete();
      }
   }
}
