package com.qq.modules.battle.planMachine.plan
{
   import com.greensock.TweenLite;
   import com.greensock.easing.Linear;
   import com.qq.GameGloble;
   import com.qq.modules.battle.constant.BattleConst;
   import com.qq.modules.battle.constant.BattleEvent;
   import com.qq.modules.battle.model.BattleUnitModel;
   import com.qq.modules.battle.model.vo.FightDamageVo;
   import com.qq.modules.battle.view.unit.UnitBase;
   import com.qq.modules.battle.view.unit.UnitFactory;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.UrlManager;
   import flash.events.Event;
   import flash.geom.Point;
   import tencent.tools.planMachine.ICallBack;
   
   public class BulletFlyForBanana extends BattleBasePlan
   {
       
      
      private var m_bulletName:String;
      
      private var m_offsetX:int;
      
      private var m_offsetY:int;
      
      private var m_speed:int;
      
      private var m_bullet:UnitBase;
      
      private var m_tween:TweenLite;
      
      public function BulletFlyForBanana()
      {
         super();
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         super.setDynamicParams(param1);
         this.m_bulletName = param1[0];
         if(isRightSide)
         {
            this.m_offsetX = -param1[1];
         }
         else
         {
            this.m_offsetX = param1[1];
         }
         this.m_offsetY = param1[2];
         this.m_speed = param1[3];
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         super.doPlan(param1);
         this.m_bullet = this.createBullet();
         var _loc2_:UnitBase = BattleUnitModel.getInstance().getUnitByPosIndex(actor.actorIndex);
         var _loc3_:Point = _loc2_.getXY();
         this.m_bullet.setXY(_loc3_.x + this.m_offsetX,_loc3_.y + this.m_offsetY);
         var _loc4_:FightDamageVo = damageList[0];
         var _loc5_:Point = BattleConst.getCardXYByPosindex(_loc4_.targetIndex);
         _loc5_.y += this.m_offsetY;
         var _loc6_:Number = Point.distance(_loc3_,_loc5_) / this.m_speed;
         this.m_tween = TweenLite.to(this.m_bullet.display,_loc6_,{
            "x":_loc5_.x,
            "y":_loc5_.y,
            "ease":Linear.easeNone,
            "onComplete":this.onBulletFlyComplete
         });
         BattleUnitModel.getInstance().battleTimer.addTweenLite(this.m_tween);
      }
      
      private function onBulletFlyComplete() : void
      {
         if(this.m_bullet)
         {
            this.m_bullet.animation.gotoAndPlay("hit",1);
            this.m_bullet.animation.addEventListener(Event.COMPLETE,this.onHitComplete);
         }
      }
      
      private function onHitComplete(param1:Event) : void
      {
         var _loc2_:BattleEvent = null;
         if(this.m_bullet)
         {
            this.m_bullet.animation.removeEventListener(Event.COMPLETE,this.onHitComplete);
            _loc2_ = new BattleEvent(BattleConst.BATTLE_REMOVE_DISPLAY);
            _loc2_.display = this.m_bullet;
            CommandDispatcher.sendEvent(_loc2_);
            setComplete();
         }
      }
      
      override protected function dispose() : void
      {
         if(this.m_bullet)
         {
            this.m_bullet.dispose();
            this.m_bullet = null;
         }
         if(this.m_tween)
         {
            BattleUnitModel.getInstance().battleTimer.removeTweenLite(this.m_tween);
            this.m_tween.kill();
            this.m_tween = null;
         }
         super.dispose();
      }
      
      private function createBullet() : UnitBase
      {
         var _loc1_:UnitBase = UnitFactory.instance.createUnit();
         _loc1_.setAssetUrl(UrlManager.getUrl(UrlManager.Url_Battle_Bullet,this.m_bulletName + GameGloble.BONE_FILE_EXT_POINT));
         var _loc2_:BattleEvent = new BattleEvent(BattleConst.BATTLE_ADD_DISPLAY);
         _loc2_.display = _loc1_;
         CommandDispatcher.sendEvent(_loc2_);
         _loc1_.animation.gotoAndPlay("animation",0);
         return _loc1_;
      }
   }
}
