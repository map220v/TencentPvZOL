package com.qq.modules.td.logic.action.plant.snapdragon
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDElementType;
   import com.qq.modules.td.command.effects.TDEffectCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.numeric.TDDamageCaculete;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   
   public class PSnapdragonActionAttack extends BasicPlantAction
   {
       
      
      private var _attackAreas:Array;
      
      public function PSnapdragonActionAttack()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         this._attackAreas = param1[0];
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Shooting,null,1);
         _plant.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishAction);
      }
      
      override public function leaveState() : void
      {
         this._attackAreas = null;
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishAction);
         _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         super.leaveState();
      }
      
      protected function onShoot(param1:FrameEvent) : void
      {
         var _loc2_:Array = null;
         var _loc3_:Vector.<IGameObject> = null;
         var _loc4_:IGameObject = null;
         if(param1.frameLabel == "shoot")
         {
            this.showFire();
            TDSoundCmd.playPlantNormalAttack(_gameObject.objectModel.staticInfo.type);
            _loc2_ = [_plant.objectModel.roadIndex - 1,_plant.objectModel.roadIndex,_plant.objectModel.roadIndex + 1];
            _loc3_ = TDSearchTargetUtils.searchTargetForPlant(_plant,this._attackAreas,_loc2_);
            for each(_loc4_ in _loc3_)
            {
               TDDamageCaculete.caculatePlantAttckDamage(_plant,_loc4_,0,false,TDConstant.AttackMode_Normal,TDElementType.FIRE_TYPE);
            }
         }
      }
      
      private function onFinishAction(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishAction);
         _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         _plant.setAction();
      }
      
      private function showFire() : void
      {
         var _loc1_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByIndex(_plant.objectModel.tileIndex);
         var _loc2_:int = -1;
         while(_loc2_ <= 1)
         {
            if(_loc1_.roadRow + _loc2_ > 0 && _loc1_.roadRow + _loc2_ <= TDGameInfo.getInstance().maxRow)
            {
               TDEffectCmd.playBlitAnimation(TDConstant.UnitType_SnapDragonFire,_loc1_.rect.right,_loc1_.rect.y + (_loc2_ + 0.5) * _loc1_.rect.height);
            }
            _loc2_++;
         }
      }
   }
}
