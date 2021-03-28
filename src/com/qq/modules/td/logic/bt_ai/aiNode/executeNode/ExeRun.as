package com.qq.modules.td.logic.bt_ai.aiNode.executeNode
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseZombieNodePvz;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ExeRun extends BaseZombieNodePvz
   {
       
      
      public function ExeRun()
      {
         super(BehaviourTreeNodeType.EXECUTE);
      }
      
      override public function calculate() : Boolean
      {
         if(selfObj.getActionID() == TDConstant.ZAction_Run)
         {
            return true;
         }
         selfObj.setAction(TDConstant.ZAction_Run);
         return true;
      }
   }
}
