package com.qq.modules.battle.planMachine.plan
{
   import com.greensock.TweenLite;
   import com.greensock.easing.Linear;
   import com.qq.modules.battle.constant.BattleConst;
   import com.qq.modules.battle.model.BattleUnitModel;
   import com.qq.modules.battle.model.vo.FightDamageVo;
   import com.qq.modules.battle.view.unit.UnitBase;
   import flash.geom.Point;
   import org.as3commons.logging.api.getLogger;
   import tencent.tools.planMachine.ICallBack;
   
   public class ActorHitTargetPlan extends BattleBasePlan
   {
       
      
      public var speed:int = 300;
      
      private var tween:TweenLite;
      
      protected var isMoveBack:int = 0;
      
      private var target:UnitBase;
      
      private var offsetX:int;
      
      private var offsetY:int;
      
      private var moveType:int;
      
      public function ActorHitTargetPlan()
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
         this.target = null;
         super.dispose();
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         super.setDynamicParams(param1);
         this.speed = param1[0];
         this.isMoveBack = param1[1];
         this.offsetX = param1[2];
         this.offsetY = param1[3];
         this.moveType = param1[4];
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         var _loc7_:Number = NaN;
         super.doPlan(param1);
         this.target = BattleUnitModel.getInstance().getUnitByPosIndex(actor.actorIndex);
         var _loc2_:FightDamageVo = damageList[0];
         var _loc3_:int = this.moveType == 0 ? int(_loc2_.targetIndex) : int(actor.targetIndex);
         var _loc4_:UnitBase = BattleUnitModel.getInstance().getUnitByPosIndex(_loc2_.targetIndex);
         var _loc5_:Point = this.target.getXY();
         var _loc6_:Point = BattleConst.getCardXYByPosindex(_loc3_);
         if(isRightSide)
         {
            this.offsetX = -this.offsetX;
         }
         _loc6_.x += this.offsetX;
         _loc6_.y += this.offsetY;
         this.sortDepth(_loc2_.targetIndex);
         if(this.speed != 0)
         {
            _loc7_ = Point.distance(_loc5_,_loc6_) / this.speed;
            getLogger().debug("[ActorHitTargetPlan]" + _loc7_);
            if(this.isMoveBack == 0)
            {
               this.tween = TweenLite.to(this.target.display,_loc7_,{
                  "x":_loc6_.x,
                  "y":_loc6_.y,
                  "ease":Linear.easeNone,
                  "onComplete":this.moveCompleteHandler
               });
            }
            else
            {
               _loc5_ = BattleConst.getCardXYByPosindex(actor.actorIndex);
               this.tween = TweenLite.to(this.target.display,_loc7_,{
                  "x":_loc5_.x,
                  "y":_loc5_.y,
                  "onComplete":this.moveCompleteHandler
               });
            }
            BattleUnitModel.getInstance().battleTimer.addTweenLite(this.tween);
         }
         else
         {
            if(this.isMoveBack == 0)
            {
               this.target.display.x = _loc6_.x;
               this.target.display.y = _loc6_.y;
            }
            else
            {
               _loc5_ = BattleConst.getCardXYByPosindex(actor.actorIndex);
               this.target.display.x = _loc5_.x;
               this.target.display.y = _loc5_.y;
            }
            this.moveCompleteHandler();
         }
      }
      
      private function moveCompleteHandler() : void
      {
         if(this.tween)
         {
            BattleUnitModel.getInstance().battleTimer.removeTweenLite(this.tween);
            this.tween.kill();
            this.tween = null;
         }
         setComplete();
      }
      
      protected function sortDepth(param1:int) : void
      {
         var _loc2_:int = BattleConst.getColIndexByPosIndex(param1);
         BattleUnitModel.getInstance().swapUnit(this.target,_loc2_);
      }
   }
}
