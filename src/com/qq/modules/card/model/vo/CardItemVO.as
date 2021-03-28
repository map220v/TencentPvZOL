package com.qq.modules.card.model.vo
{
   import PVZ.Cmd.Dto_AvatarAllAttr;
   import PVZ.Cmd.Dto_AvatarInfo;
   import PVZ.Cmd.Dto_CardFullInfo;
   import PVZ.Cmd.Dto_CardPower;
   import PVZ.Cmd.E_AvatarStatus;
   import PVZ.Cmd.E_PowerEle;
   import asgui.serialization.base64.Base64Util;
   import com.qq.GameGloble;
   import com.qq.data.DataCacheManager;
   import com.qq.modules.basic.model.templates.ServerConfigTemplateFactory;
   import com.qq.modules.card.model.templates.CardChestAvatarTemp;
   import com.qq.modules.card.model.templates.CardForgeTemplate;
   import com.qq.modules.card.model.templates.CardTemplateFactory;
   import com.qq.modules.card.model.templates.CardUpgradeTemplate;
   import com.qq.modules.embattle.constant.EmbattleConst;
   import com.qq.modules.main.model.SettingsModel;
   import com.qq.modules.main.model.settings.battle.BattleLineupTemplateFactory;
   import com.qq.modules.main.model.settings.battle.ce.BattleLineupCardLevelTemp;
   import com.qq.modules.main.model.settings.battle.ce.BattleLineupCardTemp;
   import com.qq.modules.main.model.vo.Attribute;
   import com.qq.modules.speed.model.templates.SpeedTemplateFactory;
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   import com.qq.modules.zombieIsland.constant.ZombieIslandConstant;
   import com.qq.utils.db.ClientDBTableName;
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.UInt64;
   import flash.utils.ByteArray;
   
   public class CardItemVO
   {
       
      
      private var _dto:Dto_CardFullInfo;
      
      private var _upgradeTemplate:CardUpgradeTemplate;
      
      private var _pvpPlantTemplate:BattleLineupCardTemp;
      
      private var _tdPlantTemplate:TDPlantStaticInfo;
      
      private var _forgeTemplate:CardForgeTemplate;
      
      private var _levelTemplate:BattleLineupCardLevelTemp;
      
      private var _avatarList:Array;
      
      private var _curUsedAvatar:Dto_AvatarInfo;
      
      public var recycleAvaterList:Array;
      
      private var _avatarAttr:Dto_AvatarAllAttr;
      
      private var _cardPos:uint = 0;
      
      public function CardItemVO(param1:Dto_CardFullInfo = null)
      {
         super();
         if(param1)
         {
            this.loadDto(param1);
         }
      }
      
      public function get endlessFubenHpRatio() : Number
      {
         return GameGloble.getCommEmbattleCardLeftHPByCardUID(EmbattleConst.MODE_NOENDFUBEN,this.uid);
      }
      
      public function getLeftHpRaito(param1:int) : Number
      {
         return GameGloble.getCommEmbattleCardLeftHPByCardUID(param1,this.uid);
      }
      
      public function loadDto(param1:Dto_CardFullInfo) : void
      {
         this._dto = param1;
         this._levelTemplate = null;
         this._pvpPlantTemplate = null;
         this._forgeTemplate = null;
         this._tdPlantTemplate = null;
         this._upgradeTemplate = null;
      }
      
      public function get isEmbattle() : Boolean
      {
         return GameGloble.actorModel.battleCardModel.isEmbattleCard(this.uid);
      }
      
      public function get cardStatus() : int
      {
         return GameGloble.actorModel.battleCardModel.getCardStatus(this.uid);
      }
      
      public function get teamId() : int
      {
         return GameGloble.actorModel.battleCardModel.getBattleTeamIdBycardUid(this._dto.base.uid);
      }
      
      public function get dto() : Dto_CardFullInfo
      {
         return this._dto;
      }
      
      public function get DNALevel() : int
      {
         if(this._dto == null)
         {
            return 0;
         }
         if(this._dto.base == null)
         {
            return 0;
         }
         return this._dto.base.geneId;
      }
      
      public function get plantArmorViewID() : int
      {
         if(this._dto == null)
         {
            return 0;
         }
         if(this._dto.base == null)
         {
            return 0;
         }
         return int(GameGloble.getPlantArmorViewID(this._dto.base.armorType,this._dto.base.armorStar));
      }
      
      public function get evolveLevel() : int
      {
         if(this._dto == null)
         {
            return 0;
         }
         if(this._dto.base == null)
         {
            return 0;
         }
         return this._dto.base.evolveLevel;
      }
      
      public function get uid() : Int64
      {
         return this._dto.base.uid;
      }
      
      public function get level() : uint
      {
         return this._dto.base.level;
      }
      
      public function get avatarId() : uint
      {
         return this._dto.base.avatarId;
      }
      
      public function set avatarId(param1:uint) : void
      {
         this._dto.base.avatarId = param1;
      }
      
      public function get attack() : uint
      {
         return this._dto.attack;
      }
      
      public function get defense() : uint
      {
         return this._dto.defense;
      }
      
      public function get ability() : uint
      {
         return this._dto.ability;
      }
      
      public function get speed() : uint
      {
         return SpeedTemplateFactory.instance.getSpeedForPlant(this.level);
      }
      
      public function get baptizeSpeed() : int
      {
         var _loc2_:Dto_CardPower = null;
         var _loc1_:int = 0;
         if(this._dto)
         {
            for each(_loc2_ in this._dto.powerEle)
            {
               if(_loc2_.ele == E_PowerEle.E_PowerEle_refine)
               {
                  _loc1_ = _loc2_.speed.toNumber();
               }
            }
         }
         return _loc1_;
      }
      
      public function getZombieIslandHp(param1:int) : Number
      {
         if(param1 == ZombieIslandConstant.Mode_Normal)
         {
            return this._dto.base.zombieIslandHp;
         }
         return this._dto.base.newZombieIslandHp;
      }
      
      public function get hp() : UInt64
      {
         return this._dto.hp;
      }
      
      public function get immune() : uint
      {
         return this._dto.immune;
      }
      
      public function get power() : uint
      {
         return this._dto.power;
      }
      
      public function get forgeLevel() : uint
      {
         return this._dto.base.forgeLevel;
      }
      
      public function get critical() : uint
      {
         return this._dto.critical;
      }
      
      public function get tough() : uint
      {
         return this._dto.tough;
      }
      
      public function get dodge() : uint
      {
         return this._dto.dodge;
      }
      
      public function get hit() : uint
      {
         return this._dto.hit;
      }
      
      public function get exp() : uint
      {
         return this._dto.base.exp;
      }
      
      public function get hasCurrentHp() : Boolean
      {
         return this._dto.base.hasCurrentHp;
      }
      
      public function get currentHp() : UInt64
      {
         return this._dto.base.currentHp;
      }
      
      public function get health() : uint
      {
         return this._dto.base.health;
      }
      
      public function get cardId() : uint
      {
         return this._dto.base.cardId;
      }
      
      public function get starLv() : Number
      {
         if(!this.pvpPlantTemplate)
         {
            return 0;
         }
         return this.pvpPlantTemplate.star;
      }
      
      public function get upgradeTemplate() : CardUpgradeTemplate
      {
         if(this._upgradeTemplate == null)
         {
            this._upgradeTemplate = CardTemplateFactory.instance.getCardUpgradeTemplateById(this.cardId);
         }
         return this._upgradeTemplate;
      }
      
      public function get pvpPlantTemplate() : BattleLineupCardTemp
      {
         if(this._pvpPlantTemplate == null)
         {
            this._pvpPlantTemplate = BattleLineupTemplateFactory.instance.getBattleLineupCardTemplateById(this.cardId);
         }
         return this._pvpPlantTemplate;
      }
      
      public function get tdPlantTemplate() : TDPlantStaticInfo
      {
         if(this._tdPlantTemplate == null)
         {
            this._tdPlantTemplate = DataCacheManager.getInstance().getTemplateDataById(ClientDBTableName.Table_PlantInfo,this.pvpPlantTemplate.tdId,TDPlantStaticInfo);
         }
         return this._tdPlantTemplate;
      }
      
      public function get forgeTemplate() : CardForgeTemplate
      {
         if(this._forgeTemplate == null)
         {
            this._forgeTemplate = CardTemplateFactory.instance.getCardForgeTemplate(this.cardId,this._dto.base.forgeLevel + 1);
         }
         return this._forgeTemplate;
      }
      
      public function get levelTemplate() : BattleLineupCardLevelTemp
      {
         if(this._levelTemplate == null)
         {
            this._levelTemplate = SettingsModel.instance.battleCardLevelSettings.getCardLevelInfoTempById(this.dto.base.level);
         }
         return this._levelTemplate;
      }
      
      public function getLevelTemplate(param1:int = 0) : BattleLineupCardLevelTemp
      {
         return SettingsModel.instance.battleCardLevelSettings.getCardLevelInfoTempById(this.dto.base.level + param1);
      }
      
      public function get isCanUpgrade() : Boolean
      {
         if(this.upgradeTemplate)
         {
            return this._dto.base.level >= this.upgradeTemplate.levelNeed && this._dto.base.forgeLevel == this.upgradeTemplate.forgeLvNeed;
         }
         return false;
      }
      
      public function get isMaxStarLv() : Boolean
      {
         var _loc1_:BattleLineupCardTemp = BattleLineupTemplateFactory.instance.getBattleLineupCardTemplateById(this.cardId + 1);
         return _loc1_ == null || _loc1_.star == 0;
      }
      
      public function get isMaxLv() : Boolean
      {
         return this.dto.base.level >= this.maxLevel;
      }
      
      public function get maxLevel() : int
      {
         var _loc1_:int = 100;
         if(this.pvpPlantTemplate != null)
         {
            _loc1_ = this.pvpPlantTemplate.maxLv;
         }
         var _loc2_:int = SettingsModel.instance.battleCardLevelSettings.getMaxCardLevel(GameGloble.actorModel.actorLevel);
         return int(Math.min(_loc1_,_loc2_));
      }
      
      public function get forgeLv() : int
      {
         return this.dto.base.forgeLevel;
      }
      
      public function get isMaxForgeLv() : Boolean
      {
         return this.forgeLv >= ServerConfigTemplateFactory.instance.maxForgeLv;
      }
      
      public function get targetUpgradeTemplate() : BattleLineupCardTemp
      {
         if(!this.isMaxStarLv)
         {
            return BattleLineupTemplateFactory.instance.getBattleLineupCardTemplateById(this.cardId + 1);
         }
         return null;
      }
      
      public function toDtoBase64() : String
      {
         var _loc1_:ByteArray = new ByteArray();
         this.dto.writeTo(_loc1_);
         return Base64Util.encode(_loc1_);
      }
      
      public function updateAvatarList(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Dto_AvatarInfo = null;
         var _loc8_:int = 0;
         var _loc4_:Boolean = true;
         if(this._avatarList == null)
         {
            this._avatarList = param1;
         }
         else
         {
            _loc2_ = this._avatarList.length;
            _loc3_ = param1.length;
            _loc4_ = true;
            _loc6_ = 0;
            while(_loc6_ < _loc3_)
            {
               _loc7_ = param1[_loc6_] as Dto_AvatarInfo;
               _loc8_ = 0;
               while(_loc8_ < _loc2_)
               {
                  if(_loc7_.avatarId == (this._avatarList[_loc8_] as Dto_AvatarInfo).avatarId)
                  {
                     _loc4_ = false;
                     this._avatarList[_loc8_] = _loc7_;
                     break;
                  }
                  _loc8_++;
               }
               if(_loc4_)
               {
                  this._avatarList.push(_loc7_);
               }
               _loc6_++;
            }
         }
         _loc2_ = this._avatarList.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc2_)
         {
            if((this._avatarList[_loc5_] as Dto_AvatarInfo).avatarStatus == E_AvatarStatus.E_AvatarStatus_Using)
            {
               this._curUsedAvatar = this._avatarList[_loc5_] as Dto_AvatarInfo;
            }
            _loc5_++;
         }
         this._avatarList.sort(this.sortOnOrder);
      }
      
      private function sortOnOrder(param1:Dto_AvatarInfo, param2:Dto_AvatarInfo) : Number
      {
         var _loc3_:CardChestAvatarTemp = CardTemplateFactory.instance.getPlantAvatarByAvatarId(param1.avatarId);
         var _loc4_:CardChestAvatarTemp = CardTemplateFactory.instance.getPlantAvatarByAvatarId(param2.avatarId);
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(_loc3_ != null)
         {
            _loc5_ = _loc3_.order;
         }
         if(_loc4_ != null)
         {
            _loc6_ = _loc4_.order;
         }
         if(_loc5_ < _loc6_)
         {
            return 1;
         }
         if(_loc5_ > _loc6_)
         {
            return -1;
         }
         return 0;
      }
      
      public function get avatarList() : Array
      {
         return this._avatarList;
      }
      
      public function getAvatarById(param1:uint) : Dto_AvatarInfo
      {
         var _loc2_:int = this._avatarList.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if((this._avatarList[_loc3_] as Dto_AvatarInfo).avatarId == param1)
            {
               return this._avatarList[_loc3_];
            }
            _loc3_++;
         }
         return null;
      }
      
      public function get curUsedAvatar() : Dto_AvatarInfo
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(!this._curUsedAvatar)
         {
            _loc1_ = this._avatarList.length;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               if((this._avatarList[_loc2_] as Dto_AvatarInfo).avatarStatus == E_AvatarStatus.E_AvatarStatus_Using)
               {
                  this._curUsedAvatar = this._avatarList[_loc2_] as Dto_AvatarInfo;
               }
               _loc2_++;
            }
            if(this._curUsedAvatar == null)
            {
               this._curUsedAvatar = this._avatarList[0];
            }
         }
         return this._curUsedAvatar;
      }
      
      public function set curUsedAvatar(param1:Dto_AvatarInfo) : void
      {
         this._curUsedAvatar = param1;
      }
      
      public function updateAvatarInfo(param1:int, param2:int) : void
      {
         var _loc3_:int = this._avatarList.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if((this._avatarList[_loc4_] as Dto_AvatarInfo).avatarId == param1)
            {
               (this._avatarList[_loc4_] as Dto_AvatarInfo).avatarStatus = param2;
            }
            _loc4_++;
         }
      }
      
      public function setAvatarAttr(param1:Dto_AvatarAllAttr) : void
      {
         this._avatarAttr = param1;
      }
      
      public function get avatarAttr() : Dto_AvatarAllAttr
      {
         return this._avatarAttr;
      }
      
      public function get quality() : uint
      {
         return this.dto.base.quality;
      }
      
      public function get rank() : uint
      {
         return this.dto.base.rank;
      }
      
      public function getClone() : CardItemVO
      {
         return new CardItemVO(this.dto);
      }
      
      public function get cardPos() : uint
      {
         return this._cardPos;
      }
      
      public function set cardPos(param1:uint) : void
      {
         this._cardPos = param1;
      }
      
      public function get orderPower() : uint
      {
         var _loc2_:Dto_CardPower = null;
         var _loc1_:uint = 0;
         var _loc3_:int = 0;
         while(_loc3_ < this.dto.powerEle.length)
         {
            _loc2_ = this.dto.powerEle[_loc3_];
            if(_loc2_.ele == E_PowerEle.E_PowerEle_nature || _loc2_.ele == E_PowerEle.E_PowerEle_equip)
            {
               _loc1_ += _loc2_.value.toNumber();
            }
            _loc3_++;
         }
         return _loc1_;
      }
      
      public function get awakeLevel() : int
      {
         return this.pvpPlantTemplate.awakeLevel;
      }
      
      public function getProp(param1:int) : int
      {
         switch(param1)
         {
            case Attribute.ATTACK:
               return this.attack;
            case Attribute.ABILITY:
               return this.ability;
            case Attribute.DEFENSE:
               return this.defense;
            case Attribute.HP:
               return this.hp.toNumber();
            case Attribute.HIT:
               return this.hit;
            case Attribute.CRITICAL:
               return this.critical;
            case Attribute.IMMUNE:
               return this.immune;
            case Attribute.DODGE:
               return this.dodge;
            default:
               return 0;
         }
      }
   }
}
