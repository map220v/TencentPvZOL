package com.qq.modules.battle.planMachine.plan
{
   import com.greensock.TweenMax;
   import com.qq.modules.battle.model.BattleUnitModel;
   import com.qq.modules.battle.model.vo.FightDamageVo;
   import com.qq.modules.battle.view.unit.UnitBase;
   import com.qq.utils.DMath;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   import tencent.tools.planMachine.ICallBack;
   import tencent.tools.planMachine.IPlan;
   import tencent.tools.planMachine.ParallelPlan;
   import tencent.tools.planMachine.SerialPlan;
   
   public class InjuredPlanNomal extends BattleBasePlan
   {
       
      
      private var cachePoint:Point;
      
      private var target:UnitBase;
      
      private var targetIndex:int;
      
      private var tweens:Vector.<TweenMax>;
      
      private var attackNum:int;
      
      private var attackTimeGap:Number;
      
      private var timer:Timer;
      
      private var fightDTO:FightDamageVo;
      
      private var damageHPList:Array;
      
      private var HPAndSHchangeList:Array;
      
      private var index:int = 0;
      
      private var needDieEffect:Boolean = true;
      
      private var isMissAttack:Boolean = false;
      
      private var m_needSum:Boolean = true;
      
      public function InjuredPlanNomal()
      {
         super();
         this.tweens = new Vector.<TweenMax>();
      }
      
      public function set needSum(param1:Boolean) : void
      {
         this.m_needSum = param1;
      }
      
      override protected function dispose() : void
      {
         var _loc1_:TweenMax = null;
         this.target = null;
         if(this.timer)
         {
            this.timer.stop();
            BattleUnitModel.getInstance().battleTimer.removeTimer(this.timer);
            this.timer.removeEventListener(TimerEvent.TIMER,this.timerHandler);
            this.timer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.timerComplete);
            this.timer = null;
         }
         if(this.tweens)
         {
            for each(_loc1_ in this.tweens)
            {
               BattleUnitModel.getInstance().battleTimer.removeTweenLite(_loc1_);
               _loc1_ = null;
            }
            this.tweens = null;
         }
         super.dispose();
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         super.setDynamicParams(param1);
         this.attackNum = param1[0];
         this.attackTimeGap = param1[1];
         if(param1.length >= 3)
         {
            this.needDieEffect = param1[2] == "0" ? false : true;
         }
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         super.doPlan(param1);
         if(damageList.length == 0 || damageList[0] == null)
         {
            this.timerComplete(null);
            return;
         }
         this.damageHPList = this.getRDamage(damageList[0].changeHp + damageList[0].changeShield,this.attackNum);
         this.HPAndSHchangeList = this.getHPAndSHchangeList(this.damageHPList);
         var _loc2_:int = damageList[0].changeHp;
         var _loc3_:int = _loc2_ < 0 ? -1 : 1;
         _loc2_ = Math.abs(_loc2_);
         this.fightDTO = new FightDamageVo();
         this.fightDTO.setDamage(damageList[0].damage);
         if(!BattleUnitModel.getInstance().unitPosDic)
         {
            this.dispose();
            return;
         }
         this.target = BattleUnitModel.getInstance().getUnitByPosIndex(this.fightDTO.targetIndex) as UnitBase;
         this.targetIndex = this.fightDTO.targetIndex;
         this.cachePoint = this.target.getXY();
         this.timerHandler(null);
         this.fightDTO.isAddBuff = false;
         if(this.attackNum > 1)
         {
            this.timer = new Timer(this.attackTimeGap,this.attackNum - 1);
            BattleUnitModel.getInstance().battleTimer.addTimer(this.timer);
            this.timer.addEventListener(TimerEvent.TIMER,this.timerHandler);
            this.timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.timerComplete);
            this.timer.start();
         }
         else
         {
            this.timerComplete(null);
         }
      }
      
      private function timerHandler(param1:TimerEvent) : void
      {
         var _loc3_:TweenMax = null;
         var _loc2_:Array = [];
         if(this.targetIndex % 2 == 0)
         {
            _loc3_ = TweenMax.to(this.target.display,0.04,{
               "x":this.cachePoint.x + 5,
               "repeat":1,
               "yoyo":true
            });
         }
         else
         {
            _loc3_ = TweenMax.to(this.target.display,0.04,{
               "x":this.cachePoint.x - 5,
               "repeat":1,
               "yoyo":true
            });
         }
         BattleUnitModel.getInstance().battleTimer.addTweenLite(_loc3_);
         this.tweens.push(_loc3_);
         var _loc4_:CostarChangeHP = new CostarChangeHP(this.m_needSum);
         this.fightDTO.changeShield = this.HPAndSHchangeList[this.index][1];
         this.fightDTO.changeHp = this.HPAndSHchangeList[this.index][0];
         _loc4_.setStaticParams([actor,[this.fightDTO],planGroup]);
         _loc4_.setDynamicParams([]);
         _loc4_.isDebug = isDebug;
         _loc2_.push(_loc4_);
         var _loc5_:ParallelPlan;
         (_loc5_ = new ParallelPlan(_loc2_)).doPlan(null);
         ++this.index;
      }
      
      public function timerComplete(param1:TimerEvent) : void
      {
         var _loc2_:Array = null;
         var _loc3_:DiePlanNomal = null;
         var _loc4_:SerialPlan = null;
         if(this.fightDTO == null)
         {
            setComplete();
            return;
         }
         if(!this.fightDTO.isDead || !this.needDieEffect)
         {
            setComplete();
         }
         else
         {
            _loc2_ = [];
            _loc3_ = new DiePlanNomal();
            _loc3_.setStaticParams(this.staticParams);
            _loc3_.setDynamicParams([]);
            _loc3_.isDebug = isDebug;
            _loc2_.push(_loc3_);
            (_loc4_ = new SerialPlan(_loc2_)).doPlan(this);
         }
      }
      
      private function createCostarColorBrightness(param1:Number, param2:Number) : IPlan
      {
         var _loc3_:IPlan = null;
         _loc3_ = new CostarColorBrightness();
         (_loc3_ as BattleBasePlan).setStaticParams(this.staticParams);
         (_loc3_ as BattleBasePlan).setDynamicParams([param1,1]);
         (_loc3_ as BattleBasePlan).isDebug = isDebug;
         (_loc3_ as CostarColorBrightness).time = 0.05;
         if(param2 > 0)
         {
            _loc3_ = new BattleDelayPlan(_loc3_,param2);
         }
         return _loc3_;
      }
      
      private function getRDamage(param1:int, param2:int) : Array
      {
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc3_:Array = [];
         var _loc4_:Array = [];
         var _loc5_:int = param1 < 0 ? -1 : 1;
         var _loc6_:int = Math.abs(param1);
         var _loc7_:int = Math.floor(_loc6_ / param2);
         var _loc8_:int = _loc6_ % param2;
         if(param2 > 2)
         {
            _loc10_ = 0;
            while(_loc10_ < param2)
            {
               if(_loc10_ != param2 - 1)
               {
                  _loc11_ = DMath.randNum(0,_loc7_ - 1);
                  _loc3_.push(_loc7_ + _loc11_);
                  _loc10_++;
                  if(_loc10_ == param2 - 1)
                  {
                     _loc3_.push(_loc7_ - _loc11_ + _loc8_);
                  }
                  else
                  {
                     _loc3_.push(_loc7_ - _loc11_);
                  }
               }
               else
               {
                  _loc3_.push(_loc7_ + _loc8_);
               }
               _loc10_++;
            }
         }
         else
         {
            _loc3_.push(_loc7_,_loc7_ + _loc8_);
         }
         var _loc9_:int = 0;
         while(_loc9_ < param2)
         {
            _loc3_[_loc9_] = _loc5_ * _loc3_[_loc9_];
            _loc9_++;
         }
         return _loc3_;
      }
      
      private function getHPAndSHchangeList(param1:Array) : Array
      {
         var _loc2_:Array = [];
         var _loc3_:int = damageList[0].changeHp;
         var _loc4_:int = damageList[0].changeShield;
         var _loc5_:int = 0;
         while(_loc5_ < param1.length)
         {
            if(_loc4_ < 0)
            {
               if(_loc4_ <= param1[_loc5_])
               {
                  _loc2_.push([0,param1[_loc5_]]);
                  _loc4_ -= param1[_loc5_];
               }
               else
               {
                  _loc2_.push([param1[_loc5_] - _loc4_,_loc4_]);
                  _loc3_ -= param1[_loc5_] - _loc4_;
                  _loc4_ = 0;
               }
            }
            else if(_loc4_ == 0)
            {
               _loc2_.push([param1[_loc5_],0]);
            }
            else if(_loc4_ > 0)
            {
               if(_loc4_ <= param1[_loc5_])
               {
                  _loc2_.push([param1[_loc5_] - _loc4_,_loc4_]);
                  _loc4_ = 0;
                  _loc3_ -= param1[_loc5_] - _loc4_;
               }
               else
               {
                  _loc2_.push([0,_loc4_ - param1[_loc5_]]);
                  _loc4_ -= param1[_loc5_];
               }
            }
            _loc5_++;
         }
         return _loc2_;
      }
   }
}
