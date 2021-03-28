package com.qq.modules.td.logic.bt_ai.aiNode.executeNode.plant
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import com.qq.modules.td.logic.unit.basic.GameObject;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ExeMagnetIronArmor extends BaseNodePvz
   {
       
      
      public function ExeMagnetIronArmor()
      {
         super(BehaviourTreeNodeType.EXECUTE);
      }
      
      override public function calculate() : Boolean
      {
         if((selfObj as GameObject).getActionID() == TDConstant.PMagnetAction_Working)
         {
            return true;
         }
         selfObj.setAction(TDConstant.PMagnetAction_Working);
         return true;
      }
   }
}
