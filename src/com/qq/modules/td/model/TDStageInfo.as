package com.qq.modules.td.model
{
   import PVZ.Cmd.Dto_PlantInfo;
   import asgui.utils.StringUtil;
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDObjTypeID;
   import com.qq.data.DataCacheManager;
   import com.qq.modules.card.model.templates.CardTemplateFactory;
   import com.qq.modules.endlessTD.model.EndlessTDStageRecord;
   import com.qq.modules.levelselect.model.templates.LSLevelTemplate;
   import com.qq.modules.levelselect.model.templates.LSLevelTemplateFactory;
   import com.qq.modules.td.data.TDDataFactory;
   import com.qq.modules.td.data.game.ce.TDGameTypeTemplateCE;
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   import com.qq.modules.td.data.map.TDMapRoadData;
   import com.qq.modules.td.data.map.TDMapSunBombInfo;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.data.map.TDMapWarfieldData;
   import com.qq.modules.td.data.map.TDMapWaveInfo;
   import com.qq.modules.td.data.map.TDMapWaveType;
   import com.qq.modules.td.data.slots.SlotCardData;
   import com.qq.modules.td.logic.TDResourceUtil;
   import com.qq.modules.td.model.templates.ce.DailyTDInfoTemplateCE;
   import com.qq.modules.td.model.vo.TDPathVO;
   import com.qq.modules.td.model.vo.TDUnitInitVO;
   import com.qq.modules.td.view.game.layer.floor.TDFloorUtil;
   import com.qq.templates.font.FontFZYH;
   import com.qq.utils.data.PData;
   import com.qq.utils.db.ClientDBTableName;
   import flash.utils.Dictionary;
   import org.as3commons.logging.api.getLogger;
   import tencent.data.ArgData;
   
   public class TDStageInfo
   {
      
      private static var _instance:TDStageInfo;
       
      
      public var stageID:int;
      
      public var levelID:int;
      
      public var subLevelID:int = 1;
      
      public var challengeLevelID:int;
      
      public var challengeScore:PData;
      
      public var stageMapXml:XML;
      
      private var _mapID:int;
      
      public var time:PData;
      
      public var sun:PData;
      
      public var rain:PData;
      
      public var toyCarType:int;
      
      public var toyCarList:Array;
      
      public var isFinalStage:Boolean;
      
      public var isUnderWater:Boolean;
      
      public var initUnits:Vector.<TDUnitInitVO>;
      
      public var initRoadUnits:Vector.<TDUnitInitVO>;
      
      public var tdGameType:int;
      
      private var _needScore:PData;
      
      public var warfieldData:TDMapWarfieldData;
      
      private var _allUnitTypeList:Array;
      
      private var _enemyWaveList:Array;
      
      public var totalWave:int;
      
      public var challengeAchiList:Array;
      
      public var challengeAchiTimeLimit:int;
      
      public var challengeAchiTimeRecord:int;
      
      public var cardSlotNum:PData;
      
      public var originalCardSlotNum:PData;
      
      public var initCardList:Vector.<SlotCardData>;
      
      public var plantIDList:Vector.<Dto_PlantInfo>;
      
      public var nowSkillList:Vector.<int>;
      
      public var fuelInit:PData;
      
      public var fuelMax:PData;
      
      public var rewardPlantID:int;
      
      public var stageParamXml:XML;
      
      public var totalZombie:int;
      
      public var totalFuel:int;
      
      public var mapFileMD5:String;
      
      public var miniGameParamDic:Dictionary;
      
      private var _startY:int;
      
      private var _endY:int;
      
      private var _tileHeight:int;
      
      private var _tileWidth:int;
      
      public var achievementInfo:String;
      
      public var achievementList:Array;
      
      public var preloadSoundIDList:Array;
      
      public var soundSceneID:int;
      
      public var stageName:String = "";
      
      public var startParam:TDStartParam;
      
      public var sunBombVec:Vector.<TDMapSunBombInfo>;
      
      public var scriptCode:String;
      
      public var banNormalPlant:Vector.<int>;
      
      public var banSkillPlant:Vector.<int>;
      
      public var paths:Vector.<TDPathVO>;
      
      public var pathCells:Vector.<Vector.<int>>;
      
      public var watersTiles:Vector.<int>;
      
      public var updatePaths:XMLList = null;
      
      private var _groundPathType:int;
      
      private var _powerTileArr:Array;
      
      public function TDStageInfo()
      {
         this.banNormalPlant = new Vector.<int>();
         this.banSkillPlant = new Vector.<int>();
         this.paths = new Vector.<TDPathVO>();
         this.watersTiles = new Vector.<int>(6,true);
         super();
         this.stageID = 0;
         this.levelID = 0;
         this.subLevelID = 0;
         this._mapID = 0;
         this.totalZombie = 0;
         this.totalFuel = 0;
         this.mapFileMD5 = "";
         this.reset();
      }
      
      public static function getInstance() : TDStageInfo
      {
         if(_instance == null)
         {
            _instance = new TDStageInfo();
         }
         return _instance;
      }
      
      public static function dispose(param1:int, param2:int, param3:int) : void
      {
         if(param1 == getInstance().levelID && param2 == getInstance().subLevelID && param3 == getInstance().challengeLevelID)
         {
            _instance = null;
         }
      }
      
      public function get mapID() : int
      {
         return this._mapID;
      }
      
      public function get needScore() : PData
      {
         return this._needScore;
      }
      
      public function get startY() : int
      {
         return this._startY;
      }
      
      public function get endY() : int
      {
         return this._endY;
      }
      
      public function get tileHeight() : int
      {
         return this._tileHeight;
      }
      
      public function get tileWidth() : int
      {
         return this._tileWidth;
      }
      
      public function setLevel(param1:TDStartParam) : void
      {
         var _loc2_:DailyTDInfoTemplateCE = null;
         var _loc3_:LSLevelTemplate = null;
         var _loc4_:Array = null;
         var _loc5_:String = null;
         var _loc6_:Array = null;
         this.startParam = param1;
         switch(TDStageInfo.getInstance().startParam.gameType)
         {
            case TDStartParam.Daily:
               this.stageID = 1;
               _loc2_ = LSLevelTemplateFactory.instance.getDailyTDInfo(param1.dailyMapID);
               this.soundSceneID = _loc2_.soundSceneID;
               this.stageName = _loc2_.name;
               if(_loc2_.preloadSoundIDList.length > 0)
               {
                  this.preloadSoundIDList = _loc2_.preloadSoundIDList.split(":");
               }
               else
               {
                  this.preloadSoundIDList = new Array();
               }
               break;
            case TDStartParam.Endless:
               this.stageID = 1;
               this.stageName = StringUtil.substitute(FontFZYH.ENDLESS_TD_LEVEL_NAME,param1.endlessMapInfo.level);
               break;
            case TDStartParam.Yeti:
               this.stageID = 1;
               break;
            default:
               this.stageID = param1.stageID;
               this.levelID = param1.levelID;
               this.subLevelID = param1.subLevelId;
               this.challengeLevelID = param1.challengeLevelId;
               _loc3_ = LSLevelTemplateFactory.instance.getTemplateByChallengeId(this.stageID,this.levelID,this.subLevelID,this.challengeLevelID);
               if(_loc3_)
               {
                  this.soundSceneID = _loc3_.soundSceneID;
                  this.stageName = _loc3_.name;
                  if(_loc3_.preloadSoundIDList.length > 0)
                  {
                     this.preloadSoundIDList = _loc3_.preloadSoundIDList.split(":");
                  }
                  else
                  {
                     this.preloadSoundIDList = new Array();
                  }
                  this.achievementInfo = _loc3_.achievementInfo;
                  this.achievementList = new Array();
                  if(this.achievementInfo.length > 0)
                  {
                     _loc4_ = this.achievementInfo.split("|");
                     for each(_loc5_ in _loc4_)
                     {
                        _loc6_ = _loc5_.split(":");
                        this.achievementList.push(_loc6_);
                     }
                  }
               }
         }
      }
      
      public function reset() : void
      {
         this.time = new PData();
         this.sun = new PData();
         this.rain = new PData();
         this._needScore = new PData();
         this.fuelInit = new PData();
         this.fuelMax = new PData();
         this.fuelMax.set(4);
         this.toyCarType = 0;
         this.totalFuel = 0;
         this._allUnitTypeList = new Array();
         this.warfieldData = new TDMapWarfieldData();
         this._enemyWaveList = new Array();
         this.totalWave = 0;
         this.cardSlotNum = new PData();
         this.originalCardSlotNum = new PData();
         this.scriptCode = null;
         this.miniGameParamDic = new Dictionary();
         this.toyCarList = new Array();
         this._powerTileArr = new Array();
         this.sunBombVec = new Vector.<TDMapSunBombInfo>();
         this.challengeScore = new PData();
      }
      
      public function load(param1:XML) : Boolean
      {
         this.reset();
         this.stageMapXml = param1;
         if(param1 == null)
         {
            getLogger("TD").debug("地图文件为空");
            return false;
         }
         if(this.levelID < 0)
         {
            getLogger("TD").debug("读取关卡" + this.levelID + this.subLevelID + "失败");
            return false;
         }
         var _loc2_:XML = param1.stages.stage[0];
         if(_loc2_)
         {
            this.isFinalStage = int(_loc2_.@isFinalStage) == 1;
         }
         this._mapID = param1.@mapID;
         if(this._mapID == 4)
         {
            this.addLoadList(TDConstant.UnitCatalog_Object,TDConstant.UnitType_WaterSplash);
            this.addLoadList(TDConstant.UnitCatalog_Object,TDConstant.UnitType_WaterFoam);
            this.addLoadList(TDConstant.UnitCatalog_Object,TDConstant.UnitType_WaterBreaker);
         }
         if(this.startParam.gameType == TDStartParam.Endless)
         {
            this.addObjectToLoadList(TDConstant.UnitCatalog_Plant,TDConstant.PlantType_Cherrybomb);
            this.addObjectToLoadList(TDConstant.UnitCatalog_Plant,TDConstant.PlantType_Jalapeno);
            this.addObjectToLoadList(TDConstant.UnitCatalog_Plant,TDConstant.PlantType_icebean);
         }
         this.addObjectToLoadList(TDConstant.UnitCatalog_Plant,TDConstant.PlantType_Wintermelon);
         this.initPathsParser(_loc2_);
         this.scriptParse(param1.script[0]);
         this.warfieldParse(param1.warfield[0]);
         this.conditionParser(_loc2_);
         this.enemyParser(_loc2_);
         this.banPlantParser(_loc2_);
         this.initObjectParser(_loc2_);
         this.initMiniGameParamsParser(_loc2_);
         this.initRoadObjectParser(_loc2_);
         this.initSunBombParser(_loc2_);
         return true;
      }
      
      public function get waveList() : Array
      {
         return this._enemyWaveList;
      }
      
      public function hasToyCar() : Boolean
      {
         return this.toyCarType != 0;
      }
      
      private function addLoadList(param1:int, param2:int) : void
      {
         if(param2 == 0)
         {
            getLogger().error("addUnitType error, unitType: " + param2);
         }
         var _loc3_:Array = this._allUnitTypeList[param1];
         if(_loc3_ == null)
         {
            _loc3_ = new Array();
            this._allUnitTypeList[param1] = _loc3_;
         }
         var _loc4_:int;
         if((_loc4_ = _loc3_.indexOf(param2)) == -1)
         {
            _loc3_.push(param2);
         }
      }
      
      public function getAppearUnitListByType(param1:int) : Array
      {
         return this._allUnitTypeList[param1];
      }
      
      private function scriptParse(param1:XML) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:String = String(param1[0]);
         this.scriptCode = _loc2_;
      }
      
      public function get hasGuide() : Boolean
      {
         return this.scriptCode != null;
      }
      
      private function warfieldParse(param1:XML) : void
      {
         var _loc7_:XML = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:* = false;
         var _loc11_:TDMapRoadData = null;
         var _loc12_:XMLList = null;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:XML = null;
         var _loc17_:int = 0;
         var _loc18_:String = null;
         var _loc19_:* = false;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:TDMapTileData = null;
         var _loc23_:TDMapRoadData = null;
         var _loc24_:Boolean = false;
         var _loc25_:int = 0;
         var _loc26_:int = 0;
         var _loc27_:TDMapTileData = null;
         if(param1 == null)
         {
            getLogger("TD").debug("读取战场地面信息失败");
            return;
         }
         var _loc2_:XMLList = param1.road;
         var _loc3_:int = _loc2_.length();
         var _loc4_:int = 0;
         this._startY = param1.@startY;
         this._endY = param1.@endY;
         var _loc5_:int = (this._endY - this._startY) / _loc3_;
         this._tileHeight = _loc5_;
         TDGameInfo.getInstance().zombieStartPosX = 0;
         var _loc6_:int = 0;
         while(_loc6_ < _loc3_)
         {
            _loc8_ = (_loc7_ = _loc2_[_loc6_]).@startX;
            _loc9_ = _loc7_.@endX;
            _loc10_ = String(_loc7_.@visible) == "0";
            _loc11_ = new TDMapRoadData(_loc8_,this._startY + _loc5_ * _loc6_,_loc9_,this._startY + _loc5_ * _loc6_ + _loc5_,_loc6_ + 1,_loc10_);
            _loc13_ = (_loc12_ = _loc7_.tile).length();
            _loc14_ = Math.abs(_loc8_ - _loc9_) / _loc13_;
            this._tileWidth = _loc14_;
            _loc11_.tileW = _loc14_;
            _loc11_.tileH = _loc5_;
            _loc15_ = 0;
            while(_loc15_ < _loc13_)
            {
               _loc18_ = (_loc16_ = _loc12_[_loc15_]).@type;
               _loc19_ = int(_loc16_.@forbid) == 1;
               switch(_loc18_)
               {
                  case "grass":
                     _loc17_ = TDConstant.TileType_Grass;
                     break;
                  case "water":
                     _loc17_ = TDConstant.TileType_Water;
                     break;
                  case "blank":
                     _loc17_ = TDConstant.TileType_Blank;
                     break;
                  default:
                     getLogger("TD").debug("未知的地面类型" + _loc18_);
                     break;
               }
               _loc20_ = _loc11_.index;
               _loc21_ = _loc13_ - 1 - _loc15_;
               (_loc22_ = new TDMapTileData(_loc8_ - (_loc13_ - _loc15_) * _loc14_,this._startY + _loc5_ * _loc6_,_loc14_,_loc5_,_loc4_,_loc19_)).type = _loc17_;
               _loc22_.roadIndex = _loc11_.index;
               _loc22_.roadRow = _loc20_;
               _loc22_.roadCol = _loc21_;
               _loc11_.addTile(_loc22_);
               _loc4_++;
               _loc15_++;
            }
            this.warfieldData.addRoadData(_loc11_);
            if(TDGameInfo.getInstance().zombieStartPosX == 0)
            {
               TDGameInfo.getInstance().zombieStartPosX = _loc11_.startX + 100;
            }
            if(param1.update)
            {
               this.updatePaths = param1.update;
            }
            _loc6_++;
         }
         this.toyCarList = new Array();
         if(this.startParam.gameType == TDStartParam.Daily)
         {
            this.toyCarList = this.startParam.dailyToyCar;
         }
         else
         {
            for each(_loc23_ in this.warfieldData.roadList)
            {
               _loc24_ = true;
               _loc25_ = _loc23_.tileList.length;
               _loc26_ = 0;
               while(_loc26_ < _loc25_)
               {
                  if(!(_loc27_ = _loc23_.tileList[_loc26_]).hasState(TDConstant.RoadTileState_Has_ForbidPlant))
                  {
                     _loc24_ = false;
                  }
                  _loc26_++;
               }
               if(!_loc24_)
               {
                  this.toyCarList.push(1);
               }
            }
         }
      }
      
      private function conditionParser(param1:XML) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc8_:String = null;
         var _loc10_:XML = null;
         var _loc11_:XMLList = null;
         var _loc12_:XML = null;
         var _loc13_:EndlessTDStageRecord = null;
         var _loc14_:SlotCardData = null;
         if(param1 == null)
         {
            getLogger("TD").debug("读取场景条件信息失败");
            return;
         }
         var _loc4_:String = param1.@time;
         var _loc5_:int = int(param1.init.@fuelInit);
         if(_loc4_ == "day")
         {
            this.time.set(TDConstant.Time_Day);
         }
         else if(_loc4_ == "night")
         {
            this.time.set(TDConstant.Time_Night);
         }
         else
         {
            this.time.set(TDConstant.Time_Day);
         }
         if(this.startParam.gameType == TDStartParam.Daily)
         {
            this.sun.set(int(param1.init.@sun) + this.startParam.dailyExtraSun);
            _loc5_ = this.startParam.dailyLeftFuel;
         }
         else
         {
            this.sun.set(int(param1.init.@sun));
         }
         if(this.startParam.gameType == TDStartParam.Endless)
         {
            this.rain.set(this.startParam.rainValue);
            if(this.startParam.endlessTDRecord)
            {
               _loc13_ = this.startParam.endlessTDRecord as EndlessTDStageRecord;
               this.sun.set(_loc13_.sun);
               _loc5_ = _loc13_.bean;
            }
         }
         else
         {
            this.rain.set(0);
         }
         this.rewardPlantID = int(param1.init.@rewardPlantID);
         this.tdGameType = int(param1.@gameType);
         this.toyCarType = int(param1.@toycar);
         var _loc6_:String;
         var _loc7_:Array = (_loc6_ = String(param1.@challengeAchi)).split("|");
         this.challengeAchiList = [];
         for each(_loc8_ in _loc7_)
         {
            this.challengeAchiList.push(int(_loc8_));
         }
         this.challengeAchiTimeLimit = int(param1.@challengetime);
         this.challengeAchiTimeRecord = int(param1.@challengetimeRecord);
         this.fuelInit.set(_loc5_);
         this._needScore.set(int(param1.@needScore));
         this.addObjectToLoadList(TDConstant.UnitCatalog_Zombie,TDConstant.ZombieType_Instead);
         if(this.hasToyCar())
         {
            this.addObjectToLoadList(TDConstant.UnitCatalog_Object,this.toyCarType);
         }
         this.cardSlotNum.set(int(param1.slots.@num));
         this.originalCardSlotNum.set(int(param1.slots.@num));
         this.initCardList = new Vector.<SlotCardData>();
         var _loc9_:XMLList = param1.slots.slot;
         for each(_loc10_ in _loc9_)
         {
            _loc14_ = new SlotCardData(int(_loc10_.@type),int(_loc10_.@count));
            this.initCardList.push(_loc14_);
         }
         _loc11_ = param1.extraRes.res;
         for each(_loc12_ in _loc11_)
         {
            this.addObjectToLoadList(int(_loc12_.@catalog),int(_loc12_.@id));
         }
         this.isUnderWater = int(this.stageMapXml.@sea) == 1;
         if(this.isUnderWater > 0)
         {
            this.addObjectToLoadList(TDConstant.UnitCatalog_Object,TDObjTypeID.Obj_Sea_Splash_Effect);
         }
         this.nowSkillList = new Vector.<int>();
      }
      
      private function enemyParser(param1:XML) : void
      {
         var _loc3_:XML = null;
         var _loc4_:TDMapWaveInfo = null;
         var _loc5_:XMLList = null;
         var _loc6_:XML = null;
         var _loc7_:TDMapWaveInfo = null;
         if(param1 == null)
         {
            getLogger("TD").debug("读取怪物信息失败");
            return;
         }
         var _loc2_:XMLList = param1.waves.wave;
         this.totalZombie = 0;
         for each(_loc3_ in _loc2_)
         {
            (_loc4_ = new TDMapWaveInfo(TDMapWaveType.TD_WAVE_BRANCH)).setWaveInfo(_loc3_);
            this._enemyWaveList.push(_loc4_);
            ++this.totalWave;
            _loc5_ = _loc3_.enemy;
            for each(_loc6_ in _loc5_)
            {
               (_loc7_ = new TDMapWaveInfo(TDMapWaveType.TD_WAVE_LEAF)).setEnemyInfo(_loc6_);
               this._enemyWaveList.push(_loc7_);
               ++this.totalZombie;
               if(_loc7_.enemyInfo.hasWind)
               {
                  this.addObjectToLoadList(TDConstant.UnitCatalog_Object,TDConstant.UnitType_BlowZombieEffect);
               }
               this.addObjectToLoadList(TDConstant.UnitCatalog_Zombie,_loc7_.enemyInfo.type);
            }
         }
      }
      
      private function banPlantParser(param1:XML) : void
      {
         var _loc2_:String = null;
         var _loc3_:XMLList = param1["limits"];
         if(_loc3_.length() > 0)
         {
            _loc2_ = _loc3_[0].@banplant;
            this.banNormalPlant = Vector.<int>(_loc2_.split(";"));
            _loc2_ = _loc3_[0].@banSkills;
            this.banSkillPlant = Vector.<int>(_loc2_.split(";"));
         }
      }
      
      private function initRoadObjectParser(param1:XML) : void
      {
         var _loc6_:TDUnitInitVO = null;
         var _loc2_:XMLList = param1.init.roads.road;
         var _loc3_:int = _loc2_.length();
         this.initRoadUnits = new Vector.<TDUnitInitVO>();
         var _loc4_:Array = new Array();
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc6_ = new TDUnitInitVO(_loc2_[_loc5_]);
            this.initRoadUnits.push(_loc6_);
            this.addObjectToLoadList(_loc6_.catalog,_loc6_.type);
            _loc5_++;
         }
      }
      
      private function initSunBombParser(param1:XML) : void
      {
         var _loc5_:XML = null;
         var _loc6_:TDMapSunBombInfo = null;
         var _loc2_:XMLList = param1.sunBombs.sun;
         var _loc3_:int = _loc2_.length();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = _loc2_[_loc4_];
            (_loc6_ = new TDMapSunBombInfo()).delay = uint(_loc5_.@delay);
            _loc6_.row = uint(_loc5_.@row);
            _loc6_.column = uint(_loc5_.@column);
            _loc6_.isBig = Boolean(int(_loc5_.@isBig));
            if(int(_loc5_.@speed) != 0)
            {
               _loc6_.speed = Number(_loc5_.@speed);
            }
            this.sunBombVec.push(_loc6_);
            _loc4_++;
         }
         if(_loc3_ > 0)
         {
            this.addObjectToLoadList(TDConstant.UnitCatalog_Object,TDObjTypeID.Obj_SunBomb);
            this.addObjectToLoadList(TDConstant.UnitCatalog_Object,TDObjTypeID.Obj_SunBombTrack);
         }
      }
      
      private function initPathsParser(param1:XML) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc9_:TDPathVO = null;
         var _loc2_:XMLList = param1.init.paths.path;
         var _loc3_:XMLList = param1.init.waters.water;
         var _loc7_:* = _loc4_ > 0;
         var _loc8_:Vector.<TDPathVO> = new Vector.<TDPathVO>();
         this.pathCells = new Vector.<Vector.<int>>(TDPathVO.COL_MAX + 1,true);
         _loc4_ = _loc2_.length();
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc9_ = new TDPathVO(_loc2_[_loc5_]);
            this.paths.push(_loc9_);
            if(_loc9_.order == 0 && _loc9_.type == 0)
            {
               _loc8_.push(_loc9_);
            }
            _loc5_++;
         }
         TDFloorUtil.updateCellsByPaths(this.pathCells,_loc8_);
         _loc4_ = _loc3_.length();
         this.watersTiles = new Vector.<int>(6,true);
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            this.watersTiles[int(_loc3_[_loc5_].@pathId)] = 1;
            _loc5_++;
         }
         this._groundPathType = this.mapID;
      }
      
      public function getGroundPathType() : int
      {
         return this._groundPathType;
      }
      
      public function get powerTileArr() : Array
      {
         return this._powerTileArr;
      }
      
      public function getPathVO(param1:int) : TDPathVO
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:TDPathVO = null;
         if(this.paths)
         {
            _loc2_ = this.paths.length;
            while(_loc3_ < _loc2_)
            {
               if((_loc4_ = this.paths[_loc3_]).pathId == param1)
               {
                  return _loc4_;
               }
               _loc3_++;
            }
         }
         return null;
      }
      
      private function initMiniGameParamsParser(param1:XML) : void
      {
         var _loc2_:XML = null;
         var _loc3_:ArgData = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         for each(_loc2_ in param1..param)
         {
            _loc3_ = new ArgData(String(_loc2_.@paramType),String(_loc2_.@paramData).split(","));
            this.miniGameParamDic[_loc3_.head] = _loc3_;
            if(_loc3_.head == "jewelType")
            {
               _loc4_ = _loc3_.arg.length;
               _loc5_ = 0;
               while(_loc5_ < _loc4_)
               {
                  this.addObjectToLoadList(TDConstant.UnitCatalog_Plant,Number(_loc3_.arg[_loc5_]));
                  _loc5_++;
               }
            }
         }
         if(this.tdGameType == TDConstant.TDGameType_Jewels)
         {
            this.addObjectToLoadList(TDConstant.UnitCatalog_Object,TDConstant.UnitType_TD_Hole);
         }
      }
      
      public function getMiniGameParamNumber(param1:String) : Number
      {
         if(this.miniGameParamDic == null)
         {
            return 0;
         }
         var _loc2_:ArgData = this.miniGameParamDic[param1];
         return _loc2_.arg[0];
      }
      
      public function getMiniGameParamArray(param1:String) : Array
      {
         if(this.miniGameParamDic == null)
         {
            return [];
         }
         var _loc2_:ArgData = this.miniGameParamDic[param1];
         return _loc2_.arg;
      }
      
      private function initObjectParser(param1:XML) : void
      {
         var _loc6_:TDUnitInitVO = null;
         var _loc7_:XMLList = null;
         var _loc8_:XMLList = null;
         var _loc9_:XMLList = null;
         var _loc10_:XML = null;
         var _loc11_:XMLList = null;
         var _loc12_:XML = null;
         var _loc2_:XMLList = param1.init.units.unit;
         var _loc3_:int = _loc2_.length();
         this.initUnits = new Vector.<TDUnitInitVO>();
         var _loc4_:Array = new Array();
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc6_ = new TDUnitInitVO(_loc2_[_loc5_]);
            this.initUnits.push(_loc6_);
            this.addObjectToLoadList(_loc6_.catalog,_loc6_.type);
            _loc5_++;
         }
         this.stageParamXml = param1.init.param[0];
         if(this.stageParamXml)
         {
            if((_loc7_ = this.stageParamXml.randomCard) && _loc7_.length() > 0)
            {
               _loc9_ = this.stageParamXml.randomCard[0].plant;
               for each(_loc10_ in _loc9_)
               {
                  this.addObjectToLoadList(TDConstant.UnitCatalog_Plant,_loc10_.@id);
               }
            }
            if((_loc8_ = this.stageParamXml.tileCard) && _loc8_.length() > 0)
            {
               _loc11_ = _loc8_[0].tile;
               for each(_loc12_ in _loc11_)
               {
                  this.addObjectToLoadList(TDConstant.UnitCatalog_Object,_loc12_.@type);
               }
            }
         }
      }
      
      public function addObjectToLoadList(param1:int, param2:int, param3:Boolean = true) : void
      {
         var _loc5_:Array = null;
         var _loc4_:Array = [];
         if(param3)
         {
            _loc4_.push([param1,param2]);
         }
         _loc4_ = _loc4_.concat(TDResourceUtil.checkExtraRes(param1,param2));
         for each(_loc5_ in _loc4_)
         {
            this.addLoadList(_loc5_[0],_loc5_[1]);
         }
      }
      
      public function checkGameType(param1:int) : Boolean
      {
         var _loc3_:* = false;
         var _loc2_:TDGameTypeTemplateCE = DataCacheManager.getInstance().getTemplateDataById(ClientDBTableName.Table_TDGameType,this.tdGameType,TDGameTypeTemplateCE);
         if(_loc2_ == null)
         {
            return false;
         }
         _loc3_ = false;
         switch(param1)
         {
            case TDConstant.TDGameType_Param_isChooseCard:
               _loc3_ = _loc2_.isChooseCard == 1;
               break;
            case TDConstant.TDgameType_Parma_hasNormalCardSlot:
               _loc3_ = _loc2_.hasNormalCardSlot == 1;
               break;
            case TDConstant.TDgameType_Parma_hasMovableCardSlot:
               _loc3_ = _loc2_.hasMovableCardSlot == 1;
               break;
            case TDConstant.TDgameType_Param_hasLimitCountCardSlot:
               _loc3_ = _loc2_.hasLimitCountCardSlot == 1;
               break;
            case TDConstant.TDgameType_Param_CropConsumeSun:
               _loc3_ = _loc2_.isCropConsumeSun == 1;
               break;
            case TDConstant.TDgameType_Param_DropSun:
               _loc3_ = _loc2_.isDropSun == 1;
               break;
            case TDConstant.TDgameType_Param_hasPlantSpecialSkill:
               _loc3_ = _loc2_.hasPlantSpecialSkill == 1;
               break;
            case TDConstant.TDgameType_Param_hasScorePanel:
               _loc3_ = _loc2_.hasScorePanel == 1;
               break;
            case TDConstant.TDgameType_Param_hasShovelPanel:
               _loc3_ = _loc2_.hasShovelPanel == 1;
               break;
            case TDConstant.TDgameType_Param_hasBossHpBar:
               _loc3_ = _loc2_.hasBossHpBar == 1;
         }
         return _loc3_;
      }
      
      public function getAvailablePlantList() : Array
      {
         var _loc4_:int = 0;
         var _loc5_:TDPlantStaticInfo = null;
         var _loc1_:Array = new Array();
         var _loc2_:int = 0;
         if(this.plantIDList != null)
         {
            _loc2_ = this.plantIDList.length;
         }
         var _loc3_:int = 0;
         for(; _loc3_ < _loc2_; _loc3_++)
         {
            _loc4_ = this.plantIDList[_loc3_].plantId;
            if(this.banNormalPlant.indexOf(_loc4_) == -1)
            {
               if((_loc5_ = TDDataFactory.instance.getPlantInfoByID(_loc4_)) != null)
               {
                  if(_loc5_.baseInfo.useSunOrNight != TDConstant.Time_All && _loc5_.baseInfo.useSunOrNight != TDStageInfo.getInstance().time.get())
                  {
                     continue;
                  }
                  if(!this.isUnderWater && _loc5_.baseInfo.isSeaPlant > 0)
                  {
                     continue;
                  }
               }
               _loc1_.push(_loc4_);
            }
         }
         return _loc1_;
      }
      
      public function getPlantDto(param1:int) : Dto_PlantInfo
      {
         var _loc2_:Dto_PlantInfo = null;
         var _loc3_:Dto_PlantInfo = null;
         for each(_loc2_ in this.plantIDList)
         {
            if(_loc2_.plantId == param1)
            {
               return _loc2_;
            }
         }
         _loc3_ = new Dto_PlantInfo();
         _loc3_.plantId = param1;
         _loc3_.avatarId = CardTemplateFactory.instance.getPlantDefaultAvatarID(param1);
         return _loc3_;
      }
      
      public function isChallengeLevel() : Boolean
      {
         return this.challengeLevelID > 0;
      }
   }
}
