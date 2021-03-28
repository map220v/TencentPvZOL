package com.qq.modules.td.logic.bt_ai.aiNode.executeNode.plant
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ExePlantResetDuration extends BaseNodePvz
   {
       
      
      public function ExePlantResetDuration()
      {
         super(BehaviourTreeNodeType.EXECUTE);
      }
      
      public static function calculate(param1:IGameObject) : Boolean
      {
         param1.setTimeRecord(TDConstant.TimeRecord_PlantDuration,TDGameInfo.getInstance().getCurGameTime());
         return true;
      }
      
      override public function calculate() : Boolean
      {
         selfObj.setTimeRecord(TDConstant.TimeRecord_PlantDuration,TDGameInfo.getInstance().getCurGameTime());
         return true;
      }
   }
}
