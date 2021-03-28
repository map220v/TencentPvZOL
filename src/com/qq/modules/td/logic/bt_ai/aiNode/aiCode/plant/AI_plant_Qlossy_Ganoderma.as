package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.plant
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.plant.ExePlantAttack;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.plant.ExePlantIdle;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.plant.ExePlantResetDuration;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqHasShootZombie;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqPlantCurAction;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqPlantDurationExpire;
   
   public class AI_plant_Qlossy_Ganoderma extends BaseNodePvz
   {
       
      
      public function AI_plant_Qlossy_Ganoderma()
      {
         super();
      }
      
      override public function calculate() : Boolean
      {
         if(ReqPlantCurAction.calculate(selfObj,false,TDConstant.PlantAction_Shoot))
         {
            if(ReqPlantDurationExpire.calculate(selfObj) && ReqHasShootZombie.calculate(selfObj))
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
