package com.qq.modules.td.logic.bt_ai.aiNode.requireNode
{
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseZombieNodePvz;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ReqIsFlying extends BaseZombieNodePvz
   {
       
      
      private var param1:Boolean;
      
      public function ReqIsFlying()
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
         if(zombie.zombieData.isFlying == this.param1)
         {
            return true;
         }
         return false;
      }
   }
}
