package com.qq.modules.battle.planMachine.plan
{
   import PVZ.Cmd.E_DamageType;
   import com.greensock.TweenLite;
   import com.qq.modules.battle.constant.BattleConst;
   import com.qq.modules.battle.model.BattleUnitModel;
   import com.qq.modules.battle.model.vo.FightDamageVo;
   import com.qq.modules.battle.view.unit.UnitBase;
   import flash.filters.BlurFilter;
   import flash.geom.Point;
   import org.as3commons.logging.api.getLogger;
   import tencent.tools.planMachine.ICallBack;
   import tencent.tools.planMachine.IPlan;
   
   public class MovePlanWarrior extends BattleBasePlan implements IPlan
   {
       
      
      protected var isMoveBack:int = 0;
      
      protected var tween:TweenLite;
      
      protected var fromTarget:UnitBase;
      
      protected var fightDTO:FightDamageVo;
      
      public function MovePlanWarrior()
      {
         super();
      }
      
      override protected function dispose() : void
      {
         if(this.tween)
         {
            BattleUnitModel.getInstance().battleTimer.removeTweenLite(this.tween);
            this.tween.kill();
            this.tween = null;
         }
         this.fromTarget = null;
         super.dispose();
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         if(!param1)
         {
            getLogger().error("PlayMovePlanArchor setDynamicParams error!");
            return;
         }
         this.isMoveBack = param1[0];
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         var _loc2_:Point = null;
         var _loc3_:Array = null;
         var _loc4_:FightDamageVo = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Point = null;
         var _loc8_:int = 0;
         var _loc9_:Point = null;
         var _loc10_:int = 0;
         var _loc11_:Array = null;
         var _loc12_:int = 0;
         var _loc13_:FightDamageVo = null;
         var _loc14_:int = 0;
         super.doPlan(param1);
         this.fromTarget = BattleUnitModel.getInstance().getUnitByPosIndex(actor.actorIndex) as UnitBase;
         if(this.isMoveBack == 0)
         {
            _loc3_ = [];
            _loc5_ = 0;
            while(_loc5_ < damageList.length)
            {
               if((_loc4_ = damageList[_loc5_]).damageType != E_DamageType.E_DamageType_UpdateBuff)
               {
                  _loc3_.push(_loc4_);
               }
               _loc5_++;
            }
            if(_loc3_.length >= 1)
            {
               this.fightDTO = _loc3_[0] as FightDamageVo;
               _loc2_ = getMoveToXY(this.fightDTO.targetIndex);
            }
            else if((_loc6_ = actor.targetIndex) == 0)
            {
               _loc2_ = getMoveToXY(!!BattleConst.isLeft(actor.actorIndex) ? 4 : 3);
            }
            else
            {
               _loc2_ = getMoveToXY(_loc6_);
            }
            this.tween = TweenLite.to(this.fromTarget.display,0.3,{
               "x":_loc2_.x,
               "y":_loc2_.y,
               "onComplete":this.moveCompleteHandler
            });
         }
         else if(this.isMoveBack == 1)
         {
            _loc7_ = BattleConst.getCardXYByPosindex(actor.actorIndex);
            this.tween = TweenLite.to(this.fromTarget.display,0.3,{
               "x":_loc7_.x,
               "y":_loc7_.y,
               "onComplete":this.moveCompleteHandler
            });
            BattleUnitModel.getInstance().swapUnit(this.fromTarget,0);
         }
         else if(this.isMoveBack == 2)
         {
            if(damageList.length > 0)
            {
               _loc10_ = damageList.length;
               _loc11_ = new Array();
               _loc12_ = 0;
               while(_loc12_ < _loc10_)
               {
                  _loc13_ = damageList[_loc12_];
                  _loc11_.push(_loc13_.targetIndex);
                  _loc12_++;
               }
               _loc11_.sort(Array.NUMERIC);
               _loc8_ = _loc11_[_loc11_.length - 1];
            }
            else
            {
               _loc8_ = !!BattleConst.isLeft(actor.actorIndex) ? 10 : 9;
            }
            actor.targetIndex = _loc8_;
            _loc9_ = BattleConst.getCardXYByPosindex(_loc8_);
            this.tween = TweenLite.to(this.fromTarget.display,0.3,{
               "x":_loc9_.x,
               "y":_loc9_.y,
               "onComplete":this.moveCompleteHandler
            });
         }
         if(this.tween != null)
         {
            BattleUnitModel.getInstance().battleTimer.addTweenLite(this.tween);
            this.fromTarget.display.filters = [new BlurFilter(24,0)];
         }
         this.sortDepth();
         if(this.isMoveBack == 3)
         {
            if((_loc14_ = actor.targetIndex) == 0)
            {
               if(actor.actorIndex > 100)
               {
                  _loc2_ = getMoveToXY(!!BattleConst.isLeft(actor.actorIndex) ? 10 : 9);
               }
               else
               {
                  _loc2_ = getMoveToXY(!!BattleConst.isLeft(actor.actorIndex) ? 4 : 3);
               }
            }
            else
            {
               _loc2_ = getMoveToXY(_loc14_);
            }
            this.fromTarget.display.x = _loc2_.x;
            this.fromTarget.display.y = _loc2_.y;
            setComplete();
         }
      }
      
      protected function sortDepth() : void
      {
         if(actor.targetIndex == 0)
         {
            return;
         }
         var _loc1_:int = BattleConst.getColIndexByPosIndex(actor.targetIndex);
         BattleUnitModel.getInstance().swapUnit(this.fromTarget,_loc1_);
      }
      
      protected function moveCompleteHandler() : void
      {
         if(this.tween)
         {
            BattleUnitModel.getInstance().battleTimer.removeTweenLite(this.tween);
            this.tween.kill();
            this.tween = null;
         }
         if(!this.fromTarget)
         {
            return;
         }
         this.fromTarget.display.filters = [];
         setComplete();
      }
   }
}
