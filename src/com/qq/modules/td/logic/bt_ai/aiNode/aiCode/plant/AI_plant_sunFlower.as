package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.plant
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.plant.ExePlantIdle;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqPlantCurAction;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.model.TDGameInfo;
   
   public class AI_plant_sunFlower extends BaseNodePvz
   {
       
      
      public function AI_plant_sunFlower()
      {
         super();
      }
      
      override public function calculate() : Boolean
      {
         var _loc3_:Number = NaN;
         if(ReqPlantCurAction.calculate(selfObj,true,"PlantSunFlowerAction_Product"))
         {
            return true;
         }
         var _loc1_:Number = TDGameInfo.getInstance().getCurGameTime();
         if(!selfObj.hasRunningProp(TDConstant.GameObject_Prop_Sunflower_CDTime))
         {
            _loc3_ = TDGameInfo.getInstance().getSunFlowerNextLaunchDuration(selfObj.uid,(selfObj as BasicPlant).plantData.duration) + _loc1_;
            selfObj.setRunningProp(TDConstant.GameObject_Prop_Sunflower_CDTime,_loc3_);
         }
         var _loc2_:Number = selfObj.getRunningProp(TDConstant.GameObject_Prop_Sunflower_CDTime);
         if(_loc1_ > _loc2_)
         {
            _loc2_ = TDGameInfo.getInstance().getSunFlowerNextLaunchDuration(selfObj.uid,(selfObj as BasicPlant).plantData.duration) + _loc1_;
            selfObj.setRunningProp(TDConstant.GameObject_Prop_Sunflower_CDTime,_loc2_);
            ExePlantIdle.calculate(selfObj,"PlantSunFlowerAction_Product");
            return true;
         }
         ExePlantIdle.calculate(selfObj,"PPeaShooterAction_Idle");
         return true;
      }
   }
}
