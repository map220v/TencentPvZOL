package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.plant
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BasePlantNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.ExeDoAction;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.plant.ExePlantResetDuration;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqPlantCurAction;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqPlantDurationExpire;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   
   public class AI_plant_wintermelon extends BasePlantNodePvz
   {
       
      
      public function AI_plant_wintermelon(param1:int = 30)
      {
         super(param1);
      }
      
      override public function calculate() : Boolean
      {
         var _loc1_:IGameObject = null;
         if(ReqPlantCurAction.calculate(selfObj,false,TDConstant.PlantAction_Shoot))
         {
            if(ReqPlantDurationExpire.calculate(selfObj))
            {
               _loc1_ = TDSearchTargetUtils.getOneTargetByRoad(plant.plantData.plantStaticInfo.baseInfo.isAttackFlight == 1,false,selfObj);
               if(!_loc1_)
               {
                  _loc1_ = TDSearchTargetUtils.searchOneTargetByRoads(plant);
               }
               if(_loc1_)
               {
                  plant.setAttackTarget(_loc1_);
                  ExePlantResetDuration.calculate(selfObj);
                  ExeDoAction.calculateStatic(selfObj,TDConstant.PlantAction_Shoot);
               }
               else
               {
                  ExeDoAction.calculateStatic(selfObj,TDConstant.PlantAction_Idle);
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
