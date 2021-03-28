package com.qq.modules.battle.planMachine.plan
{
   import com.greensock.TweenMax;
   import com.qq.GameGloble;
   import com.qq.modules.battle.constant.BattleConst;
   import com.qq.modules.battle.constant.BattleEvent;
   import com.qq.modules.battle.model.BattleUnitModel;
   import com.qq.modules.battle.model.vo.FightDamageVo;
   import com.qq.modules.battle.view.unit.UnitBase;
   import com.qq.modules.battle.view.unit.UnitFactory;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.UrlManager;
   import flash.geom.Point;
   import tencent.tools.planMachine.ICallBack;
   
   public class InjuredPlanStealSun extends BattleBasePlan
   {
       
      
      private var bulletName:String;
      
      private var flySpeed:Number;
      
      private var bullet:UnitBase;
      
      private var tween:TweenMax;
      
      private var endOffsetX:Number;
      
      private var endOffsetY:Number;
      
      public function InjuredPlanStealSun()
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
         if(this.bullet)
         {
            this.bullet.dispose();
            this.bullet = null;
         }
         super.dispose();
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         this.bulletName = param1[0];
         this.flySpeed = param1[1];
         this.endOffsetX = param1[2];
         if(isRightSide)
         {
            this.endOffsetX = -this.endOffsetX;
         }
         this.endOffsetY = param1[3];
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         super.doPlan(param1);
         var _loc2_:UnitBase = BattleUnitModel.getInstance().getUnitByPosIndex((damageList[0] as FightDamageVo).targetIndex);
         var _loc3_:UnitBase = BattleUnitModel.getInstance().getUnitByPosIndex(actor.actorIndex) as UnitBase;
         var _loc4_:Point = _loc2_.getXY();
         _loc4_.y -= 30;
         var _loc5_:Point = _loc3_.getXY();
         _loc5_.x -= this.endOffsetX;
         _loc5_.y -= this.endOffsetY;
         this.bullet = this.createBullet();
         this.bullet.setXY(_loc4_.x,_loc4_.y);
         var _loc6_:Number = Point.distance(_loc4_,_loc5_) / this.flySpeed;
         this.tween = TweenMax.to(this.bullet.display,_loc6_,{
            "x":_loc5_.x,
            "y":_loc5_.y,
            "onComplete":this.flyCompleteHandler
         });
         BattleUnitModel.getInstance().battleTimer.addTweenLite(this.tween);
      }
      
      private function flyCompleteHandler() : void
      {
         BattleUnitModel.getInstance().battleTimer.removeTweenLite(this.tween);
         this.tween = TweenMax.to(this.bullet.display,0.2,{
            "alpha":0,
            "onComplete":this.fadeCompleteHandler
         });
         BattleUnitModel.getInstance().battleTimer.addTweenLite(this.tween);
      }
      
      private function fadeCompleteHandler() : void
      {
         BattleUnitModel.getInstance().battleTimer.removeTweenLite(this.tween);
         this.tween = null;
         var _loc1_:BattleEvent = new BattleEvent(BattleConst.BATTLE_REMOVE_DISPLAY);
         _loc1_.display = this.bullet;
         CommandDispatcher.sendEvent(_loc1_);
         this.bullet = null;
         setComplete();
      }
      
      private function createBullet() : UnitBase
      {
         var _loc1_:UnitBase = UnitFactory.instance.createUnit();
         _loc1_.setAssetUrl(UrlManager.getUrl(UrlManager.Url_Battle_Bullet,this.bulletName + "." + GameGloble.BONE_FILE_EXT));
         var _loc2_:BattleEvent = new BattleEvent(BattleConst.BATTLE_ADD_DISPLAY);
         _loc2_.display = _loc1_;
         CommandDispatcher.sendEvent(_loc2_);
         return _loc1_;
      }
   }
}
