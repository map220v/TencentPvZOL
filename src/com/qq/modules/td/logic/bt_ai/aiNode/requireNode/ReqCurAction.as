package com.qq.modules.td.logic.bt_ai.aiNode.requireNode
{
   import com.qq.modules.td.logic.bt_ai.aiNode.BasePlantNodePvz;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ReqCurAction extends BasePlantNodePvz
   {
       
      
      public function ReqCurAction()
      {
         super(BehaviourTreeNodeType.REQUIRE);
      }
      
      public static function calculate(param1:IGameObject, param2:Boolean, param3:String) : Boolean
      {
         if(param1.getActionID() == param3)
         {
            return !!param2 ? true : false;
         }
         return !!param2 ? false : true;
      }
   }
}
