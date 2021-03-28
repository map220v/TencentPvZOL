package com.qq.modules.td.logic.action.plant.basic
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   
   public class PlantActionTransform extends BasicPlantAction
   {
       
      
      private var _transformToId:int;
      
      public function PlantActionTransform()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         var _loc2_:int = 0;
         super.enterState(param1);
         this._transformToId = param1[0];
         _loc2_ = _plant.objectModel.column;
         var _loc3_:int = _plant.objectModel.roadIndex;
         _plant.killByPrePlantType = true;
         _plant.Dispose();
         TDGameObjectCmd.addGameObjectByColAndRow(TDConstant.UnitCatalog_Plant,this._transformToId,_loc2_,_loc3_);
      }
   }
}
