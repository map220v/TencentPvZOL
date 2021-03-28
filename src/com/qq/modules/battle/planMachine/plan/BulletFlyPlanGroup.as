package com.qq.modules.battle.planMachine.plan
{
   import PVZ.Cmd.E_DamageType;
   import com.qq.modules.battle.constant.BattleConst;
   import com.qq.modules.battle.model.BattleUnitModel;
   import com.qq.modules.battle.model.vo.FightDamageVo;
   import com.qq.modules.battle.view.unit.UnitBase;
   import flash.geom.Point;
   import tencent.tools.planMachine.ICallBack;
   import tencent.tools.planMachine.IPlan;
   import tencent.tools.planMachine.ParallelPlan;
   
   public class BulletFlyPlanGroup extends BattleBasePlan
   {
       
      
      private var bulletName:String;
      
      private var offsetX:Number;
      
      private var offsetY:Number;
      
      private var flySpeed:Number;
      
      private var amount:int;
      
      private var shootTime:Number;
      
      public function BulletFlyPlanGroup()
      {
         super();
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         super.setDynamicParams(param1);
         this.bulletName = param1[0];
         this.offsetX = param1[1];
         this.offsetY = param1[2];
         this.flySpeed = param1[3];
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         var _loc3_:BulletFlyPlanLine = null;
         var _loc4_:Number = NaN;
         var _loc5_:FightDamageVo = null;
         var _loc6_:BattleDelayPlan = null;
         var _loc9_:InjuredPlanNomal = null;
         super.doPlan(param1);
         var _loc2_:Array = [];
         var _loc7_:int = 0;
         while(_loc7_ < damageList.length)
         {
            if((_loc5_ = damageList[_loc7_]).damageType != E_DamageType.E_DamageType_BlankPos && _loc5_.damageType != E_DamageType.E_DamageType_UpdateBuff)
            {
               _loc3_ = new BulletFlyPlanLine();
               _loc3_.setStaticParams([actor,[_loc5_],planGroup]);
               _loc3_.setDynamicParams([this.bulletName,this.offsetX,this.offsetY,this.flySpeed]);
               _loc3_.isDebug = isDebug;
               _loc2_.push(_loc3_);
               _loc4_ = Point.distance(BattleConst.getAnimaXYByGridXY(_loc5_.targetIndex),UnitBase(BattleUnitModel.getInstance().getUnitByPosIndex(actor.actorIndex)).getAnimationXY()) / this.flySpeed * 1000;
               (_loc9_ = new InjuredPlanNomal()).setStaticParams([actor,[_loc5_],planGroup]);
               _loc9_.setDynamicParams(["1","0","1"]);
               _loc6_ = new BattleDelayPlan(_loc9_,_loc4_);
               _loc2_.push(_loc6_);
            }
            _loc7_++;
         }
         var _loc8_:IPlan;
         (_loc8_ = new ParallelPlan(_loc2_)).doPlan(this);
      }
      
      override public function planCallBack() : void
      {
         super.planCallBack();
      }
   }
}
