package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.plant
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.plant.ExePlantAttack;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqPlantCurAction;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.model.TDGameInfo;
   
   public class AI_plant_bowlingBomb extends BaseNodePvz
   {
       
      
      public function AI_plant_bowlingBomb(param1:int = 30)
      {
         super(param1);
      }
      
      override public function calculate() : Boolean
      {
         if(ReqPlantCurAction.calculate(selfObj,true,TDConstant.PPotatoBowlingAction_Roll))
         {
            return true;
         }
         if(ReqPlantCurAction.calculate(selfObj,true,TDConstant.PlantAction_FadeOut))
         {
            return true;
         }
         ExePlantAttack.calculate(selfObj,TDConstant.PPotatoBowlingBombAction_Roll,[this.getAttackPath()]);
         return true;
      }
      
      private function getAttackPath() : int
      {
         var _loc1_:BasicPlant = selfObj as BasicPlant;
         var _loc2_:TDMapTileData = TDGameInfo.getInstance().getRoadTileByIndex(_loc1_.plantData.tileIndex);
         return _loc2_.roadIndex;
      }
   }
}
