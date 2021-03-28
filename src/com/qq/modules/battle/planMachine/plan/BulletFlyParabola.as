package com.qq.modules.battle.planMachine.plan
{
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
   import flash.utils.getTimer;
   import tencent.tools.planMachine.ICallBack;
   
   public class BulletFlyParabola extends BattleBasePlan
   {
       
      
      private var bullet:UnitBase;
      
      private var bulletName:String;
      
      private var offsetX:Number;
      
      private var offsetY:Number;
      
      private var flyTime:Number;
      
      private var h:Number = 1;
      
      private var currFrame:int;
      
      private var totalFrame:int;
      
      private var ydiff:Number;
      
      private var xdiff:Number;
      
      private var toP:Point;
      
      private var fromP:Point;
      
      private var cacheTime:Number;
      
      public function BulletFlyParabola()
      {
         super();
      }
      
      override protected function dispose() : void
      {
         if(this.bullet)
         {
            this.bullet.animation.removeEventListener(Event.COMPLETE,this.playCompleteHandler);
            this.bullet.display.removeEventListener(Event.ENTER_FRAME,this.enterFrameHandler);
            this.bullet.dispose();
            this.bullet = null;
         }
         super.dispose();
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
         this.flyTime = param1[3];
         this.h = param1[4];
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         super.doPlan(param1);
         this.bullet = this.createBullet();
         var _loc2_:UnitBase = BattleUnitModel.getInstance().getUnitByPosIndex(actor.actorIndex);
         this.fromP = _loc2_.getXY();
         this.fromP.x += this.offsetX;
         this.fromP.y += this.offsetY;
         this.bullet.setXY(this.fromP.x,this.fromP.y);
         var _loc3_:FightDamageVo = damageList[0];
         var _loc4_:UnitBase = BattleUnitModel.getInstance().getUnitByPosIndex(_loc3_.targetIndex);
         this.toP = BattleConst.getCardXYByPosindex(_loc3_.targetIndex);
         this.toP.y -= _loc4_.animation.asset.height * 0.7;
         this.updateFlyTime(this.flyTime);
         this.bullet.display.addEventListener(Event.ENTER_FRAME,this.enterFrameHandler);
      }
      
      public function updateFlyTime(param1:Number) : void
      {
         this.fromP = this.bullet.getXY();
         this.totalFrame = param1 / 1000 * GameGloble.stage.frameRate;
         this.xdiff = (this.toP.x - this.fromP.x) / this.totalFrame;
         this.ydiff = (this.toP.y - this.fromP.y - this.h * (this.totalFrame * (this.totalFrame + 1) / 2)) / this.totalFrame;
         this.currFrame = 0;
         this.cacheTime = getTimer();
      }
      
      protected function enterFrameHandler(param1:Event) : void
      {
         var _loc2_:Number = getTimer() - this.cacheTime;
         var _loc3_:int = Math.ceil(_loc2_ / 1000 * GameGloble.stage.frameRate);
         this.cacheTime = getTimer();
         this.bullet.animation.asset.rotation -= 45;
         this.bullet.setXY(this.fromP.x + this.currFrame * this.xdiff,this.fromP.y + this.currFrame * this.ydiff + this.h * (this.currFrame * (this.currFrame + 1) / 2));
         this.currFrame += _loc3_;
         if(this.currFrame >= this.totalFrame)
         {
            this.bullet.display.removeEventListener(Event.ENTER_FRAME,this.enterFrameHandler);
            this.bullet.animation.addEventListener(Event.COMPLETE,this.playCompleteHandler);
            this.bullet.animation.gotoAndPlay("animation1",1);
         }
      }
      
      protected function playCompleteHandler(param1:Event) : void
      {
         this.bullet.animation.removeEventListener(Event.COMPLETE,this.playCompleteHandler);
         setComplete();
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
