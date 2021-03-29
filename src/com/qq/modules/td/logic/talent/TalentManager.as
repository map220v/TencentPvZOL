package com.qq.modules.td.logic.talent
{
   import com.qq.GameGloble;
   import com.qq.modules.main.model.SettingsModel;
   import com.qq.modules.main.model.settings.plantTalent.PlantTalentSetting;
   import com.qq.modules.td.data.TDDataFactory;
   import com.qq.modules.td.data.game.buff.TDBuffStaticInfo;
   import com.qq.modules.td.data.game.unit.TDPlantBaseStaticInfo;
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   import com.qq.modules.td.logic.talent.talentEffect.ITalentEffect;
   import com.qq.modules.td.logic.talent.talentEffect.TalentAddBuff;
   import com.qq.modules.td.logic.talent.talentEffect.TalentAddRate;
   import com.qq.modules.td.logic.talent.talentEffect.TalentAttackAreaDouble;
   import com.qq.modules.td.logic.talent.talentEffect.TalentAttackPlugBuff;
   import com.qq.modules.td.logic.talent.talentEffect.TalentAttackSpeed;
   import com.qq.modules.td.logic.talent.talentEffect.TalentAttackZombieDrop;
   import com.qq.modules.td.logic.talent.talentEffect.TalentBuyAgainPriceDiscount;
   import com.qq.modules.td.logic.talent.talentEffect.TalentCardCoolDown;
   import com.qq.modules.td.logic.talent.talentEffect.TalentCardCoolDownPlantDie;
   import com.qq.modules.td.logic.talent.talentEffect.TalentCastSkillAfterPlant;
   import com.qq.modules.td.logic.talent.talentEffect.TalentDamagePlus;
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
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.tencent.protobuf.Int64;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   
   public class TalentManager
   {
      
      private static var _instance:TalentManager;
       
      
      private var talentFactoryDic:Dictionary;
      
      public var selfRoleID:Int64;
      
      public function TalentManager()
      {
         super();
      }
      
      public static function get instance() : TalentManager
      {
         if(!_instance)
         {
            _instance = new TalentManager();
         }
         return _instance;
      }
      
      public static function disposeInstance() : void
      {
         if(_instance)
         {
            _instance.Dispose();
            _instance = null;
         }
      }
      
      public function Dispose() : void
      {
         this.reset(null);
      }
      
      public function reset(param1:Int64) : void
      {
         var _loc2_:TalentFactory = null;
         if(param1)
         {
            this.selfRoleID = param1;
         }
         for each(_loc2_ in this.talentFactoryDic)
         {
            _loc2_.dispose();
            _loc2_ = null;
         }
         this.talentFactoryDic = new Dictionary();
      }
      
      private function getFactory(param1:Int64 = null) : TalentFactory
      {
         var _loc2_:TalentFactory = null;
         if(param1 == null)
         {
            param1 = GameGloble.actorModel.roleId;
         }
         if(this.talentFactoryDic == null)
         {
            this.talentFactoryDic = new Dictionary();
         }
         if(!this.talentFactoryDic[param1])
         {
            _loc2_ = new TalentFactory();
            this.talentFactoryDic[param1] = _loc2_;
         }
         return this.talentFactoryDic[param1];
      }
      
      public function createTalentEffect(param1:int, param2:Int64 = null) : void
      {
         var _loc3_:PlantTalentSetting = SettingsModel.instance.plantTalentSets.getPlantTalentSetById(param1);
         if(!_loc3_)
         {
            return;
         }
         var _loc4_:Array;
         var _loc5_:String = (_loc4_ = _loc3_.param.split("|")).shift();
         this.getFactory(param2).createTalentEffect(_loc5_,_loc3_.plantId,_loc4_);
      }
      
      public function getGrowPlantSunCost(param1:TDPlantStaticInfo, param2:Int64 = null) : Number
      {
         var _loc5_:Number = NaN;
         var _loc6_:ITalentEffect = null;
         var _loc3_:int = param1.baseInfo.prePlantType == 0 ? int(param1.baseInfo.id) : int(param1.baseInfo.prePlantType);
         var _loc4_:ITalentEffect;
         if(_loc4_ = this.getFactory(param2).getEffectByType(TalentFactory.EFF_GROW_PLANT_SUN_COST,_loc3_))
         {
            _loc5_ = (_loc4_ as TalentGrowPlantSunCost).getGrowPlantSunCost(param1);
            if(_loc6_ = this.getFactory(param2).getEffectByType(TalentFactory.EFF_BUY_AGAIN_PRICE_DISCOUNT,_loc3_))
            {
               return (_loc6_ as TalentBuyAgainPriceDiscount).getDiscount() * _loc5_;
            }
            return _loc5_;
         }
         return param1.baseInfo.price;
      }
      
      public function getGrowPlantSunCostDiscount(param1:TDPlantStaticInfo, param2:Int64 = null) : Number
      {
         var _loc3_:int = param1.baseInfo.prePlantType == 0 ? int(param1.baseInfo.id) : int(param1.baseInfo.prePlantType);
         var _loc4_:ITalentEffect;
         if(_loc4_ = this.getFactory(param2).getEffectByType(TalentFactory.EFF_BUY_AGAIN_PRICE_DISCOUNT,_loc3_))
         {
            return (_loc4_ as TalentBuyAgainPriceDiscount).getDiscount();
         }
         return 1;
      }
      
      public function isGrowPlantSunCostChange(param1:TDPlantStaticInfo, param2:Int64 = null) : Boolean
      {
         var _loc3_:int = param1.baseInfo.prePlantType == 0 ? int(param1.baseInfo.id) : int(param1.baseInfo.prePlantType);
         var _loc4_:ITalentEffect;
         if(_loc4_ = this.getFactory(param2).getEffectByType(TalentFactory.EFF_GROW_PLANT_SUN_COST,_loc3_))
         {
            return (_loc4_ as TalentGrowPlantSunCost).isGrowPlantSunCostChange(param1);
         }
         return false;
      }
      
      public function growPlantSunDrop(param1:BasicPlant, param2:Int64 = null) : void
      {
         var _loc3_:int = param1.plantData.plantStaticInfo.baseInfo.prePlantType == 0 ? int(param1.plantData.plantStaticInfo.baseInfo.id) : int(param1.plantData.plantStaticInfo.baseInfo.prePlantType);
         var _loc4_:ITalentEffect;
         if(_loc4_ = this.getFactory(param2).getEffectByType(TalentFactory.EFF_GROW_PLANT_SUN_DROP,_loc3_))
         {
            return (_loc4_ as TalentGrowPlantSunDrop).growPlantSunDrop(param1);
         }
      }
      
      public function getPlantCardCoolTime(param1:TDPlantStaticInfo, param2:Int64 = null) : Number
      {
         var _loc3_:int = param1.baseInfo.prePlantType == 0 ? int(param1.baseInfo.id) : int(param1.baseInfo.prePlantType);
         var _loc4_:ITalentEffect;
         if(_loc4_ = this.getFactory(param2).getEffectByType(TalentFactory.EFF_CARD_COOL_DOWN_TIME,_loc3_))
         {
            return (_loc4_ as TalentCardCoolDown).getPlantCardCoolTime(param1);
         }
         return param1.baseInfo.cardRefreshDuration;
      }
      
      public function getPlugPlantDieCardCoolTime(param1:TDPlantStaticInfo, param2:Int64 = null) : Number
      {
         var _loc3_:int = param1.baseInfo.prePlantType == 0 ? int(param1.baseInfo.id) : int(param1.baseInfo.prePlantType);
         var _loc4_:ITalentEffect;
         if(_loc4_ = this.getFactory(param2).getEffectByType(TalentFactory.EFF_PLUS_CARD_COOL_DOWN_TIME_PLANT_DIE,_loc3_))
         {
            return (_loc4_ as TalentCardCoolDownPlantDie).getPlugPlantCardCoolTime(param1);
         }
         return 0;
      }
      
      public function getPlantMaxHP(param1:TDPlantStaticInfo, param2:Int64 = null) : Number
      {
         var _loc3_:int = param1.baseInfo.prePlantType == 0 ? int(param1.baseInfo.id) : int(param1.baseInfo.prePlantType);
         var _loc4_:ITalentEffect;
         if(_loc4_ = this.getFactory(param2).getEffectByType(TalentFactory.EFF_PLANT_MAX_HP,_loc3_))
         {
            return (_loc4_ as TalentPlantMaxHP).getPlantMaxHP(param1);
         }
         return param1.baseInfo.hp;
      }
      
      public function getReflectHurt(param1:TDPlantStaticInfo, param2:Int64 = null) : Number
      {
         var _loc3_:int = param1.baseInfo.prePlantType == 0 ? int(param1.baseInfo.id) : int(param1.baseInfo.prePlantType);
         var _loc4_:ITalentEffect;
         if(_loc4_ = this.getFactory(param2).getEffectByType(TalentFactory.EFF_REFLECT_HURT,_loc3_))
         {
            return (_loc4_ as TalentReflectHurt).getReflectHurt(param1);
         }
         return 0;
      }
      
      public function getPlusAttackNum(param1:TDPlantStaticInfo, param2:Int64 = null) : int
      {
         var _loc3_:int = param1.baseInfo.prePlantType == 0 ? int(param1.baseInfo.id) : int(param1.baseInfo.prePlantType);
         var _loc4_:ITalentEffect;
         if(_loc4_ = this.getFactory(param2).getEffectByType(TalentFactory.EFF_PLUS_ATTACK_NUM,_loc3_))
         {
            return (_loc4_ as TalentPlusAttackNum).getPlusAttackNum(param1);
         }
         return 0;
      }
      
      public function getPlusAttackPowerRate(param1:TDPlantStaticInfo, param2:int, param3:Int64 = null) : int
      {
         var _loc4_:int = param1.baseInfo.prePlantType == 0 ? int(param1.baseInfo.id) : int(param1.baseInfo.prePlantType);
         var _loc5_:ITalentEffect;
         if(_loc5_ = this.getFactory(param3).getEffectByType(TalentFactory.EFF_PLUS_ATTACK_POWER,_loc4_))
         {
            return (_loc5_ as TalentPlusAttackPower).getPlusAttackPower(param1,param2);
         }
         return 0;
      }
      
      public function getDropSun(param1:TDPlantBaseStaticInfo, param2:IGameObject, param3:Int64 = null) : Number
      {
         var _loc4_:int = param1.prePlantType == 0 ? int(param1.id) : int(param1.prePlantType);
         var _loc5_:ITalentEffect;
         if(_loc5_ = this.getFactory(param3).getEffectByType(TalentFactory.EFF_ATTACK_ZOMBIE_DROP,_loc4_))
         {
            return (_loc5_ as TalentAttackZombieDrop).getDropSun(param1,param2);
         }
         return 0;
      }
      
      public function getKillZombieDropSun(param1:TDPlantStaticInfo, param2:IGameObject, param3:Int64 = null) : Number
      {
         var _loc4_:int = param1.baseInfo.prePlantType == 0 ? int(param1.baseInfo.id) : int(param1.baseInfo.prePlantType);
         var _loc5_:ITalentEffect;
         if(_loc5_ = this.getFactory(param3).getEffectByType(TalentFactory.EFF_KILL_ZOMBIE_DROP,_loc4_))
         {
            return (_loc5_ as TalentAttackZombieDrop).getDropSun(param1.baseInfo,param2);
         }
         return 0;
      }
      
      public function getKillPlantDropSun(param1:TDPlantStaticInfo, param2:IGameObject, param3:Int64 = null) : Number
      {
         var _loc4_:int = param1.baseInfo.prePlantType == 0 ? int(param1.baseInfo.id) : int(param1.baseInfo.prePlantType);
         var _loc5_:ITalentEffect;
         if(_loc5_ = this.getFactory(param3).getEffectByType(TalentFactory.EFF_KILL_PLANT_DROP,_loc4_))
         {
            return (_loc5_ as TalentAttackZombieDrop).getDropSun(param1.baseInfo,param2);
         }
         return 0;
      }
      
      public function getPlusDurationTime(param1:TDPlantStaticInfo, param2:Int64 = null) : Number
      {
         var _loc3_:int = param1.baseInfo.prePlantType == 0 ? int(param1.baseInfo.id) : int(param1.baseInfo.prePlantType);
         var _loc4_:ITalentEffect;
         if(_loc4_ = this.getFactory(param2).getEffectByType(TalentFactory.EFF_PLUS_COOLDOWN_TIME,_loc3_))
         {
            return (_loc4_ as TalentPlusCoolDownTime).getPlusDurationTime(param1);
         }
         return 0;
      }
      
      public function getAttackArea(param1:int, param2:Rectangle, param3:Int64 = null) : Array
      {
         var _loc4_ = TDDataFactory.instance.getPlantInfoByID(param1)
         param1 = _loc4_.baseInfo.prePlantType == 0 ? int(_loc4_.baseInfo.id) : int(_loc4_.baseInfo.prePlantType);
         var _loc5_:ITalentEffect;
         if(_loc5_ = this.getFactory(param3).getEffectByType(TalentFactory.EFF_ATTACK_AREA_DOUBLE,param1))
         {
            return (_loc5_ as TalentAttackAreaDouble).getAttackArea(_loc4_,param2);
         }
         return [param2];
      }
      
      public function getBuffTime(param1:TDPlantStaticInfo, param2:TDBuffStaticInfo, param3:Int64 = null) : Number
      {
         var _loc4_:int = param1.baseInfo.prePlantType == 0 ? int(param1.baseInfo.id) : int(param1.baseInfo.prePlantType);
         var _loc5_:ITalentEffect;
         if(_loc5_ = this.getFactory(param3).getEffectByType(TalentFactory.EFF_PLUS_BUFF_TIME,_loc4_))
         {
            return (_loc5_ as TalentPlusBuffTime).getPlugBuffTime(param1,param2);
         }
         return param2.duration.get();
      }
      
      public function getPlusBulletNum(param1:TDPlantStaticInfo, param2:Int64 = null) : int
      {
         var _loc3_:int = param1.baseInfo.prePlantType == 0 ? int(param1.baseInfo.id) : int(param1.baseInfo.prePlantType);
         var _loc4_:ITalentEffect;
         if(_loc4_ = this.getFactory(param2).getEffectByType(TalentFactory.EFF_PLUS_BULLET_NUM,_loc3_))
         {
            return (_loc4_ as TalentPlusBulletNum).getPlusBulletNum(param1);
         }
         return 0;
      }
      
      public function getAttackSpeed(param1:TDPlantStaticInfo, param2:IGameObject, param3:Number, param4:Int64 = null) : Number
      {
         var _loc5_:int = param1.baseInfo.prePlantType == 0 ? int(param1.baseInfo.id) : int(param1.baseInfo.prePlantType);
         var _loc6_:ITalentEffect;
         if(_loc6_ = this.getFactory(param4).getEffectByType(TalentFactory.EFF_ATTACK_SPEED,_loc5_))
         {
            return (_loc6_ as TalentAttackSpeed).getAttackSpeed(param1,param2,param3);
         }
         return param3;
      }
      
      public function getBulletType(param1:TDPlantStaticInfo, param2:int, param3:Int64 = null) : int
      {
         var _loc4_:int = param1.baseInfo.prePlantType == 0 ? int(param1.baseInfo.id) : int(param1.baseInfo.prePlantType);
         var _loc5_:ITalentEffect;
         if(_loc5_ = this.getFactory(param3).getEffectByType(TalentFactory.EFF_SAME_TARGET_BULLET_TYPE,_loc4_))
         {
            return (_loc5_ as TalentSameTargetBulletType).getBulletType(param1,param2);
         }
         return param1.baseInfo.bulletType;
      }
      
      public function getPlusBulletAttackPower(param1:TDPlantStaticInfo, param2:int, param3:Int64 = null) : int
      {
         var _loc4_:int = param1.baseInfo.prePlantType == 0 ? int(param1.baseInfo.id) : int(param1.baseInfo.prePlantType);
         var _loc5_:ITalentEffect;
         if(_loc5_ = this.getFactory(param3).getEffectByType(TalentFactory.EFF_SAME_TARGET_BULLET_TYPE,_loc4_))
         {
            return (_loc5_ as TalentSameTargetBulletType).getPlusBulletAttackPower(param1,param2);
         }
         return 0;
      }
      
      public function isProductBigSun(param1:TDPlantStaticInfo, param2:Int64 = null) : Boolean
      {
         var _loc3_:int = param1.baseInfo.prePlantType == 0 ? int(param1.baseInfo.id) : int(param1.baseInfo.prePlantType);
         var _loc4_:ITalentEffect;
         if(_loc4_ = this.getFactory(param2).getEffectByType(TalentFactory.EFF_PRODUCT_BIG_SUN,_loc3_))
         {
            return (_loc4_ as TalentProductBigSun).isProductBigSun(param1);
         }
         return false;
      }
      
      public function plugAttackBuff(param1:BasicPlant, param2:IGameObject, param3:Int64 = null) : void
      {
         var _loc4_:int = param1.plantData.plantStaticInfo.baseInfo.prePlantType == 0 ? int(param1.plantData.plantStaticInfo.baseInfo.id) : int(param1.plantData.plantStaticInfo.baseInfo.prePlantType);
         var _loc5_:ITalentEffect;
         if(_loc5_ = this.getFactory(param3).getEffectByType(TalentFactory.EFF_ATTACK_PLUG_BUFF,_loc4_))
         {
            return (_loc5_ as TalentAttackPlugBuff).plugAttackBuff(param1,param2);
         }
      }
      
      public function isShootDownArmor(param1:TDPlantStaticInfo, param2:int, param3:Int64 = null) : Boolean
      {
         var _loc4_:int = param1.baseInfo.prePlantType == 0 ? int(param1.baseInfo.id) : int(param1.baseInfo.prePlantType);
         var _loc5_:ITalentEffect;
         if(_loc5_ = this.getFactory(param3).getEffectByType(TalentFactory.EFF_SHOOT_DOWN_ARMOR,_loc4_))
         {
            return (_loc5_ as TalentShootDownArmor).isShootDownArmor(param1,param2);
         }
         return false;
      }
      
      public function isCritAttack(param1:TDPlantStaticInfo, param2:int, param3:Int64 = null) : int
      {
         var _loc4_:int = param1.baseInfo.prePlantType == 0 ? int(param1.baseInfo.id) : int(param1.baseInfo.prePlantType);
         var _loc5_:ITalentEffect;
         if(_loc5_ = this.getFactory(param3).getEffectByType(TalentFactory.EFF_IS_CRIT,_loc4_))
         {
            return (_loc5_ as TalentPlusAttackPower).getPlusAttackPower(param1,param2);
         }
         return 0;
      }
      
      public function getMeragePlanType(param1:TDPlantStaticInfo, param2:Int64 = null) : int
      {
         var _loc3_:int = param1.baseInfo.prePlantType == 0 ? int(param1.baseInfo.id) : int(param1.baseInfo.prePlantType);
         var _loc4_:ITalentEffect;
         if(_loc4_ = this.getFactory(param2).getEffectByType(TalentFactory.EFF_MERGE_PLANT,_loc3_))
         {
            return (_loc4_ as TalentMergePlant).getMergePlantType(param1);
         }
         return 0;
      }
      
      public function getIceNum(param1:TDPlantStaticInfo, param2:Int64 = null) : int
      {
         var _loc3_:int = param1.baseInfo.prePlantType == 0 ? int(param1.baseInfo.id) : int(param1.baseInfo.prePlantType);
         var _loc4_:ITalentEffect;
         if(_loc4_ = this.getFactory(param2).getEffectByType(TalentFactory.EFF_ICE_NUM,_loc3_))
         {
            return (_loc4_ as TalentIceNum).getIceNum(param1);
         }
         return 1;
      }
      
      public function getCastSkillAfterPlantTimes(param1:TDPlantStaticInfo, param2:int, param3:Int64 = null) : int
      {
         var _loc4_:int = param1.baseInfo.prePlantType == 0 ? int(param1.baseInfo.id) : int(param1.baseInfo.prePlantType);
         var _loc5_:ITalentEffect;
         if(_loc5_ = this.getFactory(param3).getEffectByType(TalentFactory.EFF_CAST_SKILL_AFTER_PLANT,_loc4_))
         {
            return (_loc5_ as TalentCastSkillAfterPlant).getCastSkillTimes(param2);
         }
         return 1;
      }
      
      public function getAddBuffId(param1:TDPlantStaticInfo, param2:Int64 = null) : int
      {
         var _loc3_:int = param1.baseInfo.prePlantType == 0 ? int(param1.baseInfo.id) : int(param1.baseInfo.prePlantType);
         var _loc4_:ITalentEffect;
         if(_loc4_ = this.getFactory(param2).getEffectByType(TalentFactory.EFF_ADD_BUFF,_loc3_))
         {
            return (_loc4_ as TalentAddBuff).getAddBuffId();
         }
         return 0;
      }
      
      public function getPlantExplodeDetail(param1:TDPlantStaticInfo, param2:Int64 = null) : Array
      {
         var _loc3_:int = param1.baseInfo.prePlantType == 0 ? int(param1.baseInfo.id) : int(param1.baseInfo.prePlantType);
         var _loc4_:ITalentEffect;
         if(_loc4_ = this.getFactory(param2).getEffectByType(TalentFactory.EFF_EXPLODE_AT_LAST_ZOMBIE,_loc3_))
         {
            return (_loc4_ as TalentExplodeAtLastZombie).getExplodeParams();
         }
         return null;
      }
      
      public function getPlantRebornTimes(param1:TDPlantStaticInfo, param2:int, param3:Int64 = null) : int
      {
         var _loc4_:int = param1.baseInfo.prePlantType == 0 ? int(param1.baseInfo.id) : int(param1.baseInfo.prePlantType);
         var _loc5_:ITalentEffect;
         if(_loc5_ = this.getFactory(param3).getEffectByType(TalentFactory.EFF_REBORN,_loc4_))
         {
            return (_loc5_ as TalentReborn).getRebornTimes(param2);
         }
         return 1;
      }
      
      public function getTimeToTransformId(param1:TDPlantStaticInfo, param2:int, param3:Int64 = null) : int
      {
         var _loc4_:int = param1.baseInfo.prePlantType == 0 ? int(param1.baseInfo.id) : int(param1.baseInfo.prePlantType);
         var _loc5_:ITalentEffect;
         if(_loc5_ = this.getFactory(param3).getEffectByType(TalentFactory.EFF_TRANSFORM_AFTER_KILL_SOME_ZOMBIE,_loc4_))
         {
            return (_loc5_ as TalentTransformAfterKillSomeZombie).getTimeToTransformId(param2);
         }
         return 0;
      }
      
      public function getKickAwayEnable(param1:TDPlantStaticInfo, param2:Int64 = null) : Boolean
      {
         var _loc3_:int = param1.baseInfo.prePlantType == 0 ? int(param1.baseInfo.id) : int(param1.baseInfo.prePlantType);
         var _loc4_:ITalentEffect;
         if(_loc4_ = this.getFactory(param2).getEffectByType(TalentFactory.EFF_ZOMBIE_KICK_AWAY,_loc3_))
         {
            return (_loc4_ as TalentZombieKickAway).getKickAwayEnable();
         }
         return false;
      }
      
      public function getAddRate(param1:TDPlantStaticInfo, param2:Int64 = null) : Number
      {
         var _loc3_:int = param1.baseInfo.prePlantType == 0 ? int(param1.baseInfo.id) : int(param1.baseInfo.prePlantType);
         var _loc4_:ITalentEffect;
         if(_loc4_ = this.getFactory(param2).getEffectByType(TalentFactory.EFF_ADD_RATE,_loc3_))
         {
            return (_loc4_ as TalentAddRate).getAddRate();
         }
         return 0;
      }
      
      public function getDamagePlus(param1:TDPlantStaticInfo, param2:int, param3:Int64 = null) : Number
      {
         var _loc4_:int = param1.baseInfo.prePlantType == 0 ? int(param1.baseInfo.id) : int(param1.baseInfo.prePlantType);
         var _loc5_:ITalentEffect;
         if(_loc5_ = this.getFactory(param3).getEffectByType(TalentFactory.EFF_DAMAGE_PLUS,_loc4_))
         {
            return (_loc5_ as TalentDamagePlus).getDamagePlus(param2);
         }
         return 1;
      }
      
      public function getPlantSomeAbilityPromotion(param1:int, param2:int, param3:Int64 = null) : Number
      {
         var _loc4_:ITalentEffect;
         if(_loc4_ = this.getFactory(param3).getEffectByType(TalentFactory.EFF_PLANT_SOME_ABILITY_PROMOTE,param1))
         {
            return (_loc4_ as TalentPlantSomeAbilityPromote).getPromotionRateByType(param2);
         }
         return 1;
      }
      
      public function getCostCut(param1:TDPlantStaticInfo, param2:Int64 = null) : Number
      {
         var _loc3_:int = param1.baseInfo.prePlantType == 0 ? int(param1.baseInfo.id) : int(param1.baseInfo.prePlantType);
         var _loc4_:ITalentEffect;
         if(_loc4_ = this.getFactory(param2).getEffectByType(TalentFactory.EFF_PLANT_SKILL_COST_LESS,_loc3_))
         {
            return (_loc4_ as TalentPlantSkillCostLess).getCostCut();
         }
         return 0;
      }
      
      public function getFlyTrapCatchHp(param1:TDPlantStaticInfo, param2:Int64 = null) : Number
      {
         var _loc3_:int = param1.baseInfo.prePlantType == 0 ? int(param1.baseInfo.id) : int(param1.baseInfo.prePlantType);
         var _loc4_:ITalentEffect;
         if(_loc4_ = this.getFactory(param2).getEffectByType(TalentFactory.EFF_PLANT_FLYTRAP_CATCH,_loc3_))
         {
            return (_loc4_ as TalentPlantFlyTrapCatch).getBlood();
         }
         return 0;
      }
   }
}
