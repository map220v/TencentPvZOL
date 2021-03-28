package com.qq.modules.td.logic.bt_ai.aiNode.executeNode.plant
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ExeCherryBombExplode extends BaseNodePvz
   {
       
      
      public function ExeCherryBombExplode()
      {
         super(BehaviourTreeNodeType.EXECUTE);
      }
      
      override public function calculate() : Boolean
      {
         if(selfObj.getActionID() == TDConstant.PCherryBombAction_Explode)
         {
            return true;
         }
         selfObj.setAction(TDConstant.PCherryBombAction_Explode);
         return true;
      }
   }
}
