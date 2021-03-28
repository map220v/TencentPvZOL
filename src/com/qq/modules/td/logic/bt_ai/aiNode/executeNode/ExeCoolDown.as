package com.qq.modules.td.logic.bt_ai.aiNode.executeNode
{
   import com.qq.modules.td.data.game.unit.TDPlantData;
   import com.qq.modules.td.logic.bt_ai.aiNode.BasePlantNodePvz;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ExeCoolDown extends BasePlantNodePvz
   {
       
      
      private var param1:Boolean = false;
      
      public function ExeCoolDown()
      {
         super(BehaviourTreeNodeType.EXECUTE);
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
            (plant.objectModel as TDPlantData).isCoolDown = true;
         }
         else
         {
            (plant.objectModel as TDPlantData).isCoolDown = false;
         }
         return true;
      }
   }
}
