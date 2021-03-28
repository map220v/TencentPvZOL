package com.qq.modules.battle.planMachine.plan
{
   import com.greensock.TweenLite;
   import com.greensock.easing.Linear;
   import com.qq.modules.battle.constant.BattleConst;
   import com.qq.modules.battle.model.BattleUnitModel;
   import com.qq.modules.battle.model.vo.FightDamageVo;
   import com.qq.modules.battle.view.unit.UnitBase;
   import flash.geom.Point;
   import tencent.tools.planMachine.ICallBack;
   
   public class ActorWallnutAttack extends BattleBasePlan
   {
       
      
      public var speed:int = 300;
      
      private var totalAttackNum:int = 0;
      
      private var curAttackNum:int = 0;
      
      private var target:UnitBase;
      
      private var tween:TweenLite;
      
      public function ActorWallnutAttack()
      {
         super();
      }
      
      override protected function dispose() : void
      {
         this.target = null;
         if(this.tween)
         {
            BattleUnitModel.getInstance().battleTimer.removeTweenLite(this.tween);
            this.tween.kill();
         }
         this.tween = null;
         super.dispose();
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         this.speed = param1[0];
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         super.doPlan(param1);
         this.totalAttackNum = damageList.length;
         this.curAttackNum = 0;
         this.target = BattleUnitModel.getInstance().getUnitByPosIndex(actor.actorIndex);
         this.moveCompleteHandler();
      }
      
      private function moveCompleteHandler() : void
      {
         var _loc5_:InjuredPlanNomal = null;
         if(this.curAttackNum > 0)
         {
            (_loc5_ = new InjuredPlanNomal()).setStaticParams([actor,[damageList[this.curAttackNum - 1]],planGroup]);
            _loc5_.setDynamicParams([1,0]);
            _loc5_.doPlan(null);
         }
         if(this.curAttackNum == this.totalAttackNum)
         {
            BattleUnitModel.getInstance().swapUnit(this.target);
            setComplete();
            return;
         }
         var _loc1_:FightDamageVo = damageList[this.curAttackNum];
         var _loc2_:Point = this.target.getXY();
         var _loc3_:Point = BattleConst.getCardXYByPosindex(_loc1_.targetIndex);
         var _loc4_:Number = Point.distance(_loc2_,_loc3_) / this.speed;
         this.tween = TweenLite.to(this.target.display,_loc4_,{
            "x":_loc3_.x,
            "y":_loc3_.y,
            "ease":Linear.easeNone,
            "onComplete":this.moveCompleteHandler
         });
         BattleUnitModel.getInstance().battleTimer.addTweenLite(this.tween);
         this.sortDepth(_loc1_.targetIndex);
         ++this.curAttackNum;
      }
      
      protected function sortDepth(param1:int) : void
      {
         var _loc2_:int = BattleConst.getColIndexByPosIndex(param1);
         BattleUnitModel.getInstance().swapUnit(this.target,_loc2_);
      }
   }
}
