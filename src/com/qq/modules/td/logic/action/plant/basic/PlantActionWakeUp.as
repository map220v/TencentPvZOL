package com.qq.modules.td.logic.action.plant.basic
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   import flash.events.Event;
   
   public class PlantActionWakeUp extends BasicPlantAction
   {
       
      
      public function PlantActionWakeUp()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onComplete);
         _gameObject.animation.gotoAndPlay(TDConstant.PlantAnmi_WakeUp);
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onComplete);
      }
      
      private function onComplete(param1:Event) : void
      {
         _gameObject.setRunningProp(TDConstant.Gameobject_Prop_IsSleeping,false);
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onComplete);
         _gameObject.setAction();
      }
   }
}
