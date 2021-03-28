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
   import flash.geom.Point;
   import flash.utils.Timer;
   import tencent.tools.planMachine.ICallBack;
   import tencent.tools.planMachine.ParallelPlan;
   
   public class LineAttackPlan extends BattleBasePlan
   {
       
      
      private var _resName:String;
      
      private var _speed:Number;
      
      private var _offX:Number;
      
      private var _offY:Number;
      
      private var _effectName:String;
      
      private var _isBack:Boolean;
      
      private var _bullet:UnitBase;
      
      private var _timer:Timer;
      
      private var _fromPos:Point;
      
      private var _toPos:Point;
      
      private var _tween:TweenLite;
      
      private var _bulletPos:Point;
      
      private var _planList:Array;
      
      public function LineAttackPlan()
      {
         super();
      }
      
      override protected function dispose() : void
      {
         super.dispose();
         if(this._bullet)
         {
            this._bullet.dispose();
            this._bullet = null;
         }
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
         this._resName = param1[0];
         this._speed = param1[1];
         this._offX = param1[2];
         this._offY = param1[3];
         this._effectName = param1[4];
         this._isBack = param1[5] == 1;
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         super.doPlan(param1);
         this.initPos();
         this.createBullet();
         this._bullet.setXY(this._fromPos.x,this._fromPos.y);
         var _loc2_:Number = Point.distance(this._fromPos,this._toPos) / this._speed;
         this._tween = TweenLite.to(this._bullet.display,_loc2_,{
            "x":this._toPos.x,
            "y":this._toPos.y,
            "ease":Linear.easeNone
         });
         BattleUnitModel.getInstance().battleTimer.addTweenLite(this._tween);
         this._planList = new Array();
         var _loc3_:ParallelPlan = this.creatEffectAndCostar();
         _loc3_.doPlan(this);
      }
      
      private function initPos() : void
      {
         if(!this._isBack)
         {
            this._fromPos = UnitBase(BattleUnitModel.getInstance().getUnitByPosIndex(actor.actorIndex)).getAnimationXY();
            this._toPos = BattleConst.getAnimaXYByGridXY(this.maxTargetIndex);
            if(isRightSide)
            {
               this._offX = -this._offX;
            }
            this._toPos.x += this._offX;
            this._toPos.y += this._offY;
            this._fromPos.y = this._toPos.y;
         }
         else
         {
            this._fromPos = BattleConst.getAnimaXYByGridXY(this.maxTargetIndex);
            this._toPos = UnitBase(BattleUnitModel.getInstance().getUnitByPosIndex(actor.actorIndex)).getAnimationXY();
            this._toPos.y = this._fromPos.y;
         }
      }
      
      private function get maxTargetIndex() : uint
      {
         var _loc2_:FightDamageVo = null;
         var _loc1_:uint = 0;
         for each(_loc2_ in damageList)
         {
            if(_loc2_.targetIndex > _loc1_)
            {
               _loc1_ = _loc2_.targetIndex;
            }
         }
         return _loc1_;
      }
      
      private function creatEffectAndCostar() : ParallelPlan
      {
         var _loc1_:BattleBasePlan = null;
         var _loc2_:Number = NaN;
         var _loc3_:FightDamageVo = null;
         var _loc4_:InjuredPlanNomal = null;
         for each(_loc3_ in damageList)
         {
            _loc2_ = Point.distance(BattleConst.getAnimaXYByGridXY(_loc3_.targetIndex),UnitBase(BattleUnitModel.getInstance().getUnitByPosIndex(actor.actorIndex)).getAnimationXY()) / this._speed * 1000;
            if(this._effectName != "")
            {
               _loc1_ = new CostarAddEffect();
               _loc1_.setStaticParams([actor,[_loc3_],planGroup]);
               _loc1_.setDynamicParams(["1",this._effectName,500,"animation",0,0]);
               _loc1_ = new BattleDelayPlan(_loc1_,_loc2_);
               this._planList.push(_loc1_);
            }
            (_loc4_ = new InjuredPlanNomal()).setStaticParams([actor,[_loc3_],planGroup]);
            _loc4_.setDynamicParams(["1","0","1"]);
            _loc1_ = new BattleDelayPlan(_loc4_,_loc2_);
            this._planList.push(_loc1_);
         }
         return new ParallelPlan(this._planList);
      }
      
      private function createBullet() : UnitBase
      {
         this._bullet = UnitFactory.instance.createUnit();
         this._bullet.setAssetUrl(UrlManager.getUrl(UrlManager.Url_Battle_Bullet,this._resName + "." + GameGloble.BONE_FILE_EXT),0,"idle",false,false);
         var _loc1_:BattleEvent = new BattleEvent(BattleConst.BATTLE_ADD_DISPLAY);
         _loc1_.display = this._bullet;
         CommandDispatcher.sendEvent(_loc1_);
         return this._bullet;
      }
   }
}
