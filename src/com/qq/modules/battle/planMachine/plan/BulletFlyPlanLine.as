package com.qq.modules.battle.planMachine.plan
{
   import asgui.events.FrameEvent;
   import com.greensock.TweenLite;
   import com.greensock.easing.Linear;
   import com.qq.GameGloble;
   import com.qq.modules.battle.constant.BattleConst;
   import com.qq.modules.battle.constant.BattleEvent;
   import com.qq.modules.battle.model.BattleUnitModel;
   import com.qq.modules.battle.model.vo.FightDamageVo;
   import com.qq.modules.battle.planMachine.core.PlanGroupEvent;
   import com.qq.modules.battle.view.unit.UnitBase;
   import com.qq.modules.battle.view.unit.UnitFactory;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.UrlManager;
   import flash.events.Event;
   import flash.geom.Point;
   import tencent.tools.planMachine.ICallBack;
   
   public class BulletFlyPlanLine extends BattleBasePlan
   {
       
      
      private var bullet:UnitBase;
      
      private var bulletName:String;
      
      private var offsetX:Number;
      
      private var offsetY:Number;
      
      private var flySpeed:Number;
      
      private var tween:TweenLite;
      
      private var isWaitHit:Boolean;
      
      private var hitFrameName:String;
      
      private var _anmiTotalFrame:int;
      
      public function BulletFlyPlanLine()
      {
         super();
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         super.setDynamicParams(param1);
         this.bulletName = param1[0];
         this.offsetX = param1[1];
         if(isRightSide)
         {
            this.offsetX = -this.offsetX;
         }
         this.offsetY = param1[2];
         this.flySpeed = param1[3];
         if(param1.length >= 5)
         {
            this.isWaitHit = param1[4] == 1;
         }
         else
         {
            this.isWaitHit = false;
         }
         if(param1.length >= 6)
         {
            this.hitFrameName = param1[5];
         }
         else
         {
            this.hitFrameName = null;
         }
      }
      
      override protected function dispose() : void
      {
         if(this.bullet)
         {
            this.bullet.dispose();
            this.bullet = null;
         }
         if(this.tween)
         {
            BattleUnitModel.getInstance().battleTimer.removeTweenLite(this.tween);
            this.tween.kill();
            this.tween = null;
         }
         super.dispose();
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         var _loc5_:Point = null;
         var _loc7_:int = 0;
         super.doPlan(param1);
         this.bullet = this.createBullet();
         var _loc2_:UnitBase = BattleUnitModel.getInstance().getUnitByPosIndex(actor.actorIndex);
         var _loc3_:Point = _loc2_.getXY();
         var _loc4_:FightDamageVo = damageList[0];
         if(this.bulletName == "bullet_thunderPine_projectile")
         {
            _loc5_ = BattleConst.getCardXYByPosindex(this.actor.targetIndex);
         }
         else
         {
            _loc5_ = BattleConst.getCardXYByPosindex(_loc4_.targetIndex);
         }
         _loc5_.y += this.offsetY;
         var _loc6_:Number = Point.distance(_loc3_,_loc5_) / this.flySpeed;
         if(isRightSide)
         {
            this.bullet.mirror();
            _loc7_ = _loc3_.x - this.offsetX;
         }
         else
         {
            _loc7_ = _loc3_.x + this.offsetX;
         }
         this.bullet.setXY(_loc7_,_loc3_.y + this.offsetY);
         this.tween = TweenLite.to(this.bullet.display,_loc6_,{
            "x":_loc5_.x,
            "y":_loc5_.y,
            "ease":Linear.easeNone,
            "onComplete":this.moveCompleteHandler
         });
         var _loc8_:Array;
         if((_loc8_ = this.bullet.animation.getAllLabelName()).length > 0)
         {
            this.bullet.animation.gotoAndPlay(_loc8_[0],1);
         }
         BattleUnitModel.getInstance().battleTimer.addTweenLite(this.tween);
      }
      
      private function moveCompleteHandler() : void
      {
         var _loc1_:PlanGroupEvent = new PlanGroupEvent(PlanGroupEvent.BULLET_HITED);
         _loc1_.eventData = this.bulletName;
         planGroup.dispatchEvent(_loc1_);
         switch(this.bulletName)
         {
            case "pea_projectile":
            case "pea_projectile_ice":
            case "bullet_clivia":
            case "pea_projectile_fire":
            case "bullet_magic_muashroom_attack":
            case "bullet_magic_mushroom_skill":
            case "bullet_lemon_small":
            case "bullet_lemon_big":
            case "bullet_guide_the_ji_spec":
            case "bullet_guide_the_ji":
            case "bullet_pepperpult":
            case "bullet_pepperpult_spec":
               this.isWaitHit = true;
         }
         if(this.isWaitHit)
         {
            this.bullet.animation.gotoAndPlay("animation1",1);
            this._anmiTotalFrame = this.bullet.animation.totalFrames;
            if(this.hitFrameName != null)
            {
               this.bullet.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.FrameEventHandler);
            }
            else
            {
               this.bullet.animation.addEventListener(Event.COMPLETE,this.injuredHandler);
            }
         }
         else
         {
            this.injuredHandler(null);
         }
      }
      
      protected function FrameEventHandler(param1:FrameEvent) : void
      {
         if(param1.frameLabel == this.hitFrameName || this.bullet.animation.currentFrame >= this._anmiTotalFrame)
         {
            this.injuredHandler(null);
         }
      }
      
      protected function injuredHandler(param1:Event) : void
      {
         this.bullet.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.FrameEventHandler);
         this.bullet.animation.removeEventListener(Event.COMPLETE,this.injuredHandler);
         var _loc2_:BattleEvent = new BattleEvent(BattleConst.BATTLE_REMOVE_DISPLAY);
         _loc2_.display = this.bullet;
         CommandDispatcher.sendEvent(_loc2_);
         setComplete();
      }
      
      override protected function getMoveToXY(param1:int) : Point
      {
         var _loc2_:int = 0;
         var _loc3_:Point = null;
         if(param1 % 2 == 0)
         {
            _loc2_ = param1 - 1;
            _loc3_ = BattleConst.getCardXYByPosindex(_loc2_);
            _loc3_.x = BattleConst.GRID_WIDTH * 3;
         }
         else
         {
            _loc2_ = param1 + 1;
            _loc3_ = BattleConst.getCardXYByPosindex(_loc2_);
            _loc3_.x = BattleConst.GRID_WIDTH * (BattleConst.GRID_WIDTH_NUM - 4);
         }
         return _loc3_;
      }
      
      private function createBullet() : UnitBase
      {
         this.bullet = UnitFactory.instance.createUnit();
         this.bullet.setAssetUrl(UrlManager.getUrl(UrlManager.Url_Battle_Bullet,this.bulletName + "." + GameGloble.BONE_FILE_EXT));
         var _loc1_:BattleEvent = new BattleEvent(BattleConst.BATTLE_ADD_DISPLAY);
         _loc1_.display = this.bullet;
         CommandDispatcher.sendEvent(_loc1_);
         return this.bullet;
      }
   }
}
