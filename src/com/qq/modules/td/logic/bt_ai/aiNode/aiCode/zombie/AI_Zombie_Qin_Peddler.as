package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.zombie
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.ExeDoAction;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqZombieDurationExpire;
   
   public class AI_Zombie_Qin_Peddler extends BaseNodePvz
   {
       
      
      public function AI_Zombie_Qin_Peddler()
      {
         super();
      }
      
      override public function calculate() : Boolean
      {
         if(ReqZombieDurationExpire.calculateStatic(selfObj,true))
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_PeddlerSetPig);
         }
         else
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Walk);
         }
         return true;
      }
   }
}
