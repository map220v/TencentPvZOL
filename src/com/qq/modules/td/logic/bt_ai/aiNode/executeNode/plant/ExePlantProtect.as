package com.qq.modules.td.logic.bt_ai.aiNode.executeNode.plant
{
   import com.qq.modules.td.logic.bt_ai.aiNode.BasePlantNodePvz;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ExePlantProtect extends BasePlantNodePvz
   {
       
      
      private var actionID:String = "PHealFlowerAction_Working";
      
      public function ExePlantProtect()
      {
         super(BehaviourTreeNodeType.EXECUTE);
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         this.actionID = param1[0];
      }
      
      override public function calculate() : Boolean
      {
         if(selfObj.getActionID() == this.actionID)
         {
            return true;
         }
         selfObj.setAction(this.actionID);
         return true;
      }
   }
}
