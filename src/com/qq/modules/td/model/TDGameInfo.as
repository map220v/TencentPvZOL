package com.qq.modules.td.model
{
   import PVZ.Cmd.Cmd_TD_ReportLevelResult_SC;
   import asgui.core.UIComponentGlobals;
   import asgui.utils.WorldClock;
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.constant.QuickPayType;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.main.command.ShortcutPayProxyCmd;
   import com.qq.modules.main.service.ShortcutPayProxy;
   import com.qq.modules.sound.data.TDSoundData;
   import com.qq.modules.td.data.TDDataFactory;
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   import com.qq.modules.td.data.map.TDMapRoadData;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.TDChallengeScoreManager;
   import com.qq.modules.td.logic.TDConditionTriggerManager;
   import com.qq.modules.td.logic.TDCropUtil;
   import com.qq.modules.td.logic.numeric.TDCheckCollision;
   import com.qq.modules.td.logic.talent.TalentManager;
   import com.qq.modules.td.logic.unit.basic.GameObject;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.object.TDNormalObject;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import com.qq.modules.td.model.vo.TDCardData;
   import com.qq.modules.td.model.vo.TDCardListData;
   import com.qq.modules.td.view.game.layer.floor.TDFloorManager;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.DMath;
   import com.qq.utils.DateUtils;
   import com.qq.utils.data.PData;
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Int64Util;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   import org.as3commons.logging.api.getLogger;
   import org.robotlegs.mvcs.Actor;
   
   public class TDGameInfo extends Actor
   {
      
      private static var _instance:TDGameInfo;
      
      public static var tdStartTime:Number;
      
      public static var speedRatio:Number = 1;
      
      public static var statistics_totalFrame:Number;
      
      public static var statistics_totalTime:Number;
       
      
      private var m_generateSunCount:int = 0;
      
      private var m_lootLeafCount:int = 0;
      
      public var lastCropPlantID:String;
      
      public var lastPassStageMsgSC:Cmd_TD_ReportLevelResult_SC;
      
      public var sun:PData;
      
      public var fuel:PData;
      
      public var rain:PData;
      
      public var useFuelValue:PData;
      
      public var gameArea:Rectangle;
      
      public var toycarPosX:int;
      
      public var enterHousePosX:int;
      
      private var _achievementList:Array;
      
      public var zombieStartPosX:int;
      
      public var aliveZombieNum:int;
      
      public var realAliveZombieNum:int;
      
      public var endlessScore:PData;
      
      public var yetiKillNum:int;
      
      public var buyBeanTimes:int;
      
      public var leftBuyBeanTimes:int;
      
      public var buySunTimes:int;
      
      public var finalResult:int;
      
      public var newAchievement:Array;
      
      public var loadingUrls:Vector.<String>;
      
      public var talentList:Array;
      
      private var _isRunningGame:Boolean;
      
      public var isFinishCreateWave:Boolean;
      
      public var startImmediately:Boolean;
      
      public var lastDieZombiePos:Point;
      
      private var _hasToyCar:Boolean;
      
      private var _toyCarFlagList:Array;
      
      private var _isDepthChange:Boolean;
      
      public var isShakeScreen:int = 0;
      
      public var dragMode:int;
      
      public var groundW:int;
      
      public var groundH:int;
      
      public var coinTargetX:int = 1005;
      
      public var coinTargetY:int = 86;
      
      public var mapW:int = 1500;
      
      public var minCol:int = 0;
      
      public var minRow:int = 1;
      
      public var maxCol:int = 9;
      
      public var maxRow:int = 5;
      
      public var maxReachedSun:int;
      
      public var updateProcessList:Array;
      
      private var _mowerBoughtList:Array;
      
      public var normalCardsData:TDCardListData;
      
      public var friendCardsData:TDCardListData;
      
      public var skillCardsData:TDCardListData;
      
      public var isStopCheckEndGame:Boolean;
      
      private var shortcutProxy:ShortcutPayProxy;
      
      public var sortList:Array;
      
      public var isPause:Boolean;
      
      private var _lastUpdateTime:Number;
      
      private var _realPassTime:Number;
      
      private var _passTime:Number;
      
      private var _startTime:Number;
      
      public var roadList:Array;
      
      public var gameobjectMap:Dictionary;
      
      private var _removeGameObjectFromMapList:Vector.<GameObject>;
      
      private var _cacheProductFirstPlantUID:Array;
      
      private var _effectRecord:Array;
      
      private var _sunAutoCollect:Boolean;
      
      public function TDGameInfo()
      {
         this.newAchievement = [];
         this.loadingUrls = new Vector.<String>();
         this.updateProcessList = [];
         this._mowerBoughtList = new Array(this.maxRow - this.minRow + 1);
         this._removeGameObjectFromMapList = new Vector.<GameObject>();
         super();
         this.toycarPosX = 260;
         this.enterHousePosX = 20;
         this.gameArea = new Rectangle(this.passWarfieldPosX,0,900,675);
         this.sun = new PData(true);
         this.fuel = new PData(true);
         this.rain = new PData(true);
         this.useFuelValue = new PData(false);
         this.useFuelValue.set(1);
         this.lastDieZombiePos = new Point(0,0);
         this._toyCarFlagList = new Array();
         this._achievementList = [];
         this.normalCardsData = new TDCardListData();
         this.friendCardsData = new TDCardListData();
         this.skillCardsData = new TDCardListData();
         this.endlessScore = new PData(true);
      }
      
      public static function getInstance() : TDGameInfo
      {
         if(_instance == null)
         {
            _instance = new TDGameInfo();
         }
         return _instance;
      }
      
      public static function dispose(param1:int, param2:int, param3:int) : void
      {
         if(param1 == TDStageInfo.getInstance().levelID && param2 == TDStageInfo.getInstance().subLevelID && param3 == TDStageInfo.getInstance().challengeLevelID)
         {
            if(_instance)
            {
               _instance.dispose();
            }
            _instance = null;
         }
      }
      
      public function set generateSunCount(param1:int) : void
      {
         this.m_generateSunCount = param1;
      }
      
      public function get generateSunCount() : int
      {
         return this.m_generateSunCount;
      }
      
      public function set lootLeafCount(param1:int) : void
      {
         this.m_lootLeafCount = param1;
      }
      
      public function get lootLeafCount() : int
      {
         return this.m_lootLeafCount;
      }
      
      public function get passWarfieldPosX() : int
      {
         return TDConstant.passWarfieldPosX;
      }
      
      public function resetTDStartTime() : void
      {
         tdStartTime = DateUtils.getInstance().getServerTime();
      }
      
      public function get achievementList() : Array
      {
         return this._achievementList;
      }
      
      public function set achievementList(param1:Array) : void
      {
         this._achievementList = param1;
         this.newAchievement = [];
      }
      
      public function addNewAchievement(param1:int) : void
      {
         if(!this.hasAchievement(param1))
         {
            this.newAchievement.push(param1);
         }
      }
      
      public function hasAchievement(param1:int) : Boolean
      {
         return this._achievementList.indexOf(param1) != -1;
      }
      
      public function get isRunningGame() : Boolean
      {
         return this._isRunningGame;
      }
      
      public function set isRunningGame(param1:Boolean) : void
      {
         this._isRunningGame = param1;
      }
      
      public function get isDepthChange() : Boolean
      {
         return this._isDepthChange;
      }
      
      public function set isDepthChange(param1:Boolean) : void
      {
         this._isDepthChange = param1;
      }
      
      public function get sunTargetX() : int
      {
         return (33 - GameGloble.xAddForScene) / GameGloble.scaleCurrent;
      }
      
      public function get sunTargetY() : int
      {
         return 24 / GameGloble.scaleCurrent;
      }
      
      public function get leafTargetX() : int
      {
         return (33 - GameGloble.xAddForScene) / GameGloble.scaleCurrent;
      }
      
      public function get leafTargetY() : int
      {
         return 67 / GameGloble.scaleCurrent;
      }
      
      public function get dropCardTargetX() : int
      {
         return (600 - GameGloble.xAddForScene) / GameGloble.scaleCurrent;
      }
      
      public function get dropCardTargetY() : int
      {
         return 70 / GameGloble.scaleCurrent;
      }
      
      public function dispose() : void
      {
         TDStageInfo.getInstance().reset();
         this._achievementList = [];
         this.normalCardsData = null;
         this.friendCardsData = null;
      }
      
      public function initSortList() : void
      {
         this.sortList = new Array();
      }
      
      public function addToSortList(param1:IGameObject) : void
      {
         var _loc2_:int = this.sortList.indexOf(param1);
         if(_loc2_ == -1)
         {
            this.sortList.push(param1);
         }
      }
      
      public function removeFromSortList(param1:IGameObject) : void
      {
         if(!this.sortList)
         {
            return;
         }
         var _loc2_:int = this.sortList.indexOf(param1);
         if(_loc2_ != -1)
         {
            this.sortList.splice(_loc2_,1);
         }
      }
      
      public function initToyCarFlag() : void
      {
         this._hasToyCar = TDStageInfo.getInstance().hasToyCar();
         this._toyCarFlagList = new Array();
         var _loc1_:int = 0;
         while(_loc1_ < TDStageInfo.getInstance().warfieldData.roadList.length)
         {
            this._toyCarFlagList[_loc1_] = false;
            _loc1_++;
         }
      }
      
      public function setToyCarFlag(param1:int, param2:Boolean) : void
      {
         this._toyCarFlagList[param1] = param2;
      }
      
      public function hasToyCarByRoadIndex(param1:int) : Boolean
      {
         if(!this._hasToyCar)
         {
            return false;
         }
         return this._toyCarFlagList[param1];
      }
      
      public function setLastDieZombiePos(param1:int, param2:int) : void
      {
         this.lastDieZombiePos.x = param1;
         this.lastDieZombiePos.y = param2;
      }
      
      public function isLastZombie() : Boolean
      {
         var _loc1_:Array = null;
         var _loc2_:int = 0;
         var _loc3_:BasicZombie = null;
         if(this.isFinishCreateWave)
         {
            _loc1_ = this.getGameObjectMapByCatalg(TDConstant.UnitCatalog_Zombie);
            _loc2_ = 0;
            for each(_loc3_ in _loc1_)
            {
               if(_loc3_.zombieData.isAlive())
               {
                  _loc2_++;
               }
            }
            if(_loc2_ == 0)
            {
               return true;
            }
         }
         return false;
      }
      
      public function reset(param1:Number, param2:Int64) : void
      {
         if(this.shortcutProxy == null)
         {
            if(GameGloble.injector.hasMapping(ShortcutPayProxy))
            {
               this.shortcutProxy = GameGloble.injector.getInstance(ShortcutPayProxy);
            }
         }
         TDFloorManager.instance.reset();
         this.resetRoadTile();
         TalentManager.instance.reset(param2);
         if(TDStageInfo.getInstance().levelID == 0)
         {
            TDSoundData.getInstance().reset(2);
         }
         else
         {
            TDSoundData.getInstance().reset(TDStageInfo.getInstance().soundSceneID);
         }
         TDChallengeScoreManager.instance.reset();
         TDConditionTriggerManager.instance.reset();
         this.isStopCheckEndGame = false;
         this.m_generateSunCount = 0;
         this.m_lootLeafCount = 0;
         this.resetGameTime();
         this.resumeTime();
         speedRatio = 1;
         this.aliveZombieNum = 0;
         this.yetiKillNum = 0;
         this.buyBeanTimes = 0;
         this.buySunTimes = 0;
         this.leftBuyBeanTimes = int.MAX_VALUE;
         this.isRunningGame = false;
         CommandDispatcher.send(CommandName.TD_ShowOrHideSunBar,TDStageInfo.getInstance().checkGameType(TDConstant.TDgameType_Param_CropConsumeSun));
         this.sun.set(TDStageInfo.getInstance().sun.get());
         CommandDispatcher.send(CommandName.TD_ChangeSun);
         CommandDispatcher.send(CommandName.TD_ShowOrHideFuelBar,TDStageInfo.getInstance().checkGameType(TDConstant.TDgameType_Param_hasPlantSpecialSkill));
         this.fuel.set(TDStageInfo.getInstance().fuelInit.get());
         CommandDispatcher.send(CommandName.TD_ChangeFuel);
         CommandDispatcher.send(CommandName.TD_ShowOrHideRainBar,TDStageInfo.getInstance().startParam.gameType == TDStartParam.Endless);
         this.rain.set(TDStageInfo.getInstance().rain.get());
         CommandDispatcher.send(CommandName.TD_ChangeRain);
         CommandDispatcher.send(CommandName.TD_RECORD_STAGE_INFO,TDStageInfo.getInstance().stageID);
         this.endlessScore.set(0);
         CommandDispatcher.send(CommandName.TD_ShowOrHideBossHpBar,false);
         this.setNormalPlantSlot(TDStageInfo.getInstance().cardSlotNum.get());
         this.setFriendPlantSlot(1);
         this.lastDieZombiePos.x = GameGloble.stage.stageWidth * 0.5;
         this.lastDieZombiePos.y = GameGloble.stage.stageHeight * 0.5;
         this.initToyCarFlag();
         this.initSortList();
         this.initSunDuration();
         this.initChallengeAchi();
         this.maxReachedSun = 0;
         this.lastCropPlantID = null;
         switch(TDStageInfo.getInstance().tdGameType)
         {
            case TDConstant.TDGameType_VOS:
               TDMiniGameMusicData.getInstance().reset();
               break;
            case TDConstant.TDGameType_NoSun:
               TDMiniGameNoSunData.getInstance().reset();
               break;
            case TDConstant.TDGameType_FlipCard:
               TDMiniGameFlipCardData.getInstance().reset(TDStageInfo.getInstance().totalZombie);
               break;
            case TDConstant.TDGameType_TerracottaMemory:
               TDMiniGameTerracottaMemoryData.getInstance().reset();
               break;
            case TDConstant.TDGameType_Jewels:
               TDMiniGameJewelsData.instance.reset();
               break;
            case TDConstant.TDGameType_CarrotRocketShooting:
               TDMiniGameShootingData.getInstance().reset();
               break;
            case TDConstant.TDGameType_CoconutCannonShooting:
               TDMiniGameCoconutCannonData.getInstance().reset();
         }
         if(TDStageInfo.getInstance().checkGameType(TDConstant.TDgameType_Parma_hasMovableCardSlot))
         {
            TDMoveCardTrackData.getInstance().reset();
            TDMoveEnergyTileCardTrackData.instance.resetData();
            TDInsertCardTrackData.instance.resetData();
         }
      }
      
      public function clean() : void
      {
         this.resetGameTime();
         this.isRunningGame = false;
         this._achievementList = [];
         this._mowerBoughtList = [];
         this.isShakeScreen = 0;
         this.cleanNormalPlantSlot();
         this.cleanFriendlPlantSlot();
         TDMiniGameJewelsData.instance.dispose();
         TDMiniGameCoconutCannonData.getInstance().dispose();
      }
      
      public function addCardToSlot(param1:TDCardData) : void
      {
         if(param1.cardSourceType == TDCardData.CARD_SOURCE_VIP)
         {
            this.normalCardsData.addCardToSlot(param1);
            CommandDispatcher.send(CommandName.TD_Add_CardToSlot,{"cardState":param1});
         }
         else if(Int64Util.isEqual(param1.friendInfoData.roleId,GameGloble.actorModel.roleId))
         {
            this.normalCardsData.addCardToSlot(param1);
            CommandDispatcher.send(CommandName.TD_Add_CardToSlot,{"cardState":param1});
            CommandDispatcher.send(CommandName.TD_ChangeChoosePlant);
         }
         else
         {
            this.friendCardsData.addCardToSlot(param1);
            CommandDispatcher.send(CommandName.TD_Add_FriendCardToSlot,{"cardState":param1});
            CommandDispatcher.send(CommandName.TD_ChangeChoosePlant);
         }
      }
      
      public function removeCardFromSlot(param1:TDCardData) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(Int64Util.isEqual(param1.friendInfoData.roleId,GameGloble.actorModel.roleId))
         {
            _loc2_ = this.normalCardsData.removeCardFromSlot(param1);
            if(_loc2_ != -1)
            {
               CommandDispatcher.send(CommandName.TD_RemoveChooseNormalPlant,{"cardState":param1});
            }
         }
         else
         {
            _loc3_ = this.friendCardsData.removeCardFromSlot(param1);
            if(_loc3_ != -1)
            {
               CommandDispatcher.send(CommandName.TD_RemoveChooseSkillPlant,{"cardState":param1});
            }
         }
      }
      
      public function hasPlantCardByType(param1:int) : Boolean
      {
         return Boolean(this.normalCardsData.hasPlantType(param1) || this.friendCardsData.hasPlantType(param1));
      }
      
      public function hasPlantCardByCardData(param1:TDCardData) : Boolean
      {
         return Boolean(this.normalCardsData.hasPlant(param1) || this.friendCardsData.hasPlant(param1));
      }
      
      public function cleanFriendlPlantSlot() : void
      {
         this.friendCardsData.reset();
         CommandDispatcher.send(CommandName.TD_CleanAllFriendPlant);
      }
      
      public function setFriendPlantSlot(param1:int) : void
      {
         this.friendCardsData.reset(param1);
         CommandDispatcher.send(CommandName.TD_Init_FriendCardSlot_UI);
      }
      
      public function cleanNormalPlantSlot() : void
      {
         CommandDispatcher.send(CommandName.TD_CleanAllNormalPlant);
         this.normalCardsData.reset();
      }
      
      public function setNormalPlantSlot(param1:int) : void
      {
         this.normalCardsData.reset(param1);
         CommandDispatcher.send(CommandName.TD_Init_CardSlot_UI);
      }
      
      public function isInScreen(param1:Number, param2:Number) : Boolean
      {
         return this.gameArea.contains(param1,param2);
      }
      
      public function resetGameTime() : void
      {
         this._passTime = 0;
         this._realPassTime = 0;
         this._lastUpdateTime = -1;
         this._startTime = 0;
         statistics_totalFrame = 0;
         statistics_totalTime = 0;
         this.pauseTime();
      }
      
      public function getCurGameTime() : Number
      {
         return this._passTime;
      }
      
      public function getRealPassTime() : Number
      {
         return int(this._realPassTime * 0.001);
      }
      
      public function setTDGameStart() : void
      {
         this._startTime = this._passTime;
         this._lastUpdateTime = -1;
      }
      
      public function get TDGameTime() : Number
      {
         return this._passTime - this._startTime;
      }
      
      public function pauseTime() : void
      {
         if(this.isPause)
         {
            getLogger("TD").debug("The game is already paused");
            return;
         }
         GameGloble.stage.removeEventListener(Event.ENTER_FRAME,this.onUpdateTime);
         this.isPause = true;
      }
      
      public function updateTime() : void
      {
         if(!this.isRunningGame)
         {
            return;
         }
         var _loc1_:Number = getTimer();
         if(this._lastUpdateTime == -1)
         {
            this._lastUpdateTime = _loc1_;
         }
         var _loc2_:Number = _loc1_ - this._lastUpdateTime;
         this._passTime += int(_loc2_ * speedRatio);
         this._realPassTime += _loc2_;
         this._lastUpdateTime = getTimer();
         ++statistics_totalFrame;
         statistics_totalTime += _loc2_;
      }
      
      private function onUpdateTime(param1:Event) : void
      {
         this.updateTime();
      }
      
      public function resumeTime() : void
      {
         if(!this.isPause)
         {
            getLogger("TD").debug("The game is already resumed");
            return;
         }
         if(this._lastUpdateTime != -1)
         {
            this._realPassTime += getTimer() - this._lastUpdateTime;
         }
         this._lastUpdateTime = getTimer();
         GameGloble.stage.addEventListener(Event.ENTER_FRAME,this.onUpdateTime);
         this.isPause = false;
      }
      
      public function initRoadTile(param1:Array) : void
      {
         this.roadList = param1;
      }
      
      public function resetRoadTile() : void
      {
         var _loc1_:TDMapRoadData = null;
         var _loc2_:Array = null;
         var _loc3_:TDMapTileData = null;
         if(this.roadList == null)
         {
            return;
         }
         for each(_loc1_ in this.roadList)
         {
            _loc2_ = _loc1_.tileList;
            for each(_loc3_ in _loc2_)
            {
               _loc3_.reset();
            }
         }
      }
      
      public function getRoadInfo(param1:int) : TDMapRoadData
      {
         if(param1 <= 0)
         {
            getLogger("TD").debug("读取路径序号必须大于0，现为" + param1);
            return null;
         }
         var _loc2_:TDMapRoadData = this.roadList[param1];
         if(_loc2_ === null)
         {
            getLogger("TD").debug("读取路面信息" + param1 + "出错");
         }
         return _loc2_;
      }
      
      public function getRoadTileNum() : int
      {
         var _loc1_:TDMapRoadData = this.getRoadInfo(1);
         if(_loc1_ != null)
         {
            return _loc1_.tileList.length;
         }
         return 0;
      }
      
      public function getRoadNum() : int
      {
         return Math.max(0,this.roadList.length - 1);
      }
      
      public function getRoadIndex(param1:int) : int
      {
         var _loc2_:TDMapRoadData = null;
         if(param1 < TDStageInfo.getInstance().startY)
         {
            return this.minRow;
         }
         if(param1 > TDStageInfo.getInstance().endY)
         {
            return this.maxRow;
         }
         for each(_loc2_ in this.roadList)
         {
            if(_loc2_.startY <= param1 && param1 <= _loc2_.endY)
            {
               return _loc2_.index;
            }
         }
         getLogger().error("路径计算发生错误，出现未知的路径");
         return 0;
      }
      
      public function getRoadTileArr(param1:int, param2:int, param3:int, param4:int) : Array
      {
         var _loc7_:Array = null;
         var _loc8_:TDMapTileData = null;
         var _loc5_:Array = [];
         var _loc6_:int = param3;
         while(_loc6_ <= param4)
         {
            _loc7_ = this.roadList[_loc6_].tileList;
            for each(_loc8_ in _loc7_)
            {
               if(param1 <= _loc8_.roadCol && _loc8_.roadCol <= param2)
               {
                  _loc5_.push(_loc8_);
               }
            }
            _loc6_++;
         }
         return _loc5_;
      }
      
      public function getRoadTileInf(param1:int, param2:int) : TDMapTileData
      {
         var _loc3_:TDMapRoadData = this.roadList[param2];
         if(_loc3_ == null)
         {
            return null;
         }
         if(param1 >= _loc3_.tileList.length)
         {
            getLogger("TD").debug("读取地块x" + param1 + "出错");
            return null;
         }
         return _loc3_.tileList[_loc3_.tileList.length - param1 - 1];
      }
      
      public function getRoadTileByIndex(param1:int) : TDMapTileData
      {
         var _loc2_:TDMapRoadData = null;
         var _loc3_:Array = null;
         var _loc4_:TDMapTileData = null;
         for each(_loc2_ in this.roadList)
         {
            _loc3_ = _loc2_.tileList;
            for each(_loc4_ in _loc3_)
            {
               if(_loc4_.index == param1)
               {
                  return _loc4_;
               }
            }
         }
         return null;
      }
      
      public function getRoadTileByScreenPos(param1:int, param2:int) : TDMapTileData
      {
         var _loc3_:TDMapRoadData = null;
         var _loc4_:TDMapTileData = null;
         param1 += GameGloble.xForScene * (1 - GameGloble.scaleCurrent);
         param1 /= GameGloble.scaleCurrent;
         param2 /= GameGloble.scaleCurrent;
         for each(_loc3_ in this.roadList)
         {
            for each(_loc4_ in _loc3_.tileList)
            {
               if(_loc4_.rect.contains(param1,param2))
               {
                  return _loc4_;
               }
            }
         }
         return null;
      }
      
      public function getRoadTileByGamePos(param1:int, param2:int) : TDMapTileData
      {
         var _loc3_:TDMapRoadData = null;
         var _loc4_:TDMapTileData = null;
         for each(_loc3_ in this.roadList)
         {
            for each(_loc4_ in _loc3_.tileList)
            {
               if(_loc4_.rect.contains(param1,param2))
               {
                  return _loc4_;
               }
            }
         }
         return null;
      }
      
      public function getRoadTileState(param1:TDMapTileData) : int
      {
         var _loc4_:TDNormalObject = null;
         var _loc2_:* = 0;
         if(param1 == null)
         {
            return _loc2_;
         }
         if(param1.hasState(TDConstant.RoadTileState_Has_ForbidPlant))
         {
            _loc2_ |= TDConstant.RoadTileState_Has_ForbidPlant;
         }
         if(param1.hasState(TDConstant.RoadTileState_forbidCropPlant_Temporary))
         {
            _loc2_ |= TDConstant.RoadTileState_Has_ForbidPlant;
         }
         if(param1.hasState(TDConstant.RoadTileState_Has_Plant))
         {
            _loc2_ |= TDConstant.RoadTileState_Has_Plant;
         }
         else if(param1.hasState(TDConstant.RoadTileState_Has_Armor))
         {
            _loc2_ |= TDConstant.RoadTileState_Has_Armor;
         }
         if(param1.hasState(TDConstant.RoadTileState_Has_Container))
         {
            _loc2_ |= TDConstant.RoadTileState_Has_Container;
         }
         if(TDFloorManager.instance.hasPathAt(param1.roadRow,param1.roadCol))
         {
            _loc2_ |= TDConstant.RoadTileState_Has_PATH;
         }
         if(TDFloorManager.instance.hasRemovedMudAt(param1.roadRow,param1.roadCol))
         {
            _loc2_ |= TDConstant.RoadTileState_Has_UNMUD;
         }
         if(TDFloorManager.instance.hasWaterAt(param1.roadRow,param1.roadCol))
         {
            _loc2_ |= TDConstant.RoadTileState_Has_WATER;
         }
         if(TDFloorManager.instance.hasSpringboard(param1.roadRow,param1.roadCol))
         {
            _loc2_ |= TDConstant.RoadTileState_Has_Springboard;
         }
         var _loc3_:Array = this.getGameObjectMapByCatalg(TDConstant.UnitCatalog_Object);
         for each(_loc4_ in _loc3_)
         {
            if(_loc4_.objData.roadIndex == param1.roadIndex && _loc4_.objData.tileIndex == param1.index)
            {
               if(_loc4_.objData.objectStaticInfo.isBlock)
               {
                  _loc2_ |= TDConstant.RoadTileState_Has_Tomb;
               }
            }
         }
         return _loc2_;
      }
      
      public function hasNomalPlantInRoadTile(param1:TDMapTileData) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         if(param1.hasState(TDConstant.RoadTileState_Has_Plant))
         {
            return true;
         }
         return false;
      }
      
      public function getEffectTileRectList(param1:int, param2:int, param3:int) : Array
      {
         var _loc6_:Rectangle = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:TDMapTileData = null;
         var _loc4_:Array = new Array();
         var _loc5_:TDMapTileData;
         if((_loc5_ = this.getRoadTileByIndex(param1)) != null)
         {
            _loc6_ = this.getEffectRectByRoadTile(param1,param2,param3);
            _loc7_ = this.getRoadTileNum() * this.getRoadNum();
            _loc8_ = 0;
            while(_loc8_ < _loc7_)
            {
               _loc9_ = this.getRoadTileByIndex(_loc8_);
               if(_loc6_.intersects(_loc9_.rect))
               {
                  _loc4_.push(_loc9_.rect);
               }
               _loc8_++;
            }
         }
         return _loc4_;
      }
      
      private function getOffsetTileIndex(param1:int, param2:int, param3:int) : int
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc4_:TDMapTileData;
         if((_loc4_ = this.getRoadTileByIndex(param1)) != null)
         {
            _loc5_ = this.getRoadTileNum();
            _loc6_ = this.getRoadNum();
            _loc7_ = Math.min(Math.max(0,param1 % _loc5_ + param2),_loc5_ - 1);
            return int((_loc8_ = Math.min(Math.max(0,int(param1 / _loc5_) + param3),_loc6_ - 1)) * _loc5_ + _loc7_);
         }
         return -1;
      }
      
      public function getEffectRect(param1:int, param2:int, param3:int) : Rectangle
      {
         var _loc4_:Rectangle = new Rectangle();
         var _loc5_:TDMapTileData;
         if((_loc5_ = this.getRoadTileByIndex(param1)) != null)
         {
            _loc4_.x = _loc5_.rect.x + 0.5 * _loc5_.rect.width - param2 * 0.5;
            _loc4_.y = _loc5_.rect.y + 0.5 * _loc5_.rect.height - param3 * 0.5;
            _loc4_.width = param2;
            _loc4_.height = param3;
         }
         return _loc4_;
      }
      
      public function getEffectRectByRoadTile(param1:int, param2:int, param3:int) : Rectangle
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Array = null;
         var _loc9_:int = 0;
         var _loc4_:Rectangle = new Rectangle();
         var _loc5_:TDMapTileData;
         if((_loc5_ = this.getRoadTileByIndex(param1)) != null)
         {
            _loc6_ = int((param3 - 1) * 0.5);
            _loc7_ = int((param2 - 1) * 0.5);
            (_loc8_ = new Array()).push(this.getOffsetTileIndex(param1,-_loc7_,-_loc6_));
            _loc8_.push(this.getOffsetTileIndex(param1,_loc7_,-_loc6_));
            _loc8_.push(this.getOffsetTileIndex(param1,-_loc7_,_loc6_));
            _loc8_.push(this.getOffsetTileIndex(param1,_loc7_,_loc6_));
            for each(_loc9_ in _loc8_)
            {
               if(_loc9_ != -1)
               {
                  if((_loc5_ = this.getRoadTileByIndex(_loc9_)) != null)
                  {
                     if(_loc4_.isEmpty())
                     {
                        _loc4_ = _loc5_.rect.clone();
                     }
                     else
                     {
                        _loc4_ = _loc4_.union(_loc5_.rect);
                     }
                  }
               }
            }
         }
         return _loc4_;
      }
      
      public function getPlantPos(param1:int, param2:int) : Point
      {
         var _loc3_:Point = new Point(0,0);
         var _loc4_:TDMapTileData = this.getRoadTileByIndex(param1);
         var _loc5_:TDPlantStaticInfo = TDDataFactory.instance.getPlantInfoByID(param2);
         if(_loc4_ != null && _loc5_ != null)
         {
            _loc3_ = this.getPlantPosByTileData(_loc4_,_loc5_);
         }
         return _loc3_;
      }
      
      public function getPlantPosByTileData(param1:TDMapTileData, param2:TDPlantStaticInfo) : Point
      {
         var _loc3_:Point = new Point();
         _loc3_.x = param1.rect.x + param1.rect.width * 0.5;
         var _loc4_:int = this.getRoadTileState(param1);
         switch(param2.baseInfo.usefulness)
         {
            case TDConstant.PlantUsefulness_Container:
               _loc3_.y = param1.rect.y + param1.rect.height;
               break;
            case TDConstant.PlantUsefulness_Protected:
               if(_loc4_ & TDCropUtil.getRoadStateKeyByPlantUsefulness(TDConstant.PlantUsefulness_Container))
               {
                  _loc3_.y = param1.rect.y + param1.rect.height * 0.5;
               }
               else
               {
                  _loc3_.y = param1.rect.y + param1.rect.height * 0.5 + 45;
               }
               break;
            case TDConstant.PlantUsefulness_Other:
               _loc3_.y = param1.rect.y + param1.rect.height - 17;
               break;
            default:
               _loc3_.y = param1.rect.y + param1.rect.height - 8;
         }
         _loc3_.y -= 15;
         return _loc3_;
      }
      
      public function initGameobjectMap() : void
      {
         this.gameobjectMap = new Dictionary();
      }
      
      public function cleanGameobjectMap() : void
      {
         var _loc1_:* = null;
         var _loc2_:Array = null;
         var _loc3_:IGameObject = null;
         if(this.gameobjectMap != null)
         {
            for(_loc1_ in this.gameobjectMap)
            {
               _loc2_ = this.gameobjectMap[_loc1_];
               for each(_loc3_ in _loc2_)
               {
                  _loc3_.dispose(false);
               }
               this.gameobjectMap[_loc1_] = new Array();
            }
         }
         this.gameobjectMap = null;
         this.gameobjectMap = new Dictionary();
      }
      
      public function cleanQuickSand() : void
      {
         var _loc2_:IGameObject = null;
         var _loc1_:Array = this.getGameObjectMapByCatalgAndType(TDConstant.UnitCatalog_Object,TDConstant.UnitType_QuickSand);
         for each(_loc2_ in _loc1_)
         {
            if(_loc2_)
            {
               _loc2_.Dispose();
            }
         }
      }
      
      public function getGameObjectMapByCatalg(param1:int) : Array
      {
         if(!this.gameobjectMap)
         {
            this.initGameobjectMap();
         }
         this.checkRemoveGameObjectFromMapList();
         var _loc2_:Array = this.gameobjectMap[param1];
         if(_loc2_ == null)
         {
            _loc2_ = new Array();
            this.gameobjectMap[param1] = _loc2_;
         }
         return _loc2_;
      }
      
      public function getGameObjectCount(param1:int) : int
      {
         var _loc3_:int = 0;
         var _loc4_:IGameObject = null;
         var _loc2_:Array = this.getGameObjectMapByCatalg(param1);
         for each(_loc4_ in _loc2_)
         {
            _loc3_++;
         }
         return _loc3_;
      }
      
      public function getGameObjectMapByCatalgAndType(param1:int, param2:int) : Array
      {
         var _loc5_:IGameObject = null;
         var _loc3_:Array = this.getGameObjectMapByCatalg(param1);
         var _loc4_:Array = new Array();
         for each(_loc5_ in _loc3_)
         {
            if(_loc5_.objectModel.unitCatalog == param1 && _loc5_.objectModel.unitType == param2)
            {
               _loc4_.push(_loc5_);
            }
         }
         return _loc4_;
      }
      
      public function countTombNum(param1:int) : int
      {
         var _loc6_:IGameObject = null;
         var _loc2_:int = 0;
         var _loc3_:Array = this.getGameObjectMapByCatalgAndType(TDConstant.UnitCatalog_Object,TDConstant.UnitType_TDTomb);
         var _loc4_:int = _loc3_.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = _loc3_[_loc5_];
            if(param1 == _loc6_.objectModel.tileIndex)
            {
               _loc2_++;
            }
            _loc5_++;
         }
         return _loc2_;
      }
      
      public function addGameobjectToMap(param1:IGameObject) : void
      {
         if(param1 == null)
         {
            getLogger("TD").debug("加入列表的gameobject为空");
            return;
         }
         var _loc2_:IGameObject = param1 as IGameObject;
         var _loc3_:int = _loc2_.objectModel.unitCatalog;
         var _loc4_:Array;
         (_loc4_ = this.getGameObjectMapByCatalg(_loc3_))[_loc2_.uid] = _loc2_;
         WorldClock.clock.add(_loc2_.animation);
      }
      
      public function removeGameObjectFromMap(param1:GameObject) : void
      {
         if(param1 == null)
         {
            getLogger("TD").debug("移除列表的gameobject为空");
            return;
         }
         var _loc2_:int = param1.model.unitCatalog;
         var _loc3_:Array = this.getGameObjectMapByCatalg(_loc2_);
         if(_loc3_[param1.uid] != null)
         {
            delete _loc3_[param1.uid];
         }
         else
         {
            getLogger("TD").debug("在列表没有找到需要移除的catalog:" + param1.model.unitCatalog + " type:" + param1.model.unitType + "的单位");
         }
      }
      
      public function addRemoveGameObjectFromMapList(param1:GameObject) : void
      {
         this._removeGameObjectFromMapList.push(param1);
         UIComponentGlobals.layoutManager.AdddDelayFuncCallOnce(this.checkRemoveGameObjectFromMapList);
      }
      
      public function checkRemoveGameObjectFromMapList() : void
      {
         while(this._removeGameObjectFromMapList.length > 0)
         {
            this.removeGameObjectFromMap(this._removeGameObjectFromMapList.pop());
         }
      }
      
      public function getGameObjctByUID(param1:uint) : IGameObject
      {
         var _loc2_:IGameObject = null;
         var _loc3_:Array = null;
         if(this.gameobjectMap == null)
         {
            this.initGameobjectMap();
         }
         for each(_loc3_ in this.gameobjectMap)
         {
            if(_loc3_[param1] != null)
            {
               _loc2_ = _loc3_[param1];
               break;
            }
         }
         return _loc2_;
      }
      
      public function getPlantListByRoadIndex(param1:Array = null, param2:Array = null) : Array
      {
         var _loc5_:BasicPlant = null;
         var _loc3_:Array = new Array();
         var _loc4_:Array = this.getGameObjectMapByCatalg(TDConstant.UnitCatalog_Plant);
         for each(_loc5_ in _loc4_)
         {
            if((param1 == null || param1.indexOf(_loc5_.plantData.roadIndex) >= 0) && (param2 == null || param2.indexOf(_loc5_.plantData.plantStaticInfo.id) >= 0))
            {
               _loc3_.push(_loc5_);
            }
         }
         return _loc3_;
      }
      
      public function getPlantByType(param1:int) : Array
      {
         var _loc4_:BasicPlant = null;
         var _loc2_:Array = new Array();
         var _loc3_:Array = this.getGameObjectMapByCatalg(TDConstant.UnitCatalog_Plant);
         for each(_loc4_ in _loc3_)
         {
            if(param1 == _loc4_.plantData.plantStaticInfo.id)
            {
               _loc2_.push(_loc4_);
            }
         }
         return _loc2_;
      }
      
      public function getPlantByTileIndex(param1:int, param2:int = -1) : Array
      {
         var _loc5_:BasicPlant = null;
         if(this.gameobjectMap == null)
         {
            this.initGameobjectMap();
         }
         var _loc3_:Array = new Array();
         var _loc4_:Array = this.getGameObjectMapByCatalg(TDConstant.UnitCatalog_Plant);
         for each(_loc5_ in _loc4_)
         {
            if(param1 == _loc5_.plantData.tileIndex)
            {
               if(param2 != -1)
               {
                  if(_loc5_.plantData.plantStaticInfo.baseInfo.usefulness == param2)
                  {
                     _loc3_.push(_loc5_);
                  }
               }
               else
               {
                  _loc3_.push(_loc5_);
               }
            }
         }
         return _loc3_;
      }
      
      public function getPlantsAllByPos(param1:int, param2:int) : Vector.<BasicPlant>
      {
         var _loc5_:BasicPlant = null;
         if(this.gameobjectMap == null)
         {
            this.initGameobjectMap();
         }
         var _loc3_:Vector.<BasicPlant> = new Vector.<BasicPlant>();
         var _loc4_:Array = this.getGameObjectMapByCatalg(TDConstant.UnitCatalog_Plant);
         for each(_loc5_ in _loc4_)
         {
            if(_loc5_.plantData.roadIndex == param1 && param2 == _loc5_.plantData.column)
            {
               _loc3_.push(_loc5_);
            }
         }
         return _loc3_;
      }
      
      public function getPlantByPos(param1:int, param2:int) : BasicPlant
      {
         var _loc4_:BasicPlant = null;
         if(this.gameobjectMap == null)
         {
            this.initGameobjectMap();
         }
         var _loc3_:Array = this.getGameObjectMapByCatalg(TDConstant.UnitCatalog_Plant);
         for each(_loc4_ in _loc3_)
         {
            if(_loc4_.plantData.roadIndex == param1 && param2 == _loc4_.plantData.column)
            {
               return _loc4_;
            }
         }
         return null;
      }
      
      public function searchTargetPlant(param1:IGameObject, param2:Array = null, param3:Boolean = false) : IGameObject
      {
         var _loc4_:IGameObject = null;
         var _loc5_:IGameObject = null;
         var _loc7_:Array = null;
         var _loc8_:Array = null;
         var _loc9_:BasicPlant = null;
         var _loc10_:TDPlantStaticInfo = null;
         var _loc11_:TDMapTileData = null;
         var _loc12_:Array = null;
         var _loc6_:Rectangle = !!param3 ? param1.damageArea : param1.attackArea;
         if(param1.objectModel.camp == TDConstant.TDCamp_Self)
         {
            _loc7_ = TDGameInfo.getInstance().getZombieList([param1.objectModel.roadIndex],TDConstant.TDCamp_Enemy);
            for each(_loc5_ in _loc7_)
            {
               if(_loc5_.objectModel.isPermitNormalAttack())
               {
                  if(TDCheckCollision.isCollision(param1,_loc6_,_loc5_,_loc5_.damageArea))
                  {
                     _loc4_ = _loc5_;
                     break;
                  }
               }
            }
         }
         else
         {
            _loc8_ = TDGameInfo.getInstance().getGameObjectMapByCatalg(TDConstant.UnitCatalog_Plant);
            for each(_loc9_ in _loc8_)
            {
               if(_loc9_.plantData.isPermitAttack())
               {
                  if(_loc9_.plantData.isAlive())
                  {
                     if(_loc9_.plantData.roadIndex == param1.objectModel.roadIndex)
                     {
                        if(_loc9_.objectModel.isPermitNormalAttack())
                        {
                           if((_loc10_ = TDDataFactory.instance.getPlantInfoByID(_loc9_.plantData.plantStaticInfo.id)).baseInfo.usefulness == TDConstant.PlantUsefulness_Container)
                           {
                              _loc11_ = this.getRoadTileByIndex(_loc9_.plantData.tileIndex);
                              if(this.hasNomalPlantInRoadTile(_loc11_))
                              {
                                 continue;
                              }
                           }
                           if(!(param2 && param2.indexOf(_loc9_.plantData.plantHeight) < 0))
                           {
                              if(TDCheckCollision.isCollision(param1,_loc6_,_loc9_,_loc9_.damageArea))
                              {
                                 if(_loc9_.plantData.getProtectedPlantUID() != -1)
                                 {
                                    _loc4_ = TDGameInfo.getInstance().getGameObjctByUID(_loc9_.plantData.getProtectedPlantUID());
                                 }
                                 else
                                 {
                                    _loc4_ = _loc9_;
                                 }
                                 if(_loc4_ != null)
                                 {
                                    break;
                                 }
                              }
                           }
                        }
                     }
                  }
               }
            }
            if(_loc4_ == null)
            {
               _loc12_ = TDGameInfo.getInstance().getZombieList([param1.objectModel.roadIndex],TDConstant.TDCamp_Self);
               for each(_loc5_ in _loc12_)
               {
                  if(_loc5_.objectModel.isPermitNormalAttack())
                  {
                     if(TDCheckCollision.isCollision(param1,_loc6_,_loc5_,_loc5_.damageArea))
                     {
                        _loc4_ = _loc5_;
                        break;
                     }
                  }
               }
            }
         }
         return _loc4_;
      }
      
      public function getZombieListByType(param1:int) : Array
      {
         var _loc4_:BasicZombie = null;
         var _loc2_:Array = new Array();
         var _loc3_:Array = this.getGameObjectMapByCatalg(TDConstant.UnitCatalog_Zombie);
         for each(_loc4_ in _loc3_)
         {
            if(_loc4_.zombieData.zombiestaticInfo.type == param1)
            {
               _loc2_.push(_loc4_);
            }
         }
         return _loc2_;
      }
      
      public function getZombieList(param1:Array = null, param2:int = 0, param3:Boolean = false, param4:Boolean = false, param5:Boolean = true, param6:Array = null, param7:Array = null) : Array
      {
         var _loc10_:BasicZombie = null;
         var _loc11_:Array = null;
         var _loc12_:TDNormalObject = null;
         var _loc8_:Array = new Array();
         if(param2 == TDConstant.TDCamp_Enemy && param5)
         {
            _loc11_ = this.getGameObjectMapByCatalg(TDConstant.UnitCatalog_Object);
            for each(_loc12_ in _loc11_)
            {
               if(_loc12_.objData.objectStaticInfo.beAttack == 1 && _loc12_.isVaild)
               {
                  if(this.caculateRoadHit(param1,_loc12_.objData.roadIndex,_loc12_.objData.objectStaticInfo.rowOffsetTop,_loc12_.objData.objectStaticInfo.rowOffsetBottom))
                  {
                     _loc8_.push(_loc12_);
                  }
               }
            }
         }
         var _loc9_:Array = this.getGameObjectMapByCatalg(TDConstant.UnitCatalog_Zombie);
         for each(_loc10_ in _loc9_)
         {
            if(_loc10_.isVaild)
            {
               if(!(!param3 && _loc10_.zombieData.isFlying))
               {
                  if(_loc10_.zombieData.isPermitAttack())
                  {
                     if(!(param4 && !_loc10_.zombieData.isAlive()))
                     {
                        if(!(param6 && param6.indexOf(_loc10_.zombieData.zombiestaticInfo.catalog) < 0))
                        {
                           if(!(param7 && param7.indexOf(_loc10_.zombieData.zombiestaticInfo.catalog) >= 0))
                           {
                              if(param2 != 0)
                              {
                                 if(_loc10_.objectModel.camp != param2)
                                 {
                                    continue;
                                 }
                              }
                              if(this.caculateRoadHit(param1,_loc10_.zombieData.roadIndex,_loc10_.zombieData.zombiestaticInfo.rowOffsetTop,_loc10_.zombieData.zombiestaticInfo.rowOffsetBottom))
                              {
                                 _loc8_.push(_loc10_);
                              }
                           }
                        }
                     }
                  }
               }
            }
         }
         if(_loc8_ != null)
         {
            _loc8_.sortOn("x",Array.NUMERIC);
         }
         return _loc8_;
      }
      
      private function caculateRoadHit(param1:Array, param2:int, param3:int, param4:int) : Boolean
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc5_:* = false;
         if(param1 && param1.length > 0)
         {
            if(param3 == 0 && param4 == 0)
            {
               _loc5_ = param1.indexOf(param2) >= 0;
            }
            else
            {
               _loc6_ = param2 - param3;
               _loc7_ = param2 + param4;
               for each(_loc8_ in param1)
               {
                  if(_loc8_ >= _loc6_ && _loc8_ <= _loc7_)
                  {
                     _loc5_ = true;
                     break;
                  }
               }
            }
         }
         else
         {
            _loc5_ = true;
         }
         return _loc5_;
      }
      
      public function removeGameoObjectFromGame(param1:IGameObject) : void
      {
         if(param1 == null)
         {
            getLogger("TD").debug("移除的gameobject为空");
            return;
         }
         param1.dispose();
      }
      
      public function initSunDuration() : void
      {
         this._cacheProductFirstPlantUID = new Array();
      }
      
      public function initChallengeAchi() : void
      {
         TDChallengeScoreManager.instance.registerListenType(TDStageInfo.getInstance().challengeAchiList);
      }
      
      public function getSunFlowerNextLaunchDuration(param1:int, param2:int) : Number
      {
         var _loc3_:Number = NaN;
         var _loc4_:*;
         if(_loc4_ = this._cacheProductFirstPlantUID.indexOf(param1) == -1)
         {
            this._cacheProductFirstPlantUID.push(param1);
            _loc3_ = DMath.randNum(300,param2 / 2);
         }
         else
         {
            _loc3_ = DMath.randNum(param2 - 150,param2);
         }
         return _loc3_;
      }
      
      public function hasTileBuildTomb(param1:int) : Boolean
      {
         var _loc2_:Array = this.getTileIDBuildTombList(param1);
         return _loc2_.length > 0;
      }
      
      public function getTileIDBuildTombList(param1:int) : Array
      {
         var _loc7_:IGameObject = null;
         var _loc8_:TDMapRoadData = null;
         var _loc9_:Array = null;
         var _loc10_:TDMapTileData = null;
         var _loc2_:int = param1 - 300;
         var _loc3_:int = param1 - 450;
         var _loc4_:Array = new Array();
         var _loc5_:Array = new Array();
         var _loc6_:Array = this.getGameObjectMapByCatalgAndType(TDConstant.UnitCatalog_Object,TDConstant.UnitType_TDTomb);
         for each(_loc7_ in _loc6_)
         {
            _loc5_.push(_loc7_.objectModel.tileIndex);
         }
         for each(_loc8_ in this.roadList)
         {
            _loc9_ = _loc8_.tileList;
            for each(_loc10_ in _loc9_)
            {
               if(_loc5_.indexOf(_loc10_.index) == -1)
               {
                  if(TDCropUtil.isPermitCropPlant(_loc10_) && !_loc10_.hasState(TDConstant.RoadTileState_Ready_Add_Tomb) && (_loc10_.rect.x + _loc10_.rect.width * 0.5 <= _loc2_ && _loc10_.rect.x + _loc10_.rect.width * 0.5 >= _loc3_))
                  {
                     _loc4_.push(_loc10_.index);
                  }
               }
            }
         }
         return _loc4_;
      }
      
      public function getZombieStartWalkPos(param1:int, param2:int = -1) : Point
      {
         var _loc3_:Point = new Point(TDGameInfo.getInstance().zombieStartPosX,0);
         var _loc4_:TDMapRoadData;
         if((_loc4_ = this.getRoadInfo(param1)) == null)
         {
            getLogger("TD").debug("添加僵尸到路" + param1 + "失败");
            return _loc3_;
         }
         _loc3_.y = _loc4_.endY - 11;
         if(param2 >= 0)
         {
            _loc3_.x = this.getZomebiePosByTile(param2,1).x;
         }
         return _loc3_;
      }
      
      public function getZomebiePosByTile(param1:int, param2:int) : Point
      {
         var _loc3_:Point = new Point();
         var _loc4_:TDMapTileData;
         if((_loc4_ = this.getRoadTileInf(param1,param2)) != null)
         {
            _loc3_.x = _loc4_.rect.x + _loc4_.rect.width * 0.5 + 10;
            _loc3_.y = _loc4_.rect.bottom - 11;
         }
         else if((_loc4_ = this.getRoadTileInf(1,param2)) != null)
         {
            _loc3_.x = _loc4_.rect.x + _loc4_.rect.width * (-param1 + 1 + 0.5) + 10;
            _loc3_.y = _loc4_.rect.bottom - 11;
         }
         return _loc3_;
      }
      
      public function getLeftToyCarInfo() : Array
      {
         var _loc2_:int = 0;
         var _loc3_:Array = null;
         var _loc4_:IGameObject = null;
         var _loc1_:Array = new Array();
         if(TDStageInfo.getInstance().toyCarType != 0)
         {
            _loc2_ = 0;
            while(_loc2_ < 5)
            {
               _loc1_[_loc2_] = 0;
               _loc2_++;
            }
            if(TDStageInfo.getInstance().toyCarType != 0)
            {
               _loc3_ = this.getGameObjectMapByCatalgAndType(TDConstant.UnitCatalog_Object,TDStageInfo.getInstance().toyCarType);
               for each(_loc4_ in _loc3_)
               {
                  if(_loc4_.getActionID() == TDConstant.LawnMowerAction_Idle)
                  {
                     _loc1_[_loc4_.objectModel.roadIndex - 1] = 1;
                  }
               }
            }
         }
         else
         {
            _loc1_ = TDStageInfo.getInstance().startParam.dailyToyCar;
         }
         return _loc1_;
      }
      
      public function isPlayZombieHitEffect(param1:int) : Boolean
      {
         var _loc7_:Array = null;
         if(this._effectRecord == null)
         {
            this._effectRecord = new Array();
         }
         var _loc2_:Number = this.getCurGameTime();
         var _loc3_:int = 0;
         var _loc4_:int = this._effectRecord.length;
         var _loc5_:Boolean = true;
         var _loc6_:Array = new Array();
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc7_ = this._effectRecord[_loc3_];
            if(_loc2_ < _loc7_[0] + 500)
            {
               _loc6_.push(_loc7_);
               if(param1 == _loc7_[1])
               {
                  _loc5_ = false;
               }
            }
            _loc3_++;
         }
         if(_loc5_)
         {
            _loc6_.push([_loc2_,param1]);
         }
         this._effectRecord = _loc6_;
         return _loc5_;
      }
      
      public function autoCollectSun(param1:Boolean) : void
      {
         this._sunAutoCollect = param1;
      }
      
      public function get sunAutoCollect() : Boolean
      {
         return this._sunAutoCollect;
      }
      
      public function openPayAlert(param1:Boolean) : void
      {
         ShortcutPayProxyCmd.setShortcutPayTip(QuickPayType.BUY_TD,!param1);
         this.shortcutProxy.setFlag(QuickPayType.BUY_TD,!param1);
      }
      
      public function get payAlertOpen() : Boolean
      {
         return !this.shortcutProxy.getFlag(QuickPayType.BUY_TD);
      }
      
      public function recordBoughtMower(param1:int) : void
      {
         if(this._mowerBoughtList[param1] == null)
         {
            this._mowerBoughtList[param1] = 1;
         }
         else
         {
            this._mowerBoughtList[param1] += 1;
         }
      }
      
      public function getMowerBoughtRecordByRoad(param1:int) : int
      {
         if(this._mowerBoughtList[param1] == null)
         {
            return 0;
         }
         return this._mowerBoughtList[param1];
      }
   }
}
