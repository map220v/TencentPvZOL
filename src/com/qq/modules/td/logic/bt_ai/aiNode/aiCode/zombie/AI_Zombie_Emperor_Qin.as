package com.qq.modules.td.logic.bt_ai.aiNode.aiCode.zombie
{
   import com.qq.CommandName;
   import com.qq.constant.td.TDConditionID;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.TDConditionTriggerManager;
   import com.qq.modules.td.logic.bt_ai.aiNode.BaseNodePvz;
   import com.qq.modules.td.logic.bt_ai.aiNode.executeNode.ExeDoAction;
   import com.qq.modules.td.logic.bt_ai.aiNode.requireNode.ReqZombieDurationExpire;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.utils.CommandDispatcher;
   
   public class AI_Zombie_Emperor_Qin extends BaseNodePvz
   {
       
      
      public function AI_Zombie_Emperor_Qin(param1:int = 30)
      {
         super(param1);
         CommandDispatcher.send(CommandName.TD_ShowOrHideBossHpBar,TDStageInfo.getInstance().checkGameType(TDConstant.TDgameType_Param_hasBossHpBar));
         TDConditionTriggerManager.instance.addCondition(TDConditionID.BOSS_APPEAR,true);
      }
      
      override public function calculate() : Boolean
      {
         var _loc2_:Boolean = false;
         var _loc1_:int = selfObj.getRunningProp(TDConstant.GameObject_Prop_EmperorQin_State);
         if(_loc1_ == 0)
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_EmperorQin_DrillOut);
         }
         else
         {
            _loc2_ = selfObj.getRunningProp(TDConstant.GameObject_Prop_BossStateChangeFinished);
            if(!_loc2_)
            {
               if(_loc1_ == 3 || _loc1_ == 2)
               {
                  ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_EmperorQin_WakeUp);
               }
            }
            else if(selfObj.hasRunningProp(TDConstant.GameObject_Prop_IsCastSkill) && selfObj.getRunningProp(TDConstant.GameObject_Prop_IsCastSkill) == true)
            {
               selfObj.cleanRunningProp(TDConstant.GameObject_Prop_IsCastSkill);
               ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_EmperorQin_CastSkill);
            }
            else if(ReqZombieDurationExpire.calculateStatic(selfObj,true) && selfObj.getRunningProp(TDConstant.Gameobject_Prop_SummonZombie_IsCanStart))
            {
               ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_EmperorQin_SummonZombie);
            }
            else
            {
               ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Idle);
            }
         }
         return true;
      }
   }
}
