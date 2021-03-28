package com.qq.modules.battle.planMachine.plan
{
   import PVZ.Cmd.E_DamageType;
   import com.qq.modules.battle.model.vo.FightDamageVo;
   import tencent.tools.planMachine.ICallBack;
   import tencent.tools.planMachine.ParallelPlan;
   
   public class CostarAddEffectGroup extends BattleBasePlan
   {
       
      
      protected var topOrGround:Boolean;
      
      protected var effectName:String;
      
      protected var time:Number;
      
      protected var offsetX:Number;
      
      protected var offsetY:Number;
      
      protected var actionName:String;
      
      public function CostarAddEffectGroup()
      {
         super();
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         this.topOrGround = param1[0] == "1" ? true : false;
         this.effectName = param1[1];
         this.time = param1[2];
         this.actionName = param1[3];
         this.offsetX = param1[4];
         this.offsetY = param1[5];
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         var _loc6_:CostarAddEffect = null;
         super.doPlan(param1);
         var _loc2_:int = damageList.length;
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            if((damageList[_loc4_] as FightDamageVo).damageType != E_DamageType.E_DamageType_BlankPos && (damageList[_loc4_] as FightDamageVo).damageType != E_DamageType.E_DamageType_UpdateBuff)
            {
               (_loc6_ = new CostarAddEffect()).setStaticParams([actor,[damageList[_loc4_]],planGroup]);
               _loc6_.setDynamicParams([this.topOrGround,this.effectName,this.time,this.actionName,this.offsetX,this.offsetY]);
               _loc3_.push(_loc6_);
            }
            _loc4_++;
         }
         var _loc5_:ParallelPlan;
         (_loc5_ = new ParallelPlan(_loc3_)).doPlan(this);
      }
   }
}
