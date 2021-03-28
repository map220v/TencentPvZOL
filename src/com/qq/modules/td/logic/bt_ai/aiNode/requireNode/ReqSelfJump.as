package com.qq.modules.td.logic.bt_ai.aiNode.requireNode
{
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseZombieNodePvz;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ReqSelfJump extends BaseZombieNodePvz
   {
       
      
      private var param1:Boolean = false;
      
      public function ReqSelfJump()
      {
         super(BehaviourTreeNodeType.REQUIRE);
      }
      
      override public function setDynamicParams(param1:Array) : void
      {
         if(param1[0] == "false")
         {
            this.param1 = false;
         }
         if(param1[0] == "true")
         {
            this.param1 = true;
         }
      }
      
      override public function calculate() : Boolean
      {
         var _loc1_:Boolean = zombie.zombieData.canJump;
         if(this.param1 == true)
         {
            return !!_loc1_ ? true : false;
         }
         return !!_loc1_ ? false : true;
      }
   }
}
