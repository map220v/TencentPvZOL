package com.qq.modules.td.logic.bt_ai.aiNode.requireNode
{
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ReqHasZombieInAttackRange extends BaseNodePvz
   {
       
      
      protected var isAlived:Boolean = false;
      
      public function ReqHasZombieInAttackRange()
      {
         super(BehaviourTreeNodeType.REQUIRE);
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         if(param1[0] == "false")
         {
            this.isAlived = false;
         }
         else
         {
            this.isAlived = true;
         }
      }
      
      override public function calculate() : Boolean
      {
         var _loc1_:Vector.<IGameObject> = TDSearchTargetUtils.searchTargetForPlantWithAttackArea(selfObj as BasicPlant,[mySelfData.roadIndex],this.isAlived);
         if(_loc1_.length > 0)
         {
            selfObj.setAttackTarget(_loc1_[0]);
            return true;
         }
         return false;
      }
   }
}
