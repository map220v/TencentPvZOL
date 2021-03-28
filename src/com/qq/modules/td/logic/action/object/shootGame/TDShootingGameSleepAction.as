package com.qq.modules.td.logic.action.object.shootGame
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   
   public class TDShootingGameSleepAction extends BasicPlantAction
   {
       
      
      public function TDShootingGameSleepAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Sleep,true);
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
      }
   }
}
