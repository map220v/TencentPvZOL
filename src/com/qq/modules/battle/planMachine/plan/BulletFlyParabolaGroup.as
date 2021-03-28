package com.qq.modules.battle.planMachine.plan
{
   import PVZ.Cmd.E_DamageType;
   import com.qq.modules.battle.model.vo.FightDamageVo;
   import com.qq.modules.battle.view.unit.UnitBase;
   import flash.geom.Point;
   import tencent.tools.planMachine.ICallBack;
   import tencent.tools.planMachine.ParallelPlan;
   
   public class BulletFlyParabolaGroup extends BattleBasePlan
   {
       
      
      private var bullet:UnitBase;
      
      private var bulletName:String;
      
      private var offsetX:Number;
      
      private var offsetY:Number;
      
      private var flyTime:Number;
      
      private var h:Number = 0.8;
      
      private var currFrame:int;
      
      private var totalFrame:int;
      
      private var ydiff:Number;
      
      private var xdiff:Number;
      
      private var toP:Point;
      
      private var fromP:Point;
      
      public function BulletFlyParabolaGroup()
      {
         super();
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         super.setDynamicParams(param1);
         this.bulletName = param1[0];
         this.offsetX = param1[1];
         this.offsetY = param1[2];
         this.flyTime = param1[3];
         this.h = param1[4];
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         var _loc6_:BulletFlyParabola = null;
         var _loc7_:Array = null;
         super.doPlan(param1);
         var _loc2_:int = damageList.length;
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            if(FightDamageVo(damageList[_loc4_]).damageType != E_DamageType.E_DamageType_BlankPos && FightDamageVo(damageList[_loc4_]).damageType != E_DamageType.E_DamageType_UpdateBuff)
            {
               _loc6_ = new BulletFlyParabola();
               _loc7_ = [damageList[_loc4_]];
               _loc6_.setStaticParams([actor,_loc7_,planGroup]);
               _loc6_.setDynamicParams([this.bulletName,this.offsetX,this.offsetY,this.flyTime,this.h]);
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
