package com.qq.modules.td.logic.action.plant.snapdragon
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
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
   
   public class PSnapdragonActionSpecialSkill extends PlantSpecialSkillAction
   {
       
      
      public function PSnapdragonActionSpecialSkill()
      {
         super();
      }
      
      private function getCheckArea() : Rectangle
      {
         var _loc1_:Rectangle = new Rectangle();
         var _loc2_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByIndex(_plant.objectModel.tileIndex);
         if(_loc2_ != null)
         {
            _loc1_.x = _loc2_.rect.right;
            _loc1_.y = _loc2_.rect.top - _loc2_.rect.height;
            _loc1_.width = _loc2_.rect.width * 3;
            _loc1_.height = _loc2_.rect.height * 3;
         }
         return _loc1_;
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood,1);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinishSkillOn);
         _gameObject.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onAttackEvent);
      }
      
      private function onFinishSkillOn(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinishSkillOn);
         finishSpecialSkill();
      }
      
      private function onAttackEvent(param1:FrameEvent) : void
      {
         var _loc2_:Rectangle = null;
         var _loc3_:Array = null;
         var _loc4_:Vector.<IGameObject> = null;
         var _loc5_:IGameObject = null;
         if(param1.frameLabel == "spurt")
         {
            _loc2_ = this.getCheckArea();
            TDEffectCmd.playBlitAnimation(TDConstant.UnitType_SnapDragonBigFire,_loc2_.x,_loc2_.y + _loc2_.height * 0.5);
            TDSoundCmd.playPlantSpecialAttack(_gameObject.objectModel.staticInfo.type);
         }
         else if(param1.frameLabel == "damage")
         {
            _loc2_ = this.getCheckArea();
            _loc3_ = [_plant.objectModel.roadIndex - 1,_plant.objectModel.roadIndex,_plant.objectModel.roadIndex + 1];
            _loc4_ = TDSearchTargetUtils.searchTargetForPlant(_plant,[_loc2_],_loc3_);
            for each(_loc5_ in _loc4_)
            {
               TDDamageCaculete.caculatePlantAttckDamage(_plant,_loc5_,0,true);
               _loc5_.objectModel.removeBuffByType(TDConstant.TDBuffType_Frozen);
            }
            this.showFire();
         }
      }
      
      private function showFire() : void
      {
         var _loc3_:int = 0;
         var _loc1_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByIndex(_plant.objectModel.tileIndex);
         var _loc2_:int = -1;
         while(_loc2_ <= 1)
         {
            if(_loc1_.roadRow + _loc2_ > 0 && _loc1_.roadRow + _loc2_ <= TDGameInfo.getInstance().maxRow)
            {
               _loc3_ = 0;
               while(_loc3_ < 3)
               {
                  if(_loc1_.roadCol - _loc3_ > 0)
                  {
                     TDEffectCmd.playBlitAnimation(TDConstant.UnitType_SnapDragonFireballs,_loc1_.rect.right + (_loc3_ + 0.5) * _loc1_.rect.width,_loc1_.rect.bottom + _loc2_ * _loc1_.rect.height);
                  }
                  _loc3_++;
               }
            }
            _loc2_++;
         }
      }
      
      override public function runningState() : void
      {
         super.runningState();
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinishSkillOn);
         _gameObject.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onAttackEvent);
      }
   }
}
