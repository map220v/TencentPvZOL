package com.qq.modules.dummy.model
{
   import com.qq.data.DataCacheManager;
   import com.qq.modules.dummy.DummyConst;
   import com.qq.modules.dummy.model.templates.ce.DummyBuffEffectInfoCE;
   import com.qq.modules.dummy.model.templates.ce.DummyBuyFubenEnemgyTemplateCE;
   import com.qq.modules.dummy.model.templates.ce.DummyBuySkillPointTemplateCE;
   import com.qq.modules.dummy.model.templates.ce.DummyLevelTemplateCE;
   import com.qq.modules.dummy.model.templates.ce.DummyPropTemplateCE;
   import com.qq.modules.dummy.model.templates.ce.DummyZombieStarTemplateCE;
   import com.qq.utils.db.ClientDBTableName;
   
   public class DummyDataFactory
   {
      
      private static var _instance:DummyDataFactory;
       
      
      private var _dummyZombieMap:Array;
      
      private var _dummyZmmbieList:Array;
      
      private var _dummyZombieQuiltyMap:Array;
      
      private var _skillMap:Array;
      
      private var _buffMap:Array;
      
      private var _propMap:Array;
      
      private var _levelMap:Array;
      
      private var _maxDummyLv:int;
      
      private var _equipmentMap:Array;
      
      private var _equipmentLevelMap:Array;
      
      private var _equipmentQuiltyMap:Array;
      
      private var _equipmetnMaxQuilty:int;
      
      private var _dummyStarInfoMap:Array;
      
      private var _dummyMaxStar:int;
      
      private var _buffEffectMap:Array;
      
      private var _fubenChapterList:Array;
      
      private var _fubenStageMap:Array;
      
      private var _fubenLevelInfoMap:Array;
      
      private var _fubenStageList:Array;
      
      private var _totalChapter:int;
      
      private var _maxZombieQuilty:int;
      
      private var _skillUpdateList:Array;
      
      private var _skillActiveList:Array;
      
      private var _exchangeNeedItemID:int;
      
      private var _combieInfoList:Array;
      
      private var _combieNeedLevelInfoList:Array;
      
      private var _combieNeedStarInfoList:Array;
      
      private var _total:int;
      
      private var _cacheCompositeDummyNum:int = -1;
      
      private var _dummyCallMap:Array;
      
      private var _dummySkillPointPriceMap:Array;
      
      private var _dummyBuyFubenEnemgyMap:Array;
      
      public function DummyDataFactory()
      {
         super();
      }
      
      public static function getInstance() : DummyDataFactory
      {
         if(_instance == null)
         {
            _instance = new DummyDataFactory();
         }
         return _instance;
      }
      
      private function initDummyZombieData() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:DummyZombieTemplate = null;
         if(this._dummyZombieMap == null)
         {
            this._dummyZombieMap = new Array();
            this._dummyZmmbieList = DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_DUMMY_ZOMBIE_INFO,DummyZombieTemplate);
            this._total = this._dummyZmmbieList.length;
            _loc1_ = this._dummyZmmbieList.length;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               _loc3_ = this._dummyZmmbieList[_loc2_];
               this._dummyZombieMap[_loc3_.id] = _loc3_;
               _loc2_++;
            }
         }
      }
      
      private function initDummyZombieQuiltyData() : void
      {
         var _loc1_:Array = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:DummyZombieQuiltyTemplate = null;
         var _loc5_:Array = null;
         if(this._dummyZombieQuiltyMap == null)
         {
            this._dummyZombieQuiltyMap = new Array();
            this._maxZombieQuilty = 0;
            _loc1_ = DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_DUMMY_ZOMBIE_QUILTY_INFO,DummyZombieQuiltyTemplate);
            _loc2_ = _loc1_.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc4_ = _loc1_[_loc3_];
               this._dummyZombieQuiltyMap[_loc4_.id] = _loc4_;
               if(this._exchangeNeedItemID == 0)
               {
                  _loc5_ = _loc4_.exchangeNeedItemStr.split(":");
                  this._exchangeNeedItemID = _loc5_[0];
               }
               if(_loc4_.id > this._maxZombieQuilty)
               {
                  this._maxZombieQuilty = _loc4_.id;
               }
               _loc3_++;
            }
         }
      }
      
      private function initSkillData() : void
      {
         var _loc1_:Array = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:DummyZombieSkillTemplate = null;
         if(this._skillMap == null)
         {
            this._skillMap = new Array();
            _loc1_ = DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_DUMMY_SKILL_INFO,DummyZombieSkillTemplate);
            _loc2_ = _loc1_.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc4_ = _loc1_[_loc3_];
               this._skillMap[_loc4_.id] = _loc4_;
               _loc3_++;
            }
         }
      }
      
      private function initBuffData() : void
      {
         var _loc1_:Array = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:DummyBuffTemplate = null;
         if(this._buffMap == null)
         {
            this._buffMap = new Array();
            _loc1_ = DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_DUMMY_BUFF_INFO,DummyBuffTemplate);
            _loc2_ = _loc1_.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc4_ = _loc1_[_loc3_];
               this._buffMap[_loc4_.id] = _loc4_;
               _loc3_++;
            }
         }
      }
      
      private function initPropData() : void
      {
         var _loc1_:Array = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:DummyPropTemplateCE = null;
         if(this._propMap == null)
         {
            this._propMap = new Array();
            _loc1_ = DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_DUMMY_PROP_INFO,DummyPropTemplateCE);
            _loc2_ = _loc1_.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc4_ = _loc1_[_loc3_];
               this._propMap[_loc4_.id] = _loc4_;
               _loc3_++;
            }
         }
      }
      
      private function initLevelData() : void
      {
         var _loc1_:Array = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:DummyLevelTemplateCE = null;
         if(this._levelMap == null)
         {
            this._levelMap = new Array();
            this._maxDummyLv = 0;
            _loc1_ = DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_DUMMY_LEVEL_INFO,DummyLevelTemplateCE);
            _loc2_ = _loc1_.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               if((_loc4_ = _loc1_[_loc3_]).id > this._maxDummyLv)
               {
                  this._maxDummyLv = _loc4_.id;
               }
               this._levelMap[_loc4_.id] = _loc4_;
               _loc3_++;
            }
         }
      }
      
      private function initEquipmentData() : void
      {
         var _loc1_:Array = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:DummyEquipmentTemplate = null;
         var _loc5_:int = 0;
         if(this._equipmentMap == null)
         {
            this._equipmentMap = new Array();
            _loc1_ = DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_EQUIPMENT_INFO,DummyEquipmentTemplate);
            _loc2_ = _loc1_.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc5_ = (_loc4_ = _loc1_[_loc3_]).type * 100 + _loc4_.quilty;
               this._equipmentMap[_loc5_] = _loc4_;
               _loc3_++;
            }
         }
      }
      
      private function initEquipmentLevelData() : void
      {
         var _loc1_:Array = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:DummyEquipmentLevelTemplate = null;
         if(this._equipmentLevelMap == null)
         {
            this._equipmentLevelMap = new Array();
            _loc1_ = DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_EQUIPMENT_LEVEL_INFO,DummyEquipmentLevelTemplate);
            _loc2_ = _loc1_.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc4_ = _loc1_[_loc3_];
               this._equipmentLevelMap[_loc4_.id] = _loc4_;
               _loc3_++;
            }
         }
      }
      
      private function initEquipmentQuiltyData() : void
      {
         var _loc1_:Array = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:DummyEquipmentQuiltyTemplate = null;
         if(this._equipmentQuiltyMap == null)
         {
            this._equipmetnMaxQuilty = -1;
            this._equipmentQuiltyMap = new Array();
            _loc1_ = DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_EQUIPMENT_QUILTY_INFO,DummyEquipmentQuiltyTemplate);
            _loc2_ = _loc1_.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc4_ = _loc1_[_loc3_];
               this._equipmentQuiltyMap[_loc4_.id] = _loc4_;
               if(_loc4_.id > this._equipmetnMaxQuilty)
               {
                  this._equipmetnMaxQuilty = _loc4_.id;
               }
               _loc3_++;
            }
         }
      }
      
      private function initDummyStarData() : void
      {
         var _loc1_:Array = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:DummyZombieStarTemplateCE = null;
         if(this._dummyStarInfoMap == null)
         {
            this._dummyMaxStar = -1;
            this._dummyStarInfoMap = new Array();
            _loc1_ = DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_DUMMY_STAR_INFO,DummyZombieStarTemplateCE);
            _loc2_ = _loc1_.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc4_ = _loc1_[_loc3_];
               this._dummyStarInfoMap[_loc4_.id] = _loc4_;
               if(_loc4_.id > this._dummyMaxStar)
               {
                  this._dummyMaxStar = _loc4_.id;
               }
               _loc3_++;
            }
         }
      }
      
      private function initDummyBuffEffectData() : void
      {
         var _loc1_:Array = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:DummyBuffEffectInfoCE = null;
         if(this._buffEffectMap == null)
         {
            this._buffEffectMap = new Array();
            _loc1_ = DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_DUMMY_BUFF_EFFECT_INFO,DummyBuffEffectInfoCE);
            _loc2_ = _loc1_.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc4_ = _loc1_[_loc3_];
               this._buffEffectMap[_loc4_.id] = _loc4_;
               _loc3_++;
            }
         }
      }
      
      private function initFubenStageInfo() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:DummyFubenStageTemplate = null;
         if(this._fubenStageMap == null)
         {
            this._fubenStageMap = new Array();
            this._fubenChapterList = new Array();
            this._fubenStageList = DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_DUMMY_FUBEN_STAGE_INFO,DummyFubenStageTemplate);
            _loc1_ = this._fubenStageList.length;
            _loc2_ = 0;
            while(_loc2_ < _loc1_)
            {
               _loc3_ = this._fubenStageList[_loc2_];
               if(_loc3_.stageID == 6 && _loc3_.mode == DummyConst.Fuben_Mode_Normal)
               {
                  this._fubenChapterList.push(_loc3_);
                  ++this._totalChapter;
               }
               this._fubenStageMap[_loc3_.id] = _loc3_;
               _loc2_++;
            }
         }
      }
      
      private function initFubenLevelInfo() : void
      {
         var _loc1_:Array = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:DummyFubenLevelTemplate = null;
         if(this._fubenLevelInfoMap == null)
         {
            this._fubenLevelInfoMap = new Array();
            _loc1_ = DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_DUMMY_FUBEN_LEVEL_INFO,DummyFubenLevelTemplate);
            _loc2_ = _loc1_.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc4_ = _loc1_[_loc3_];
               this._fubenLevelInfoMap[_loc4_.id] = _loc4_;
               _loc3_++;
            }
         }
      }
      
      private function initSkillUpdateInfo() : void
      {
         var _loc1_:Array = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:DummySkillUpdateTemplate = null;
         if(this._skillUpdateList == null)
         {
            this._skillUpdateList = new Array();
            _loc1_ = DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_DUMMY_ZOMBIE_SKILL_NEED_ITEM,DummySkillUpdateTemplate);
            _loc2_ = _loc1_.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc4_ = _loc1_[_loc3_];
               this._skillUpdateList[_loc4_.rarity + "-" + _loc4_.id] = _loc4_;
               _loc3_++;
            }
         }
      }
      
      private function initSkillActiveInfo() : void
      {
         var _loc1_:Array = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:DummyActiveSkillInfoTemplate = null;
         if(this._skillActiveList == null)
         {
            this._skillActiveList = new Array();
            _loc1_ = DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_DUMMY_ACTIVE_SKILL_INFO,DummyActiveSkillInfoTemplate);
            _loc2_ = _loc1_.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc4_ = _loc1_[_loc3_];
               this._skillActiveList[_loc4_.id] = _loc4_;
               _loc3_++;
            }
         }
      }
      
      public function getSkillActiveInfoByActiveID(param1:int) : DummyActiveSkillInfoTemplate
      {
         this.initSkillActiveInfo();
         return this._skillActiveList[param1];
      }
      
      public function getSkillActiveInfoBySkillID(param1:int) : DummyActiveSkillInfoTemplate
      {
         var _loc2_:DummyZombieSkillTemplate = this.getParentSkillInfoBySkillID(param1);
         if(_loc2_ == null)
         {
            return null;
         }
         return this.getSkillActiveInfoByActiveID(_loc2_.activeSkillInfoID);
      }
      
      public function getFubenStageList() : Array
      {
         this.initFubenStageInfo();
         return this._fubenStageList;
      }
      
      public function getFubenStageTemplateByChapterAndMode(param1:int, param2:int, param3:int) : DummyFubenStageTemplate
      {
         var _loc4_:int = this.getFubenStageID(param1,param2,param3);
         return this.getFubenStageTemplateByID(_loc4_);
      }
      
      public function getFubenStageID(param1:int, param2:int, param3:int) : int
      {
         return int(param3 * 1000 + param1 * 10 + param2);
      }
      
      public function getFubenStageTemplateByID(param1:int) : DummyFubenStageTemplate
      {
         this.initFubenStageInfo();
         return this._fubenStageMap[param1];
      }
      
      public function getFubenChapterList() : Array
      {
         this.initFubenStageInfo();
         return this._fubenChapterList;
      }
      
      public function getTotalFubenChaperNum() : int
      {
         this.initFubenStageInfo();
         return this._totalChapter;
      }
      
      public function get totalZombie() : int
      {
         this.initDummyZombieData();
         return this._total;
      }
      
      public function getDummyZombieInfoByID(param1:int) : DummyZombieTemplate
      {
         this.initDummyZombieData();
         return this._dummyZombieMap[param1];
      }
      
      public function getDummyZombieInfoByIndex(param1:int) : DummyZombieTemplate
      {
         this.initDummyZombieData();
         if(param1 < this._total)
         {
            return this._dummyZmmbieList[param1];
         }
         return null;
      }
      
      public function getCompositeDummyZombieList() : Array
      {
         var _loc4_:DummyZombieTemplate = null;
         this.initDummyZombieData();
         var _loc1_:Array = new Array();
         var _loc2_:int = this._dummyZmmbieList.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if((_loc4_ = this._dummyZmmbieList[_loc3_]) != null && _loc4_.isShow)
            {
               _loc1_.push(_loc4_);
            }
            _loc3_++;
         }
         return _loc1_;
      }
      
      public function getCompoisteDummyNum() : int
      {
         var _loc1_:Array = null;
         if(this._cacheCompositeDummyNum == -1)
         {
            _loc1_ = this.getCompositeDummyZombieList();
            this._cacheCompositeDummyNum = _loc1_.length;
         }
         return this._cacheCompositeDummyNum;
      }
      
      public function getSkillInfoByID(param1:int) : DummyZombieSkillTemplate
      {
         this.initSkillData();
         return this._skillMap[param1];
      }
      
      public function getSkillInfoListByBaseSkillID(param1:int) : Array
      {
         var _loc3_:DummyZombieSkillTemplate = null;
         this.initSkillData();
         var _loc2_:Array = new Array();
         for each(_loc3_ in this._skillMap)
         {
            if(_loc3_.baseSkillID == param1)
            {
               _loc2_.push(_loc3_);
            }
         }
         return _loc2_;
      }
      
      public function getParentSkillInfoBySkillID(param1:int) : DummyZombieSkillTemplate
      {
         var _loc2_:DummyZombieSkillTemplate = this.getSkillInfoByID(param1);
         if(_loc2_ == null)
         {
            return null;
         }
         if(_loc2_.id == _loc2_.baseSkillID + 1)
         {
            return null;
         }
         return this.getSkillInfoByID(_loc2_.id - 1);
      }
      
      public function getBuffInfoByID(param1:int) : DummyBuffTemplate
      {
         this.initBuffData();
         return this._buffMap[param1];
      }
      
      public function getPropInfoByID(param1:int, param2:int, param3:int) : DummyPropTemplateCE
      {
         this.initPropData();
         var _loc4_:int = param1 * 100000 + param2 * 1000 + param3;
         return this._propMap[_loc4_];
      }
      
      public function getLevelInfoByLevel(param1:int) : DummyLevelTemplateCE
      {
         this.initLevelData();
         return this._levelMap[param1];
      }
      
      public function getZombieMaxLvByRoleLv(param1:int) : int
      {
         var _loc3_:DummyLevelTemplateCE = null;
         this.initLevelData();
         var _loc2_:int = 0;
         for each(_loc3_ in this._levelMap)
         {
            if(_loc3_.needRoleLevel > param1)
            {
               break;
            }
            _loc2_ = _loc3_.id;
         }
         return _loc2_;
      }
      
      public function getZombieMaxLv() : int
      {
         this.initLevelData();
         return this._maxDummyLv;
      }
      
      public function getEquipmentInfoBy(param1:int, param2:int) : DummyEquipmentTemplate
      {
         this.initEquipmentData();
         var _loc3_:int = param1 * 100 + param2;
         return this._equipmentMap[_loc3_];
      }
      
      public function getEquipmentLevelInfoByLV(param1:int) : DummyEquipmentLevelTemplate
      {
         this.initEquipmentLevelData();
         return this._equipmentLevelMap[param1];
      }
      
      public function getEquipmentQuiltyInfoByQuiltyID(param1:int) : DummyEquipmentQuiltyTemplate
      {
         this.initEquipmentQuiltyData();
         return this._equipmentQuiltyMap[param1];
      }
      
      public function getEquipmentMaxQuilty() : int
      {
         this.initEquipmentQuiltyData();
         return this._equipmetnMaxQuilty;
      }
      
      public function getDummyStarPercentBuffByID(param1:int) : Number
      {
         this.initDummyStarData();
         var _loc2_:DummyZombieStarTemplateCE = this._dummyStarInfoMap[param1];
         if(_loc2_ == null)
         {
            return 1;
         }
         return _loc2_.percentBuff * 0.0001;
      }
      
      public function getDummyStarUpPieceNumByStar(param1:int) : Number
      {
         this.initDummyStarData();
         var _loc2_:DummyZombieStarTemplateCE = this._dummyStarInfoMap[param1];
         if(_loc2_ == null)
         {
            return 0;
         }
         return _loc2_.needPieces;
      }
      
      public function getMaxDummyZombieStar() : int
      {
         this.initDummyStarData();
         return this._dummyMaxStar;
      }
      
      public function getBuffEffectInfoByID(param1:int) : DummyBuffEffectInfoCE
      {
         this.initDummyBuffEffectData();
         return this._buffEffectMap[param1];
      }
      
      public function getZombieQuiltyInfoByID(param1:int) : DummyZombieQuiltyTemplate
      {
         this.initDummyZombieQuiltyData();
         return this._dummyZombieQuiltyMap[param1];
      }
      
      public function getSkillUpdateTemplateByLv(param1:int, param2:int) : DummySkillUpdateTemplate
      {
         this.initSkillUpdateInfo();
         return this._skillUpdateList[param2 + "-" + param1];
      }
      
      public function getSkillMaxLevel(param1:int) : int
      {
         var _loc2_:DummyZombieSkillTemplate = this.getSkillInfoByID(param1);
         if(_loc2_ == null)
         {
            return 0;
         }
         var _loc3_:DummyActiveSkillInfoTemplate = this.getSkillActiveInfoByActiveID(_loc2_.activeSkillInfoID);
         if(_loc3_ == null)
         {
            return 0;
         }
         return _loc3_.maxSkill;
      }
      
      public function getFubenLevelTemplateByID(param1:int) : DummyFubenLevelTemplate
      {
         this.initFubenLevelInfo();
         return this._fubenLevelInfoMap[param1];
      }
      
      public function getLevelNum() : int
      {
         return 5;
      }
      
      public function getFubenLevelInfoListByChaperAndStage(param1:int, param2:int, param3:int) : Array
      {
         var _loc7_:DummyFubenLevelTemplate = null;
         this.initFubenLevelInfo();
         var _loc4_:Array = new Array();
         var _loc5_:int = this.getLevelNum();
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            if((_loc7_ = this.getFubenLevelTemplate(param1,param2,param3,_loc6_ + 1)) != null)
            {
               _loc4_.push(_loc7_);
            }
            _loc6_++;
         }
         return _loc4_;
      }
      
      public function getLevelID(param1:int, param2:int, param3:int, param4:int) : int
      {
         return int(param2 * 100000 + param1 * 100 + param3 * 10 + param4);
      }
      
      public function getFubenLevelTemplate(param1:int, param2:int, param3:int, param4:int) : DummyFubenLevelTemplate
      {
         var _loc5_:int = this.getLevelID(param1,param2,param3,param4);
         return this.getFubenLevelTemplateByID(_loc5_);
      }
      
      private function initDummyCallInfo() : void
      {
         var _loc1_:Array = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:DummyZombieCallTemplate = null;
         if(this._dummyCallMap == null)
         {
            this._dummyCallMap = new Array();
            _loc1_ = DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_DUMMY_ZOMBIE_CALL_INFO,DummyZombieCallTemplate);
            _loc2_ = _loc1_.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc4_ = _loc1_[_loc3_];
               this._dummyCallMap[_loc4_.id] = _loc4_;
               _loc3_++;
            }
         }
      }
      
      public function getDummyCallTemplate(param1:int) : DummyZombieCallTemplate
      {
         this.initDummyCallInfo();
         return this._dummyCallMap[param1];
      }
      
      public function initBuySkillPointData() : void
      {
         var _loc1_:Array = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:DummyBuySkillPointTemplateCE = null;
         if(this._dummySkillPointPriceMap == null)
         {
            this._dummySkillPointPriceMap = new Array();
            _loc1_ = DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_DUMMY_BUY_SKILL_POINT_INFO,DummyBuySkillPointTemplateCE);
            _loc2_ = _loc1_.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc4_ = _loc1_[_loc3_];
               this._dummySkillPointPriceMap[_loc4_.id] = _loc4_;
               _loc3_++;
            }
         }
      }
      
      public function getBuySkillPointTemplate(param1:int) : DummyBuySkillPointTemplateCE
      {
         this.initBuySkillPointData();
         return this._dummySkillPointPriceMap[param1];
      }
      
      public function initBuyFubenEnemgyData() : void
      {
         var _loc1_:Array = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:DummyBuyFubenEnemgyTemplateCE = null;
         if(this._dummyBuyFubenEnemgyMap == null)
         {
            this._dummyBuyFubenEnemgyMap = new Array();
            _loc1_ = DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_DUMMY_BUY_FUBEN_EMENGY_INFO,DummyBuyFubenEnemgyTemplateCE);
            _loc2_ = _loc1_.length;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc4_ = _loc1_[_loc3_];
               this._dummyBuyFubenEnemgyMap[_loc4_.id] = _loc4_;
               _loc3_++;
            }
         }
      }
      
      public function getBuyFubenEnemgyTemplate(param1:int) : DummyBuyFubenEnemgyTemplateCE
      {
         this.initBuyFubenEnemgyData();
         return this._dummyBuyFubenEnemgyMap[param1];
      }
      
      public function getDummyExchangeNeedNum(param1:int) : int
      {
         var _loc2_:DummyZombieQuiltyTemplate = this.getZombieQuiltyInfoByID(param1);
         if(_loc2_ != null)
         {
            return _loc2_.getExchangeNeedItemNum();
         }
         return 0;
      }
      
      public function getEquipmentExchangeNeedNum(param1:int) : int
      {
         var _loc2_:DummyEquipmentQuiltyTemplate = this.getEquipmentQuiltyInfoByQuiltyID(param1);
         if(_loc2_ != null)
         {
            return _loc2_.getExchangeNeedItemNum();
         }
         return 0;
      }
      
      public function getExchangeNeedItemID() : int
      {
         this.initDummyZombieQuiltyData();
         return this._exchangeNeedItemID;
      }
      
      private function initCombineInfoList() : void
      {
         if(this._combieInfoList == null)
         {
            this._combieInfoList = DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_DUMMY_COMBIE_INFO,DummyCombineTemplate);
         }
      }
      
      public function getTotalCombine() : int
      {
         this.initCombineInfoList();
         return this._combieInfoList.length;
      }
      
      public function getCombineInfoList() : Array
      {
         this.initCombineInfoList();
         return this._combieInfoList;
      }
      
      public function getCombineInfoByID(param1:int) : DummyCombineTemplate
      {
         var _loc4_:DummyCombineTemplate = null;
         this.initCombineInfoList();
         var _loc2_:int = this._combieInfoList.length;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            if((_loc4_ = this._combieInfoList[_loc3_]).id == param1)
            {
               return _loc4_;
            }
            _loc3_++;
         }
         return null;
      }
      
      public function getCombineInfoByIndex(param1:int) : DummyCombineTemplate
      {
         this.initCombineInfoList();
         return this._combieInfoList[param1];
      }
      
      public function getCombineStarByID(param1:int, param2:int) : DummyCombineNeedStarTemplate
      {
         var _loc6_:DummyCombineNeedStarTemplate = null;
         var _loc3_:Array = this._combieNeedStarInfoList[param1];
         var _loc4_:int = _loc3_.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            if((_loc6_ = _loc3_[_loc5_]).id == param2)
            {
               return _loc6_;
            }
            _loc5_++;
         }
         return null;
      }
      
      public function getCombineStarTemplateList(param1:int) : Array
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:DummyCombineNeedStarTemplate = null;
         var _loc6_:Array = null;
         if(this._combieNeedStarInfoList == null)
         {
            this._combieNeedStarInfoList = new Array();
            _loc2_ = DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_DUMMY_COMBIE_NEED_STAR_INFO,DummyCombineNeedStarTemplate);
            _loc3_ = _loc2_.length;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc5_ = _loc2_[_loc4_];
               if((_loc6_ = this._combieNeedStarInfoList[_loc5_.combineID]) == null)
               {
                  _loc6_ = new Array();
                  this._combieNeedStarInfoList[_loc5_.combineID] = _loc6_;
               }
               _loc6_.push(_loc5_);
               _loc4_++;
            }
         }
         return this._combieNeedStarInfoList[param1];
      }
      
      public function getCombineLevelByID(param1:int, param2:int) : DummyCombineNeedLevelTemplate
      {
         var _loc6_:DummyCombineNeedLevelTemplate = null;
         var _loc3_:Array = this._combieNeedLevelInfoList[param1];
         var _loc4_:int = _loc3_.length;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            if((_loc6_ = _loc3_[_loc5_]).id == param2)
            {
               return _loc6_;
            }
            _loc5_++;
         }
         return null;
      }
      
      public function getCombineLevelTemplateList(param1:int) : Array
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:DummyCombineNeedLevelTemplate = null;
         var _loc6_:Array = null;
         if(this._combieNeedLevelInfoList == null)
         {
            this._combieNeedLevelInfoList = new Array();
            _loc2_ = DataCacheManager.getInstance().getTemplateCacheData(ClientDBTableName.TABLE_DUMMY_COMBIE_NEED_LEVEL_INFO,DummyCombineNeedLevelTemplate);
            _loc3_ = _loc2_.length;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc5_ = _loc2_[_loc4_];
               if((_loc6_ = this._combieNeedLevelInfoList[_loc5_.combineID]) == null)
               {
                  _loc6_ = new Array();
                  this._combieNeedLevelInfoList[_loc5_.combineID] = _loc6_;
               }
               _loc6_.push(_loc5_);
               _loc4_++;
            }
         }
         return this._combieNeedLevelInfoList[param1];
      }
   }
}
