package com.qq.modules.td.logic.bt_ai.aiNode.executeNode
{
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ExeCustomProp extends BaseNodePvz
   {
       
      
      private var propName:String;
      
      private var propValue:Boolean;
      
      public function ExeCustomProp()
      {
         super(BehaviourTreeNodeType.EXECUTE);
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         if(param1 != null)
         {
            this.propName = param1[0];
            if(param1[1] == "false")
            {
               this.propValue = false;
            }
            if(param1[1] == "true")
            {
               this.propValue = true;
            }
         }
      }
      
      override public function calculate() : Boolean
      {
         selfObj.setAICustomProp(this.propName,this.propValue);
         return true;
      }
   }
}
