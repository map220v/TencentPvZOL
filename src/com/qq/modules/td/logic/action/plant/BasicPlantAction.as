package com.qq.modules.td.logic.action.plant
{
   import com.qq.modules.td.data.game.unit.TDPlantData;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   
   public class BasicPlantAction extends BasicAction
   {
       
      
      protected var _plant:BasicPlant;
      
      protected var _plantModel:TDPlantData;
      
      public function BasicPlantAction()
      {
         super();
      }
      
      override public function setGameObject(param1:IGameObject, param2:String) : void
      {
         super.setGameObject(param1,param2);
         this._plant = param1 as BasicPlant;
         this._plantModel = this._plant.model as TDPlantData;
      }
      
      override public function dispose() : void
      {
         this._plant = null;
         this._plantModel = null;
         super.dispose();
      }
   }
}
