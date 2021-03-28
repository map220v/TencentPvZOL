package com.qq.modules.td.logic.bt_ai.aiNode.executeNode
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ExeBalloonPop extends BaseNodePvz
   {
       
      
      public function ExeBalloonPop()
      {
         super(BehaviourTreeNodeType.EXECUTE);
      }
      
      override public function calculate() : Boolean
      {
         if(selfObj.getActionID() == TDConstant.ZAction_Pop)
         {
            return true;
         }
         selfObj.setAction(TDConstant.ZAction_Pop);
         return true;
      }
   }
}
