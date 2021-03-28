package com.qq.modules.td.logic.bt_ai.aiNode.executeNode
{
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ExeFrozenAI extends BaseNodePvz
   {
       
      
      public function ExeFrozenAI()
      {
         super(BehaviourTreeNodeType.EXECUTE);
      }
      
      override public function calculate() : Boolean
      {
         selfObj.setFrozenAI(true);
         return true;
      }
   }
}
