package com.qq.modules.td.logic.action.plant.citron
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDSoundID;
   import com.qq.modules.td.command.game.TDFireBulletCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.action.plant.basic.PlantSpecialSkillAction;
   import flash.events.Event;
   
   public class PCitronActionSpecialSkill extends PlantSpecialSkillAction
   {
       
      
      public function PCitronActionSpecialSkill()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Shooting);
         _plant.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishAttack);
      }
      
      private function onShoot(param1:FrameEvent) : void
      {
         var _loc2_:int = 0;
         if(param1.frameLabel == "shoot")
         {
            _loc2_ = _plant.plantData.plantStaticInfo.baseInfo.getSpecialSkillParam(TDConstant.SpecialSkill_Param_ShootBulletType);
            TDFireBulletCmd.shoot(_plant,_plant.curAttackTarget,_plant.plantData.plantStaticInfo.baseInfo.getSpecialSkillParam(TDConstant.SpecialSkill_Param_ShootBulletType),_plant.plantData.plantStaticInfo.baseInfo.getSpecialSkillParamStr(TDConstant.SpecialSkill_Param_ShootBoneName),30,0,1,true);
            TDSoundCmd.playSound(TDSoundID.Future_Citron_PF_Impact_orb);
            _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         }
      }
      
      private function onFinishAttack(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishAttack);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishRecovery);
         _plant.animation.gotoAndPlay("recovery");
      }
      
      private function onFinishRecovery(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishRecovery);
         finishSpecialSkill();
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishAttack);
         _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishRecovery);
      }
   }
}
