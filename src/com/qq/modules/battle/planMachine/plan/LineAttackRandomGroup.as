package com.qq.modules.battle.planMachine.plan
{
   import PVZ.Cmd.E_DamageType;
   import com.qq.modules.battle.constant.BattleConst;
   import com.qq.modules.battle.model.vo.FightDamageVo;
   import tencent.base.utils.ObjectUtil;
   import tencent.tools.planMachine.ICallBack;
   import tencent.tools.planMachine.ParallelPlan;
   
   public class LineAttackRandomGroup extends BattleBasePlan
   {
       
      
      private var _resName:String;
      
      private var _speed:Number;
      
      private var _offX:Number;
      
      private var _offY:Number;
      
      private var _effectName:String;
      
      private var _isBack:Boolean;
      
      private var _delay:Number;
      
      private var _attackRound:uint;
      
      public function LineAttackRandomGroup()
      {
         super();
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         super.setDynamicParams(param1);
         this._resName = param1[0];
         this._speed = param1[1];
         this._offX = param1[2];
         this._offY = param1[3];
         this._effectName = param1[4];
         this._isBack = param1[5] == 1;
         this._delay = param1[6];
         this._attackRound = param1[7];
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         var _loc3_:int = 0;
         var _loc4_:FightDamageVo = null;
         var _loc5_:FightDamageVo = null;
         var _loc6_:Array = null;
         var _loc7_:BattleBasePlan = null;
         var _loc8_:int = 0;
         var _loc10_:int = 0;
         super.doPlan(param1);
         var _loc2_:Vector.<Array> = new Vector.<Array>(3);
         for each(_loc5_ in damageList)
         {
            if(_loc5_.damageType != E_DamageType.E_DamageType_BlankPos && _loc5_.damageType != E_DamageType.E_DamageType_UpdateBuff)
            {
               (_loc4_ = ObjectUtil.clone(_loc5_) as FightDamageVo).setDamage(_loc5_.damage);
               _loc4_.changeHp = _loc4_.changeHp * 1 / (this._attackRound * (!!this._isBack ? 2 : 1));
               _loc3_ = BattleConst.getHorizontalByIndex(_loc5_.targetIndex);
               if(_loc2_[_loc3_])
               {
                  _loc2_[_loc3_].push(_loc4_);
               }
               else
               {
                  _loc2_[_loc3_] = new Array();
                  _loc2_[_loc3_].push(_loc4_);
               }
            }
         }
         _loc6_ = new Array();
         _loc8_ = 0;
         while(_loc8_ < _loc2_.length)
         {
            if(_loc2_[_loc8_])
            {
               _loc10_ = 0;
               while(_loc10_ < this._attackRound)
               {
                  (_loc7_ = new LineAttackPlan()).setStaticParams([actor,_loc2_[_loc8_],planGroup]);
                  _loc7_.setDynamicParams([this._resName,this._speed + (-this._speed / 6 + this._speed / 3 * Math.random()),this._offX,this._offY,this._effectName,this._isBack]);
                  _loc7_.isDebug = isDebug;
                  if(_loc10_ != 0)
                  {
                     _loc7_ = new BattleDelayPlan(_loc7_,this._delay * _loc10_);
                  }
                  _loc6_.push(_loc7_);
                  _loc10_++;
               }
            }
            _loc8_++;
         }
         var _loc9_:ParallelPlan;
         (_loc9_ = new ParallelPlan(_loc6_)).doPlan(this);
      }
   }
}
