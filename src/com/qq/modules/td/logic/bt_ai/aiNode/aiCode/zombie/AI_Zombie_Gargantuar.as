package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.zombie
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.ExeDoAction;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqAttackTarget;
   import com.qq.modules.td.logic.unit.zombie.GargantuarZombie;
   
   public class AI_Zombie_Gargantuar extends BaseNodePvz
   {
       
      
      public function AI_Zombie_Gargantuar(param1:int = 30)
      {
         super(param1);
      }
      
      override public function calculate() : Boolean
      {
         if(this.zombieGargantuar.isHaveImp && selfObj.objectModel.curHp.get() < selfObj.objectModel.maxHp.get() * 0.4)
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Gargantuar_LaunchImp);
         }
         else if(ReqAttackTarget.calculateStatic(true,selfObj))
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Gargantuar_Smash);
         }
         else
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Walk);
         }
         return true;
      }
      
      public function get zombieGargantuar() : GargantuarZombie
      {
         return selfObj as GargantuarZombie;
      }
   }
}
