package com.qq.modules.td.logic.action.plant.potatomine
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   import flash.events.Event;
   
   public class PPotatomineActionIdle extends BasicPlantAction
   {
       
      
      public function PPotatomineActionIdle()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_PotatoStart,false);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishStart);
      }
      
      private function onFinishStart(param1:Event) : void
      {
         _plant.removeEventListener(Event.COMPLETE,this.onFinishStart);
         _plant.animation.gotoAndPlay("submerged Idle",true);
      }
      
      override public function leaveState() : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishStart);
      }
   }
}
