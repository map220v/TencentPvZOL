package com.qq.modules.battle.planMachine.plan
{
   import PVZ.Cmd.E_DamageType;
   import com.qq.modules.battle.model.vo.FightDamageVo;
   import tencent.tools.planMachine.ICallBack;
   import tencent.tools.planMachine.ParallelPlan;
   
   public class BulletBaseDropGroup extends BattleBasePlan
   {
       
      
      private var bulletName:String;
      
      private var flyTime:Number;
      
      public function BulletBaseDropGroup()
      {
         super();
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         super.setDynamicParams(param1);
         this.bulletName = param1[0];
         this.flyTime = param1[1];
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         var _loc4_:BulletBaseDrop = null;
         var _loc7_:Array = null;
         super.doPlan(param1);
         var _loc2_:int = damageList.length;
         var _loc3_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_)
         {
            if((damageList[_loc5_] as FightDamageVo).damageType != E_DamageType.E_DamageType_BlankPos && (damageList[_loc5_] as FightDamageVo).damageType != E_DamageType.E_DamageType_UpdateBuff)
            {
               _loc4_ = new BulletBaseDrop();
               _loc7_ = [damageList[_loc5_]];
               _loc4_.setStaticParams([actor,_loc7_,planGroup]);
               _loc4_.setDynamicParams([this.bulletName,this.flyTime]);
               _loc4_.isDebug = isDebug;
               _loc3_.push(_loc4_);
            }
            _loc5_++;
         }
         var _loc6_:ParallelPlan;
         (_loc6_ = new ParallelPlan(_loc3_)).doPlan(this);
      }
   }
}
