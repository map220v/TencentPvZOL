package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.zombie
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.ExeDoAction;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqAttackTarget;
   import com.qq.modules.td.logic.unit.zombie.BarrelRollerZombie;
   
   public class AI_Zombie_BarrelRoller extends BaseNodePvz
   {
       
      
      public function AI_Zombie_BarrelRoller(param1:int = 30)
      {
         super(param1);
      }
      
      override public function calculate() : Boolean
      {
         if(ReqAttackTarget.calculateStatic(true,selfObj))
         {
            if(this.barrelRoller.barrel && this.barrelRoller.barrel.isVaild)
            {
               ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Eat);
            }
            else
            {
               ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Eat2);
            }
         }
         else if(this.barrelRoller.barrel && this.barrelRoller.barrel.isVaild)
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_BarrelRoller_Walk);
         }
         else
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Walk2);
         }
         return true;
      }
      
      private function get barrelRoller() : BarrelRollerZombie
      {
         return selfObj as BarrelRollerZombie;
      }
   }
}
