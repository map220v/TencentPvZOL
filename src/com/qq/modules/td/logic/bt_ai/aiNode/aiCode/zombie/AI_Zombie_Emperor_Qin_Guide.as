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
   
   public class AI_Zombie_Emperor_Qin_Guide extends BaseNodePvz
   {
       
      
      private var wakeuped:Boolean;
      
      public function AI_Zombie_Emperor_Qin_Guide(param1:int = 30)
      {
         super(param1);
         CommandDispatcher.send(CommandName.TD_ShowOrHideBossHpBar,TDStageInfo.getInstance().checkGameType(TDConstant.TDgameType_Param_hasBossHpBar));
         CommandDispatcher.send(CommandName.TD_ProcessBar_ToFinal);
         TDConditionTriggerManager.instance.addCondition(TDConditionID.BOSS_APPEAR,true);
      }
      
      override public function calculate() : Boolean
      {
         var _loc1_:int = selfObj.getRunningProp(TDConstant.GameObject_Prop_EmperorQin_State);
         if(_loc1_ == 0)
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_EmperorQin_DrillOut);
         }
         else if(_loc1_ == 1 && !this.wakeuped && selfObj.getActionID() != TDConstant.ZAction_EmperorQin_WakeUp)
         {
            this.wakeuped = true;
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_EmperorQin_WakeUp);
         }
         else if(ReqZombieDurationExpire.calculateStatic(selfObj,true))
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_EmperorQin_SummonZombie);
         }
         else
         {
            ExeDoAction.calculateStatic(selfObj,TDConstant.ZAction_Idle);
         }
         return true;
      }
   }
}
