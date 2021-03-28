package com.qq.modules.td.logic.bt_ai.aiNode.executeNode
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ExeCatchSunEnd extends BaseNodePvz
   {
       
      
      public function ExeCatchSunEnd()
      {
         super(BehaviourTreeNodeType.EXECUTE);
      }
      
      override public function calculate() : Boolean
      {
         if(selfObj.getActionID() == TDConstant.ZAction_CatchSunEnd)
         {
            return true;
         }
         if(selfObj.getActionID() == TDConstant.ZAction_CatchSun)
         {
            selfObj.setAction(TDConstant.ZAction_CatchSunEnd);
            return true;
         }
         return false;
      }
   }
}
