package com.qq.modules.battle.planMachine.plan
{
   import PVZ.Cmd.E_DamageType;
   import com.qq.modules.battle.constant.BattleConst;
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
   import com.qq.modules.main.model.settings.battle.planSettings.PlanTree;
   import com.qq.utils.CommandDispatcher;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.as3commons.logging.api.getLogger;
   import tencent.tools.planMachine.ICallBack;
   import tencent.tools.planMachine.IPlan;
   
   public class CostarChangeHP extends BattleBasePlan
   {
       
      
      private var tweenTime:Number = 1;
      
      private var hideTimer:Timer;
      
      private var lossShieldPlan:IPlan;
      
      public var checkDie:Boolean;
      
      private var m_needSum:Boolean = true;
      
      public function CostarChangeHP(param1:Boolean = true)
      {
         this.m_needSum = param1;
         super();
      }
      
      override protected function dispose() : void
      {
         if(this.lossShieldPlan)
         {
            this.lossShieldPlan.cancelPlan();
            this.lossShieldPlan = null;
         }
         if(this.hideTimer)
         {
            this.hideTimer.stop();
            BattleUnitModel.getInstance().battleTimer.removeTimer(this.hideTimer);
            this.hideTimer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.hideProgressBar);
            this.hideTimer = null;
         }
         super.dispose();
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         var _loc7_:Number = NaN;
         var _loc8_:UnitRageCtr = null;
         var _loc9_:Boolean = false;
         var _loc10_:PlanSetting = null;
         var _loc11_:PlanTree = null;
         var _loc12_:UnitBuffCtr = null;
         var _loc13_:DiePlanNomal = null;
         super.doPlan(param1);
         var _loc2_:FightDamageVo = damageList[0] as FightDamageVo;
         var _loc3_:UnitBase = BattleUnitModel.getInstance().getUnitByPosIndex(_loc2_.targetIndex) as UnitBase;
         var _loc4_:UnitProgressCtr;
         if((_loc4_ = _loc3_.getControlByType(BaseUnitControler.TYPE_PROGRESS) as UnitProgressCtr) == null)
         {
            return;
         }
         _loc4_.tweenTime = this.tweenTime;
         if(_loc2_.changeMaxHp != 0)
         {
            BattleFightModel.getInstance().updateCardMaxHp(_loc2_.targetIndex,_loc2_.changeMaxHp);
         }
         var _loc5_:Number;
         if((_loc5_ = _loc2_.changeShield) > 0)
         {
            BattleFightModel.getInstance().updateCardMaxShield(_loc2_.targetIndex,_loc5_);
            _loc4_.addShield();
            _loc4_.changeArmor(0,false);
            (_loc3_.getControlByType(BaseUnitControler.TYPE_SHIED) as UnitShiedCtr).changeBlood(_loc5_);
            _loc5_ = 0;
         }
         var _loc6_:BattleUnitInfo = BattleFightModel.getInstance().getFightCardByPosIndex(_loc2_.targetIndex);
         if(_loc2_.changeHp + _loc5_ != 0 || _loc2_.damageType == E_DamageType.E_DamageType_Dodge)
         {
            _loc9_ = _loc2_.damageType == E_DamageType.E_DamageType_Critical ? true : false;
            if(_loc5_ < 0)
            {
               _loc5_ = -Math.min(Math.abs(_loc5_),_loc6_.shield.toNumber());
            }
            (_loc3_.getControlByType(BaseUnitControler.TYPE_BLOOD) as UnitBloodCtr).changeBlood(_loc2_.changeHp + _loc5_,_loc9_,false);
         }
         if(_loc6_.hp.toNumber() + _loc2_.changeHp > _loc6_.maxHp.toNumber())
         {
            _loc2_.changeHp = _loc6_.maxHp.toNumber() - _loc6_.hp.toNumber();
         }
         if(_loc6_.hp.toNumber() + _loc2_.changeHp < 0)
         {
            _loc2_.changeHp = -_loc6_.hp.toNumber();
         }
         if(_loc6_.shield.toNumber() + _loc2_.changeShield > _loc6_.maxShield.toNumber())
         {
            _loc2_.changeShield = _loc6_.maxShield.toNumber() - _loc6_.shield.toNumber();
         }
         if(_loc6_.shield.toNumber() + _loc2_.changeShield < 0)
         {
            _loc2_.changeShield = -_loc6_.shield.toNumber();
         }
         if(_loc6_.rage + _loc2_.changeRage > _loc6_.maxRage)
         {
            _loc2_.changeRage = _loc6_.maxRage - _loc6_.rage;
         }
         if(_loc6_.rage + _loc2_.changeRage < 0)
         {
            _loc2_.changeRage = -_loc6_.rage;
         }
         if(_loc2_.changeHp < 0)
         {
            _loc2_.changeShield = -_loc6_.shield.toNumber();
         }
         _loc7_ = (_loc6_.hp.toNumber() + _loc2_.changeHp) / _loc6_.maxHp.toNumber();
         _loc4_.changeHP(_loc7_);
         _loc7_ = (_loc6_.shield.toNumber() + _loc2_.changeShield) / _loc6_.maxShield.toNumber();
         _loc4_.changeArmor(_loc7_);
         _loc7_ = (_loc6_.rage + _loc2_.changeRage) / _loc6_.maxRage;
         _loc4_.changeRage(_loc7_);
         BattleFightModel.getInstance().updateCardHP(_loc2_.targetIndex,_loc2_.changeHp);
         BattleFightModel.getInstance().updateCardRage(_loc2_.targetIndex,_loc2_.changeRage);
         BattleFightModel.getInstance().updateCardShield(_loc2_.targetIndex,_loc2_.changeShield);
         if(_loc2_.isDead)
         {
            this.hideTimer = new Timer(1000,1);
            BattleUnitModel.getInstance().battleTimer.addTimer(this.hideTimer);
            this.hideTimer.addEventListener(TimerEvent.TIMER_COMPLETE,this.hideProgressBar);
            this.hideTimer.start();
         }
         _loc8_ = _loc3_.getControlByType(BaseUnitControler.TYPE_RAGE) as UnitRageCtr;
         if(_loc6_.rage >= _loc6_.maxRage)
         {
            _loc8_.showMaxRageEffect();
         }
         else
         {
            _loc8_.removeMaxRageEffect();
         }
         if(_loc6_.shield.toNumber() <= 0 && _loc6_.maxShield.toNumber() > 0 && _loc2_.changeShield < 0)
         {
            if(_loc11_ = (_loc10_ = BattleRoundStateModel.getInstance().planFactory.getPlanSetting(_loc2_.targetIndex)).getLossShieldPlanTree())
            {
               this.lossShieldPlan = BattleRoundStateModel.getInstance().planFactory.createPlanByTree(actor,damageList,planGroup,_loc11_);
            }
         }
         if(_loc2_.buffInfo != null)
         {
            if(_loc2_.buffInfo.buffLeftRound >= 30)
            {
               if(_loc2_.isAddBuff)
               {
                  CommandDispatcher.send(BattleConst.Event_AddResidentBuff,[_loc2_.buffInfo,_loc2_.targetIndex]);
               }
               else
               {
                  getLogger().error("移除常驻buff" + _loc2_.buffInfo.buffID);
               }
            }
            else
            {
               _loc12_ = _loc3_.getControlByType(BaseUnitControler.TYPE_BUFF) as UnitBuffCtr;
               if(_loc2_.isAddBuff)
               {
                  _loc12_.addBuff(_loc2_.buffInfo,_loc2_.targetIndex);
               }
               else if(_loc2_.buffInfo.buffLeftRound <= 0)
               {
                  _loc12_.removeBuff(_loc2_.buffInfo);
               }
            }
         }
         if(this.lossShieldPlan)
         {
            this.lossShieldPlan.doPlan(this);
         }
         else if(this.checkDie && _loc2_.isDead)
         {
            (_loc13_ = new DiePlanNomal()).setStaticParams(this.staticParams);
            _loc13_.setDynamicParams([]);
            _loc13_.isDebug = isDebug;
            _loc13_.doPlan(this);
         }
         else
         {
            this.setComplete();
         }
      }
      
      override protected function setComplete() : void
      {
         super.setComplete();
      }
      
      private function hideProgressBar(param1:TimerEvent) : void
      {
         this.hideTimer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.hideProgressBar);
         this.hideTimer.stop();
         var _loc2_:FightDamageVo = damageList[0] as FightDamageVo;
         var _loc3_:UnitBase = BattleUnitModel.getInstance().getUnitByPosIndex(_loc2_.targetIndex) as UnitBase;
         var _loc4_:UnitProgressCtr;
         (_loc4_ = _loc3_.getControlByType(BaseUnitControler.TYPE_PROGRESS) as UnitProgressCtr).setVisible(false);
      }
   }
}
