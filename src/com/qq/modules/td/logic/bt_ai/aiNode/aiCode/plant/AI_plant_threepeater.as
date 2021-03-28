package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.plant
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.plant.ExePlantAttack;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.plant.ExePlantIdle;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.plant.ExePlantResetDuration;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqPlantCurAction;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqPlantDurationExpire;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.model.TDGameInfo;
   
   public class AI_plant_threepeater extends BaseNodePvz
   {
       
      
      public function AI_plant_threepeater()
      {
         super();
      }
      
      override public function calculate() : Boolean
      {
         if(ReqPlantCurAction.calculate(selfObj,false,TDConstant.PThreepeaterAction_Shoot))
         {
            if(ReqPlantDurationExpire.calculate(selfObj) && TDSearchTargetUtils.searchOneTargetByRoads(selfObj,this.getAttackRoads()))
            {
               ExePlantResetDuration.calculate(selfObj);
               ExePlantAttack.calculate(selfObj,TDConstant.PThreepeaterAction_Shoot);
            }
            else
            {
               ExePlantIdle.calculate(selfObj,TDConstant.PlantAction_Idle);
            }
         }
         return true;
      }
      
      private function getAttackRoads() : Array
      {
         var _loc2_:int = 0;
         var _loc1_:Array = [];
         var _loc3_:int = -1;
         while(_loc3_ <= 1)
         {
            _loc2_ = selfObj.objectModel.roadIndex + _loc3_;
            if(_loc2_ >= TDGameInfo.getInstance().minRow && _loc2_ <= TDGameInfo.getInstance().maxRow)
            {
               _loc1_.push(_loc2_);
            }
            _loc3_++;
         }
         return _loc1_;
      }
   }
}
