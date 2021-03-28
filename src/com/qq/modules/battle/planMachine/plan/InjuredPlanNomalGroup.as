package com.qq.modules.battle.planMachine.plan
{
   import PVZ.Cmd.E_DamageType;
   import com.qq.modules.battle.model.vo.FightDamageVo;
   import tencent.tools.planMachine.ICallBack;
   import tencent.tools.planMachine.ParallelPlan;
   
   public class InjuredPlanNomalGroup extends BattleBasePlan
   {
       
      
      private var attackNum:int;
      
      private var attackTimeGap:Number;
      
      private var m_needSum:Boolean = true;
      
      public function InjuredPlanNomalGroup()
      {
         super();
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         super.setDynamicParams(param1);
         this.attackNum = param1[0];
         this.attackTimeGap = param1[1];
         if(param1.length > 2)
         {
            this.m_needSum = param1[2] == "0" ? false : true;
         }
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         var _loc6_:InjuredPlanNomal = null;
         super.doPlan(param1);
         var _loc2_:Array = [];
         var _loc3_:int = damageList.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if((damageList[_loc4_] as FightDamageVo).damageType != E_DamageType.E_DamageType_BlankPos && (damageList[_loc4_] as FightDamageVo).damageType != E_DamageType.E_DamageType_UpdateBuff)
            {
               (_loc6_ = new InjuredPlanNomal()).needSum = this.m_needSum;
               _loc6_.setStaticParams([actor,[damageList[_loc4_]],planGroup]);
               _loc6_.setDynamicParams([this.attackNum,this.attackTimeGap]);
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
