package com.qq.modules.td.logic.action.plant.moteng
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   
   public class PlantMotengActionIdle extends BasicPlantAction
   {
       
      
      public function PlantMotengActionIdle()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Idle,true);
      }
   }
}
