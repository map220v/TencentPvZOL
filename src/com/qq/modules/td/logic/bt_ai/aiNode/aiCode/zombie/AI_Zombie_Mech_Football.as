package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.zombie
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseZombieNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.ExeDoAction;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqAttackTarget;
   
   public class AI_Zombie_Mech_Football extends BaseZombieNodePvz
   {
       
      
      public function AI_Zombie_Mech_Football(param1:int = 30)
      {
         super(param1);
      }
      
      override public function calculate() : Boolean
      {
         if(ReqAttackTarget.calculateStatic(true,selfObj))
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_MechFootball_Bump);
         }
         else
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Walk);
         }
         return true;
      }
   }
}
