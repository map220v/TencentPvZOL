package com.qq.modules.battle.planMachine.core
{
   import com.qq.modules.battle.planMachine.plan.ActorActionPlan;
   import com.qq.modules.battle.planMachine.plan.ActorAddEffect;
   import com.qq.modules.battle.planMachine.plan.ActorChangeHP;
   import com.qq.modules.battle.planMachine.plan.ActorColorAdvanced;
   import com.qq.modules.battle.planMachine.plan.ActorColorBrightness;
   import com.qq.modules.battle.planMachine.plan.ActorFrameEventPlan;
   import com.qq.modules.battle.planMachine.plan.ActorHitTargetPlan;
   import com.qq.modules.battle.planMachine.plan.ActorMirrorPlan;
   import com.qq.modules.battle.planMachine.plan.ActorPlaySound;
   import com.qq.modules.battle.planMachine.plan.ActorShieldJudge;
   import com.qq.modules.battle.planMachine.plan.ActorWallnutAttack;
   import com.qq.modules.battle.planMachine.plan.BulletArrowDelayGroup;
   import com.qq.modules.battle.planMachine.plan.BulletArrowGroup;
   import com.qq.modules.battle.planMachine.plan.BulletBaseArrow;
   import com.qq.modules.battle.planMachine.plan.BulletBaseDrop;
   import com.qq.modules.battle.planMachine.plan.BulletBaseDropGroup;
   import com.qq.modules.battle.planMachine.plan.BulletDropBulletDelayGroup;
   import com.qq.modules.battle.planMachine.plan.BulletDropPlanLine;
   import com.qq.modules.battle.planMachine.plan.BulletFlyBloomerang;
   import com.qq.modules.battle.planMachine.plan.BulletFlyBloomerangGroup;
   import com.qq.modules.battle.planMachine.plan.BulletFlyForBanana;
   import com.qq.modules.battle.planMachine.plan.BulletFlyForBananaSkill;
   import com.qq.modules.battle.planMachine.plan.BulletFlyParabola;
   import com.qq.modules.battle.planMachine.plan.BulletFlyParabolaGroup;
   import com.qq.modules.battle.planMachine.plan.BulletFlyPlanGroup;
   import com.qq.modules.battle.planMachine.plan.BulletFlyPlanLine;
   import com.qq.modules.battle.planMachine.plan.BulletFlyPlanLineGroup;
   import com.qq.modules.battle.planMachine.plan.BulletFlyPlanLineOneTarget;
   import com.qq.modules.battle.planMachine.plan.CostarActionPlan;
   import com.qq.modules.battle.planMachine.plan.CostarAddEffect;
   import com.qq.modules.battle.planMachine.plan.CostarAddEffectGroup;
   import com.qq.modules.battle.planMachine.plan.CostarChangeHP;
   import com.qq.modules.battle.planMachine.plan.CostarColorAdvanced;
   import com.qq.modules.battle.planMachine.plan.CostarColorAdvancedGroup;
   import com.qq.modules.battle.planMachine.plan.CostarColorBrightness;
   import com.qq.modules.battle.planMachine.plan.CurePlanNomal;
   import com.qq.modules.battle.planMachine.plan.CurePlanNomalGroup;
   import com.qq.modules.battle.planMachine.plan.DamageSplitPlan;
   import com.qq.modules.battle.planMachine.plan.DebugTracePlan;
   import com.qq.modules.battle.planMachine.plan.DiePlanNomal;
   import com.qq.modules.battle.planMachine.plan.DummyPassiveSkillPlan;
   import com.qq.modules.battle.planMachine.plan.ElectricAtkGroup;
   import com.qq.modules.battle.planMachine.plan.ElectricAtkPlan;
   import com.qq.modules.battle.planMachine.plan.InjuredPlanNomal;
   import com.qq.modules.battle.planMachine.plan.InjuredPlanNomalGroup;
   import com.qq.modules.battle.planMachine.plan.InjuredPlanStealSun;
   import com.qq.modules.battle.planMachine.plan.InjuredPlanStealSunGroup;
   import com.qq.modules.battle.planMachine.plan.InjuredPlanVerticalGroup;
   import com.qq.modules.battle.planMachine.plan.JumpBasePlan;
   import com.qq.modules.battle.planMachine.plan.LeaderSkillPlan;
   import com.qq.modules.battle.planMachine.plan.LineAttackPlan;
   import com.qq.modules.battle.planMachine.plan.LineAttackRandomGroup;
   import com.qq.modules.battle.planMachine.plan.MovePlanArchor;
   import com.qq.modules.battle.planMachine.plan.MovePlanFlyAttack;
   import com.qq.modules.battle.planMachine.plan.MovePlanWarrior;
   import com.qq.modules.battle.planMachine.plan.RelivePlan;
   import com.qq.modules.battle.planMachine.plan.ResetUnitTotalBlood;
   import com.qq.modules.battle.planMachine.plan.ScreanColorPlan;
   import com.qq.modules.battle.planMachine.plan.ScreanShakePlan;
   import com.qq.modules.battle.planMachine.plan.TriggerReceivePlan;
   import com.qq.modules.battle.planMachine.plan.TriggerSendPlan;
   import com.qq.modules.battle.planMachine.plan.VerticalAddEffectGroup;
   import com.qq.modules.battle.planMachine.plan.special.GuildFightCycleAniamat;
   import com.qq.modules.main.model.SettingsModel;
   import com.qq.modules.main.model.settings.battle.planSettings.PlanSetting;
   import flash.net.registerClassAlias;
   
   public class PlanStorage
   {
       
      
      public function PlanStorage()
      {
         super();
         registerClassAlias("MovePlanArchor",MovePlanArchor);
         registerClassAlias("MovePlanWarrior",MovePlanWarrior);
         registerClassAlias("JumpBasePlan",JumpBasePlan);
         registerClassAlias("MovePlanFlyAttack",MovePlanFlyAttack);
         registerClassAlias("ActorActionPlan",ActorActionPlan);
         registerClassAlias("ActorFrameEventPlan",ActorFrameEventPlan);
         registerClassAlias("ActorColorAdvanced",ActorColorAdvanced);
         registerClassAlias("ActorColorBrightness",ActorColorBrightness);
         registerClassAlias("ActorAddEffect",ActorAddEffect);
         registerClassAlias("ActorWallnutAttack",ActorWallnutAttack);
         registerClassAlias("ActorChangeHP",ActorChangeHP);
         registerClassAlias("ActorHitTargetPlan",ActorHitTargetPlan);
         registerClassAlias("ActorMirrorPlan",ActorMirrorPlan);
         registerClassAlias("LineAttackPlan",LineAttackPlan);
         registerClassAlias("LineAttackRandomGroup",LineAttackRandomGroup);
         registerClassAlias("DiePlanNomal",DiePlanNomal);
         registerClassAlias("InjuredPlanNomal",InjuredPlanNomal);
         registerClassAlias("InjuredPlanNomalGroup",InjuredPlanNomalGroup);
         registerClassAlias("CostarColorAdvanced",CostarColorAdvanced);
         registerClassAlias("CostarColorAdvancedGroup",CostarColorAdvancedGroup);
         registerClassAlias("CostarColorBrightness",CostarColorBrightness);
         registerClassAlias("CostarAddEffect",CostarAddEffect);
         registerClassAlias("CostarAddEffectGroup",CostarAddEffectGroup);
         registerClassAlias("CostarChangeHP",CostarChangeHP);
         registerClassAlias("CostarActionPlan",CostarActionPlan);
         registerClassAlias("CurePlanNomal",CurePlanNomal);
         registerClassAlias("CurePlanNomalGroup",CurePlanNomalGroup);
         registerClassAlias("InjuredPlanStealSun",InjuredPlanStealSun);
         registerClassAlias("InjuredPlanStealSunGroup",InjuredPlanStealSunGroup);
         registerClassAlias("InjuredPlanVerticalGroup",InjuredPlanVerticalGroup);
         registerClassAlias("VerticalAddEffectGroup",VerticalAddEffectGroup);
         registerClassAlias("BulletFlyPlanLine",BulletFlyPlanLine);
         registerClassAlias("BulletFlyPlanLineOneTarget",BulletFlyPlanLineOneTarget);
         registerClassAlias("BulletFlyPlanLineGroup",BulletFlyPlanLineGroup);
         registerClassAlias("BulletFlyParabola",BulletFlyParabola);
         registerClassAlias("BulletFlyParabolaGroup",BulletFlyParabolaGroup);
         registerClassAlias("BulletFlyBloomerang",BulletFlyBloomerang);
         registerClassAlias("BulletFlyBloomerangGroup",BulletFlyBloomerangGroup);
         registerClassAlias("BulletFlyBloomerangGroup",BulletFlyBloomerangGroup);
         registerClassAlias("BulletBaseArrow",BulletBaseArrow);
         registerClassAlias("BulletArrowGroup",BulletArrowGroup);
         registerClassAlias("BulletArrowDelayGroup",BulletArrowDelayGroup);
         registerClassAlias("BulletBaseDrop",BulletBaseDrop);
         registerClassAlias("BulletBaseDropGroup",BulletBaseDropGroup);
         registerClassAlias("BulletFlyPlanGroup",BulletFlyPlanGroup);
         registerClassAlias("BulletFlyForBanana",BulletFlyForBanana);
         registerClassAlias("BulletFlyForBananaSkill",BulletFlyForBananaSkill);
         registerClassAlias("BulletDropBulletDelayGroup",BulletDropBulletDelayGroup);
         registerClassAlias("BulletDropPlanLine",BulletDropPlanLine);
         registerClassAlias("ElectricAtkPlan",ElectricAtkPlan);
         registerClassAlias("ElectricAtkGroup",ElectricAtkGroup);
         registerClassAlias("TriggerSendPlan",TriggerSendPlan);
         registerClassAlias("TriggerReceivePlan",TriggerReceivePlan);
         registerClassAlias("DebugTracePlan",DebugTracePlan);
         registerClassAlias("ResetUnitTotalBlood",ResetUnitTotalBlood);
         registerClassAlias("DamageSplitPlan",DamageSplitPlan);
         registerClassAlias("ActoShieldJudge",ActorShieldJudge);
         registerClassAlias("ScreanShakePlan",ScreanShakePlan);
         registerClassAlias("ScreanColorPlan",ScreanColorPlan);
         registerClassAlias("LeaderSkillPlan",LeaderSkillPlan);
         registerClassAlias("DummyPassiveSkillPlan",DummyPassiveSkillPlan);
         registerClassAlias("ActorPlaySound",ActorPlaySound);
         registerClassAlias("RelivePlan",RelivePlan);
         registerClassAlias("GuildFightCycleAniamat",GuildFightCycleAniamat);
      }
      
      public function getPlanSetting(param1:String) : PlanSetting
      {
         return SettingsModel.instance.battleCartoonSettings.getPlanSetting(param1);
      }
   }
}
