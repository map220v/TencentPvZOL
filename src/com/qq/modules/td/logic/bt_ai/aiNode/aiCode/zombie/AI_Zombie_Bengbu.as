package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.zombie
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseZombieNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.ExeDoAction;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqAttackTarget;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqZombieDurationExpire;
   import com.qq.modules.td.model.TDGameInfo;
   
   public class AI_Zombie_Bengbu extends BaseZombieNodePvz
   {
       
      
      public function AI_Zombie_Bengbu(param1:int = 30)
      {
         super(param1);
      }
      
      override public function calculate() : Boolean
      {
         var _loc1_:Boolean = false;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(zombie && zombie.zombieData && zombie.zombieData.armorData)
         {
            if(zombie.zombieData.armorData[0] && zombie.zombieData.armorData[0][TDConstant.Armor_Hp] > 0)
            {
               _loc1_ = true;
            }
         }
         if(ReqZombieDurationExpire.calculateStatic(selfObj,true) && _loc1_)
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Bengbu_CastSkill);
         }
         else if(zombie.getRunningProp(TDConstant.Gameobject_Prop_Bengbu_Hidden) != true)
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
            _loc2_ = zombie.zombieData.zombiestaticInfo.getParam(TDConstant.Zombie_Param_Hidden_Duration);
            _loc3_ = TDGameInfo.getInstance().getCurGameTime();
            _loc4_ = zombie.getRunningProp(TDConstant.Gameobject_Prop_Bengbu_Hidden_Time);
            if(_loc3_ >= _loc4_ + _loc2_)
            {
               ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Bengbu_FreeSkill);
            }
         }
         return true;
      }
   }
}
