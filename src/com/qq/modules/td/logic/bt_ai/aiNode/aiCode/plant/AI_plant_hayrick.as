package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.plant
{
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.plant.ExePlantIdle;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqPlantCurAction;
   
   public class AI_plant_hayrick extends BaseNodePvz
   {
       
      
      public function AI_plant_hayrick()
      {
         super();
      }
      
      override public function calculate() : Boolean
      {
         if(ReqPlantCurAction.calculate(selfObj,true,"PPeaShooterAction_Idle"))
         {
            return true;
         }
         ExePlantIdle.calculate(selfObj,"PPeaShooterAction_Idle");
         return true;
      }
   }
}
