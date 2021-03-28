package com.qq.modules.main.model
{
   import PVZ.Cmd.Dto_PlantInfo;
   import PVZ.Cmd.Dto_TDLevelInfo;
   import asgui.controls.Button;
   import asgui.core.IUIComponent;
   import com.qq.CommandName;
   import com.qq.constant.roleInfo.RoleInfoConst;
   import com.qq.data.DataCacheManager;
   import com.qq.modules.basic.model.templates.ce.EntryTemplateCE;
   import com.qq.modules.card.model.templates.CardTemplateFactory;
   import com.qq.modules.levelselect.model.templates.LSLevelTemplate;
   import com.qq.modules.levelselect.model.templates.LSLevelTemplateFactory;
   import com.qq.modules.main.model.vo.LevelObserver;
   import com.qq.modules.map.model.templates.MapLevelTemplate;
   import com.qq.modules.map.model.templates.MapTemplateFactory;
   import com.qq.modules.roleInfo.model.templates.ce.LevelInfoTemplateCE;
   import com.qq.modules.td.data.TDDataFactory;
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.DateUtils;
   import com.qq.utils.db.ClientDBTableName;
   import com.tencent.protobuf.Int64;
   import flash.utils.getTimer;
   import org.allencuilib.util.TimeUtils;
   import org.robotlegs.mvcs.Actor;
   
   public class ActorModel extends Actor
   {
      
      public static var instance:ActorModel;
      
      public static const MAX_STAGE:int = 5;
      
      public static const BLUE_VIP_RATIO:Number = 1;
      
      public static const YELLOW_VIP_RATIO:Number = 1;
      
      public static const NORMAL_VIP_RATION:Number = 1;
       
      
      private var _actorBattleCardModel:ActorBattleCardModel;
      
      private var _selfPrivilegeModel:SelfPrivilegeModel;
      
      public var mergeServerFlag:Array;
      
      private var m_vecLevelObserver:Vector.<LevelObserver>;
      
      private var m_contribValue:int;
      
      private var m_lastPayTime:uint;
      
      private var _roleId:Int64;
      
      private var _zoneID:uint;
      
      private var _actorCoin:uint;
      
      private var m_luckyPoint:uint;
      
      private var m_holeLightBuyCount:int;
      
      private var m_holeLight:uint;
      
      public var dummySkillPoint:int;
      
      public var dummySkillPointBuyTimesToday:int;
      
      public var dummyFubenEnergy:int;
      
      public var dummyFubenEnergyBuyTimesToday:int;
      
      public var prestige:int;
      
      private var _actorId:int = 0;
      
      private var _newSystemMailNum:int;
      
      private var _newUserMailNum:int;
      
      private var _currEnergy:int = 0;
      
      private var _currEnergyBuyNum:int = 0;
      
      private var _actorSun:uint;
      
      private var m_rankCache:int;
      
      private var _actorSunDelay:uint;
      
      private var _actorExpDelay:uint;
      
      private var _actorExp:uint;
      
      private var _fosterTicket:uint;
      
      private var _isEquipAttachEnabled:Boolean;
      
      private var _actorFightPower:uint = 10;
      
      private var _actorLevel:uint = 0;
      
      private var _actorName:String;
      
      private var _friendPoint:int;
      
      private var _headIconUrl:String;
      
      private var _avatarPlantInfo:Dto_PlantInfo;
      
      public var hasNewFormationPos:Boolean = false;
      
      private var _actorLatestTDLevel:Dto_TDLevelInfo;
      
      private var _levelTemplate:LevelInfoTemplateCE;
      
      private var _goldDiamond:int;
      
      private var _giftDiamond:int;
      
      private var _fame:int;
      
      public var unlockPlantList:Array;
      
      public var unlockSpecialPlantList:Array;
      
      private var _TDPlantAvatarList:Array;
      
      private var m_durability:uint;
      
      private var m_durabilityMax:uint;
      
      private var m_durabilityCoolDown:Number;
      
      private var _inBattleAnimate:Boolean;
      
      public var regTime:uint;
      
      public var serverOpenTime:uint;
      
      public var regRoleSystemOpenTime:int = -1;
      
      public var isPlayZoneTask:Boolean = false;
      
      public var forbidCardAwaken:Boolean = false;
      
      public function ActorModel()
      {
         this._TDPlantAvatarList = [];
         super();
         instance = this;
         this._actorBattleCardModel = new ActorBattleCardModel(this);
         this._selfPrivilegeModel = new SelfPrivilegeModel();
         this.m_vecLevelObserver = new Vector.<LevelObserver>();
      }
      
      public function get contribValue() : int
      {
         return this.m_contribValue;
      }
      
      public function set contribValue(param1:int) : void
      {
         this.m_contribValue = param1;
      }
      
      public function get lastPayTime() : uint
      {
         return this.m_lastPayTime;
      }
      
      public function set lastPayTime(param1:uint) : void
      {
         this.m_lastPayTime = param1;
      }
      
      public function get battleCardModel() : ActorBattleCardModel
      {
         return this._actorBattleCardModel;
      }
      
      public function get selfPrivilegeModel() : SelfPrivilegeModel
      {
         return this._selfPrivilegeModel;
      }
      
      public function get roleId() : Int64
      {
         return this._roleId;
      }
      
      public function set roleId(param1:Int64) : void
      {
         this._roleId = param1;
      }
      
      public function get zoneID() : uint
      {
         return this._zoneID;
      }
      
      public function set zoneID(param1:uint) : void
      {
         this._zoneID = param1;
      }
      
      public function get actorCoin() : uint
      {
         return this._actorCoin;
      }
      
      public function set actorCoin(param1:uint) : void
      {
         this._actorCoin = param1;
      }
      
      public function get luckyPoint() : uint
      {
         return this.m_luckyPoint;
      }
      
      public function set luckyPoint(param1:uint) : void
      {
         this.m_luckyPoint = param1;
      }
      
      public function get holeLightBuyCount() : int
      {
         return this.m_holeLightBuyCount;
      }
      
      public function set holeLightBuyCount(param1:int) : void
      {
         this.m_holeLightBuyCount = param1;
      }
      
      public function set holeLight(param1:uint) : void
      {
         this.m_holeLight = param1;
      }
      
      public function get holeLight() : uint
      {
         return this.m_holeLight;
      }
      
      public function get isMaxCoin() : Boolean
      {
         return this._actorCoin >= this.levelTemplate.bankLimit;
      }
      
      public function get actorId() : int
      {
         return this._actorId;
      }
      
      public function set actorId(param1:int) : void
      {
         this._actorId = param1;
      }
      
      public function get newSysMailNum() : int
      {
         return this._newSystemMailNum;
      }
      
      public function get newUserMailNum() : int
      {
         return this._newUserMailNum;
      }
      
      public function setNewMail(param1:int, param2:int) : void
      {
         this._newSystemMailNum = param1;
         this._newUserMailNum = param2;
         CommandDispatcher.send(CommandName.ChangeMail);
      }
      
      public function get currEnergy() : int
      {
         return this._currEnergy;
      }
      
      public function set currEnergy(param1:int) : void
      {
         this._currEnergy = param1;
      }
      
      public function get currEnergyBuyNum() : int
      {
         return this._currEnergyBuyNum;
      }
      
      public function set currEnergyBuyNum(param1:int) : void
      {
         this._currEnergyBuyNum = param1;
      }
      
      public function get actorSun() : uint
      {
         return this._actorSun;
      }
      
      public function set actorSun(param1:uint) : void
      {
         this._actorSun = param1;
      }
      
      public function set rank(param1:int) : void
      {
         this.m_rankCache = param1;
      }
      
      public function get rank() : int
      {
         return this.m_rankCache;
      }
      
      public function get actorSunDelay() : uint
      {
         return this._actorSunDelay;
      }
      
      public function set actorSunDelay(param1:uint) : void
      {
         this._actorSunDelay = param1;
      }
      
      public function get actorExpDelay() : uint
      {
         return this._actorExpDelay;
      }
      
      public function set actorExpDelay(param1:uint) : void
      {
         this._actorExpDelay = param1;
      }
      
      public function get actorExp() : uint
      {
         return this._actorExp;
      }
      
      public function set actorExp(param1:uint) : void
      {
         this._actorExp = param1;
      }
      
      public function get fosterTicket() : uint
      {
         return this._fosterTicket;
      }
      
      public function set fosterTicket(param1:uint) : void
      {
         this._fosterTicket = param1;
      }
      
      public function set isEquipAttachEnabled(param1:Boolean) : void
      {
         this._isEquipAttachEnabled = param1;
      }
      
      public function get isEquipAttachEnabled() : Boolean
      {
         return this._isEquipAttachEnabled;
      }
      
      public function get actorFightPower() : uint
      {
         return this._actorFightPower;
      }
      
      public function set actorFightPower(param1:uint) : void
      {
         this._actorFightPower = param1;
      }
      
      public function get actorLevel() : uint
      {
         return this._actorLevel;
      }
      
      public function set actorLevel(param1:uint) : void
      {
         if(this._actorLevel != param1)
         {
            this._actorLevel = param1;
            this._levelTemplate = null;
            this.checkLevelOpen();
         }
      }
      
      private function checkLevelOpen() : void
      {
         var _loc1_:LevelObserver = null;
         this.m_vecLevelObserver.sort(LevelObserver.sortByLevel);
         var _loc2_:int = 0;
         while(_loc2_ < this.m_vecLevelObserver.length)
         {
            _loc1_ = this.m_vecLevelObserver[_loc2_];
            if(!_loc1_.check(this._actorLevel))
            {
               return;
            }
            if(_loc1_.runOnce)
            {
               this.m_vecLevelObserver.splice(_loc2_,1);
               _loc2_--;
            }
            _loc1_.excute();
            _loc2_++;
         }
      }
      
      public function addLevelObserver(param1:LevelObserver) : void
      {
         if(param1.check(this._actorLevel))
         {
            param1.excute();
            if(param1.runOnce == false)
            {
               this.m_vecLevelObserver.push(param1);
            }
         }
         else
         {
            this.m_vecLevelObserver.push(param1);
         }
      }
      
      public function get actorName() : String
      {
         return this._actorName;
      }
      
      public function set actorName(param1:String) : void
      {
         this._actorName = param1;
      }
      
      public function get friendPoint() : int
      {
         return this._friendPoint;
      }
      
      public function set friendPoint(param1:int) : void
      {
         this._friendPoint = param1;
      }
      
      public function get headIconUrl() : String
      {
         return this._headIconUrl;
      }
      
      public function set headIconUrl(param1:String) : void
      {
         this._headIconUrl = param1;
      }
      
      public function get avatarPlantInfo() : Dto_PlantInfo
      {
         return this._avatarPlantInfo;
      }
      
      public function set avatarPlantInfo(param1:Dto_PlantInfo) : void
      {
         this._avatarPlantInfo = param1;
      }
      
      public function get actorLatestTDLevel() : Dto_TDLevelInfo
      {
         return this._actorLatestTDLevel;
      }
      
      public function set actorLatestTDLevel(param1:Dto_TDLevelInfo) : void
      {
         this._actorLatestTDLevel = param1;
      }
      
      public function get levelTemplate() : LevelInfoTemplateCE
      {
         if(this._levelTemplate == null)
         {
            this._levelTemplate = this.getLevelTemplate(this.actorLevel);
         }
         return this._levelTemplate;
      }
      
      public function getLevelTemplate(param1:int) : LevelInfoTemplateCE
      {
         return DataCacheManager.getInstance().getTemplateDataById(ClientDBTableName.Table_RoleLevelInfo,param1,LevelInfoTemplateCE);
      }
      
      public function getFirstActorLevelByCardNum(param1:int) : int
      {
         var _loc2_:int = 0;
         param1 = param1 > RoleInfoConst.MAX_EMBATTLE_CARD_NUM ? int(RoleInfoConst.MAX_EMBATTLE_CARD_NUM) : int(param1);
         if(this._levelTemplate != null)
         {
            _loc2_ = 1;
            while(_loc2_ < 100)
            {
               if(this.getLevelTemplate(_loc2_).battleCardMax == param1)
               {
                  return _loc2_;
               }
               _loc2_++;
            }
         }
         return 0;
      }
      
      public function get goldDiamond() : int
      {
         return this._goldDiamond;
      }
      
      public function set goldDiamond(param1:int) : void
      {
         this._goldDiamond = param1;
      }
      
      public function get giftDiamond() : int
      {
         return this._giftDiamond;
      }
      
      public function set giftDiamond(param1:int) : void
      {
         this._giftDiamond = param1;
      }
      
      public function get totalDiamond() : int
      {
         return this._giftDiamond + this._goldDiamond;
      }
      
      public function isEnoughDiamond(param1:int, param2:Boolean = false) : Boolean
      {
         if(param2)
         {
            return this._goldDiamond >= param1;
         }
         return this.totalDiamond >= param1;
      }
      
      public function get fame() : int
      {
         return this._fame;
      }
      
      public function set fame(param1:int) : void
      {
         this._fame = param1;
      }
      
      public function getTDOpenedStageID() : int
      {
         var _loc2_:int = 0;
         var _loc3_:LSLevelTemplate = null;
         var _loc1_:int = 1;
         if(this.actorLatestTDLevel.stageId != 0)
         {
            _loc1_ = this.actorLatestTDLevel.stageId;
            _loc2_ = _loc1_ + 1;
            if(_loc2_ <= MAX_STAGE)
            {
               _loc3_ = LSLevelTemplateFactory.instance.getTemplateByStageIdAndLevelId(_loc2_,1,1);
               if(_loc3_ != null && _loc3_.needRoleLevel <= this.actorLevel)
               {
                  if(this.actorLatestTDLevel.levelId == LSLevelTemplateFactory.instance.getStageTotalLevelByStageId(_loc1_))
                  {
                     _loc1_ += 1;
                  }
               }
            }
         }
         return _loc1_;
      }
      
      public function updateUnlockPlant(param1:Dto_PlantInfo) : void
      {
         var _loc5_:Dto_PlantInfo = null;
         var _loc2_:int = this.unlockPlantList.length;
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            if((_loc5_ = this.unlockPlantList[_loc4_] as Dto_PlantInfo).plantId == param1.plantId)
            {
               _loc5_.isNew = param1.isNew;
               _loc5_.avatarId = param1.avatarId;
               _loc3_ = true;
               _loc4_ = _loc2_;
            }
            _loc4_++;
         }
         if(!_loc3_)
         {
            this.unlockPlantList.push(param1);
         }
      }
      
      public function getNewUnlockPlant() : Dto_PlantInfo
      {
         var _loc3_:Dto_PlantInfo = null;
         var _loc4_:TDPlantStaticInfo = null;
         var _loc1_:int = this.unlockPlantList.length;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = this.unlockPlantList[_loc2_] as Dto_PlantInfo;
            _loc4_ = TDDataFactory.instance.getPlantInfoByID(_loc3_.plantId);
            if(_loc3_.isNew && _loc4_.stageId != 0)
            {
               return _loc3_;
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getUnlockPlant(param1:uint) : Dto_PlantInfo
      {
         var _loc2_:Dto_PlantInfo = null;
         var _loc4_:Dto_PlantInfo = null;
         var _loc3_:int = this.unlockPlantList.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            if((_loc4_ = this.unlockPlantList[_loc5_] as Dto_PlantInfo).plantId == param1)
            {
               _loc2_ = _loc4_;
               break;
            }
            _loc5_++;
         }
         if(!_loc2_)
         {
            for each(_loc4_ in this.unlockSpecialPlantList)
            {
               if(_loc4_.plantId == param1)
               {
                  _loc2_ = _loc4_;
                  break;
               }
            }
         }
         if(!_loc2_)
         {
            _loc2_ = new Dto_PlantInfo();
            _loc2_.plantId = param1;
            _loc2_.avatarId = CardTemplateFactory.instance.getPlantDefaultAvatarID(param1);
         }
         return _loc2_;
      }
      
      public function setNoNewUnlockPlant() : void
      {
         var _loc3_:Dto_PlantInfo = null;
         var _loc1_:int = this.unlockPlantList.length;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = this.unlockPlantList[_loc2_] as Dto_PlantInfo;
            _loc3_.isNew = false;
            _loc2_++;
         }
      }
      
      public function isUnlockPlant(param1:int) : Boolean
      {
         var _loc4_:Dto_PlantInfo = null;
         var _loc2_:int = this.unlockPlantList.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if((_loc4_ = this.unlockPlantList[_loc3_] as Dto_PlantInfo).plantId == param1)
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function setTDPlantAvatarList(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Dto_PlantInfo = null;
         var _loc4_:Array = new Array();
         _loc2_ = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_];
            if(_loc3_.plantId != 0)
            {
               _loc4_.push(_loc3_);
            }
            _loc2_++;
         }
         this._TDPlantAvatarList = _loc4_;
      }
      
      public function get TDPlantAvatarListNum() : int
      {
         return this._TDPlantAvatarList.length;
      }
      
      public function get TDPlantAvatarList() : Array
      {
         return this._TDPlantAvatarList;
      }
      
      public function getTDPlantAvatarInfo(param1:int) : Dto_PlantInfo
      {
         var _loc2_:int = this._TDPlantAvatarList.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if((this._TDPlantAvatarList[_loc3_] as Dto_PlantInfo).plantId == param1)
            {
               return this._TDPlantAvatarList[_loc3_];
            }
            _loc3_++;
         }
         return null;
      }
      
      public function setTDPlantAvatarId(param1:int, param2:int) : void
      {
         var _loc5_:Dto_PlantInfo = null;
         var _loc3_:int = this._TDPlantAvatarList.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if((_loc5_ = this._TDPlantAvatarList[_loc4_] as Dto_PlantInfo).plantId == param1)
            {
               _loc5_.avatarId = param2;
            }
            _loc4_++;
         }
      }
      
      public function updateDurability(param1:uint, param2:uint, param3:uint) : void
      {
         this.m_durability = param1;
         this.m_durabilityMax = param2 > 0 ? uint(param2) : uint(1);
         this.m_durabilityCoolDown = param3 + getTimer() / 1000;
         CommandDispatcher.send(CommandName.CHANGE_DURABILITY);
      }
      
      public function get durabilityCoolDown() : Number
      {
         return this.m_durabilityCoolDown - getTimer() / 1000;
      }
      
      public function get durability() : uint
      {
         return this.m_durability;
      }
      
      public function get durabilityLimit() : uint
      {
         return this.m_durabilityMax;
      }
      
      public function getDiamondDiscountPrice() : Object
      {
         return {
            "type":1,
            "dis":NORMAL_VIP_RATION,
            "flag":false
         };
      }
      
      public function get inBattleAnimate() : Boolean
      {
         return this._inBattleAnimate;
      }
      
      public function set inBattleAnimate(param1:Boolean) : void
      {
         this._inBattleAnimate = param1;
      }
      
      public function checkIfOpenDaySatisfied(param1:int, param2:int, param3:Boolean = true) : Boolean
      {
         if(param3 && this.getIfIsOldUser())
         {
            return true;
         }
         return this.getServerOpenedDays() >= param1 - 1 && param2 <= this.actorLevel;
      }
      
      public function checkIfOpenDaySatisfiedFromTemplate(param1:EntryTemplateCE) : Boolean
      {
         return this.checkIfOpenDaySatisfied(param1.needDays,param1.needLevel);
      }
      
      public function checkIfOpenDaySatisfiedToUIFromTemplate(param1:IUIComponent, param2:EntryTemplateCE) : Boolean
      {
         return this.checkIfOpenDaySatisfiedToUI(param1,param2.needDays,param2.needLevel);
      }
      
      public function getUnsatisfiedTipFromTemplate(param1:EntryTemplateCE) : String
      {
         return this.getUnsatisfiedTip(param1.needDays,param1.needLevel);
      }
      
      public function getUnsatisfiedTip(param1:int, param2:int) : String
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         _loc3_ = "";
         if(param2)
         {
            _loc3_ += "小镇" + param2 + "级";
         }
         _loc3_ += "开启 ";
         if(param1)
         {
            if((_loc4_ = (param1 - 1 - this.getServerOpenedDays()) * 24 * 3600) > 0)
            {
               _loc3_ += TimeUtils.formatSecondToStr(_loc4_,TimeUtils.LEFT_DD_HH_MM$CHN);
            }
            _loc3_ += "后解锁";
         }
         return _loc3_;
      }
      
      public function checkIfOpenDaySatisfiedToUI(param1:IUIComponent, param2:int, param3:int) : Boolean
      {
         var _loc5_:String = null;
         var _loc4_:Boolean;
         if(!(_loc4_ = this.checkIfOpenDaySatisfied(param2,param3)))
         {
            _loc5_ = this.getUnsatisfiedTip(param2,param3);
         }
         if(param1 is Button)
         {
            (param1 as Button).enabled = _loc4_;
            param1.toolTip = _loc5_;
         }
         return _loc4_;
      }
      
      public function getServerOpenedDays() : Number
      {
         var _loc1_:Date = new Date();
         _loc1_.setTime(this.serverOpenTime * 1000);
         var _loc2_:Number = (DateUtils.getInstance().getServerTime() - _loc1_.time / 1000) / 3600 / 24;
         return _loc2_ > 0 ? Number(_loc2_) : Number(0);
      }
      
      public function getOpenMapNeedLevelNotSatified(param1:int = 1) : int
      {
         var _loc2_:int = 0;
         var _loc3_:MapLevelTemplate = MapTemplateFactory.instance.getMapLevelTemplateById(param1);
         if(this.getIfIsOldUser())
         {
            _loc2_ = _loc3_.levelMinForOldUser;
         }
         else
         {
            _loc2_ = _loc3_.levelMin;
         }
         if(this.actorLevel >= _loc2_)
         {
            return 0;
         }
         return _loc2_;
      }
      
      public function getIfIsOldUser() : Boolean
      {
         return this.regRoleSystemOpenTime > 0 && this.regRoleSystemOpenTime > this.regTime;
      }
   }
}
