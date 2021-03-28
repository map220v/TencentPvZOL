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
   import com.qq.modules.td.logic.talent.TalentManager;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   
   public class AI_plant_kernalpult extends BaseNodePvz
   {
       
      
      public function AI_plant_kernalpult()
      {
         super();
      }
      
      override public function calculate() : Boolean
      {
         var _loc1_:Number = NaN;
         if(ReqPlantCurAction.calculate(selfObj,false,TDConstant.PlantKernalpultActionShoot) && ReqPlantCurAction.calculate(selfObj,false,TDConstant.PlantKernalpultActionBuffShoot))
         {
            if(ReqPlantDurationExpire.calculate(selfObj) && ReqHasShootZombie.calculate(selfObj))
            {
               ExePlantResetDuration.calculate(selfObj);
               _loc1_ = TalentManager.instance.getAddRate((selfObj as BasicPlant).plantData.plantStaticInfo) / 100;
               if(Math.random() < 0.7 - _loc1_)
               {
                  ExePlantAttack.calculate(selfObj,TDConstant.PlantKernalpultActionShoot);
               }
               else
               {
                  ExePlantAttack.calculate(selfObj,TDConstant.PlantKernalpultActionBuffShoot);
               }
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
