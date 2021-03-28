package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.zombie
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.ExeDoAction;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqAttackTarget;
   import com.qq.modules.td.logic.unit.zombie.TerracottaZombie;
   
   public class AI_Zombie_Terracotta extends BaseNodePvz
   {
       
      
      public function AI_Zombie_Terracotta()
      {
         super();
      }
      
      override public function calculate() : Boolean
      {
         if(this.terracotta.isWake)
         {
            if(ReqAttackTarget.calculateStatic(true,selfObj))
            {
               ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Eat);
            }
            else
            {
               ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Walk);
            }
         }
         else
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Terracotta_Popup);
         }
         return true;
      }
      
      private function get terracotta() : TerracottaZombie
      {
         return selfObj as TerracottaZombie;
      }
   }
}
