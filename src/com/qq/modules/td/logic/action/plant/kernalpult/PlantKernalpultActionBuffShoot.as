package com.qq.modules.td.logic.action.plant.kernalpult
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDFireBulletCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import flash.events.Event;
   
   public class PlantKernalpultActionBuffShoot extends PlantKernalpultActionShoot
   {
      
      public static const BUFF_BULLET_ID:uint = 1800;
       
      
      public function PlantKernalpultActionBuffShoot()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Attack2,null,1);
         _plant.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishAction);
      }
      
      override public function leaveState() : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishAction);
         _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         super.leaveState();
      }
      
      override protected function onShoot(param1:FrameEvent) : void
      {
         if(param1.frameLabel == "shoot")
         {
            TDSoundCmd.playPlantNormalAttack(_gameObject.objectModel.staticInfo.type);
            TDFireBulletCmd.shoot(_plant,_plant.curAttackTarget,BUFF_BULLET_ID,_plant.model.staticInfo.firePosBoneName);
            _plant.setAttackTarget(null);
         }
      }
      
      private function onFinishAction(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishAction);
         _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         _plant.setAction();
      }
   }
}
