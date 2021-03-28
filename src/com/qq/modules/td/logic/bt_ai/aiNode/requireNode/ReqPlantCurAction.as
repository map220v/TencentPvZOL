package com.qq.modules.td.logic.bt_ai.aiNode.requireNode
{
   import com.qq.modules.td.logic.bt_ai.aiNode.BasePlantNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiUtils.DataCompareUtils;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ReqPlantCurAction extends BasePlantNodePvz
   {
       
      
      private var param1:String;
      
      private var param2:String;
      
      public function ReqPlantCurAction()
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
      
      override public function setDynamicParams(param1:Array) : void
      {
         this.param1 = param1[0];
         this.param2 = param1[1];
      }
      
      override public function calculate() : Boolean
      {
         return Boolean(DataCompareUtils.compareString(this.param2,this.param1,plant.getActionID()));
      }
   }
}
