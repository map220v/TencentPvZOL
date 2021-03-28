package com.qq.modules.td.logic.action.object.plantFoodEffect
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   
   public class PlantFoodEffectAction extends BasicAction
   {
       
      
      private var _targetPlant:BasicPlant;
      
      private var _isPlantfoodOff:Boolean;
      
      public function PlantFoodEffectAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         var _loc2_:uint = _gameObject.objectModel.getParamValue(TDConstant.GameObjectData_Param_SpecialSkillPlantUIN);
         this._targetPlant = TDGameInfo.getInstance().getGameObjctByUID(_loc2_) as BasicPlant;
         _gameObject.animation.gotoAndPlay("plantfood_on");
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinsh_Plantfood_on);
         this._isPlantfoodOff = false;
      }
      
      override public function runningState() : void
      {
         super.runningState();
         if(this._isPlantfoodOff)
         {
            return;
         }
         if(this._targetPlant !== null && this._targetPlant.isVaild)
         {
            if(this._targetPlant.getActionID() != this._targetPlant.plantData.plantStaticInfo.baseInfo.specialActionName)
            {
               this.onFinsh_Plantfood(null);
            }
         }
         else
         {
            _gameObject.dispose();
         }
      }
      
      override public function leaveState() : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinsh_Plantfood_on);
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinsh_Plantfood_off);
         this._targetPlant = null;
         super.leaveState();
      }
      
      private function onFinsh_Plantfood_on(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinsh_Plantfood_on);
         _gameObject.animation.gotoAndPlay("plantfood",true);
      }
      
      private function onFinsh_Plantfood(param1:Event) : void
      {
         this._isPlantfoodOff = true;
         _gameObject.animation.gotoAndPlay("plantfood_off");
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinsh_Plantfood_off);
      }
      
      private function onFinsh_Plantfood_off(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinsh_Plantfood_off);
         _gameObject.dispose();
      }
   }
}
