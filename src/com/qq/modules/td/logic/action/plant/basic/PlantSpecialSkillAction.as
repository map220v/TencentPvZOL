package com.qq.modules.td.logic.action.plant.basic
{
   import com.qq.modules.td.logic.TDSpecialSkillTrigger;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   
   public class PlantSpecialSkillAction extends BasicPlantAction
   {
       
      
      private var _actionTimeScale:Number = -1;
      
      private var _recordTimeScale:Number;
      
      public function PlantSpecialSkillAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.setFrozenAI(true);
         if(this._actionTimeScale != -1)
         {
            this._recordTimeScale = _plant.timeScale;
            _plant.setTimeScale(this._actionTimeScale);
         }
         else
         {
            this._recordTimeScale = 0;
         }
      }
      
      override public function leaveState() : void
      {
         if(this._recordTimeScale > 0)
         {
            _plant.setTimeScale(this._recordTimeScale);
         }
         this.finishSpecialSkill();
         super.leaveState();
      }
      
      protected function setActionTimeScale(param1:Number) : void
      {
         this._actionTimeScale = param1;
      }
      
      protected function finishSpecialSkill() : void
      {
         _plant.setFrozenAI(false);
         _plant.setAction();
         TDSpecialSkillTrigger.getInstance().finishSpecialSkill(_plant);
      }
   }
}
