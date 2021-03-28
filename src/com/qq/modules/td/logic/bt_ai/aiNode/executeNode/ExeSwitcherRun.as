package com.qq.modules.td.logic.bt_ai.aiNode.executeNode
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ExeSwitcherRun extends BaseNodePvz
   {
       
      
      public function ExeSwitcherRun()
      {
         super(BehaviourTreeNodeType.EXECUTE);
      }
      
      override public function calculate() : Boolean
      {
         var _loc1_:String = selfObj.getActionID();
         if(_loc1_ != TDConstant.SwitcherActionRun)
         {
            selfObj.setAction(TDConstant.SwitcherActionRun);
         }
         _loc1_ = selfObj.getActionID();
         return true;
      }
   }
}
