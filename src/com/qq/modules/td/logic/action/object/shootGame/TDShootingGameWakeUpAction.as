package com.qq.modules.td.logic.action.object.shootGame
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   import flash.events.Event;
   
   public class TDShootingGameWakeUpAction extends BasicPlantAction
   {
       
      
      public function TDShootingGameWakeUpAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.animation.gotoAndPlay("cd_end");
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishAction);
      }
      
      override public function leaveState() : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishAction);
         super.leaveState();
      }
      
      private function onFinishAction(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishAction);
         _plant.setAction(TDConstant.PlantAction_Idle);
      }
   }
}
