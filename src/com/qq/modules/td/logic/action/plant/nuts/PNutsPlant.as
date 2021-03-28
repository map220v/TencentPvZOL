package com.qq.modules.td.logic.action.plant.nuts
{
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   import flash.events.Event;
   
   public class PNutsPlant extends BasicPlantAction
   {
       
      
      public function PNutsPlant()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         _plant.animation.gotoAndPlay("plant");
         _plant.animation.addEventListener(Event.COMPLETE,this.onAnimComplete);
         _plant.setFrozenAI(true);
      }
      
      private function onAnimComplete(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onAnimComplete);
         _plant.setFrozenAI(false);
      }
   }
}
