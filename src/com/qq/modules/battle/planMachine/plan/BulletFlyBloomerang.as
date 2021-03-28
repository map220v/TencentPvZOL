package com.qq.modules.battle.planMachine.plan
{
   import PVZ.Cmd.Dto_FightDamage;
   import com.greensock.TweenMax;
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
   import tencent.tools.planMachine.ICallBack;
   import tencent.tools.planMachine.IPlan;
   import tencent.tools.planMachine.ParallelPlan;
   
   public class BulletFlyBloomerang extends BattleBasePlan
   {
       
      
      private var bullet:UnitBase;
      
      private var bulletName:String;
      
      private var offsetX:Number;
      
      private var offsetY:Number;
      
      private var flySpeed:Number;
      
      private var backTime:Number = 1;
      
      private var tweenMaxList:Array;
      
      public function BulletFlyBloomerang()
      {
         this.tweenMaxList = [];
         super();
      }
      
      override protected function dispose() : void
      {
         var _loc2_:TweenMax = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.tweenMaxList.length)
         {
            _loc2_ = this.tweenMaxList[_loc1_];
            BattleUnitModel.getInstance().battleTimer.removeTweenLite(_loc2_);
            _loc2_.kill();
            _loc1_++;
         }
         this.tweenMaxList = null;
         if(this.bullet)
         {
            this.bullet.dispose();
            this.bullet = null;
         }
         super.dispose();
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         super.setDynamicParams(param1);
         this.bulletName = "bloomerang_projectile";
         this.offsetX = param1[0];
         if(isRightSide)
         {
            this.offsetX = -this.offsetX;
         }
         this.offsetY = param1[1];
         this.flySpeed = param1[2];
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         super.doPlan(param1);
         this.bullet = this.createBullet();
         var _loc2_:UnitBase = BattleUnitModel.getInstance().getUnitByPosIndex(actor.actorIndex);
         var _loc3_:Point = _loc2_.getXY();
         _loc3_.x += this.offsetX;
         _loc3_.y += this.offsetY;
         this.bullet.setXY(_loc3_.x,_loc3_.y);
         var _loc4_:IPlan;
         (_loc4_ = this.createEffect()).doPlan(this);
      }
      
      private function createEffect() : IPlan
      {
         var _loc10_:FightDamageVo = null;
         var _loc11_:Point = null;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:int = 0;
         var _loc1_:UnitBase = BattleUnitModel.getInstance().getUnitByPosIndex(actor.actorIndex);
         var _loc2_:Point = _loc1_.getXY();
         _loc2_.x += this.offsetX;
         _loc2_.y += this.offsetY;
         var _loc3_:Number = 0;
         var _loc4_:Array = [];
         var _loc5_:Array = [];
         var _loc6_:int = 0;
         while(_loc6_ < damageList.length)
         {
            _loc10_ = damageList[_loc6_];
            _loc11_ = BattleConst.getCardXYByPosindex(_loc10_.targetIndex);
            _loc11_.x += this.offsetX;
            _loc11_.y += this.offsetY;
            _loc13_ = (_loc12_ = Point.distance(_loc2_,_loc11_)) / this.flySpeed;
            _loc4_.push([_loc13_ - _loc3_,_loc11_.x,_loc11_.y]);
            _loc3_ = _loc13_;
            _loc6_++;
         }
         var _loc7_:Number = 0;
         var _loc8_:int = 0;
         while(_loc8_ < _loc4_.length)
         {
            _loc5_.push(this.attackEffect(_loc4_[_loc8_][0] + _loc7_,true,damageList[_loc8_]));
            this.tweenMaxList.push(TweenMax.to(this.bullet.display,_loc4_[_loc8_][0],{
               "delay":_loc7_,
               "x":_loc4_[_loc8_][1],
               "y":_loc4_[_loc8_][2],
               "ease":Linear.easeNone
            }));
            _loc7_ += _loc4_[_loc8_][0];
            _loc8_++;
         }
         if(damageList.length >= 1)
         {
            _loc5_.push(this.attackEffect(this.backTime * 2 + _loc7_,false,damageList[damageList.length - 1]));
            this.tweenMaxList.push(TweenMax.to(this.bullet.display,this.backTime,{
               "delay":_loc7_,
               "x":_loc4_[_loc4_.length - 1][1] + 30,
               "y":_loc4_[_loc4_.length - 1][2],
               "repeat":1,
               "yoyo":true
            }));
            _loc7_ += this.backTime * 2;
            _loc14_ = _loc4_.length - 1;
            while(_loc14_ > 0)
            {
               _loc5_.push(this.attackEffect(_loc4_[_loc14_][0] + _loc7_,false,damageList[_loc14_ - 1]));
               this.tweenMaxList.push(TweenMax.to(this.bullet.display,_loc4_[_loc14_][0],{
                  "delay":_loc7_,
                  "x":_loc4_[_loc14_ - 1][1],
                  "y":_loc4_[_loc14_ - 1][2],
                  "ease":Linear.easeNone
               }));
               _loc7_ += _loc4_[_loc14_][0];
               _loc14_--;
            }
            this.tweenMaxList.push(TweenMax.to(this.bullet.display,_loc4_[0][0],{
               "delay":_loc7_,
               "x":_loc2_.x,
               "y":_loc2_.y,
               "ease":Linear.easeNone
            }));
         }
         var _loc9_:int = 0;
         while(_loc9_ < this.tweenMaxList.length)
         {
            BattleUnitModel.getInstance().battleTimer.addTweenLite(this.tweenMaxList[_loc9_]);
            _loc9_++;
         }
         return new ParallelPlan(_loc5_);
      }
      
      private function attackEffect(param1:Number, param2:Boolean, param3:FightDamageVo) : IPlan
      {
         var _loc4_:BattleDelayPlan = null;
         var _loc5_:Array = [];
         var _loc6_:CostarAddEffect;
         (_loc6_ = new CostarAddEffect()).setStaticParams([actor,[param3],planGroup]);
         if(param2)
         {
            _loc6_.setDynamicParams(["1","bloomerang_projectile_hit",500,"animation",-10,30]);
         }
         else
         {
            _loc6_.setDynamicParams(["1","bloomerang_projectile_hit",500,"animation3",-10,30]);
         }
         if(param1 > 0)
         {
            _loc4_ = new BattleDelayPlan(_loc6_,param1 * 1000);
            _loc5_.push(_loc4_);
         }
         else
         {
            _loc5_.push(_loc6_);
         }
         var _loc7_:FightDamageVo = new FightDamageVo();
         var _loc8_:Dto_FightDamage = new Dto_FightDamage();
         _loc7_.setDamage(_loc8_);
         _loc7_.isDead = param3.isDead;
         _loc7_.targetIndex = param3.targetIndex;
         _loc7_.changeHp = param3.changeHp * 0.5;
         _loc7_.changeShield = param3.changeShield * 0.5;
         var _loc9_:InjuredPlanNomal;
         (_loc9_ = new InjuredPlanNomal()).setStaticParams([actor,[_loc7_],planGroup]);
         if(param2)
         {
            _loc9_.setDynamicParams(["1","0","0"]);
         }
         else
         {
            _loc9_.setDynamicParams(["1","0","1"]);
         }
         if(param1 > 0)
         {
            _loc4_ = new BattleDelayPlan(_loc9_,param1 * 1000);
            _loc5_.push(_loc4_);
         }
         else
         {
            _loc5_.push(_loc9_);
         }
         return new ParallelPlan(_loc5_);
      }
      
      override public function planCallBack() : void
      {
         var _loc1_:BattleEvent = new BattleEvent(BattleConst.BATTLE_REMOVE_DISPLAY);
         _loc1_.display = this.bullet;
         CommandDispatcher.sendEvent(_loc1_);
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
