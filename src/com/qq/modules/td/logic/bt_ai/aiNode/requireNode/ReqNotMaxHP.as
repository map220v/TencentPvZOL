package com.qq.modules.td.logic.bt_ai.aiNode.requireNode
{
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseZombieNodePvz;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ReqNotMaxHP extends BaseZombieNodePvz
   {
       
      
      public function ReqNotMaxHP()
      {
         super(BehaviourTreeNodeType.REQUIRE);
      }
      
      override public function calculate() : Boolean
      {
         if(zombie.zombieData.curHp.get() < zombie.zombieData.maxHp.get())
         {
            return true;
         }
         return false;
      }
   }
}
