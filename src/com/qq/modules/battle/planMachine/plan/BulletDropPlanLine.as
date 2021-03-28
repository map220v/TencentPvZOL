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
   import tencent.tools.planMachine.ParallelPlan;
   
   public class BulletDropPlanLine extends BattleBasePlan
   {
       
      
      private var bullet:UnitBase;
      
      protected var bulletName:String;
      
      protected var bulletEffectName:String;
      
      protected var isCompletePlayBulletAnmi:Boolean;
      
      private var tween:TweenLite;
      
      public function BulletDropPlanLine()
      {
         super();
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         super.setDynamicParams(param1);
         this.bulletName = param1[0];
         this.bulletEffectName = param1[1];
         this.isCompletePlayBulletAnmi = int(param1[2]) == 1;
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
         var _loc2_:Point = null;
         var _loc4_:int = 0;
         var _loc5_:FightDamageVo = null;
         super.doPlan(param1);
         this.bullet = this.createBullet();
         if(damageList.length == 0)
         {
            _loc4_ = !!BattleConst.isLeft(actor.actorIndex) ? 10 : 9;
            _loc2_ = BattleConst.getCardXYByPosindex(_loc4_);
         }
         else
         {
            _loc5_ = damageList[0];
            _loc2_ = BattleConst.getCardXYByPosindex(_loc5_.targetIndex);
         }
         this.bullet.setXY(_loc2_.x,_loc2_.y - 550);
         this.tween = TweenLite.to(this.bullet.display,0.5,{
            "x":_loc2_.x,
            "y":_loc2_.y,
            "ease":Linear.easeOut,
            "onComplete":this.moveCompleteHandler
         });
         var _loc3_:Array = this.bullet.animation.getAllLabelName();
         if(_loc3_.length > 0)
         {
            this.bullet.animation.gotoAndPlay(_loc3_[0],1);
         }
         BattleUnitModel.getInstance().battleTimer.addTweenLite(this.tween);
      }
      
      private function moveCompleteHandler() : void
      {
         var _loc1_:PlanGroupEvent = new PlanGroupEvent(PlanGroupEvent.BULLET_HITED);
         _loc1_.eventData = this.bulletName;
         planGroup.dispatchEvent(_loc1_);
         if(this.isCompletePlayBulletAnmi)
         {
            this.bullet.animation.addEventListener(Event.COMPLETE,this.injuredHandler);
         }
         else
         {
            this.injuredHandler(null);
         }
      }
      
      protected function injuredHandler(param1:Event) : void
      {
         var _loc2_:Array = null;
         var _loc3_:CostarAddEffect = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:ParallelPlan = null;
         var _loc7_:InjuredPlanNomal = null;
         var _loc8_:InjuredPlanNomal = null;
         this.bullet.animation.removeEventListener(Event.COMPLETE,this.injuredHandler);
         if(this.bulletEffectName && this.bulletEffectName != "")
         {
            _loc2_ = new Array();
            _loc3_ = new CostarAddEffect();
            _loc3_.setStaticParams([actor,[damageList[0]],planGroup]);
            _loc3_.setDynamicParams([0,this.bulletEffectName,300,"coconut_explosion",0,0]);
            _loc2_.push(_loc3_);
            if(this.bullet)
            {
               this.bullet.dispose();
               this.bullet = null;
            }
            _loc4_ = damageList.length;
            _loc5_ = 0;
            while(_loc5_ < _loc4_)
            {
               (_loc7_ = new InjuredPlanNomal()).setStaticParams([actor,[damageList[_loc5_]],planGroup]);
               _loc7_.setDynamicParams([1,100]);
               _loc7_.isDebug = isDebug;
               _loc2_.push(_loc7_);
               _loc5_++;
            }
            (_loc6_ = new ParallelPlan(_loc2_)).doPlan(this);
         }
         else
         {
            (_loc8_ = new InjuredPlanNomal()).setStaticParams([actor,[damageList[0]],planGroup]);
            _loc8_.setDynamicParams([1,100]);
            _loc8_.isDebug = isDebug;
            _loc8_.doPlan(this);
            setComplete();
         }
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
