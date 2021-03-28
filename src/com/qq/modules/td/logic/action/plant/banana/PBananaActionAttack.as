package com.qq.modules.td.logic.action.plant.banana
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDFireBulletCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   import com.qq.modules.td.logic.talent.TalentManager;
   import flash.events.Event;
   
   public class PBananaActionAttack extends BasicPlantAction
   {
       
      
      public function PBananaActionAttack()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         if(_plant.getRunningProp(TDConstant.Gameobject_Prop_Banana_Weak) == true)
         {
            _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Attack2);
            _plant.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onSingleShoot);
         }
         else
         {
            _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Attack);
            _plant.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onDoubleShoot);
         }
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishAction);
      }
      
      override public function dispose() : void
      {
         if(_plant && _plant.animation)
         {
            _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onDoubleShoot);
            _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onSingleShoot);
            _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishAction);
         }
         super.dispose();
      }
      
      override public function leaveState() : void
      {
         _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onDoubleShoot);
         _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onSingleShoot);
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishAction);
      }
      
      private function onDoubleShoot(param1:FrameEvent) : void
      {
         if(param1.frameLabel == "shoot1")
         {
            this.shootBullet();
         }
         else if(param1.frameLabel == "shoot2")
         {
            this.shootBullet();
         }
      }
      
      protected function onSingleShoot(param1:FrameEvent) : void
      {
         if(param1.frameLabel == "shoot")
         {
            this.shootBullet();
         }
      }
      
      private function shootBullet() : void
      {
         var _loc1_:int = TalentManager.instance.getBulletType(_plant.plantData.plantStaticInfo,_plant.uid);
         TDFireBulletCmd.shoot(_plant,_plant.curAttackTarget,_loc1_,_plant.model.staticInfo.firePosBoneName,0,-35);
         TDSoundCmd.playPlantNormalAttack(_gameObject.objectModel.staticInfo.type);
      }
      
      protected function onFinishAction(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishAction);
         _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onDoubleShoot);
         _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onSingleShoot);
         _plant.setAction();
      }
   }
}
