package com.qq.modules.battle.planMachine.plan
{
   import PVZ.Cmd.Dto_FightDamage;
   import PVZ.Cmd.E_DamageType;
   import com.qq.modules.battle.model.vo.FightDamageVo;
   import com.qq.modules.battle.view.unit.UnitBase;
   import com.qq.utils.DMath;
   import tencent.tools.planMachine.ICallBack;
   import tencent.tools.planMachine.ParallelPlan;
   
   public class BulletFlyBloomerangGroup extends BattleBasePlan
   {
       
      
      private var bullet:UnitBase;
      
      private var bulletName:String;
      
      private var offsetX:Number;
      
      private var offsetY:Number;
      
      private var flySpeed:Number;
      
      private var bulletNum:int;
      
      public function BulletFlyBloomerangGroup()
      {
         super();
      }
      
      override protected function dispose() : void
      {
         super.dispose();
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         super.setDynamicParams(param1);
         this.offsetX = param1[0];
         this.offsetY = param1[1];
         this.flySpeed = param1[2];
         this.bulletNum = 1;
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         var _loc7_:FightDamageVo = null;
         var _loc8_:FightDamageVo = null;
         var _loc9_:Dto_FightDamage = null;
         var _loc10_:BulletFlyBloomerang = null;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         super.doPlan(param1);
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < damageList.length)
         {
            if((_loc7_ = damageList[_loc3_]).damageType != E_DamageType.E_DamageType_BlankPos && _loc7_.damageType != E_DamageType.E_DamageType_UpdateBuff)
            {
               _loc8_ = new FightDamageVo();
               _loc9_ = new Dto_FightDamage();
               _loc8_.setDamage(_loc9_);
               _loc8_.isDead = _loc7_.isDead;
               _loc8_.targetIndex = _loc7_.targetIndex;
               _loc8_.changeHp = (damageList[_loc3_] as FightDamageVo).changeHp / this.bulletNum;
               _loc8_.changeShield = (damageList[_loc3_] as FightDamageVo).changeShield / this.bulletNum;
               _loc2_.push(_loc8_);
            }
            _loc3_++;
         }
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < this.bulletNum)
         {
            _loc10_ = new BulletFlyBloomerang();
            _loc11_ = DMath.randNum(this.flySpeed - 100,this.flySpeed + 100);
            _loc12_ = DMath.randNum(this.offsetY - 20,this.offsetY + 20);
            _loc13_ = DMath.randNum(this.offsetX - 20,this.offsetX + 20);
            _loc10_.setDynamicParams([this.offsetX,_loc12_,_loc11_]);
            _loc10_.setStaticParams([actor,_loc2_,planGroup]);
            _loc10_.isDebug = isDebug;
            _loc4_.push(_loc10_);
            _loc5_++;
         }
         var _loc6_:ParallelPlan;
         (_loc6_ = new ParallelPlan(_loc4_)).doPlan(this);
      }
   }
}
