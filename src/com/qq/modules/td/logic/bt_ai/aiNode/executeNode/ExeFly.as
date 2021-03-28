package com.qq.modules.td.logic.bt_ai.aiNode.executeNode
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ExeFly extends BaseNodePvz
   {
       
      
      public function ExeFly()
      {
         super(BehaviourTreeNodeType.EXECUTE);
      }
      
      override public function calculate() : Boolean
      {
         if(selfObj.getActionID() == TDConstant.ZAction_Fly)
         {
            return true;
         }
         selfObj.setAction(TDConstant.ZAction_Fly);
         return true;
      }
   }
}
