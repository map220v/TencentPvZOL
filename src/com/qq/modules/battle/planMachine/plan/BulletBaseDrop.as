package com.qq.modules.battle.planMachine.plan
{
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
   
   public class BulletBaseDrop extends BattleBasePlan
   {
       
      
      private var bullet:UnitBase;
      
      private var bulletName:String;
      
      private var flyTime:Number;
      
      private var toP:Point;
      
      private var fromP:Point;
      
      private var tween:TweenLite;
      
      public function BulletBaseDrop()
      {
         super();
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
      
      override public function setDynamicParams(param1:Array) : void
      {
         super.setDynamicParams(param1);
         this.bulletName = param1[0];
         this.flyTime = param1[1];
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         super.doPlan(param1);
         this.bullet = this.createBullet();
         var _loc2_:FightDamageVo = damageList[0];
         this.toP = BattleConst.getAnimaXYByGridXY(_loc2_.targetIndex);
         var _loc3_:UnitBase = BattleUnitModel.getInstance().getUnitByPosIndex(actor.actorIndex);
         this.fromP = this.toP.clone();
         this.fromP.y = _loc3_.display.globalToLocal(new Point()).y;
         this.bullet.setXY(this.fromP.x,this.fromP.y);
         this.tween = TweenLite.to(this.bullet.display,this.flyTime / 1000,{
            "x":this.toP.x,
            "y":this.toP.y,
            "ease":Linear.easeNone,
            "onComplete":this.moveCompleteHandler
         });
         BattleUnitModel.getInstance().battleTimer.addTweenLite(this.tween);
      }
      
      private function moveCompleteHandler() : void
      {
         var _loc1_:PlanGroupEvent = new PlanGroupEvent(PlanGroupEvent.BULLET_HITED);
         _loc1_.eventData = this.bulletName;
         planGroup.dispatchEvent(_loc1_);
         this.bullet.animation.gotoAndPlay("explosion",1);
         this.bullet.animation.addEventListener(Event.COMPLETE,this.injuredHandler);
      }
      
      private function injuredHandler(param1:Event) : void
      {
         setComplete();
      }
      
      private function createBullet() : UnitBase
      {
         this.bullet = UnitFactory.instance.createUnit();
         this.bullet.setAssetUrl(UrlManager.getUrl(UrlManager.Url_Battle_Bullet,this.bulletName + "." + GameGloble.BONE_FILE_EXT),0,"idle",false,false);
         var _loc1_:BattleEvent = new BattleEvent(BattleConst.BATTLE_ADD_DISPLAY);
         _loc1_.display = this.bullet;
         CommandDispatcher.sendEvent(_loc1_);
         return this.bullet;
      }
   }
}
