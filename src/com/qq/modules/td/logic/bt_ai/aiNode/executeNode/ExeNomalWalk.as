package com.qq.modules.td.logic.bt_ai.aiNode.executeNode
{
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ExeNomalWalk extends BaseNodePvz
   {
       
      
      private var param1:String = "ZAction_Walk";
      
      public function ExeNomalWalk()
      {
         super(BehaviourTreeNodeType.EXECUTE);
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         if(param1 != null)
         {
            this.param1 = param1[0];
         }
      }
      
      override public function calculate() : Boolean
      {
         if(selfObj.getActionID() == this.param1)
         {
            return true;
         }
         selfObj.setAction(this.param1);
         return true;
      }
   }
}
