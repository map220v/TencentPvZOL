package com.qq.modules.td.logic.action.plant.peashooter
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDFireBulletCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   import com.qq.modules.td.logic.talent.TalentManager;
   import flash.events.Event;
   
   public class PlantPeaShooterActionShoot extends BasicPlantAction
   {
       
      
      public function PlantPeaShooterActionShoot()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Shooting);
         _plant.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishAction);
      }
      
      override public function dispose() : void
      {
         if(_plant && _plant.animation)
         {
            _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
            _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishAction);
         }
         super.dispose();
      }
      
      override public function leaveState() : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishAction);
      }
      
      protected function onShoot(param1:FrameEvent) : void
      {
         var _loc2_:int = 0;
         if(param1.frameLabel == "shoot")
         {
            _loc2_ = TalentManager.instance.getBulletType(_plant.plantData.plantStaticInfo,_plant.uid);
            TDFireBulletCmd.shoot(_plant,_plant.curAttackTarget,_loc2_,_plant.model.staticInfo.firePosBoneName);
            TDSoundCmd.playPlantNormalAttack(_gameObject.objectModel.staticInfo.type);
         }
         _plant.setAttackTarget(null);
      }
      
      private function onFinishAction(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishAction);
         _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         _plant.setAction();
      }
   }
}
