package com.qq.modules.td.logic.bt_ai.aiNode.executeNode
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import com.qq.modules.td.logic.unit.basic.GameObject;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ExeGasp extends BaseNodePvz
   {
       
      
      public function ExeGasp()
      {
         super(BehaviourTreeNodeType.EXECUTE);
      }
      
      override public function calculate() : Boolean
      {
         if((selfObj as GameObject).getActionID() == TDConstant.ZAction_Gasp)
         {
            return true;
         }
         selfObj.setAction(TDConstant.ZAction_Gasp);
         return true;
      }
   }
}
