package com.qq.modules.battle.planMachine.plan
{
   import PVZ.Cmd.E_DamageType;
   import com.qq.modules.battle.model.vo.FightDamageVo;
   import tencent.tools.planMachine.ICallBack;
   import tencent.tools.planMachine.ParallelPlan;
   
   public class BulletArrowGroup extends BattleBasePlan
   {
       
      
      protected var bulletName:String;
      
      protected var bulletEffectName:String;
      
      protected var offsetX:Number;
      
      protected var offsetY:Number;
      
      public function BulletArrowGroup()
      {
         super();
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         super.setDynamicParams(param1);
         this.bulletName = param1[0];
         this.offsetX = param1[1];
         if(isRightSide)
         {
            this.offsetX = -this.offsetX;
         }
         this.offsetY = param1[2];
         this.bulletEffectName = param1[3];
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         var _loc6_:BulletBaseArrow = null;
         var _loc7_:Array = null;
         super.doPlan(param1);
         var _loc2_:int = damageList.length;
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            if((damageList[_loc4_] as FightDamageVo).damageType != E_DamageType.E_DamageType_UpdateBuff)
            {
               _loc6_ = new BulletBaseArrow();
               _loc7_ = [damageList[_loc4_]];
               _loc6_.setStaticParams([actor,_loc7_,planGroup]);
               _loc6_.setDynamicParams([this.bulletName,this.offsetX,this.offsetY,this.bulletEffectName]);
               _loc6_.isDebug = isDebug;
               _loc3_.push(_loc6_);
            }
            _loc4_++;
         }
         var _loc5_:ParallelPlan;
         (_loc5_ = new ParallelPlan(_loc3_)).doPlan(this);
      }
   }
}
