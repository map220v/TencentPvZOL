package com.qq.modules.battle.planMachine.plan
{
   import com.greensock.TweenLite;
   import com.qq.modules.battle.constant.BattleConst;
   import com.qq.modules.battle.model.BattleUnitModel;
   import com.qq.modules.battle.model.vo.FightDamageVo;
   import com.qq.modules.battle.view.unit.UnitBase;
   import tencent.tools.planMachine.ICallBack;
   
   public class JumpBasePlan extends BattleBasePlan
   {
       
      
      protected var time:Number;
      
      protected var head:Boolean;
      
      protected var meUnit:UnitBase;
      
      private var _tween:TweenLite;
      
      public function JumpBasePlan()
      {
         super();
      }
      
      override protected function dispose() : void
      {
         super.dispose();
         this.meUnit = null;
         if(this._tween)
         {
            BattleUnitModel.getInstance().battleTimer.removeTweenLite(this._tween);
            this._tween.kill();
            this._tween = null;
         }
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         super.setDynamicParams(param1);
         this.time = param1[0];
         this.head = param1[1] == 1;
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         super.doPlan(param1);
         this.meUnit = BattleUnitModel.getInstance().getUnitByPosIndex(actor.actorIndex) as UnitBase;
         var _loc2_:FightDamageVo = damageList[0];
         var _loc3_:UnitBase = BattleUnitModel.getInstance().getUnitByPosIndex(actor.targetIndex) as UnitBase;
         var _loc4_:Number = _loc3_.getXY().x;
         var _loc5_:Number = _loc3_.getXY().y;
         if(this.head)
         {
            _loc5_ -= BattleConst.GRID_HEIGHT;
         }
         this._tween = TweenLite.to(this.meUnit.display,this.time / 1000,{
            "x":_loc4_,
            "y":_loc5_,
            "onComplete":this.onJumpUpHandler
         });
         BattleUnitModel.getInstance().battleTimer.addTweenLite(this._tween);
      }
      
      protected function onJumpUpHandler() : void
      {
         setComplete();
      }
   }
}
