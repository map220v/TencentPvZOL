package com.qq.modules.battle.planMachine.plan
{
   import PVZ.Cmd.E_DamageType;
   import com.qq.modules.battle.model.vo.FightDamageVo;
   import tencent.tools.planMachine.ICallBack;
   import tencent.tools.planMachine.ParallelPlan;
   
   public class BulletArrowDelayGroup extends BattleBasePlan
   {
       
      
      protected var bulletName:String;
      
      protected var bulletEffectName:String;
      
      protected var offsetX:Number;
      
      protected var offsetY:Number;
      
      protected var bulletHitEffectName:String;
      
      private var delayTArr:Array;
      
      public function BulletArrowDelayGroup()
      {
         this.delayTArr = new Array();
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
         this.bulletHitEffectName = param1[4];
         var _loc2_:int = 4;
         while(_loc2_ < param1.length)
         {
            if(param1.length > _loc2_ + 1)
            {
               this.delayTArr.push(param1[_loc2_ + 1]);
            }
            _loc2_++;
         }
         if(this.delayTArr.length == 0)
         {
            this.delayTArr[0] = 0;
         }
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         var _loc4_:BattleBasePlan = null;
         var _loc7_:Array = null;
         super.doPlan(param1);
         var _loc2_:int = damageList.length;
         var _loc3_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_)
         {
            if(FightDamageVo(damageList[_loc5_]).damageType != E_DamageType.E_DamageType_BlankPos && FightDamageVo(damageList[_loc5_]).damageType != E_DamageType.E_DamageType_UpdateBuff)
            {
               _loc4_ = new BulletBaseArrow();
               _loc7_ = [damageList[_loc5_]];
               _loc4_.setStaticParams([actor,_loc7_,planGroup]);
               _loc4_.setDynamicParams([this.bulletName,this.offsetX,this.offsetY,this.bulletEffectName,this.bulletHitEffectName]);
               _loc4_.isDebug = isDebug;
               if(_loc5_ >= 1)
               {
                  if(this.delayTArr.length >= _loc5_)
                  {
                     _loc4_ = new BattleDelayPlan(_loc4_,this.delayTArr[_loc5_ - 1]);
                  }
                  else if(this.delayTArr[0] != 0)
                  {
                     _loc4_ = new BattleDelayPlan(_loc4_,this.delayTArr[0]);
                  }
               }
               _loc3_.push(_loc4_);
            }
            _loc5_++;
         }
         var _loc6_:ParallelPlan;
         (_loc6_ = new ParallelPlan(_loc3_)).doPlan(this);
      }
   }
}
