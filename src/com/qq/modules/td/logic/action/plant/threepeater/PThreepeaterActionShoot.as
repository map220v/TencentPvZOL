package com.qq.modules.td.logic.action.plant.threepeater
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDFireBulletCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   import com.qq.modules.td.logic.talent.TalentManager;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   
   public class PThreepeaterActionShoot extends BasicPlantAction
   {
       
      
      public function PThreepeaterActionShoot()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishAction);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Shooting);
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
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(param1.frameLabel == "shoot")
         {
            _loc2_ = TalentManager.instance.getBulletType(_plant.plantData.plantStaticInfo,_plant.uid);
            _loc3_ = 1 + TalentManager.instance.getPlusBulletNum(_plant.plantData.plantStaticInfo);
            _loc5_ = -1;
            while(_loc5_ <= 1)
            {
               if((_loc4_ = _plant.objectModel.roadIndex + _loc5_) >= TDGameInfo.getInstance().minRow && _loc4_ <= TDGameInfo.getInstance().maxRow)
               {
                  _loc6_ = 0;
                  while(_loc6_ < _loc3_)
                  {
                     _loc7_ = 50 * (_loc3_ - 1 - _loc6_);
                     TDFireBulletCmd.shoot(_plant,_plant.curAttackTarget,_loc2_,null,_loc7_,-40,1,false,null,[_loc4_]);
                     _loc6_++;
                  }
                  TDSoundCmd.playPlantNormalAttack(_gameObject.objectModel.staticInfo.type);
               }
               _loc5_++;
            }
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
