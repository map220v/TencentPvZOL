package com.qq.modules.td.logic.action.plant.basic
{
   import com.greensock.TweenMax;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   
   public class PlantActionFadeOut extends BasicPlantAction
   {
       
      
      public function PlantActionFadeOut()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         TweenMax.to(_plant,0.2,{
            "alpha":0,
            "delay":1,
            "onComplete":this.onFinishFadeOut
         });
      }
      
      override public function leaveState() : void
      {
         TweenMax.killTweensOf(_plant);
      }
      
      private function onFinishFadeOut() : void
      {
         if(_plant != null)
         {
            _plant.dispose();
         }
      }
   }
}
