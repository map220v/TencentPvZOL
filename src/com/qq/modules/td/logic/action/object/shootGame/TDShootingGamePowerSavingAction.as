package com.qq.modules.td.logic.action.object.shootGame
{
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   
   public class TDShootingGamePowerSavingAction extends BasicPlantAction
   {
       
      
      public function TDShootingGamePowerSavingAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.animation.gotoAndPlay("attack_xuli",true);
      }
      
      override public function runningState() : void
      {
         super.runningState();
      }
      
      override public function leaveState() : void
      {
         super.leaveState();
      }
   }
}
