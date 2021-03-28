package com.qq.modules.battle.planMachine
{
   import PVZ.Cmd.Dto_FightAction;
   import PVZ.Cmd.Dto_FightDamage;
   import PVZ.Cmd.Dto_FightPuppetInfo;
   import PVZ.Cmd.E_DamageType;
   import PVZ.Cmd.E_FightActionType;
   import com.greensock.plugins.ColorTransformPlugin;
   import com.greensock.plugins.TweenPlugin;
   import com.qq.modules.battle.constant.BattleConst;
   import com.qq.modules.battle.model.BattleFightModel;
   import com.qq.modules.battle.model.BattleRoundStateModel;
   import com.qq.modules.battle.model.BattleUnitInfo;
   import com.qq.modules.battle.model.BattleUnitModel;
   import com.qq.modules.battle.model.vo.FightDamageVo;
   import com.qq.modules.battle.planMachine.core.PlanFactoryImpl;
   import com.qq.modules.battle.planMachine.core.PlanGroup;
   import com.qq.modules.battle.planMachine.core.PlanStorage;
   import com.qq.modules.battle.planMachine.plan.ActorChangeHP;
   import com.qq.modules.battle.planMachine.plan.CostarChangeHP;
   import com.qq.modules.battle.view.unit.UnitBase;
   import com.qq.modules.dummy.model.DummyDataFactory;
   import com.qq.modules.dummy.model.DummyZombieTemplate;
   import com.qq.modules.main.model.SettingsModel;
   import com.qq.modules.main.model.settings.battle.ce.BattleLineupCardTemp;
   import com.qq.modules.main.model.settings.battle.planSettings.PlanNode;
   import com.qq.modules.main.model.settings.battle.planSettings.PlanSetting;
   import com.qq.modules.main.model.settings.battle.planSettings.PlanTree;
   import tencent.tools.planMachine.IPlan;
   import tencent.tools.planMachine.SerialPlan;
   
   public class PlanFactory extends PlanFactoryImpl
   {
      
      private static var _leaderNode:PlanNode;
      
      private static var _dummyPassiveSkillNode:PlanNode;
       
      
      private var planStorage:PlanStorage;
      
      public function PlanFactory()
      {
         super();
         this.planStorage = new PlanStorage();
         TweenPlugin.activate([ColorTransformPlugin]);
      }
      
      public static function createLeaderSkillPlanTree() : PlanTree
      {
         var _loc2_:PlanNode = null;
         if(_leaderNode == null)
         {
            _leaderNode = new PlanNode();
            _leaderNode.createNodeByData("ParallelPlan",null,0);
            _loc2_ = new PlanNode();
            _loc2_.createNodeByData("ActorAddEffect","1|skill_flash|0|effect|0|0".split("|"));
            _leaderNode.addNode(_loc2_);
            _loc2_ = new PlanNode();
            _loc2_.createNodeByData("CostarAddEffectGroup","1|leaderSkillEffect|0|effect|-50|-50".split("|"));
            _leaderNode.addNode(_loc2_);
            _loc2_ = new PlanNode();
            _loc2_.createNodeByData("CostarAddEffectGroup","0|plant_skillEffect_foot|0|effect|0|0".split("|"));
            _leaderNode.addNode(_loc2_);
            _loc2_ = new PlanNode();
            _loc2_.createNodeByData("LeaderSkillPlan",[0]);
            _leaderNode.addNode(_loc2_);
            _loc2_ = new PlanNode();
            _loc2_.createNodeByData("InjuredPlanNomalGroup","1|0".split("|"));
            _leaderNode.addNode(_loc2_);
         }
         var _loc1_:PlanTree = new PlanTree();
         _loc1_.skillIdList = new Array();
         _loc1_.planNodeList.push(_leaderNode);
         return _loc1_;
      }
      
      public static function createDummyPassiveSkillPlanTree() : PlanTree
      {
         var _loc2_:PlanNode = null;
         if(_dummyPassiveSkillNode == null)
         {
            _dummyPassiveSkillNode = new PlanNode();
            _dummyPassiveSkillNode.createNodeByData("ParallelPlan",null,0);
            _loc2_ = new PlanNode();
            _loc2_.createNodeByData("DummyPassiveSkillPlan");
            _dummyPassiveSkillNode.addNode(_loc2_);
            _loc2_ = new PlanNode();
            _loc2_.createNodeByData("InjuredPlanNomalGroup","1|0".split("|"));
            _dummyPassiveSkillNode.addNode(_loc2_);
         }
         var _loc1_:PlanTree = new PlanTree();
         _loc1_.skillIdList = new Array();
         _loc1_.planNodeList.push(_dummyPassiveSkillNode);
         return _loc1_;
      }
      
      public function createActionPlan(param1:Dto_FightAction) : IPlan
      {
         var _loc3_:IPlan = null;
         var _loc4_:PlanSetting = null;
         var _loc5_:PlanTree = null;
         var _loc6_:UnitBase = null;
         var _loc9_:Dto_FightDamage = null;
         var _loc10_:IPlan = null;
         var _loc11_:ActorChangeHP = null;
         var _loc12_:CostarChangeHP = null;
         var _loc13_:FightDamageVo = null;
         var _loc14_:Dto_FightDamage = null;
         var _loc2_:Array = [];
         var _loc7_:PlanGroup = new PlanGroup();
         _loc6_ = BattleUnitModel.getInstance().getUnitByPosIndex(param1.actor.actorIndex);
         _loc5_ = (_loc4_ = this.getPlanSetting(param1.actor.actorIndex)).getAttackPlanTree(param1.actor.actorIndex,param1.actor.skillId);
         var _loc8_:Array = new Array();
         for each(_loc9_ in param1.damage)
         {
            if(!(param1.actionType == E_FightActionType.E_FightActionType_Attack && _loc9_.damageType == E_DamageType.E_DamageType_UpdateBuff))
            {
               _loc8_.push(FightDamageVo.fromDtoFightDamage(param1,_loc9_));
            }
         }
         if(_loc8_.length > 0)
         {
            _loc2_.push(createPlanByTree(param1.actor,_loc8_,_loc7_,_loc5_));
         }
         else if(!BattleConst.isDummyZombieByPos(param1.actor.actorIndex))
         {
            if(BattleRoundStateModel.getInstance().curRound == 0)
            {
               _loc2_.push(createPlanByTree(param1.actor,_loc8_,_loc7_,_loc5_));
            }
            else
            {
               (_loc11_ = new ActorChangeHP()).setStaticParams([param1.actor,param1.damage]);
               _loc2_.push(_loc11_);
               _loc12_ = new CostarChangeHP(false);
               _loc13_ = new FightDamageVo();
               (_loc14_ = new Dto_FightDamage()).targetIndex = param1.actor.actorIndex;
               _loc14_.damageType = E_DamageType.E_DamageType_Dodge;
               _loc13_.setDamage(_loc14_);
               _loc12_.setStaticParams([param1.actor,[_loc13_]]);
               _loc2_.push(_loc12_);
            }
         }
         if(_loc2_.length > 0)
         {
            _loc10_ = new SerialPlan(_loc2_);
         }
         return _loc10_;
      }
      
      public function createBuffEffectPlan(param1:FightDamageVo) : IPlan
      {
         var _loc2_:CostarChangeHP = new CostarChangeHP();
         _loc2_.checkDie = true;
         _loc2_.setStaticParams([null,[param1],null]);
         return _loc2_;
      }
      
      public function getPlanSetting(param1:int) : PlanSetting
      {
         var _loc2_:Dto_FightPuppetInfo = null;
         var _loc3_:DummyZombieTemplate = null;
         var _loc4_:PlanSetting = null;
         var _loc5_:BattleUnitInfo = null;
         if(BattleConst.isDummyZombieByPos(param1))
         {
            _loc2_ = BattleFightModel.getInstance().getDummyInfoByPosIndex(param1);
            _loc3_ = DummyDataFactory.getInstance().getDummyZombieInfoByID(_loc2_.baseId);
            return this.planStorage.getPlanSetting(_loc3_.resName);
         }
         _loc5_ = BattleFightModel.getInstance().getFightCardByPosIndex(param1);
         return this.getPlanSettingByCardId(_loc5_.cardId);
      }
      
      public function getPlanSettingByCardId(param1:int) : PlanSetting
      {
         var _loc2_:BattleLineupCardTemp = SettingsModel.instance.battleCardSettings.getBattleCardTempById(param1);
         return this.planStorage.getPlanSetting(_loc2_.planClassName);
      }
   }
}
