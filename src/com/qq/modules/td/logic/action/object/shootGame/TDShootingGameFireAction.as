package com.qq.modules.td.logic.action.object.shootGame
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDFireBulletCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.plant.ExePlantResetDuration;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class TDShootingGameFireAction extends BasicPlantAction
   {
       
      
      private var _targetPos:Point;
      
      public function TDShootingGameFireAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         this._targetPos = param1[0];
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Shooting,null,1);
         _plant.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishAction);
      }
      
      override public function leaveState() : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishAction);
         _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         super.leaveState();
      }
      
      protected function onShoot(param1:FrameEvent) : void
      {
         if(param1.frameLabel == "shoot")
         {
            ExePlantResetDuration.calculate(_plant);
            TDFireBulletCmd.shoot(_plant,null,_plant.plantData.plantStaticInfo.baseInfo.bulletType,_plant.model.staticInfo.firePosBoneName,0,0,1,false,this._targetPos);
            TDSoundCmd.playPlantNormalAttack(_gameObject.objectModel.staticInfo.type);
         }
      }
      
      private function onFinishAction(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishAction);
         _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         _plant.setAction(TDConstant.TDShootingGameSleepAction);
      }
   }
}
