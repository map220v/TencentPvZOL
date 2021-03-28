package com.qq.modules.td.logic.numeric
{
   import PVZ.Cmd.Dto_PlantInfo;
   import com.qq.CommandName;
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDElementType;
   import com.qq.modules.endlessTD.model.templates.EndlessTemplateFactory;
   import com.qq.modules.td.command.game.TDGameCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.data.GlobelProtectValue;
   import com.qq.modules.td.logic.talent.TalentManager;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.bullet.BasicBullet;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.modules.td.model.TDStartParam;
   import com.qq.utils.CommandDispatcher;
   import org.as3commons.logging.api.getLogger;
   
   public class TDDamageCaculete
   {
       
      
      public function TDDamageCaculete()
      {
         super();
      }
      
      public static function caculateBulletDamage(param1:BasicBullet, param2:IGameObject) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Number = NaN;
         var _loc5_:BasicPlant = null;
         var _loc6_:BasicPlant = null;
         if(param1.shooter.objectModel.unitCatalog == TDConstant.UnitCatalog_Plant)
         {
            _loc3_ = (_loc5_ = param1.shooter as BasicPlant).plantData.plantStaticInfo.baseInfo.attackType;
            _loc4_ = getPlantAttckDamage(_loc5_,param2,param1.isSpecialSkill);
         }
         else if(param1.shooter.objectModel.unitCatalog == TDConstant.UnitCatalog_Zombie)
         {
            _loc4_ = -(param1.shooter as BasicZombie).zombieData.zombiestaticInfo.attackValue;
         }
         else
         {
            _loc3_ = TDConstant.AttackType_Normal;
            _loc4_ = -1;
         }
         executeDamage(param2,_loc4_,_loc3_,TDConstant.AttackMode_Normal,param1.shooter);
         CommandDispatcher.send(CommandName.TD_BE_ATTACKED,{
            "fromUid":param1.shooter.uid,
            "toUid":param2.uid
         });
         if(param1.shooter is BasicPlant)
         {
            _loc6_ = param1.shooter as BasicPlant;
            TalentManager.instance.getDropSun(_loc6_.plantData.plantStaticInfo.baseInfo,param2);
            TalentManager.instance.plugAttackBuff(param1.shooter as BasicPlant,param2);
         }
         if(param1.bulletData.bulletStaticInfo.hitBuff != 0)
         {
            if(param2.isVaild)
            {
               param2.objectModel.addBuff(param1.bulletData.bulletStaticInfo.hitBuff,param1);
            }
         }
         TDSoundCmd.zombieHitByBullet(param2.uid,param1.bulletData.bulletStaticInfo.type);
      }
      
      public static function caculatePlantAttckDamage(param1:BasicPlant, param2:IGameObject, param3:Number = 0, param4:Boolean = false, param5:int = 0, param6:int = 0) : void
      {
         var _loc7_:Number = getPlantAttckDamage(param1,param2,param4) + param3;
         if(param2.objectModel.unitCatalog == TDConstant.UnitCatalog_Zombie)
         {
            executeDamage(param2,_loc7_,param1.plantData.plantStaticInfo.baseInfo.attackType,param5,param1,param6);
         }
         else if(param2.objectModel.unitCatalog == TDConstant.UnitCatalog_Object)
         {
            executeDamage(param2,_loc7_,param1.plantData.plantStaticInfo.baseInfo.attackType,param5,param1,param6);
         }
         CommandDispatcher.send(CommandName.TD_BE_ATTACKED,{
            "fromUid":param1.uid,
            "toUid":param2.uid
         });
      }
      
      public static function caculatePlantDamage(param1:BasicPlant, param2:Array, param3:Boolean = false, param4:int = -1, param5:int = 0) : void
      {
         var _loc6_:BasicPlant = param1 as BasicPlant;
         if(param4 == -1)
         {
            param4 = _loc6_.plantData.plantStaticInfo.baseInfo.damageType;
         }
         var _loc7_:int = 0;
         while(_loc7_ < param2.length)
         {
            caculatePlantAttckDamage(param1,param2[_loc7_],0,param3,param4,param5);
            _loc7_++;
         }
      }
      
      public static function getPlantAttckDamage(param1:BasicPlant, param2:IGameObject, param3:Boolean = false) : Number
      {
         var _loc6_:BasicZombie = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         if(param1 == null)
         {
            getLogger("TD").debug("射击者为空");
            return 0;
         }
         if(param2 == null)
         {
            getLogger("TD").debug("攻击目标为空");
            return 0;
         }
         var _loc4_:int = 0;
         var _loc5_:Number = 0;
         if(param2.objectModel.unitCatalog == TDConstant.UnitCatalog_Zombie)
         {
            if((_loc6_ = param2 as BasicZombie).zombieData.isExistArmor())
            {
               _loc5_ = !!param3 ? Number(param1.plantData.plantStaticInfo.baseInfo.specialSkillDamageValueForShielded) : Number(param1.plantData.plantStaticInfo.baseInfo.damageValueForShielded);
            }
            else
            {
               _loc5_ = !!param3 ? Number(param1.plantData.plantStaticInfo.baseInfo.specialSkillDamageValue) : Number(param1.plantData.plantStaticInfo.baseInfo.damageValue);
            }
         }
         else
         {
            _loc5_ = !!param3 ? Number(param1.plantData.plantStaticInfo.baseInfo.specialSkillDamageValue) : Number(param1.plantData.plantStaticInfo.baseInfo.damageValue);
         }
         _loc5_ *= GlobelProtectValue.getInstance().get(GlobelProtectValue.KEY_VALUE_001);
         _loc4_ = -GlobelProtectValue.getInstance().get(GlobelProtectValue.KEY_FIGHTPOWER) * _loc5_;
         if(param3 == false)
         {
            if((_loc7_ = TalentManager.instance.getPlusAttackPowerRate(param1.plantData.plantStaticInfo,param2.objectModel.staticInfo.type)) != 0)
            {
               _loc4_ -= param1.plantData.plantStaticInfo.baseInfo.damageValue * _loc7_ / 100;
            }
            if((_loc8_ = TalentManager.instance.getPlusBulletAttackPower(param1.plantData.plantStaticInfo,param1.uid)) != 0)
            {
               _loc4_ -= param1.plantData.plantStaticInfo.baseInfo.damageValue * _loc8_ / 100;
            }
         }
         return _loc4_;
      }
      
      public static function caculateZombieDamage(param1:BasicZombie, param2:IGameObject, param3:int = -2) : void
      {
         var _loc5_:int = 0;
         var _loc6_:Number = NaN;
         var _loc4_:Number = 0;
         if(!param1.model.isAlive())
         {
            return;
         }
         _loc4_ = -param1.zombieData.zombiestaticInfo.attackValue;
         if(param2.objectModel.unitCatalog == TDConstant.UnitCatalog_Zombie)
         {
            _loc5_ = TDConstant.AttackMode_ZombieAttack;
         }
         if(param3 != -2)
         {
            _loc5_ = param3;
         }
         param2.changeHp(_loc4_,TDConstant.AttackType_Normal,_loc5_,param1);
         param2.objectModel.addBuff(TDConstant.TDBuffID_BeAttacked,null);
         if(param2 is BasicPlant && _loc4_ < 0)
         {
            if((_loc6_ = TalentManager.instance.getReflectHurt((param2 as BasicPlant).plantData.plantStaticInfo)) != 0)
            {
               executeDamage(param1,_loc6_,TDConstant.AttackType_Normal,TDConstant.AttackMode_Normal,param2);
            }
         }
      }
      
      public static function executeDamage(param1:IGameObject, param2:int, param3:int, param4:int, param5:IGameObject = null, param6:int = 0) : void
      {
         var _loc8_:int = 0;
         var _loc9_:Dto_PlantInfo = null;
         var _loc10_:int = 0;
         switch(param6)
         {
            case TDElementType.FIRE_TYPE:
               param1.objectModel.removeBuffByElementType(TDElementType.ICE_TYPE);
               break;
            case TDElementType.ICE_TYPE:
               param1.objectModel.removeBuffByElementType(TDElementType.FIRE_TYPE);
         }
         if(param5 is BasicPlant)
         {
            param2 *= TalentManager.instance.getDamagePlus((param5 as BasicPlant).plantData.plantStaticInfo,param1.objectModel.unitType);
         }
         var _loc7_:Boolean;
         if(_loc7_ = param1.changeHp(param2,param3,param4,param5))
         {
            if(TDStageInfo.getInstance().startParam.gameType == TDStartParam.Endless && param1 is BasicZombie && param5 is BasicPlant)
            {
               _loc8_ = (param5 as BasicPlant).plantData.plantStaticInfo.baseInfo.endlessTDScoreRatio;
               if((_loc9_ = TDStageInfo.getInstance().getPlantDto((param5 as BasicPlant).plantData.plantStaticInfo.id)) && _loc9_.strengthLevel > 0)
               {
                  _loc8_ += EndlessTemplateFactory.instance.getStrengthenTemplate(_loc9_.strengthLevel).scoreRatio;
               }
               _loc10_ = (param1 as BasicZombie).zombieData.zombiestaticInfo.endlessTDScore * _loc8_ * 0.0001;
               TDGameCmd.changeEndlessScore(_loc10_);
            }
         }
      }
   }
}
