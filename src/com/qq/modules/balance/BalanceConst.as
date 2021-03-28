package com.qq.modules.balance
{
   import PVZ.Cmd.Dto_CardBaseInfo;
   import PVZ.Cmd.Dto_CardFullInfo;
   import PVZ.Cmd.Dto_CardPower;
   import PVZ.Cmd.E_PowerEle;
   import com.qq.GameGloble;
   import com.qq.modules.basic.model.templates.ServerConfigTemplateFactory;
   import com.qq.modules.card.model.templates.CardForgeTemplate;
   import com.qq.modules.card.model.templates.CardTemplateFactory;
   import com.qq.modules.card.model.vo.CardItemVO;
   import com.qq.modules.main.model.SettingsModel;
   import com.qq.modules.main.model.settings.battle.ce.BattleLineupCardFeatureTemp;
   import com.qq.modules.main.model.settings.battle.ce.BattleLineupCardTemp;
   import com.qq.modules.main.model.vo.Attribute;
   import com.qq.modules.speed.model.templates.SpeedTemplateFactory;
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.UInt64;
   import flash.utils.Dictionary;
   
   public class BalanceConst
   {
      
      public static const CONDITION_STAR:uint = 5;
      
      public static const CONDITION_RARITY:uint = 3;
      
      public static const NEED_FORGE_LEVEL:int = 5;
      
      public static const NEED_QUALITY:uint = 1;
      
      private static var s_dicAttribute:Dictionary;
      
      private static var s_need_card_level:uint;
       
      
      public function BalanceConst()
      {
         super();
      }
      
      public static function getForgeAttribute(param1:Number, param2:Number) : Number
      {
         return param1 * (param2 / 10000);
      }
      
      private static function getAttributeBuff(param1:int) : Attribute
      {
         if(s_dicAttribute == null)
         {
            s_dicAttribute = new Dictionary();
            s_dicAttribute[1] = parseFromString(ServerConfigTemplateFactory.instance.sBalancePkAttackAttributes);
            s_dicAttribute[2] = parseFromString(ServerConfigTemplateFactory.instance.sBalancePkDefenseAttributes);
            s_dicAttribute[3] = parseFromString(ServerConfigTemplateFactory.instance.sBalancePkAuxiliaryAttributes);
         }
         return s_dicAttribute[param1];
      }
      
      private static function parseFromString(param1:String) : Attribute
      {
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc5_:String = null;
         var _loc2_:Attribute = new Attribute();
         if(param1)
         {
            _loc3_ = param1.split(";");
            for each(_loc5_ in _loc3_)
            {
               _loc4_ = _loc5_.split(":");
               _loc2_.setAttribute(_loc4_[0],_loc4_[1]);
            }
         }
         return _loc2_;
      }
      
      public static function get NEED_CARD_LEVEL() : uint
      {
         if(s_need_card_level == 0)
         {
            s_need_card_level = ServerConfigTemplateFactory.instance.iBalancePkLevel;
         }
         return s_need_card_level;
      }
      
      public static function getBaseAttribute(param1:Number, param2:Number) : Number
      {
         return param1 + BalanceConst.NEED_CARD_LEVEL * param2;
      }
      
      public static function getFeatureAttribute(param1:Number, param2:int, param3:int) : Number
      {
         var _loc4_:Number = param2 > 1 ? Number(-param1) : Number(param1);
         return Number(param3 > 0 ? Number(_loc4_ * 100) : Number(_loc4_));
      }
      
      public static function checkCondition(param1:BattleLineupCardTemp) : Boolean
      {
         if(param1.star != CONDITION_STAR)
         {
            return false;
         }
         if(param1.onUse <= 0)
         {
            return false;
         }
         if(param1.awakeLevel != 0)
         {
            return false;
         }
         return true;
      }
      
      public static function createCard(param1:BattleLineupCardTemp) : CardItemVO
      {
         var _loc6_:BattleLineupCardFeatureTemp = null;
         var _loc7_:int = 0;
         var _loc8_:Attribute = null;
         var _loc9_:Dto_CardBaseInfo = null;
         var _loc10_:Dto_CardFullInfo = null;
         var _loc11_:Array = null;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:Dto_CardPower = null;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc23_:int = 0;
         var _loc25_:Dto_CardPower = null;
         var _loc2_:Attribute = new Attribute();
         _loc2_.setAttribute(Attribute.ATTACK,BalanceConst.getBaseAttribute(param1.initialAttack,param1.growAttack));
         _loc2_.setAttribute(Attribute.DEFENSE,BalanceConst.getBaseAttribute(param1.initialDefense,param1.growDefense));
         _loc2_.setAttribute(Attribute.HP,BalanceConst.getBaseAttribute(param1.initialHp,param1.growHp));
         _loc2_.setAttribute(Attribute.SHIELD,BalanceConst.getBaseAttribute(param1.initialShield,param1.growShield));
         _loc2_.setAttribute(Attribute.ABILITY,BalanceConst.getBaseAttribute(param1.initialAbility,param1.growAbility));
         _loc2_.setAttribute(Attribute.HIT,BalanceConst.getBaseAttribute(param1.initialHit,param1.growHit));
         _loc2_.setAttribute(Attribute.DODGE,BalanceConst.getBaseAttribute(param1.initialDodge,param1.growDodge));
         _loc2_.setAttribute(Attribute.CRITICAL,BalanceConst.getBaseAttribute(param1.initialCritical,param1.growCritical));
         _loc2_.setAttribute(Attribute.TOUGH,BalanceConst.getBaseAttribute(param1.initialTough,param1.growTough));
         _loc2_.setAttribute(Attribute.IMMUNE,BalanceConst.getBaseAttribute(param1.initialImmune,param1.growImmune));
         var _loc3_:CardForgeTemplate = CardTemplateFactory.instance.getCardForgeTemplate(param1.id,BalanceConst.NEED_FORGE_LEVEL);
         var _loc4_:Attribute = new Attribute();
         if(_loc3_)
         {
            _loc4_.setAttribute(Attribute.ATTACK,BalanceConst.getForgeAttribute(_loc2_.getAttribute(Attribute.ATTACK),_loc3_.addAtk));
            _loc4_.setAttribute(Attribute.DEFENSE,BalanceConst.getForgeAttribute(_loc2_.getAttribute(Attribute.DEFENSE),_loc3_.addDef));
            _loc4_.setAttribute(Attribute.HP,BalanceConst.getForgeAttribute(_loc2_.getAttribute(Attribute.HP),_loc3_.addHp));
            _loc4_.setAttribute(Attribute.SHIELD,BalanceConst.getForgeAttribute(_loc2_.getAttribute(Attribute.SHIELD),_loc3_.addShield));
            _loc4_.setAttribute(Attribute.ABILITY,BalanceConst.getForgeAttribute(_loc2_.getAttribute(Attribute.ABILITY),_loc3_.addAbility));
         }
         var _loc5_:Attribute = new Attribute();
         for each(_loc7_ in param1.features)
         {
            _loc6_ = SettingsModel.instance.battleCardFeatureSettings.getCardFeatureTempById(_loc7_);
            _loc5_.setAttribute(_loc6_.type,BalanceConst.getFeatureAttribute(_loc6_.value,_loc6_.sign,_loc6_.valueType));
         }
         _loc8_ = getAttributeBuff(param1.subType);
         _loc2_.mergeAttribute(_loc4_);
         _loc2_.mergeAttribute(_loc5_);
         _loc2_.mergeAttribute(_loc8_);
         (_loc9_ = new Dto_CardBaseInfo()).cardId = param1.id;
         _loc9_.level = NEED_CARD_LEVEL;
         _loc9_.forgeLevel = NEED_FORGE_LEVEL;
         _loc9_.quality = NEED_QUALITY;
         _loc9_.uid = Int64.fromNumber(param1.id);
         (_loc10_ = new Dto_CardFullInfo()).attack = calculateAttribute(_loc2_.getAttribute(Attribute.ATTACK,true),_loc2_.getAttribute(Attribute.PERCENT_ATTACK));
         _loc10_.defense = calculateAttribute(_loc2_.getAttribute(Attribute.DEFENSE,true),_loc2_.getAttribute(Attribute.PERCENT_DEFENSE));
         _loc10_.hp = UInt64.fromNumber(calculateAttribute(_loc2_.getAttribute(Attribute.HP,true),_loc2_.getAttribute(Attribute.PERCENT_HP)));
         _loc10_.shield = UInt64.fromNumber(calculateAttribute(_loc2_.getAttribute(Attribute.SHIELD,true),_loc2_.getAttribute(Attribute.PERCENT_SHIELD)));
         _loc10_.ability = calculateAttribute(_loc2_.getAttribute(Attribute.ABILITY,true),_loc2_.getAttribute(Attribute.PERCENT_ABILITY));
         _loc10_.hit = calculateAttribute(_loc2_.getAttribute(Attribute.HIT,true),_loc2_.getAttribute(Attribute.PERCENT_HIT));
         _loc10_.dodge = calculateAttribute(_loc2_.getAttribute(Attribute.DODGE,true),_loc2_.getAttribute(Attribute.PERCENT_DODGE));
         _loc10_.critical = calculateAttribute(_loc2_.getAttribute(Attribute.CRITICAL,true),_loc2_.getAttribute(Attribute.PERCENT_CRITICAL));
         _loc10_.tough = calculateAttribute(_loc2_.getAttribute(Attribute.TOUGH,true),_loc2_.getAttribute(Attribute.PERCENT_TOUGH));
         _loc10_.immune = calculateAttribute(_loc2_.getAttribute(Attribute.IMMUNE,true),_loc2_.getAttribute(Attribute.PERCENT_IMMUNE));
         _loc10_.base = _loc9_;
         _loc9_.currentHp = _loc10_.hp;
         _loc11_ = [];
         _loc12_ = SpeedTemplateFactory.instance.getSpeedForPlant(NEED_CARD_LEVEL);
         _loc13_ = GameGloble.caculateFightPower(_loc10_.attack,_loc10_.defense,_loc10_.hp.toNumber(),_loc10_.ability,_loc10_.critical,_loc10_.hit,_loc10_.dodge,_loc10_.tough);
         (_loc14_ = new Dto_CardPower()).ele = E_PowerEle.E_PowerEle_total;
         _loc14_.value = Int64.fromNumber(_loc13_);
         _loc14_.speed = Int64.fromNumber(_loc12_);
         _loc15_ = calculateAttribute(_loc8_.getAttribute(Attribute.ATTACK,true),_loc2_.getAttribute(Attribute.PERCENT_ATTACK));
         _loc16_ = calculateAttribute(_loc8_.getAttribute(Attribute.DEFENSE,true),_loc2_.getAttribute(Attribute.PERCENT_DEFENSE));
         _loc17_ = calculateAttribute(_loc8_.getAttribute(Attribute.HP,true),_loc2_.getAttribute(Attribute.PERCENT_HP));
         _loc18_ = calculateAttribute(_loc8_.getAttribute(Attribute.ABILITY,true),_loc2_.getAttribute(Attribute.PERCENT_ABILITY));
         _loc19_ = calculateAttribute(_loc8_.getAttribute(Attribute.HIT,false),_loc2_.getAttribute(Attribute.PERCENT_HIT));
         _loc20_ = calculateAttribute(_loc8_.getAttribute(Attribute.DODGE,false),_loc2_.getAttribute(Attribute.PERCENT_DODGE));
         _loc21_ = calculateAttribute(_loc8_.getAttribute(Attribute.CRITICAL,false),_loc2_.getAttribute(Attribute.PERCENT_CRITICAL));
         _loc22_ = calculateAttribute(_loc8_.getAttribute(Attribute.TOUGH,false),_loc2_.getAttribute(Attribute.PERCENT_TOUGH));
         if((_loc23_ = GameGloble.caculateFightPower(_loc15_,_loc16_,_loc17_,_loc18_,_loc21_,_loc19_,_loc20_,_loc22_)) > 0)
         {
            (_loc25_ = new Dto_CardPower()).ele = E_PowerEle.E_PowerEle_balancepk;
            _loc25_.value = Int64.fromNumber(_loc23_);
         }
         var _loc24_:Dto_CardPower;
         (_loc24_ = new Dto_CardPower()).ele = E_PowerEle.E_PowerEle_nature;
         _loc24_.value = Int64.fromNumber(_loc13_ - _loc23_);
         _loc24_.speed = Int64.fromNumber(_loc12_);
         _loc11_.push(_loc14_);
         _loc11_.push(_loc24_);
         if(_loc25_)
         {
            _loc11_.push(_loc25_);
         }
         _loc10_.powerEle = _loc11_;
         _loc10_.power = _loc13_;
         return new CardItemVO(_loc10_);
      }
      
      private static function calculateAttribute(param1:Number, param2:Number) : Number
      {
         if(param2 > 0)
         {
            return param1 * (100 + param2 / 10000) / 100;
         }
         return param1;
      }
      
      public static function sortCards(param1:Vector.<CardItemVO>) : Vector.<CardItemVO>
      {
         return param1.sort(sortCard);
      }
      
      private static function sortCard(param1:CardItemVO, param2:CardItemVO) : int
      {
         if(param1.pvpPlantTemplate.rarity != param2.pvpPlantTemplate.rarity)
         {
            return param2.pvpPlantTemplate.rarity - param1.pvpPlantTemplate.rarity;
         }
         return param2.power - param1.power;
      }
   }
}
