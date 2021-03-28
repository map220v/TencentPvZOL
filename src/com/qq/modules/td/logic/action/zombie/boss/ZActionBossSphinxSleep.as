package com.qq.modules.td.logic.action.zombie.boss
{
   import com.qq.CommandName;
   import com.qq.constant.td.TDConditionID;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.logic.TDConditionTriggerManager;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.utils.CommandDispatcher;
   import org.as3commons.logging.api.getLogger;
   
   public class ZActionBossSphinxSleep extends BasicAction
   {
       
      
      public function ZActionBossSphinxSleep()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         getLogger("boss").info("boss sleep");
         super.enterState(param1);
         var _loc2_:int = _gameObject.getRunningProp(TDConstant.GameObject_Prop_BossSphinx_State);
         if(_loc2_ == 1)
         {
            _gameObject.setAction(TDConstant.ZAction_BossSphinx_Attack1);
         }
         else if(_loc2_ == 2)
         {
            _gameObject.setAction(TDConstant.ZAction_BossSphinx_WaitingAngle);
         }
         else
         {
            _gameObject.setRunningProp(TDConstant.GameObject_Prop_BossSphinx_State,0);
            _gameObject.objectModel.addBuff(TDConstant.TDBuffID_God,_gameObject);
            _gameObject.animation.gotoAndPlay("idle",true);
         }
         CommandDispatcher.send(CommandName.TD_ShowOrHideBossHpBar,TDStageInfo.getInstance().checkGameType(TDConstant.TDgameType_Param_hasBossHpBar));
         TDConditionTriggerManager.instance.addCondition(TDConditionID.BOSS_APPEAR,true);
      }
      
      override public function runningState() : void
      {
         super.runningState();
         if(_gameObject.getRunningProp(TDConstant.GameObject_Prop_BossSphinx_State) == 1)
         {
            _gameObject.setAction(TDConstant.ZAction_BossSphinx_Attack1);
         }
      }
   }
}
