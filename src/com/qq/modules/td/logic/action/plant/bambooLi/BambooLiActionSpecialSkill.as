package com.qq.modules.td.logic.action.plant.bambooLi
{
   import asgui.events.FrameEvent;
   import com.qq.modules.td.command.effects.TDEffectCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.action.plant.basic.PlantSpecialSkillAction;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.numeric.TDDamageCaculete;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class BambooLiActionSpecialSkill extends PlantSpecialSkillAction
   {
       
      
      private var _isAttacking:Boolean;
      
      private var _isAttackLeft:Boolean;
      
      public var _lastAttackTime:Number;
      
      public function BambooLiActionSpecialSkill()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         this._isAttacking = false;
         this._isAttackLeft = false;
         this._lastAttackTime = TDGameInfo.getInstance().getCurGameTime();
         _gameObject.animation.gotoAndPlay("skill_on",1);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinishSkillOn);
         _gameObject.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onAttackEvent);
      }
      
      private function onAttackEvent(param1:FrameEvent) : void
      {
         if(param1.frameLabel == "playSound")
         {
            TDSoundCmd.bambooLiSpecialAttack();
         }
         else if(param1.frameLabel == "startHitRight")
         {
            this._isAttacking = true;
            this._isAttackLeft = false;
         }
         else if(param1.frameLabel == "startHitLeft")
         {
            this._isAttacking = true;
            this._isAttackLeft = true;
         }
         if(param1.frameLabel == "endHitRight" || param1.frameLabel == "endHitLeft")
         {
            this._isAttacking = false;
         }
      }
      
      override public function runningState() : void
      {
         var _loc4_:Rectangle = null;
         var _loc7_:IGameObject = null;
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
         var _loc2_:Vector.<IGameObject> = new Vector.<IGameObject>();
         var _loc3_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByIndex(_gameObject.objectModel.tileIndex);
         if(this._isAttackLeft)
         {
            _loc4_ = new Rectangle(_loc3_.rect.x - _loc3_.rect.width * 1.25,_loc3_.rect.y - _loc3_.rect.height,_loc3_.rect.width,_loc3_.rect.height * 3);
         }
         else
         {
            _loc4_ = new Rectangle(_loc3_.rect.x + _loc3_.rect.width * 1.25,_loc3_.rect.y - _loc3_.rect.height,_loc3_.rect.width,_loc3_.rect.height * 3);
         }
         var _loc5_:Rectangle = new Rectangle(_loc3_.rect.x,_loc3_.rect.y,_loc3_.rect.width,_loc3_.rect.height);
         var _loc6_:Array = [_plant.objectModel.roadIndex - 1,_plant.objectModel.roadIndex,_plant.objectModel.roadIndex + 1];
         _loc2_ = TDSearchTargetUtils.searchTargetForPlant(_plant,[_loc4_,_loc5_],_loc6_);
         for each(_loc7_ in _loc2_)
         {
            TDDamageCaculete.caculatePlantAttckDamage(_plant,_loc7_,0,true);
            TDEffectCmd.playBambooLiHitEffect(_plant,_loc7_);
         }
      }
      
      override public function leaveState() : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinishSkillOn);
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinishSkill);
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinishSkillOff);
         _gameObject.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onAttackEvent);
         super.leaveState();
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
   }
}
