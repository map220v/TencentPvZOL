package com.qq.modules.td.logic.bt_ai.aiNode.executeNode
{
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ExeDoAction extends BaseNodePvz
   {
       
      
      private var param1:String = "";
      
      public function ExeDoAction()
      {
         super(BehaviourTreeNodeType.EXECUTE);
      }
      
      public static function calculateStatic(param1:IGameObject, param2:String, param3:Array = null, param4:Boolean = false, param5:Boolean = false) : Boolean
      {
         if(param1.getActionID() == param2)
         {
            return true;
         }
         if(param5 && param1.getActionID() != null)
         {
            return true;
         }
         param1.setAction(param2,param3,param4);
         return true;
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
