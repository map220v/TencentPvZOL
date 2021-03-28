package com.qq.modules.td.logic.action.plant.citron
{
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDSoundID;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   import flash.events.Event;
   
   public class PCitronActionCharge extends BasicPlantAction
   {
       
      
      public function PCitronActionCharge()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.animation.gotoAndPlay("charge");
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishAction);
         TDSoundCmd.playSound(TDSoundID.Future_Citron_Charge);
      }
      
      override public function leaveState() : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishAction);
      }
      
      private function onFinishAction(param1:Event) : void
      {
         _plant.setRunningProp(TDConstant.Gameobject_Prop_IsReadyToAttack,true);
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishAction);
         _plant.setAction();
      }
   }
}
