package com.qq.modules.td.logic.action.plant.bubbleFlower
{
   import asgui.events.FrameEvent;
   import com.qq.modules.td.command.game.TDFireBulletCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   import com.qq.modules.td.logic.talent.TalentManager;
   import flash.events.Event;
   
   public class BubbleFlowerAttackAction extends BasicPlantAction
   {
       
      
      public function BubbleFlowerAttackAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.animation.gotoAndPlay("attack");
         _plant.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         _plant.animation.addEventListener(Event.COMPLETE,this.finishAttack);
      }
      
      private function onShoot(param1:FrameEvent) : void
      {
         var _loc2_:int = 0;
         if(param1.frameLabel == "shoot")
         {
            _loc2_ = TalentManager.instance.getBulletType(_plant.plantData.plantStaticInfo,_plant.uid);
            TDFireBulletCmd.shoot(_plant,_plant.curAttackTarget,_loc2_,null,15,-_plant.damageArea.height * 0.5);
            TDSoundCmd.playPlantNormalAttack(_gameObject.objectModel.staticInfo.type);
         }
         _plant.setAttackTarget(null);
      }
      
      private function finishAttack(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.finishAttack);
         _plant.setAction();
      }
      
      override public function leaveState() : void
      {
         _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         _plant.animation.removeEventListener(Event.COMPLETE,this.finishAttack);
         super.leaveState();
      }
   }
}
