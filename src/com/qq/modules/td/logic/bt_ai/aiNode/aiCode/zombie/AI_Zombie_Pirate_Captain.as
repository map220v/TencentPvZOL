package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.zombie
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.ExeDoAction;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqAttackTarget;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqZombieDurationExpire;
   import com.qq.modules.td.logic.unit.zombie.PirateCaptainZombie;
   import com.qq.modules.td.model.TDGameInfo;
   
   public class AI_Zombie_Pirate_Captain extends BaseNodePvz
   {
       
      
      public function AI_Zombie_Pirate_Captain(param1:int = 30)
      {
         super(param1);
      }
      
      override public function calculate() : Boolean
      {
         if(ReqZombieDurationExpire.calculateStatic(selfObj,true))
         {
            if(!this.zombieCaptain.isHaveParrot)
            {
               ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_PirateCaptain_GetParrot);
            }
            else if(TDGameInfo.getInstance().getGameObjectCount(TDConstant.UnitCatalog_Plant) > 0)
            {
               ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_PirateCaptain_ReleaseParrot);
            }
            else if(ReqAttackTarget.calculateStatic(true,selfObj))
            {
               ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Eat);
            }
            else
            {
               ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Walk);
            }
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
      
      public function get zombieCaptain() : PirateCaptainZombie
      {
         return selfObj as PirateCaptainZombie;
      }
   }
}
