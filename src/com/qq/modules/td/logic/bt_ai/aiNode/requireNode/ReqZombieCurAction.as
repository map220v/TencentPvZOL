package com.qq.modules.td.logic.bt_ai.aiNode.requireNode
{
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiUtils.DataCompareUtils;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ReqZombieCurAction extends BaseNodePvz
   {
       
      
      private var param1:String;
      
      private var param2:String;
      
      public function ReqZombieCurAction()
      {
         super(BehaviourTreeNodeType.REQUIRE);
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         this.param1 = param1[0];
         this.param2 = param1[1];
      }
      
      override public function calculate() : Boolean
      {
         return Boolean(DataCompareUtils.compareString(this.param2,this.param1,selfObj.getActionID()));
      }
   }
}
