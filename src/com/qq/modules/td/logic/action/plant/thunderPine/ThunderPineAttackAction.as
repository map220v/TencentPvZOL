package com.qq.modules.td.logic.action.plant.thunderPine
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDSoundID;
   import com.qq.modules.sound.command.SoundCmd;
   import com.qq.modules.td.command.game.TDFireBulletCmd;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   import com.qq.modules.td.logic.talent.TalentManager;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   
   public class ThunderPineAttackAction extends BasicPlantAction
   {
       
      
      public function ThunderPineAttackAction()
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
            _plant.setTimeRecord(TDConstant.TimeRecord_PlantDuration,TDGameInfo.getInstance().getCurGameTime());
            _loc2_ = TalentManager.instance.getBulletType(_plant.plantData.plantStaticInfo,_plant.uid);
            TDFireBulletCmd.shoot(_plant,_plant.curAttackTarget,_loc2_,null,10,-_plant.damageArea.height);
            SoundCmd.playSound(TDSoundID.Seapine_Atk);
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
