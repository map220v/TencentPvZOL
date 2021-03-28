package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.zombie
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseZombieNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.ExeDoAction;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqAttackTarget;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqZombieDurationExpire;
   
   public class AI_Zombie_Poison extends BaseZombieNodePvz
   {
       
      
      public function AI_Zombie_Poison()
      {
         super();
      }
      
      override public function calculate() : Boolean
      {
         if(ReqZombieDurationExpire.calculateStatic(selfObj,true))
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Poison_Caster);
         }
         else if(ReqAttackTarget.calculateStatic(true,selfObj))
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Eat);
         }
         else
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Walk);
         }
         return true;
      }
   }
}
