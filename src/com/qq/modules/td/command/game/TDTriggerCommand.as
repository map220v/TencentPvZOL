package com.qq.modules.td.command.game
{
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDZombieSkillType;
   import com.qq.modules.td.command.game.skill.TDSkillCmd;
   import com.qq.modules.td.data.game.skill.TDSkillInfo;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDMiniGameTerracottaMemoryData;
   import com.qq.utils.CommandDispatcher;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class TDTriggerCommand extends StrongRobotlegCommand
   {
       
      
      public function TDTriggerCommand()
      {
         super();
      }
      
      public function wakeupBossSphinx() : void
      {
         var _loc2_:IGameObject = null;
         var _loc1_:Array = TDGameInfo.getInstance().getZombieListByType(TDConstant.ZombieType_BOSS_Sphinx);
         if(_loc1_.length > 0)
         {
            _loc2_ = _loc1_[0];
            _loc2_.setRunningProp(TDConstant.GameObject_Prop_BossSphinx_State,1);
         }
      }
      
      public function angleAttackBossSphinx() : void
      {
         var _loc2_:IGameObject = null;
         var _loc1_:Array = TDGameInfo.getInstance().getZombieListByType(TDConstant.ZombieType_BOSS_Sphinx);
         if(_loc1_.length > 0)
         {
            _loc2_ = _loc1_[0];
            _loc2_.setRunningProp(TDConstant.GameObject_Prop_BossSphinx_State,2);
         }
      }
      
      public function enterEmperorQinFirstPhase() : void
      {
         var _loc2_:IGameObject = null;
         var _loc1_:Array = TDGameInfo.getInstance().getZombieListByType(TDConstant.ZombieType_Emperor_Qin);
         if(_loc1_.length > 0)
         {
            _loc2_ = _loc1_[0];
            _loc2_.setRunningProp(TDConstant.GameObject_Prop_EmperorQin_State,2);
            _loc2_.setRunningProp(TDConstant.GameObject_Prop_BossStateChangeFinished,false);
         }
      }
      
      public function enterEmperorQinSecondPhase() : void
      {
         var _loc2_:IGameObject = null;
         var _loc1_:Array = TDGameInfo.getInstance().getZombieListByType(TDConstant.ZombieType_Emperor_Qin);
         if(_loc1_.length > 0)
         {
            _loc2_ = _loc1_[0];
            _loc2_.setRunningProp(TDConstant.GameObject_Prop_EmperorQin_State,3);
            _loc2_.setRunningProp(TDConstant.GameObject_Prop_BossStateChangeFinished,false);
         }
      }
      
      public function castBossSkill(param1:int, param2:String, param3:*) : void
      {
         var _loc4_:IGameObject = null;
         var _loc6_:TDSkillInfo = null;
         var _loc5_:Array;
         if((_loc5_ = TDGameInfo.getInstance().getZombieListByType(param1)).length > 0)
         {
            _loc4_ = _loc5_[0];
            (_loc6_ = new TDSkillInfo()).skillType = param2;
            _loc6_.skillPara = param3;
            _loc4_.setRunningProp(TDConstant.GameObject_Prop_IsCastSkill,true);
            _loc4_.setRunningProp(TDConstant.GameObject_Prop_CastSkillData,_loc6_);
         }
      }
      
      public function setEmperorSummonSwitch(param1:int, param2:Boolean) : void
      {
         var _loc4_:IGameObject = null;
         var _loc3_:Array = TDGameInfo.getInstance().getZombieListByType(TDConstant.ZombieType_Emperor_Qin);
         if(_loc3_.length > 0)
         {
            (_loc4_ = _loc3_[0]).setRunningProp(TDConstant.Gameobject_Prop_SummonZombie_IsCanStart,param2);
            _loc4_.setRunningProp(TDConstant.Gameobject_Prop_SummonZombie_Index,0);
         }
      }
      
      public function initWaveTerracotta(param1:int, param2:int, param3:Array = null, param4:int = 5, param5:int = -1, param6:int = 3) : void
      {
         TDMiniGameTerracottaMemoryData.getInstance().startNewWave(param1,param2,param3,param4,param5,param6);
      }
      
      public function dispatchTDEvent(param1:String, param2:Object = null) : void
      {
         CommandDispatcher.send(param1,param2);
      }
      
      public function castZombieSkill(param1:String, param2:Array = null) : void
      {
         var _loc3_:TDSkillInfo = new TDSkillInfo();
         _loc3_.skillType = param1;
         _loc3_.skillPara = param2;
         switch(param1)
         {
            case TDZombieSkillType.Type_FireBall:
               TDSkillCmd.castFireBall(_loc3_);
               break;
            case TDZombieSkillType.Type_QuickSand:
               TDSkillCmd.castQuickSand(_loc3_);
               break;
            case TDZombieSkillType.Type_SpeedUp:
               TDSkillCmd.addZombieSpeedUpBuff();
         }
      }
   }
}
