package com.qq.modules.td.logic.bt_ai.aiNode.requireNode
{
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ReqNotState extends BaseNodePvz
   {
       
      
      private var _notState:String;
      
      public function ReqNotState()
      {
         super(BehaviourTreeNodeType.REQUIRE);
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         this._notState = String(param1[0]);
      }
      
      override public function calculate() : Boolean
      {
         return selfObj.getActionID() != this._notState;
      }
   }
}
