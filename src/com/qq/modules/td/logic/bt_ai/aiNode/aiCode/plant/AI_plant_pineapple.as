package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.plant
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BasePlantNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.plant.ExePlantAttack;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.plant.ExePlantIdle;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.plant.ExePlantResetDuration;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqHasShootZombie;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqPlantCurAction;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqPlantDurationExpire;
   
   public class AI_plant_pineapple extends BasePlantNodePvz
   {
       
      
      public function AI_plant_pineapple(param1:int = 30)
      {
         super(param1);
      }
      
      override public function calculate() : Boolean
      {
         if(ReqPlantCurAction.calculate(selfObj,false,TDConstant.PlantAction_Shoot))
         {
            if(ReqPlantDurationExpire.calculate(selfObj) && ReqHasShootZombie.calculateTheLastOne(selfObj))
            {
               ExePlantResetDuration.calculate(selfObj);
               ExePlantAttack.calculate(selfObj,TDConstant.PlantAction_Shoot);
            }
            else
            {
               ExePlantIdle.calculate(selfObj,TDConstant.PlantAction_Idle);
            }
         }
         return true;
      }
   }
}
