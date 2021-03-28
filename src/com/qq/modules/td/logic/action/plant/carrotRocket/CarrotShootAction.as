package com.qq.modules.td.logic.action.plant.carrotRocket
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDFireBulletCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   import com.qq.modules.td.logic.talent.TalentManager;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   
   public class CarrotShootAction extends BasicPlantAction
   {
       
      
      private var defaultBulletNum:int = 1;
      
      public function CarrotShootAction()
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
         _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishAction);
      }
      
      protected function onShoot(param1:FrameEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param1.frameLabel == "shoot")
         {
            _loc2_ = this.defaultBulletNum + TalentManager.instance.getPlusBulletNum(_plant.plantData.plantStaticInfo);
            _loc3_ = TalentManager.instance.getBulletType(_plant.plantData.plantStaticInfo,_plant.uid);
            _loc5_ = 0;
            while(_loc5_ < _loc2_)
            {
               _loc4_ = 50 * (_loc2_ - 1 - _loc5_);
               TDFireBulletCmd.shoot(_plant,_plant.curAttackTarget,_loc3_,_plant.model.staticInfo.firePosBoneName,_loc4_);
               _loc5_++;
            }
            TDSoundCmd.playPlantNormalAttack(_gameObject.objectModel.staticInfo.type);
            _plant.setTimeRecord(TDConstant.TimeRecord_PlantDuration,TDGameInfo.getInstance().getCurGameTime());
         }
      }
      
      protected function onFinishAction(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishAction);
         _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         _plant.setAction();
      }
   }
}
