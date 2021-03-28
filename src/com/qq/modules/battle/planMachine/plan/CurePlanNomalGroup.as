package com.qq.modules.battle.planMachine.plan
{
   import PVZ.Cmd.E_DamageType;
   import com.qq.modules.battle.model.vo.FightDamageVo;
   import tencent.tools.planMachine.ICallBack;
   import tencent.tools.planMachine.ParallelPlan;
   
   public class CurePlanNomalGroup extends BattleBasePlan
   {
       
      
      public function CurePlanNomalGroup()
      {
         super();
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         var _loc6_:CurePlanNomal = null;
         super.doPlan(param1);
         var _loc2_:Array = [];
         var _loc3_:int = damageList.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if((damageList[_loc4_] as FightDamageVo).damageType != E_DamageType.E_DamageType_BlankPos && (damageList[_loc4_] as FightDamageVo).damageType != E_DamageType.E_DamageType_UpdateBuff)
            {
               (_loc6_ = new CurePlanNomal()).setStaticParams([actor,[damageList[_loc4_]],planGroup]);
               _loc6_.isDebug = isDebug;
               _loc2_.push(_loc6_);
            }
            _loc4_++;
         }
         var _loc5_:ParallelPlan;
         (_loc5_ = new ParallelPlan(_loc2_)).doPlan(this);
      }
   }
}
