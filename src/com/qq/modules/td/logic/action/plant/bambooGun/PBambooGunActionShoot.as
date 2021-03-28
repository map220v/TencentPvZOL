package com.qq.modules.td.logic.action.plant.bambooGun
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDFireBulletCmd;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   import flash.events.Event;
   
   public class PBambooGunActionShoot extends BasicPlantAction
   {
       
      
      public function PBambooGunActionShoot()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Shooting);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishAction);
         _plant.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
      }
      
      override public function leaveState() : void
      {
         _plant.setAttackTarget(null);
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishAction);
         _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
      }
      
      private function onShoot(param1:FrameEvent) : void
      {
         if(param1.frameLabel == "shoot")
         {
            TDFireBulletCmd.shoot(_plant,_plant.curAttackTarget,_plant.plantData.plantStaticInfo.baseInfo.bulletType,_plant.model.staticInfo.firePosBoneName);
         }
      }
      
      private function onFinishAction(param1:Event) : void
      {
         _plant.setAction(TDConstant.PBambooGun_Idle);
      }
   }
}
