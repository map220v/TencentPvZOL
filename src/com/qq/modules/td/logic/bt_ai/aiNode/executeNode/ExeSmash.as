package com.qq.modules.td.logic.bt_ai.aiNode.executeNode
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ExeSmash extends BaseNodePvz
   {
       
      
      public function ExeSmash()
      {
         super(BehaviourTreeNodeType.EXECUTE);
      }
      
      override public function calculate() : Boolean
      {
         if(selfObj.getActionID() == TDConstant.ZAction_Gargantuar_Smash)
         {
            return true;
         }
         selfObj.setAction(TDConstant.ZAction_Gargantuar_Smash);
         return true;
      }
   }
}
