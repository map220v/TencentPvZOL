package com.qq.modules.td.logic.action.plant.dandelion
{
   import asgui.events.FrameEvent;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.action.plant.basic.PlantSpecialSkillAction;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.numeric.TDDamageCaculete;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class DandelionSpecialSkillAction extends PlantSpecialSkillAction
   {
       
      
      public var _lastAttackTime:Number;
      
      private var _isAttacking:Boolean;
      
      private var _checkArea:Rectangle;
      
      public function DandelionSpecialSkillAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         var _loc2_:TDMapTileData = null;
         super.enterState(param1);
         if(this._checkArea == null)
         {
            this._checkArea = new Rectangle();
            _loc2_ = TDGameInfo.getInstance().getRoadTileByIndex(_gameObject.objectModel.tileIndex);
            if(_loc2_ != null)
            {
               this._checkArea.x = _loc2_.rect.left - _loc2_.rect.width;
               this._checkArea.y = _loc2_.rect.top - _loc2_.rect.height;
               this._checkArea.width = _loc2_.rect.width * 5;
               this._checkArea.height = _loc2_.rect.height * 5;
            }
         }
         this._lastAttackTime = TDGameInfo.getInstance().getCurGameTime();
         _gameObject.animation.gotoAndPlay("skill_on",1);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinishSkillOn);
         _gameObject.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onAttackEvent);
      }
      
      private function onFinishSkillOn(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinishSkillOn);
         _gameObject.animation.gotoAndPlay("skill",1);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinishSkill);
      }
      
      private function onFinishSkill(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinishSkill);
         _gameObject.animation.gotoAndPlay("skill_off",1);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinishSkillOff);
      }
      
      private function onFinishSkillOff(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinishSkillOff);
         finishSpecialSkill();
      }
      
      private function onAttackEvent(param1:FrameEvent) : void
      {
         if(param1.frameLabel == "startAttack")
         {
            this._isAttacking = true;
         }
         if(param1.frameLabel == "endAttack")
         {
            this._isAttacking = false;
         }
      }
      
      override public function runningState() : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc6_:IGameObject = null;
         super.runningState();
         if(!this._isAttacking)
         {
            return;
         }
         var _loc1_:Number = TDGameInfo.getInstance().getCurGameTime();
         if(_loc1_ - this._lastAttackTime <= 33)
         {
            return;
         }
         this._lastAttackTime = _loc1_;
         var _loc2_:Array = new Array();
         var _loc5_:Array;
         _loc4_ = (_loc5_ = TDSearchTargetUtils.getZombieList(_plant)).length;
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc6_ = _loc5_[_loc3_];
            if(this._checkArea.contains(_loc6_.x,_loc6_.y))
            {
               TDDamageCaculete.caculatePlantAttckDamage(_plant,_loc6_,0,true);
            }
            _loc3_++;
         }
      }
   }
}
