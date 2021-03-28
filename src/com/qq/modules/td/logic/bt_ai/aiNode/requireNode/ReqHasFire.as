package com.qq.modules.td.logic.bt_ai.aiNode.requireNode
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseZombieNodePvz;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ReqHasFire extends BaseZombieNodePvz
   {
       
      
      public function ReqHasFire()
      {
         super(BehaviourTreeNodeType.REQUIRE);
      }
      
      override public function calculate() : Boolean
      {
         return selfObj.objectModel.checkState(TDConstant.TDUnitState_HasTorch);
      }
   }
}
