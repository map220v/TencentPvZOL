package com.qq.modules.battle.planMachine.plan
{
   import PVZ.Cmd.E_DamageType;
   import com.qq.modules.battle.constant.BattleConst;
   import com.qq.modules.battle.model.vo.FightDamageVo;
   import tencent.tools.planMachine.ICallBack;
   import tencent.tools.planMachine.ParallelPlan;
   import tencent.tools.planMachine.Plan;
   
   public class VerticalAddEffectGroup extends BattleBasePlan
   {
       
      
      protected var topOrGround:Boolean;
      
      protected var effectName:String;
      
      protected var time:Number;
      
      protected var offsetX:Number;
      
      protected var offsetY:Number;
      
      protected var actionName:String;
      
      protected var delay:Number;
      
      public function VerticalAddEffectGroup()
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
         this.delay = param1[6];
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         var _loc4_:Number = NaN;
         var _loc6_:CostarAddEffect = null;
         var _loc7_:FightDamageVo = null;
         var _loc9_:Plan = null;
         super.doPlan(param1);
         var _loc2_:Array = [];
         var _loc3_:Vector.<Array> = new Vector.<Array>(3);
         var _loc5_:int = damageList.length;
         var _loc8_:int = 0;
         while(_loc8_ < _loc5_)
         {
            if((_loc7_ = damageList[_loc8_]).damageType != E_DamageType.E_DamageType_BlankPos && _loc7_.damageType != E_DamageType.E_DamageType_UpdateBuff)
            {
               (_loc6_ = new CostarAddEffect()).setStaticParams([actor,[damageList[_loc8_]],planGroup]);
               _loc6_.setDynamicParams([this.topOrGround,this.effectName,this.time,this.actionName,this.offsetX,this.offsetY]);
               _loc4_ = BattleConst.getVerticalByIndex(damageList[_loc8_].targetIndex);
               if(_loc3_[_loc4_])
               {
                  _loc3_[_loc4_].push(_loc6_);
               }
               else
               {
                  _loc3_[_loc4_] = new Array();
                  _loc3_[_loc4_].push(_loc6_);
               }
            }
            _loc8_++;
         }
         var _loc10_:int = 0;
         while(_loc10_ < _loc3_.length)
         {
            for each(_loc6_ in _loc3_[_loc10_])
            {
               _loc9_ = new BattleDelayPlan(_loc6_,(_loc10_ + 1) * this.delay);
               _loc2_.push(_loc9_);
            }
            _loc10_++;
         }
         var _loc11_:ParallelPlan;
         (_loc11_ = new ParallelPlan(_loc2_)).doPlan(this);
      }
   }
}
