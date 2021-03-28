package com.qq.modules.td.logic.bt_ai.aiNode.executeNode
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ExeSwitcherIdle extends BaseNodePvz
   {
       
      
      public function ExeSwitcherIdle()
      {
         super(BehaviourTreeNodeType.EXECUTE);
      }
      
      override public function calculate() : Boolean
      {
         if(selfObj.getActionID() == TDConstant.SwitcherActionIdle)
         {
            return true;
         }
         selfObj.setAction(TDConstant.SwitcherActionIdle);
         return true;
      }
   }
}
