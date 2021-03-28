package com.qq.modules.td.logic.bt_ai.aiNode.executeNode.plant
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ExeFadeOutPlant extends BaseNodePvz
   {
       
      
      public function ExeFadeOutPlant()
      {
         super(BehaviourTreeNodeType.EXECUTE);
      }
      
      override public function calculate() : Boolean
      {
         if(selfObj.getActionID() == TDConstant.PlantAction_FadeOut)
         {
            return true;
         }
         selfObj.setAction(TDConstant.PlantAction_FadeOut);
         return true;
      }
   }
}
