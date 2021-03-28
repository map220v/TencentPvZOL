package com.qq.modules.td.logic.bt_ai.aiNode.requireNode
{
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseZombieNodePvz;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ReqArmorValid extends BaseZombieNodePvz
   {
       
      
      private var param1:Boolean = false;
      
      public function ReqArmorValid()
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
         var _loc1_:Boolean = false;
         if(zombie.isVaild && zombie.zombieData.isExistArmor())
         {
            _loc1_ = true;
         }
         return _loc1_ == this.param1 ? true : false;
      }
   }
}
