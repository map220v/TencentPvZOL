package com.qq.modules.td.logic.bt_ai.aiNode.executeNode.plant
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ExeLuckygrassAttack extends BaseNodePvz
   {
       
      
      public function ExeLuckygrassAttack()
      {
         super(BehaviourTreeNodeType.EXECUTE);
      }
      
      override public function calculate() : Boolean
      {
         if(selfObj.getActionID() == TDConstant.PLunckygrass_Blow)
         {
            return true;
         }
         selfObj.setAction(TDConstant.PLunckygrass_Blow);
         return true;
      }
   }
}
