package com.qq.modules.td.logic.action.plant.garlic
{
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   
   public class GarlicIdleAction1 extends BasicPlantAction
   {
       
      
      public function GarlicIdleAction1()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.animation.gotoAndPlay("idle",true);
      }
   }
}
