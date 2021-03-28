package com.qq.modules.battle.planMachine.plan
{
   import PVZ.Cmd.E_DamageType;
   import com.qq.modules.battle.constant.BattleConst;
   import com.qq.modules.battle.model.vo.FightDamageVo;
   import tencent.tools.planMachine.ICallBack;
   import tencent.tools.planMachine.ParallelPlan;
   import tencent.tools.planMachine.Plan;
   
   public class InjuredPlanVerticalGroup extends BattleBasePlan
   {
       
      
      private var attackNum:int;
      
      private var attackTimeGap:Number;
      
      private var delay:Number;
      
      public function InjuredPlanVerticalGroup()
      {
         super();
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         super.setDynamicParams(param1);
         this.attackNum = param1[0];
         this.attackTimeGap = param1[1];
         this.delay = param1[1];
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         var _loc4_:Number = NaN;
         var _loc6_:InjuredPlanNomal = null;
         var _loc8_:Plan = null;
         super.doPlan(param1);
         var _loc2_:Array = [];
         var _loc3_:Vector.<Array> = new Vector.<Array>(3);
         var _loc5_:int = damageList.length;
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_)
         {
            if((damageList[_loc7_] as FightDamageVo).damageType != E_DamageType.E_DamageType_BlankPos && (damageList[_loc7_] as FightDamageVo).damageType != E_DamageType.E_DamageType_UpdateBuff)
            {
               (_loc6_ = new InjuredPlanNomal()).setStaticParams([actor,[damageList[_loc7_]],planGroup]);
               _loc6_.setDynamicParams([this.attackNum,this.attackTimeGap]);
               _loc6_.isDebug = isDebug;
               _loc4_ = BattleConst.getVerticalByIndex(damageList[_loc7_].targetIndex);
               if(_loc3_[_loc4_])
               {
                  _loc3_[_loc4_].push(_loc6_);
               }
               else
               {
                  _loc3_[_loc4_] = new Array();
                  _loc3_[_loc4_].push(_loc6_);
               }
            }
            _loc7_++;
         }
         var _loc9_:int = 0;
         while(_loc9_ < _loc3_.length)
         {
            for each(_loc6_ in _loc3_[_loc9_])
            {
               _loc8_ = new BattleDelayPlan(_loc6_,(_loc9_ + 1) * this.delay);
               _loc2_.push(_loc8_);
            }
            _loc9_++;
         }
         var _loc10_:ParallelPlan;
         (_loc10_ = new ParallelPlan(_loc2_)).doPlan(this);
      }
   }
}
