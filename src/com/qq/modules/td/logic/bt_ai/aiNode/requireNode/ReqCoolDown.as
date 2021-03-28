package com.qq.modules.td.logic.bt_ai.aiNode.requireNode
{
   import com.qq.modules.td.data.game.unit.TDPlantData;
   import com.qq.modules.td.logic.bt_ai.aiNode.BasePlantNodePvz;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ReqCoolDown extends BasePlantNodePvz
   {
       
      
      private var param1:Boolean = false;
      
      public function ReqCoolDown()
      {
         super(BehaviourTreeNodeType.REQUIRE);
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         if(param1[0] == "false")
         {
            this.param1 = false;
         }
         else
         {
            this.param1 = true;
         }
      }
      
      override public function calculate() : Boolean
      {
         if(this.param1 == true)
         {
            return !!(plant.objectModel as TDPlantData).isCoolDown ? true : false;
         }
         return !!(plant.objectModel as TDPlantData).isCoolDown ? false : true;
      }
   }
}
