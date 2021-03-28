package com.qq.modules.td.logic.action.plant.moteng
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDFireBulletCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.action.plant.basic.PlantSpecialSkillAction;
   import flash.events.Event;
   
   public class PlantMotengSpecialAction extends PlantSpecialSkillAction
   {
       
      
      public function PlantMotengSpecialAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.animation.gotoAndPlay("skill");
         _plant.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishAction);
      }
      
      private function onShoot(param1:FrameEvent) : void
      {
         var _loc2_:int = 0;
         if(param1.frameLabel == "shoot")
         {
            _loc2_ = _plant.plantData.plantStaticInfo.baseInfo.getSpecialSkillParam(TDConstant.SpecialSkill_Param_ShootBulletType);
            TDFireBulletCmd.shoot(_plant,_plant.curAttackTarget,_loc2_,"leiyuanxin",-100,50,1,true);
            TDSoundCmd.playPlantSpecialAttack(_gameObject.objectModel.staticInfo.type);
            _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         }
      }
      
      private function onFinishAction(param1:Event) : void
      {
         finishSpecialSkill();
      }
      
      override public function dispose() : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishAction);
         super.dispose();
      }
   }
}
