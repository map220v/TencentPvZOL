package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.plant
{
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.plant.ExePlantAttack;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.plant.ExePlantIdle;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.plant.ExePlantResetDuration;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqHasShootZombie;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqPlantCurAction;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqPlantDurationExpire;
   
   public class AI_plant_moteng extends BaseNodePvz
   {
       
      
      public function AI_plant_moteng()
      {
         super();
      }
      
      override public function calculate() : Boolean
      {
         if(ReqPlantCurAction.calculate(selfObj,false,"PSmallWisteriaAction_Attack"))
         {
            if(ReqPlantDurationExpire.calculate(selfObj) && ReqHasShootZombie.calculate(selfObj))
            {
               ExePlantResetDuration.calculate(selfObj);
               ExePlantAttack.calculate(selfObj,"PSmallWisteriaAction_Attack");
            }
            else
            {
               ExePlantIdle.calculate(selfObj,"PPeaShooterAction_Idle");
            }
         }
         return true;
      }
   }
}
