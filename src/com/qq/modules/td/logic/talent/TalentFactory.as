package com.qq.modules.td.logic.talent
{
   import com.qq.modules.td.logic.talent.talentEffect.ITalentEffect;
   import com.qq.modules.td.logic.talent.talentEffect.TalentAddBuff;
   import com.qq.modules.td.logic.talent.talentEffect.TalentAddRate;
   import com.qq.modules.td.logic.talent.talentEffect.TalentAttackAreaDouble;
   import com.qq.modules.td.logic.talent.talentEffect.TalentAttackPlugBuff;
   import com.qq.modules.td.logic.talent.talentEffect.TalentAttackSpeed;
   import com.qq.modules.td.logic.talent.talentEffect.TalentAttackZombieDrop;
   import com.qq.modules.td.logic.talent.talentEffect.TalentBuyAgainPriceDiscount;
   import com.qq.modules.td.logic.talent.talentEffect.TalentCardCoolDown;
   import com.qq.modules.td.logic.talent.talentEffect.TalentCardCoolDownIcon;
   import com.qq.modules.td.logic.talent.talentEffect.TalentCardCoolDownPlantDie;
   import com.qq.modules.td.logic.talent.talentEffect.TalentCastSkillAfterPlant;
   import com.qq.modules.td.logic.talent.talentEffect.TalentDamagePlus;
   import com.qq.modules.td.logic.talent.talentEffect.TalentEffect;
   import com.qq.modules.td.logic.talent.talentEffect.TalentExplodeAtLastZombie;
   import com.qq.modules.td.logic.talent.talentEffect.TalentGrowPlantSunCost;
   import com.qq.modules.td.logic.talent.talentEffect.TalentGrowPlantSunDrop;
   import com.qq.modules.td.logic.talent.talentEffect.TalentIceNum;
   import com.qq.modules.td.logic.talent.talentEffect.TalentMergePlant;
   import com.qq.modules.td.logic.talent.talentEffect.TalentPlantFlyTrapCatch;
   import com.qq.modules.td.logic.talent.talentEffect.TalentPlantMaxHP;
   import com.qq.modules.td.logic.talent.talentEffect.TalentPlantSkillCostLess;
   import com.qq.modules.td.logic.talent.talentEffect.TalentPlantSomeAbilityPromote;
   import com.qq.modules.td.logic.talent.talentEffect.TalentPlusAttackNum;
   import com.qq.modules.td.logic.talent.talentEffect.TalentPlusAttackPower;
   import com.qq.modules.td.logic.talent.talentEffect.TalentPlusBuffTime;
   import com.qq.modules.td.logic.talent.talentEffect.TalentPlusBulletNum;
   import com.qq.modules.td.logic.talent.talentEffect.TalentPlusCoolDownTime;
   import com.qq.modules.td.logic.talent.talentEffect.TalentProductBigSun;
   import com.qq.modules.td.logic.talent.talentEffect.TalentReborn;
   import com.qq.modules.td.logic.talent.talentEffect.TalentReflectHurt;
   import com.qq.modules.td.logic.talent.talentEffect.TalentSameTargetBulletType;
   import com.qq.modules.td.logic.talent.talentEffect.TalentShootDownArmor;
   import com.qq.modules.td.logic.talent.talentEffect.TalentTransformAfterKillSomeZombie;
   import com.qq.modules.td.logic.talent.talentEffect.TalentZombieKickAway;
   import flash.utils.Dictionary;
   import org.as3commons.logging.api.getLogger;
   
   public class TalentFactory
   {
      
      public static const EFF_GROW_PLANT_SUN_COST:String = "1";
      
      public static const EFF_CARD_COOL_DOWN_TIME:String = "2";
      
      public static const EFF_PLANT_MAX_HP:String = "3";
      
      public static const EFF_REFLECT_HURT:String = "4";
      
      public static const EFF_PLUS_ATTACK_NUM:String = "5";
      
      public static const EFF_PLUS_ATTACK_POWER:String = "6";
      
      public static const EFF_ATTACK_ZOMBIE_DROP:String = "7";
      
      public static const EFF_PLUS_COOLDOWN_TIME:String = "8";
      
      public static const EFF_ATTACK_AREA_DOUBLE:String = "9";
      
      public static const EFF_PLUS_BUFF_TIME:String = "10";
      
      public static const EFF_PLUS_BULLET_NUM:String = "11";
      
      public static const EFF_ATTACK_SPEED:String = "12";
      
      public static const EFF_SAME_TARGET_BULLET_TYPE:String = "13";
      
      public static const EFF_KILL_ZOMBIE_DROP:String = "14";
      
      public static const EFF_PLUS_CARD_COOL_DOWN_TIME_PLANT_DIE:String = "15";
      
      public static const EFF_GROW_PLANT_SUN_DROP:String = "16";
      
      public static const EFF_KILL_PLANT_DROP:String = "17";
      
      public static const EFF_PRODUCT_BIG_SUN:String = "18";
      
      public static const EFF_ATTACK_PLUG_BUFF:String = "19";
      
      public static const EFF_SHOOT_DOWN_ARMOR:String = "20";
      
      public static const EFF_IS_CRIT:String = "21";
      
      public static const EFF_MERGE_PLANT:String = "22";
      
      public static const EFF_ICE_NUM:String = "23";
      
      public static const EFF_CAST_SKILL_AFTER_PLANT:String = "24";
      
      public static const EFF_ADD_BUFF:String = "25";
      
      public static const EFF_EXPLODE_AT_LAST_ZOMBIE:String = "26";
      
      public static const EFF_REBORN:String = "27";
      
      public static const EFF_TRANSFORM_AFTER_KILL_SOME_ZOMBIE:String = "28";
      
      public static const EFF_ZOMBIE_KICK_AWAY:String = "29";
      
      public static const EFF_ADD_RATE:String = "30";
      
      public static const EFF_BUY_AGAIN_PRICE_DISCOUNT:String = "31";
      
      public static const EFF_DAMAGE_PLUS:String = "32";
      
      public static const EFF_PLANT_SOME_ABILITY_PROMOTE:String = "33";
      
      public static const EFF_PLANT_SKILL_COST_LESS:String = "34";
      
      public static const EFF_PLANT_FLYTRAP_CATCH:String = "35";
      
      public static const ABILITY_PROMOTION_TYPE_NUTS_SHIELD:int = 1;
      
      private static var effectClassDic:Dictionary;
       
      
      private var talentEffectDic:Dictionary;
      
      public function TalentFactory()
      {
         super();
         if(!TalentFactory.effectClassDic)
         {
            effectClassDic = new Dictionary();
            effectClassDic[EFF_GROW_PLANT_SUN_COST] = TalentGrowPlantSunCost;
            effectClassDic[EFF_CARD_COOL_DOWN_TIME] = TalentCardCoolDownIcon;
            effectClassDic[EFF_PLANT_MAX_HP] = TalentPlantMaxHP;
            effectClassDic[EFF_REFLECT_HURT] = TalentReflectHurt;
            effectClassDic[EFF_PLUS_ATTACK_NUM] = TalentPlusAttackNum;
            effectClassDic[EFF_PLUS_ATTACK_POWER] = TalentPlusAttackPower;
            effectClassDic[EFF_ATTACK_ZOMBIE_DROP] = TalentAttackZombieDrop;
            effectClassDic[EFF_PLUS_COOLDOWN_TIME] = TalentPlusCoolDownTime;
            effectClassDic[EFF_ATTACK_AREA_DOUBLE] = TalentAttackAreaDouble;
            effectClassDic[EFF_PLUS_BUFF_TIME] = TalentPlusBuffTime;
            effectClassDic[EFF_PLUS_BULLET_NUM] = TalentPlusBulletNum;
            effectClassDic[EFF_ATTACK_SPEED] = TalentAttackSpeed;
            effectClassDic[EFF_SAME_TARGET_BULLET_TYPE] = TalentSameTargetBulletType;
            effectClassDic[EFF_KILL_ZOMBIE_DROP] = TalentAttackZombieDrop;
            effectClassDic[EFF_PLUS_CARD_COOL_DOWN_TIME_PLANT_DIE] = TalentCardCoolDownPlantDie;
            effectClassDic[EFF_GROW_PLANT_SUN_DROP] = TalentGrowPlantSunDrop;
            effectClassDic[EFF_KILL_PLANT_DROP] = TalentAttackZombieDrop;
            effectClassDic[EFF_PRODUCT_BIG_SUN] = TalentProductBigSun;
            effectClassDic[EFF_ATTACK_PLUG_BUFF] = TalentAttackPlugBuff;
            effectClassDic[EFF_SHOOT_DOWN_ARMOR] = TalentShootDownArmor;
            effectClassDic[EFF_IS_CRIT] = TalentPlusAttackPower;
            effectClassDic[EFF_MERGE_PLANT] = TalentMergePlant;
            effectClassDic[EFF_ICE_NUM] = TalentIceNum;
            effectClassDic[EFF_CAST_SKILL_AFTER_PLANT] = TalentCastSkillAfterPlant;
            effectClassDic[EFF_ADD_BUFF] = TalentAddBuff;
            effectClassDic[EFF_EXPLODE_AT_LAST_ZOMBIE] = TalentExplodeAtLastZombie;
            effectClassDic[EFF_REBORN] = TalentReborn;
            effectClassDic[EFF_TRANSFORM_AFTER_KILL_SOME_ZOMBIE] = TalentTransformAfterKillSomeZombie;
            effectClassDic[EFF_ZOMBIE_KICK_AWAY] = TalentZombieKickAway;
            effectClassDic[EFF_ADD_RATE] = TalentAddRate;
            effectClassDic[EFF_BUY_AGAIN_PRICE_DISCOUNT] = TalentBuyAgainPriceDiscount;
            effectClassDic[EFF_DAMAGE_PLUS] = TalentDamagePlus;
            effectClassDic[EFF_PLANT_SOME_ABILITY_PROMOTE] = TalentPlantSomeAbilityPromote;
            effectClassDic[EFF_PLANT_SKILL_COST_LESS] = TalentPlantSkillCostLess;
            effectClassDic[EFF_PLANT_FLYTRAP_CATCH] = TalentPlantFlyTrapCatch;
         }
         this.talentEffectDic = new Dictionary();
      }
      
      private function init2() : void
      {
         var _loc1_:TalentEffect = null;
         var _loc2_:TalentPlusCoolDownTime = new TalentPlusCoolDownTime();
         _loc2_.setData([15000]);
         this.addEffect(EFF_PLUS_COOLDOWN_TIME,1500,_loc2_);
         var _loc3_:TalentAttackZombieDrop = new TalentAttackZombieDrop();
         _loc3_.setData([100,1,200]);
         this.addEffect(EFF_KILL_ZOMBIE_DROP,1500,_loc3_);
         _loc1_ = new TalentCardCoolDownPlantDie();
         _loc1_.setData([50000]);
         this.addEffect(EFF_PLUS_CARD_COOL_DOWN_TIME_PLANT_DIE,1300,_loc1_);
         var _loc4_:TalentSameTargetBulletType;
         (_loc4_ = new TalentSameTargetBulletType()).setData([500000000,700,50]);
         this.addEffect(EFF_SAME_TARGET_BULLET_TYPE,1200,_loc4_);
         _loc3_ = new TalentAttackZombieDrop();
         _loc3_.setData([100,1,200]);
         this.addEffect(EFF_KILL_PLANT_DROP,1200,_loc3_);
         _loc1_ = new TalentGrowPlantSunDrop();
         _loc1_.setData([2,1,200]);
         this.addEffect(EFF_GROW_PLANT_SUN_DROP,1900,_loc1_);
         _loc1_ = new TalentGrowPlantSunDrop();
         _loc1_.setData([2,1,200]);
         this.addEffect(EFF_GROW_PLANT_SUN_DROP,1100,_loc1_);
         _loc1_ = new TalentProductBigSun();
         _loc1_.setData([50]);
         this.addEffect(EFF_PRODUCT_BIG_SUN,1100,_loc1_);
         _loc1_ = new TalentAttackPlugBuff();
         _loc1_.setData([400]);
         this.addEffect(EFF_ATTACK_PLUG_BUFF,2000,_loc1_);
         _loc1_ = new TalentShootDownArmor();
         _loc1_.setData([100000,100]);
         this.addEffect(EFF_SHOOT_DOWN_ARMOR,2000,_loc1_);
         _loc1_ = new TalentPlusAttackPower();
         _loc1_.setData([0,200,50]);
         this.addEffect(EFF_IS_CRIT,1800,_loc1_);
         var _loc5_:TalentAttackAreaDouble;
         (_loc5_ = new TalentAttackAreaDouble()).setData([]);
         this.addEffect(EFF_ATTACK_AREA_DOUBLE,1800,_loc5_);
      }
      
      private function init() : void
      {
         var _loc2_:TalentCardCoolDown = null;
         var _loc1_:TalentGrowPlantSunCost = new TalentGrowPlantSunCost();
         _loc1_.setData([25,1]);
         this.addEffect(EFF_GROW_PLANT_SUN_COST,1200,_loc1_);
         _loc2_ = new TalentCardCoolDown();
         _loc2_.setData([1,0]);
         this.addEffect(EFF_CARD_COOL_DOWN_TIME,1200,_loc2_);
         var _loc3_:TalentSameTargetBulletType = new TalentSameTargetBulletType();
         _loc3_.setData([5,700,50]);
         this.addEffect(EFF_SAME_TARGET_BULLET_TYPE,1200,_loc3_);
         var _loc4_:TalentPlusBulletNum;
         (_loc4_ = new TalentPlusBulletNum()).setData([1,50]);
         this.addEffect(EFF_PLUS_BULLET_NUM,1210,_loc4_);
         _loc1_ = new TalentGrowPlantSunCost();
         _loc1_.setData([25,0]);
         this.addEffect(EFF_GROW_PLANT_SUN_COST,1600,_loc1_);
         var _loc5_:TalentPlusAttackNum;
         (_loc5_ = new TalentPlusAttackNum()).setData([1]);
         this.addEffect(EFF_PLUS_ATTACK_NUM,1600,_loc5_);
         _loc2_ = new TalentCardCoolDown();
         _loc2_.setData([1,0]);
         this.addEffect(EFF_CARD_COOL_DOWN_TIME,1100,_loc2_);
         var _loc6_:TalentPlantMaxHP;
         (_loc6_ = new TalentPlantMaxHP()).setData([50]);
         this.addEffect(EFF_PLANT_MAX_HP,1100,_loc6_);
         _loc2_ = new TalentCardCoolDown();
         _loc2_.setData([1,5]);
         this.addEffect(EFF_CARD_COOL_DOWN_TIME,1110,_loc2_);
         _loc2_ = new TalentCardCoolDown();
         _loc2_.setData([5,0]);
         this.addEffect(EFF_CARD_COOL_DOWN_TIME,1900,_loc2_);
         var _loc7_:TalentReflectHurt;
         (_loc7_ = new TalentReflectHurt()).setData([50]);
         this.addEffect(EFF_REFLECT_HURT,1300,_loc7_);
         var _loc8_:TalentPlusAttackPower;
         (_loc8_ = new TalentPlusAttackPower()).setData([3200,100,100]);
         this.addEffect(EFF_PLUS_ATTACK_POWER,1400,_loc8_);
         var _loc9_:TalentAttackZombieDrop;
         (_loc9_ = new TalentAttackZombieDrop()).setData([100,1,200]);
         this.addEffect(EFF_ATTACK_ZOMBIE_DROP,2000,_loc9_);
         var _loc10_:TalentPlusCoolDownTime;
         (_loc10_ = new TalentPlusCoolDownTime()).setData([5000]);
         this.addEffect(EFF_PLUS_COOLDOWN_TIME,1500,_loc10_);
         (_loc5_ = new TalentPlusAttackNum()).setData([1000]);
         this.addEffect(EFF_PLUS_ATTACK_NUM,1500,_loc5_);
         (_loc8_ = new TalentPlusAttackPower()).setData([0,100,100]);
         this.addEffect(EFF_PLUS_ATTACK_POWER,1800,_loc8_);
         var _loc11_:TalentAttackAreaDouble;
         (_loc11_ = new TalentAttackAreaDouble()).setData([]);
         this.addEffect(EFF_ATTACK_AREA_DOUBLE,1800,_loc11_);
         var _loc12_:TalentAttackSpeed;
         (_loc12_ = new TalentAttackSpeed()).setData([50,100]);
         this.addEffect(EFF_ATTACK_SPEED,1800,_loc12_);
         (_loc5_ = new TalentPlusAttackNum()).setData([1000]);
         this.addEffect(EFF_PLUS_ATTACK_NUM,1700,_loc5_);
         var _loc13_:TalentPlusBuffTime;
         (_loc13_ = new TalentPlusBuffTime()).setData([300,5000]);
         this.addEffect(EFF_PLUS_BUFF_TIME,1700,_loc13_);
         var _loc14_:TalentCardCoolDownIcon;
         (_loc14_ = new TalentCardCoolDownIcon()).setData([1500,0]);
         this.addEffect(EFF_CARD_COOL_DOWN_TIME,1700,_loc14_);
      }
      
      public function createTalentEffect(param1:String, param2:int, param3:Array) : void
      {
         var _loc5_:TalentEffect = null;
         var _loc4_:Class;
         if(_loc4_ = this.getEffectClass(param1))
         {
            (_loc5_ = new _loc4_() as TalentEffect).setData(param3);
            this.addEffect(param1,param2,_loc5_);
         }
      }
      
      private function addEffect(param1:String, param2:int, param3:ITalentEffect) : void
      {
         param3.plantType = param2;
         if(!this.talentEffectDic[param1])
         {
            this.talentEffectDic[param1] = new Dictionary();
         }
         var _loc4_:Dictionary;
         (_loc4_ = this.talentEffectDic[param1] as Dictionary)[param3.plantType] = param3;
      }
      
      private function getEffectClass(param1:String) : Class
      {
         if(effectClassDic[param1])
         {
            return effectClassDic[param1] as Class;
         }
         getLogger().error("无法找到对应天赋解析类：" + param1);
         return null;
      }
      
      public function getEffectByType(param1:String, param2:int) : ITalentEffect
      {
         var _loc3_:Dictionary = this.talentEffectDic[param1] as Dictionary;
         if(_loc3_ && _loc3_[param2])
         {
            return _loc3_[param2] as ITalentEffect;
         }
         return null;
      }
      
      public function dispose() : void
      {
         var _loc1_:Dictionary = null;
         var _loc2_:ITalentEffect = null;
         for each(_loc1_ in this.talentEffectDic)
         {
            for each(_loc2_ in _loc1_)
            {
               _loc2_.dispose();
            }
         }
         this.talentEffectDic = new Dictionary();
      }
   }
}
