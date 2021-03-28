package com.qq.modules.td.logic.bt_ai.aiNode.executeNode.zombie
{
   import asgui.blit.bone.BlitBoneAnim;
   import com.qq.modules.td.command.game.TDHurtPlantCmd;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseZombieNodePvz;
   import tencent.tools.behaviourTrees.BehaviourTreeNodeType;
   
   public class ExeFirePlant extends BaseZombieNodePvz
   {
       
      
      private var boneAnim:BlitBoneAnim;
      
      public function ExeFirePlant()
      {
         super(BehaviourTreeNodeType.EXECUTE);
      }
      
      override public function calculate() : Boolean
      {
         if(zombie.curAttackTarget)
         {
            TDHurtPlantCmd.firePlant(zombie.curAttackTarget);
         }
         return true;
      }
   }
}
