package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.plant
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BasePlantNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.ExeDoAction;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.plant.ExePlantResetDuration;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqHasShootZombie;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqPlantCurAction;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqPlantDurationExpire;
   import com.qq.modules.td.logic.talent.TalentManager;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   
   public class AI_plant_laserbean extends BasePlantNodePvz
   {
       
      
      public function AI_plant_laserbean(param1:int = 30)
      {
         super(param1);
      }
      
      override public function calculate() : Boolean
      {
         var _loc1_:int = 0;
         if(ReqPlantCurAction.calculate(selfObj,false,TDConstant.PLaserbeanAction_Shoot))
         {
            if(ReqPlantDurationExpire.calculate(selfObj) && ReqHasShootZombie.calculate(selfObj))
            {
               ExePlantResetDuration.calculate(selfObj);
               ExeDoAction.calculateStatic(selfObj,TDConstant.PLaserbeanAction_Shoot);
               _loc1_ = TalentManager.instance.getAddBuffId((selfObj as BasicPlant).plantData.plantStaticInfo);
               if(_loc1_ > 0 && !(selfObj as BasicPlant).objectModel.hasBuff(_loc1_))
               {
                  (selfObj as BasicPlant).objectModel.addBuff(_loc1_,selfObj);
               }
            }
            else
            {
               ExeDoAction.calculateStatic(selfObj,TDConstant.PlantAction_Idle);
            }
         }
         return true;
      }
   }
}
