package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.plant
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BasePlantNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.plant.ExePlantAttack;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.plant.ExePlantIdle;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   
   public class AI_plant_spikeweed extends BasePlantNodePvz
   {
       
      
      public function AI_plant_spikeweed(param1:int = 30)
      {
         super(param1);
      }
      
      override public function calculate() : Boolean
      {
         if(TDSearchTargetUtils.searchTargetForPlantWithAttackArea(plant,[selfObj.objectModel.roadIndex]).length > 0)
         {
            ExePlantAttack.calculate(selfObj,TDConstant.PSpikeweedAction_Attack);
         }
         else
         {
            ExePlantIdle.calculate(selfObj,TDConstant.PlantAction_Idle);
         }
         return true;
      }
   }
}
