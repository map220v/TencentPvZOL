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
   import com.qq.utils.GeomUtils;
   import com.qq.utils.UrlManager;
   import flash.events.Event;
   import flash.geom.Point;
   import tencent.tools.planMachine.ICallBack;
   
   public class ElectricAtkPlan extends BattleBasePlan
   {
       
      
      protected var electircEft:UnitBase;
      
      protected var effectName:String;
      
      protected var linkWidth:int;
      
      protected var offsetX:Number;
      
      protected var offsetY:Number;
      
      protected var upNode:int;
      
      public function ElectricAtkPlan()
      {
         super();
      }
      
      override protected function dispose() : void
      {
         super.dispose();
         if(this.electircEft)
         {
            this.electircEft.animation.addEventListener(Event.COMPLETE,this.onComplete);
            this.electircEft = null;
         }
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         super.setDynamicParams(param1);
         this.effectName = param1[0];
         this.linkWidth = param1[1];
         this.offsetX = param1[2];
         this.offsetY = param1[3];
         this.upNode = param1[4];
      }
      
      override public function doPlan(param1:ICallBack) : void
      {
         var _loc2_:UnitBase = null;
         var _loc3_:Point = null;
         super.doPlan(param1);
         this.createElectric();
         if(this.upNode == 0)
         {
            this.upNode = actor.actorIndex;
            _loc2_ = BattleUnitModel.getInstance().getUnitByPosIndex(this.upNode);
            _loc3_ = _loc2_.getAnimationXY();
         }
         else
         {
            _loc2_ = BattleUnitModel.getInstance().getUnitByPosIndex(this.upNode);
            _loc3_ = _loc2_.getAnimationXY();
            this.offsetY = -_loc2_.animation.asset.height / 2;
         }
         _loc3_.x += this.offsetX;
         _loc3_.y += this.offsetY;
         var _loc4_:FightDamageVo = damageList[0];
         var _loc5_:UnitBase;
         var _loc6_:Point = (_loc5_ = BattleUnitModel.getInstance().getUnitByPosIndex(_loc4_.targetIndex)).getAnimationXY();
         _loc6_.y -= _loc5_.animation.asset.height / 2;
         this.electircEft.setXY(_loc3_.x,_loc3_.y);
         this.electircEft.setRotation(GeomUtils.getPointDegrees(_loc3_,_loc6_));
         this.electircEft.setScaleForAnimat(GeomUtils.pointDistance(_loc3_,_loc6_) / this.linkWidth,1);
         this.electircEft.animation.addEventListener(Event.COMPLETE,this.onComplete);
      }
      
      private function onComplete(param1:Event) : void
      {
         setComplete();
      }
      
      private function createElectric() : void
      {
         this.electircEft = UnitFactory.instance.createUnit();
         this.electircEft.setAssetUrl(UrlManager.getUrl(UrlManager.Url_Battle_Effect,this.effectName + "." + GameGloble.BONE_FILE_EXT),0,"animation",false,false);
         this.electircEft.animation.gotoAndPlay("animation",1);
         var _loc1_:BattleEvent = new BattleEvent(BattleConst.BATTLE_ADD_DISPLAY);
         _loc1_.display = this.electircEft;
         CommandDispatcher.sendEvent(_loc1_);
      }
   }
}
