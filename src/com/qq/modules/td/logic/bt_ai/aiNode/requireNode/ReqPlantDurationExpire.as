package com.qq.modules.td.logic.bt_ai.aiNode.requireNode
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.model.TDGameInfo;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ReqPlantDurationExpire extends BaseNodePvz
   {
       
      
      public function ReqPlantDurationExpire()
      {
         super(BehaviourTreeNodeType.REQUIRE);
      }
      
      public static function calculate(param1:IGameObject) : Boolean
      {
         if(TDGameInfo.getInstance().getCurGameTime() - param1.getTimeRecord(TDConstant.TimeRecord_PlantDuration) > (param1 as BasicPlant).plantData.duration)
         {
            return true;
         }
         return false;
      }
      
      override public function calculate() : Boolean
      {
         if(TDGameInfo.getInstance().getCurGameTime() - selfObj.getTimeRecord(TDConstant.TimeRecord_PlantDuration) > (selfObj as BasicPlant).plantData.duration)
         {
            return true;
         }
         return false;
      }
   }
}
