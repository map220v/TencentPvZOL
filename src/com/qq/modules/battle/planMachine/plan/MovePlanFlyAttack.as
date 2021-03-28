package com.qq.modules.battle.planMachine.plan
{
   import PVZ.Cmd.E_DamageType;
   import com.greensock.TweenMax;
   import com.qq.modules.battle.constant.BattleConst;
   import com.qq.modules.battle.model.BattleUnitModel;
   import com.qq.modules.battle.model.vo.FightDamageVo;
   import com.qq.modules.battle.view.unit.UnitBase;
   import flash.events.Event;
   import flash.geom.Point;
   import org.as3commons.logging.api.getLogger;
   import tencent.tools.planMachine.ICallBack;
   import tencent.tools.planMachine.IPlan;
   
   public class MovePlanFlyAttack extends BattleBasePlan implements IPlan
   {
       
      
      protected var isMoveBack:int = 0;
      
      protected var tween:TweenMax;
      
      protected var fromTarget:UnitBase;
      
      protected var fightDTO:FightDamageVo;
      
      private var _frameNameList:Array;
      
      public function MovePlanFlyAttack()
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
         if(this.fromTarget != null)
         {
            this.fromTarget.animation.removeEventListener(Event.COMPLETE,this.onJumpComplete);
            this.fromTarget.animation.removeEventListener(Event.COMPLETE,this.moveCompleteHandler);
         }
         this.fromTarget = null;
         super.dispose();
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         var _loc3_:Array = null;
         if(!param1)
         {
            getLogger().error("MovePlanFlyAttack setDynamicParams error!");
            return;
         }
         var _loc2_:String = param1[1];
         if(_loc2_ != null)
         {
            _loc3_ = _loc2_.split(":");
            if(_loc3_.length == 3)
            {
               this._frameNameList = _loc3_;
            }
         }
         this.isMoveBack = param1[0];
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         var _loc3_:Point = null;
         var _loc5_:FightDamageVo = null;
         var _loc7_:int = 0;
         var _loc8_:Array = null;
         var _loc9_:Array = null;
         var _loc10_:Object = null;
         super.doPlan(param1);
         this.fromTarget = BattleUnitModel.getInstance().getUnitByPosIndex(actor.actorIndex) as UnitBase;
         var _loc2_:Point = BattleConst.getCardXYByPosindex(actor.actorIndex);
         var _loc4_:Array = [];
         var _loc6_:int = 0;
         while(_loc6_ < damageList.length)
         {
            if((_loc5_ = damageList[_loc6_]).damageType != E_DamageType.E_DamageType_UpdateBuff)
            {
               _loc4_.push(_loc5_);
            }
            _loc6_++;
         }
         if(_loc4_.length == 1)
         {
            this.fightDTO = _loc4_[0] as FightDamageVo;
            _loc3_ = getMoveToXY(this.fightDTO.targetIndex);
         }
         else
         {
            if((_loc7_ = actor.targetIndex) == 0)
            {
               _loc7_ = (_loc4_[0] as FightDamageVo).targetIndex;
               _loc8_ = BattleConst.unitPointMaping[_loc7_ - 1];
               _loc7_ = BattleConst.getCardPosIndexByUnitPoint([_loc8_[0],1]);
            }
            _loc3_ = getMoveToXY(_loc7_);
         }
         if(this.isMoveBack == 0)
         {
            if(this._frameNameList != null)
            {
               (_loc9_ = new Array()).push({
                  "x":_loc2_.x,
                  "y":_loc2_.y
               });
               _loc10_ = {
                  "x":_loc2_.x + (_loc3_.x - _loc2_.x) * 0.5,
                  "y":_loc2_.y - 100
               };
               _loc9_.push(_loc10_);
               _loc9_.push({
                  "x":_loc3_.x + (!!isRightSide ? -30 : 30),
                  "y":_loc3_.y
               });
               this.tween = TweenMax.to(this.fromTarget.display,0.5,{
                  "bezierThrough":_loc9_,
                  "onComplete":this.onFlyComplete
               });
               this.fromTarget.animation.addEventListener(Event.COMPLETE,this.onJumpComplete);
               this.fromTarget.animation.gotoAndPlay(this._frameNameList[0],1);
            }
            else
            {
               this.tween = TweenMax.to(this.fromTarget.display,0.3,{
                  "x":_loc3_.x,
                  "y":_loc3_.y,
                  "onComplete":this.moveCompleteHandler
               });
            }
         }
         else
         {
            this.tween = TweenMax.to(this.fromTarget.display,0.3,{
               "x":_loc2_.x,
               "y":_loc2_.y,
               "onComplete":this.moveCompleteHandler
            });
         }
         BattleUnitModel.getInstance().battleTimer.addTweenLite(this.tween);
         this.sortDepth();
      }
      
      private function onJumpComplete(param1:Event) : void
      {
         this.fromTarget.animation.removeEventListener(Event.COMPLETE,this.onJumpComplete);
         this.fromTarget.animation.gotoAndPlay(this._frameNameList[1],0);
      }
      
      private function onFlyComplete() : void
      {
         this.fromTarget.animation.addEventListener(Event.COMPLETE,this.moveCompleteHandler);
         this.fromTarget.animation.gotoAndPlay(this._frameNameList[2],1);
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
      
      protected function moveCompleteHandler(param1:Event = null) : void
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
         setComplete();
      }
   }
}
