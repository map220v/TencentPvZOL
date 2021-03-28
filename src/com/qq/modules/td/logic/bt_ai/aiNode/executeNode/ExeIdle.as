package com.qq.modules.td.logic.bt_ai.aiNode.executeNode
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ExeIdle extends BaseNodePvz
   {
       
      
      public function ExeIdle()
      {
         super(BehaviourTreeNodeType.EXECUTE);
      }
      
      override public function calculate() : Boolean
      {
         if(selfObj.getActionID() == TDConstant.ZombieAnmi_Idle)
         {
            return true;
         }
         selfObj.animation.gotoAndPlay(TDConstant.ZombieAnmi_Idle);
         return true;
      }
   }
}
