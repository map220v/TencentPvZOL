package com.qq.modules.battle.planMachine.plan
{
   import PVZ.Cmd.E_DamageType;
   import com.qq.modules.battle.model.vo.FightDamageVo;
   import tencent.tools.planMachine.ICallBack;
   import tencent.tools.planMachine.ParallelPlan;
   
   public class InjuredPlanStealSunGroup extends BattleBasePlan
   {
       
      
      private var bulletName:String;
      
      private var flySpeed:Number;
      
      private var endOffsetX:Number;
      
      private var endOffsetY:Number;
      
      public function InjuredPlanStealSunGroup()
      {
         super();
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         this.bulletName = param1[0];
         this.flySpeed = param1[1];
         this.endOffsetX = param1[2];
         this.endOffsetY = param1[3];
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         var _loc6_:InjuredPlanStealSun = null;
         super.doPlan(param1);
         var _loc2_:Array = [];
         var _loc3_:int = damageList.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if((damageList[_loc4_] as FightDamageVo).damageType != E_DamageType.E_DamageType_BlankPos && (damageList[_loc4_] as FightDamageVo).damageType != E_DamageType.E_DamageType_UpdateBuff)
            {
               (_loc6_ = new InjuredPlanStealSun()).setStaticParams([actor,[damageList[_loc4_]],planGroup]);
               _loc6_.setDynamicParams([this.bulletName,this.flySpeed,this.endOffsetX,this.endOffsetY]);
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
