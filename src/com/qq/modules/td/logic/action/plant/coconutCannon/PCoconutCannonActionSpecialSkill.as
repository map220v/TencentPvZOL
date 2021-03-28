package com.qq.modules.td.logic.action.plant.coconutCannon
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDFireBulletCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.action.plant.basic.PlantSpecialSkillAction;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.plant.ExePlantResetDuration;
   import flash.events.Event;
   
   public class PCoconutCannonActionSpecialSkill extends PlantSpecialSkillAction
   {
       
      
      public function PCoconutCannonActionSpecialSkill()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Plantfood,null,1);
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
            TDFireBulletCmd.shoot(_plant,_plant.curAttackTarget,_plant.plantData.plantStaticInfo.baseInfo.getSpecialSkillParam(TDConstant.SpecialSkill_Param_ShootBulletType),null,40,-40,1,true);
            _plant.setAttackTarget(null);
            TDSoundCmd.playPlantNormalAttack(_gameObject.objectModel.staticInfo.type);
         }
      }
      
      private function onFinishAction(param1:Event) : void
      {
         _plant.setRunningProp(TDConstant.Gameobject_Prop_IsSleeping,true);
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishAction);
         _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         finishSpecialSkill();
      }
   }
}
