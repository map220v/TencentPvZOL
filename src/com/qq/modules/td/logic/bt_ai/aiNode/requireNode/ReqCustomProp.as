package com.qq.modules.td.logic.bt_ai.aiNode.requireNode
{
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ReqCustomProp extends BaseNodePvz
   {
       
      
      private var propName:String;
      
      private var propValue:Boolean;
      
      public function ReqCustomProp()
      {
         super(BehaviourTreeNodeType.REQUIRE);
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
         if(!selfObj.hasAICustomProp(this.propName))
         {
            return false == this.propValue;
         }
         return Boolean(selfObj.checkAICustomProp(this.propName,this.propValue));
      }
   }
}
