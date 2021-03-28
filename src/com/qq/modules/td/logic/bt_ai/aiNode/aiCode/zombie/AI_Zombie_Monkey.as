package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.zombie
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseZombieNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.ExeDoAction;
   
   public class AI_Zombie_Monkey extends BaseZombieNodePvz
   {
       
      
      public function AI_Zombie_Monkey()
      {
         super();
      }
      
      override public function calculate() : Boolean
      {
         ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Monkey_Attack);
         return true;
      }
   }
}
