package com.qq.modules.battle.planMachine.plan
{
   import com.qq.GameGloble;
   import com.qq.modules.battle.constant.BattleConst;
   import com.qq.modules.battle.constant.BattleEvent;
   import com.qq.modules.battle.model.BattleUnitModel;
   import com.qq.modules.battle.model.vo.FightDamageVo;
   import com.qq.modules.battle.view.unit.UnitBase;
   import com.qq.modules.battle.view.unit.UnitFactory;
   import com.qq.utils.Bezier;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.UrlManager;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   import tencent.tools.planMachine.ICallBack;
   import tencent.tools.planMachine.ParallelPlan;
   
   public class BulletBaseArrow extends BattleBasePlan
   {
       
      
      private var bullet:UnitBase;
      
      private var bulletEffect:UnitBase;
      
      private var bulletName:String;
      
      private var bulletEffectName:String;
      
      private var bulletHitEffectName:String;
      
      private var offsetX:Number;
      
      private var offsetY:Number;
      
      private var toP:Point;
      
      private var fromP:Point;
      
      private var _bezier:Bezier;
      
      private var _crtStep:int;
      
      private var _step:int;
      
      private var _count:int;
      
      private var _timer:Timer;
      
      public function BulletBaseArrow()
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
         if(this.bulletEffect)
         {
            this.bulletEffect.dispose();
            this.bulletEffect = null;
         }
         if(this._timer)
         {
            BattleUnitModel.getInstance().battleTimer.removeTimer(this._timer);
            this._timer.stop();
            this._timer.removeEventListener(TimerEvent.TIMER,this.updateBulletPos);
            this._timer = null;
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
         this.bulletEffectName = param1[3];
         this.bulletHitEffectName = param1[4];
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         super.doPlan(param1);
         this.initTimer();
         this.bullet = this.createBullet();
         var _loc2_:UnitBase = BattleUnitModel.getInstance().getUnitByPosIndex(actor.actorIndex);
         this.fromP = _loc2_.getAnimationXY();
         this.fromP.x += this.offsetX;
         this.fromP.y += this.offsetY;
         this.bullet.setXY(this.fromP.x,this.fromP.y);
         if(this.bulletEffect)
         {
            this.bulletEffect.setXY(this.fromP.x,this.fromP.y);
         }
         var _loc3_:FightDamageVo = damageList[0];
         this.toP = BattleConst.getAnimaXYByGridXY(_loc3_.targetIndex);
         this.toP.y -= 60;
         var _loc4_:int = this.fromP.x + (this.toP.x - this.fromP.x) * 0.7;
         var _loc5_:int = this.fromP.y - 150;
         var _loc6_:Point = new Point(_loc4_,_loc5_);
         var _loc7_:int = 20;
         this._bezier = new Bezier();
         this._bezier.init(this.fromP,_loc6_,this.toP,_loc7_);
         this._crtStep = 0;
         this._step = 1;
         this._count = 0;
      }
      
      protected function initTimer() : void
      {
         this._timer = new Timer(33);
         this._timer.addEventListener(TimerEvent.TIMER,this.updateBulletPos);
         this._timer.start();
         BattleUnitModel.getInstance().battleTimer.addTimer(this._timer);
      }
      
      protected function updateBulletPos(param1:TimerEvent) : void
      {
         var _loc3_:Array = null;
         var _loc4_:CostarAddEffect = null;
         var _loc5_:InjuredPlanNomal = null;
         var _loc6_:ParallelPlan = null;
         var _loc7_:InjuredPlanNomal = null;
         var _loc2_:Array = this._bezier.getAnchorPoint(this._crtStep);
         if(_loc2_.length > 0)
         {
            this.bullet.setRotation(_loc2_[2]);
            this.bullet.setXY(_loc2_[0],_loc2_[1]);
            if(this.bulletEffect)
            {
               this.bulletEffect.setXY(_loc2_[0],_loc2_[1]);
            }
            if(_loc2_[2] > 0 && _loc2_[2] <= 180)
            {
               ++this._count;
               if(this._count > 15)
               {
                  this._count = 0;
                  ++this._step;
               }
            }
            this._crtStep += this._step;
         }
         else if(this.bulletHitEffectName && this.bulletHitEffectName != "")
         {
            if(this._timer)
            {
               this._timer.stop();
            }
            _loc3_ = new Array();
            (_loc4_ = new CostarAddEffect()).setStaticParams([actor,[damageList[0]],planGroup]);
            _loc4_.setDynamicParams([1,this.bulletHitEffectName,0,"idle",0,0]);
            _loc3_.push(_loc4_);
            if(this.bullet)
            {
               this.bullet.dispose();
               this.bullet = null;
            }
            (_loc5_ = new InjuredPlanNomal()).setStaticParams([actor,[damageList[0]],planGroup]);
            _loc5_.setDynamicParams([1,100]);
            _loc5_.isDebug = isDebug;
            _loc3_.push(_loc5_);
            (_loc6_ = new ParallelPlan(_loc3_)).doPlan(this);
         }
         else
         {
            (_loc7_ = new InjuredPlanNomal()).setStaticParams([actor,[damageList[0]],planGroup]);
            _loc7_.setDynamicParams([1,100]);
            _loc7_.isDebug = isDebug;
            _loc7_.doPlan(this);
            setComplete();
         }
      }
      
      private function createBullet() : UnitBase
      {
         this.bullet = UnitFactory.instance.createUnit();
         this.bullet.setAssetUrl(UrlManager.getUrl(UrlManager.Url_Battle_Bullet,this.bulletName + "." + GameGloble.BONE_FILE_EXT),0,"idle",false,false);
         var _loc1_:BattleEvent = new BattleEvent(BattleConst.BATTLE_ADD_DISPLAY);
         _loc1_.display = this.bullet;
         CommandDispatcher.sendEvent(_loc1_);
         if(this.bulletEffectName && this.bulletEffectName != "")
         {
            this.bulletEffect = UnitFactory.instance.createUnit();
            this.bulletEffect.setAssetUrl(UrlManager.getUrl(UrlManager.Url_Battle_Effect,this.bulletEffectName + "." + GameGloble.BONE_FILE_EXT),0,"idle",false,false);
            _loc1_ = new BattleEvent(BattleConst.BATTLE_ADD_DISPLAY);
            _loc1_.display = this.bulletEffect;
            CommandDispatcher.sendEvent(_loc1_);
         }
         return this.bullet;
      }
   }
}
