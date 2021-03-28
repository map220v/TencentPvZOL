package com.qq.modules.battle.planMachine.plan
{
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
   
   public class BulletFlyForBananaSkill extends BattleBasePlan
   {
       
      
      private var m_bulletName:String;
      
      private var m_offsetX:int;
      
      private var m_offsetY:int;
      
      private var m_speed:int;
      
      private var m_bullet:UnitBase;
      
      private var m_vecBullet:Vector.<UnitBase>;
      
      private var m_vecTween:Vector.<TweenMax>;
      
      private var m_bulletCompleteCount:int = 0;
      
      public function BulletFlyForBananaSkill()
      {
         super();
      }
      
      override protected function dispose() : void
      {
         var _loc1_:UnitBase = null;
         var _loc2_:TweenMax = null;
         if(this.m_vecBullet)
         {
            for each(_loc1_ in this.m_vecBullet)
            {
               _loc1_.dispose();
            }
            this.m_vecBullet.length = 0;
            this.m_vecBullet = null;
         }
         if(this.m_vecTween)
         {
            for each(_loc2_ in this.m_vecTween)
            {
               BattleUnitModel.getInstance().battleTimer.removeTweenLite(_loc2_);
               _loc2_.kill();
            }
            this.m_vecTween.length = 0;
            this.m_vecTween = null;
         }
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
         var _loc7_:FightDamageVo = null;
         var _loc8_:Point = null;
         super.doPlan(param1);
         this.m_vecBullet = new Vector.<UnitBase>();
         var _loc2_:UnitBase = BattleUnitModel.getInstance().getUnitByPosIndex(actor.actorIndex);
         var _loc3_:Point = _loc2_.getXY();
         var _loc4_:UnitBase;
         (_loc4_ = this.createBullet()).setXY(_loc3_.x + this.m_offsetX,_loc3_.y + this.m_offsetY);
         this.m_vecBullet.push(_loc4_);
         var _loc5_:UnitBase = this.createBullet();
         this.m_vecBullet.push(_loc5_);
         _loc5_.setXY(_loc3_.x + this.m_offsetX,_loc3_.y + this.m_offsetY);
         var _loc6_:int = 0;
         this.m_bulletCompleteCount = 2;
         for each(_loc7_ in damageList)
         {
            _loc6_ = Math.max(_loc7_.targetIndex,_loc6_);
         }
         _loc8_ = BattleConst.getCardXYByPosindex(_loc6_);
         _loc8_.y += this.m_offsetY;
         if(isRightSide)
         {
            _loc8_.x -= 50;
         }
         else
         {
            _loc8_.x += 50;
         }
         var _loc9_:Number = Point.distance(_loc3_,_loc8_) / this.m_speed;
         this.m_vecTween = new Vector.<TweenMax>();
         var _loc10_:int = (_loc8_.x - _loc3_.x) / 2;
         var _loc11_:TweenMax = TweenMax.to(_loc4_.display,_loc9_,{
            "yoyo":true,
            "repeat":1,
            "bezier":[{
               "x":_loc3_.x + _loc10_,
               "y":_loc3_.y - 50
            },{
               "x":_loc8_.x,
               "y":_loc8_.y
            }],
            "ease":Linear.easeNone,
            "onComplete":this.onBulletFlyComplete,
            "onCompleteParams":[_loc4_]
         });
         this.m_vecTween.push(_loc11_);
         BattleUnitModel.getInstance().battleTimer.addTweenLite(_loc11_);
         var _loc12_:TweenMax = TweenMax.to(_loc5_.display,_loc9_,{
            "yoyo":true,
            "repeat":1,
            "bezier":[{
               "x":_loc3_.x + _loc10_,
               "y":_loc3_.y + 50
            },{
               "x":_loc8_.x,
               "y":_loc8_.y
            }],
            "ease":Linear.easeNone,
            "onComplete":this.onBulletFlyComplete,
            "onCompleteParams":[_loc5_]
         });
         this.m_vecTween.push(_loc12_);
         BattleUnitModel.getInstance().battleTimer.addTweenLite(_loc12_);
      }
      
      private function onBulletFlyComplete(param1:UnitBase) : void
      {
         this.m_bulletCompleteCount = this.m_bulletCompleteCount - 1;
         var _loc2_:BattleEvent = new BattleEvent(BattleConst.BATTLE_REMOVE_DISPLAY);
         _loc2_.display = param1;
         CommandDispatcher.sendEvent(_loc2_);
         if(this.m_bulletCompleteCount <= 0)
         {
            setComplete();
         }
      }
      
      private function createBullet() : UnitBase
      {
         var _loc1_:UnitBase = UnitFactory.instance.createUnit();
         _loc1_.setAssetUrl(UrlManager.getUrl(UrlManager.Url_Battle_Bullet,this.m_bulletName + GameGloble.BONE_FILE_EXT_POINT));
         _loc1_.animation.gotoAndPlay("animation",0);
         var _loc2_:BattleEvent = new BattleEvent(BattleConst.BATTLE_ADD_DISPLAY);
         _loc2_.display = _loc1_;
         CommandDispatcher.sendEvent(_loc2_);
         return _loc1_;
      }
   }
}
