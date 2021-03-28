package com.qq.modules.td.logic.action.plant.citron
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDSoundID;
   import com.qq.modules.td.command.game.TDFireBulletCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.action.plant.basic.PlantActionShoot;
   import com.qq.modules.td.logic.talent.TalentManager;
   import flash.events.Event;
   
   public class PCitronActionShoot extends PlantActionShoot
   {
       
      
      public function PCitronActionShoot()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState();
         _plant.setRunningProp(TDConstant.Gameobject_Prop_IsReadyToAttack,false);
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishRecovery);
      }
      
      override protected function onShoot(param1:FrameEvent) : void
      {
         var _loc2_:int = 0;
         if(param1.frameLabel == "shoot")
         {
            _loc2_ = TalentManager.instance.getBulletType(_plant.plantData.plantStaticInfo,_plant.uid);
            TDFireBulletCmd.shoot(_plant,_plant.curAttackTarget,_loc2_,_plant.model.staticInfo.firePosBoneName);
            TDSoundCmd.playSound(TDSoundID.Future_Citron_Attack);
         }
         _plant.setAttackTarget(null);
      }
      
      override protected function onFinishAction(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishAction);
         _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishRecovery);
         _plant.animation.gotoAndPlay("recovery");
      }
      
      private function onFinishRecovery(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishRecovery);
         _plant.setAction();
      }
   }
}
