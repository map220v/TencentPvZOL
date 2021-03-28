package com.qq.modules.td.logic.action.plant.icebean
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.buff.TDBuffManager;
   import flash.events.Event;
   
   public class PIcebeanActionExplode extends BasicPlantAction
   {
       
      
      public function PIcebeanActionExplode()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         _plant.animation.addEventListener(Event.COMPLETE,this.onComplete);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Attack);
      }
      
      override public function runningState() : void
      {
         super.runningState();
      }
      
      override public function leaveState() : void
      {
         _plant.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         _plant.animation.removeEventListener(Event.COMPLETE,this.onComplete);
         super.leaveState();
      }
      
      private function onShoot(param1:FrameEvent) : void
      {
         var _loc2_:Array = null;
         if(param1.frameLabel == "shoot")
         {
            TDSoundCmd.playIcebergSpecialAttack();
            _loc2_ = TDSearchTargetUtils.getZombieList(_plant);
            TDBuffManager.getInstance().addGameObjectsBuffWithBuffId(_loc2_,TDConstant.TDBuffID_Iceburg_fressze);
         }
      }
      
      private function onComplete(param1:Event) : void
      {
         _plant.Dispose();
      }
   }
}
