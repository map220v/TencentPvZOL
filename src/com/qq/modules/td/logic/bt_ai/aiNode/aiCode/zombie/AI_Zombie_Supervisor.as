package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.zombie
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.ExeDoAction;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqAttackTarget;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqZombieDurationExpire;
   
   public class AI_Zombie_Supervisor extends BaseNodePvz
   {
      
      private static const NOMARL_WALK_END_FRAME:uint = 146;
       
      
      public function AI_Zombie_Supervisor()
      {
         super();
      }
      
      override public function calculate() : Boolean
      {
         if(ReqAttackTarget.calculateStatic(true,selfObj))
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Supervisor_Eat);
            return true;
         }
         if(selfObj.getActionID() == TDConstant.ZAction_Supervisor_AddSpeed)
         {
            return true;
         }
         if(ReqZombieDurationExpire.calculateStatic(selfObj,true) && selfObj.animation.currentFrame >= NOMARL_WALK_END_FRAME)
         {
            if(!selfObj.objectModel.hasBuff(TDConstant.TDBuffID_SpeedUp_Sup))
            {
               ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Supervisor_AddSpeed);
               return true;
            }
         }
         ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Walk);
         return true;
      }
   }
}
