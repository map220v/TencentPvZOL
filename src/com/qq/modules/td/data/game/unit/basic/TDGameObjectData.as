package com.qq.modules.td.data.game.unit.basic
{
   import com.qq.constant.td.TDConstant;
   import com.qq.data.DataCacheManager;
   import com.qq.modules.td.data.act.ITDMapAct;
   import com.qq.modules.td.data.game.ITDStaticData;
   import com.qq.modules.td.data.game.buff.TDBuffStaticInfo;
   import com.qq.modules.td.data.game.unit.TDZombieStaticInfo;
   import com.qq.modules.td.data.map.TDMapRoadData;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.logic.buff.TDBuffInfo;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.unitFunctor.camelGroup.CamelGroup;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.PvzMathUtil;
   import com.qq.utils.data.PData;
   import com.qq.utils.db.ClientDBTableName;
   import flash.utils.Dictionary;
   import tencent.tools.group.GroupManager;
   
   public class TDGameObjectData
   {
      
      public static const SPEED_WALK:int = 0;
      
      public static const SPEED_RUN:int = 1;
      
      public static const SPEED_FLY:int = 2;
      
      public static const SPEED_BULLET:int = 3;
      
      public static const SPEED_SUNDROP:int = 4;
      
      public static const SPEED_PUSH:int = 5;
       
      
      public var curHp:PData;
      
      public var maxHp:PData;
      
      public var curDyingHp:PData;
      
      public var curArmorHp:PData;
      
      public var maxArmorHp:PData;
      
      public var armorNameList:Array;
      
      public var uid:int;
      
      public var unitCatalog:int;
      
      public var unitType:int;
      
      public var staticInfo:ITDStaticData;
      
      private var _roadIndex:int;
      
      protected var _baseSpeedList:Dictionary;
      
      protected var _speedChangeValue:Number;
      
      public var hasFuel:Boolean;
      
      public var dropCard:int;
      
      public var onDieAct:Vector.<ITDMapAct>;
      
      public var sortIndex:int;
      
      public var sortIndexOffset:int = 0;
      
      private var _param:Array;
      
      public var isVaild:Boolean;
      
      public var gameObject:IGameObject;
      
      public var camp:int;
      
      public var dirction:int;
      
      public var groupId:String;
      
      public var param:Array;
      
      private var _state:int;
      
      public var isFlying:Boolean;
      
      private var _column:int;
      
      private var _tileIndex:int = -1;
      
      public var buffList:Array;
      
      public function TDGameObjectData(param1:int, param2:int)
      {
         super();
         this.unitCatalog = param1;
         this.unitType = param2;
         this.sortIndex = 0;
         this.isVaild = true;
         this.dirction = 1;
      }
      
      public function init() : void
      {
         this.updateSortIndex();
         this.initState();
         this._param = new Array();
         this.camp = TDConstant.TDCamp_Other;
         this.curHp = new PData();
         this.maxHp = new PData();
         this.curDyingHp = new PData();
         this.curArmorHp = new PData();
         this.curArmorHp.set(0);
         this.maxArmorHp = new PData();
         this.maxArmorHp.set(0);
         this.initBuff();
      }
      
      protected function initSpeed() : void
      {
         this._baseSpeedList = new Dictionary();
         this._speedChangeValue = 0;
      }
      
      public function getSpeed(param1:int) : Number
      {
         return this._baseSpeedList[param1] + this._speedChangeValue;
      }
      
      public function set speedChangeValue(param1:Number) : void
      {
         this._speedChangeValue = param1;
      }
      
      public function get speedChangeValue() : Number
      {
         return this._speedChangeValue;
      }
      
      public function updateSortIndex() : void
      {
         this.sortIndex = this.getSortValue() + this.sortIndexOffset;
      }
      
      protected function getSortValue() : int
      {
         return 0;
      }
      
      public function setParamValue(param1:int, param2:int) : void
      {
         this._param[param1] = param2;
      }
      
      public function getParamValue(param1:int) : int
      {
         if(this._param[param1] == null)
         {
            return 0;
         }
         return int(this._param[param1]);
      }
      
      public function get roadIndex() : int
      {
         return this._roadIndex;
      }
      
      public function set roadIndex(param1:int) : void
      {
         this._roadIndex = param1;
      }
      
      public function get column() : int
      {
         return this._column;
      }
      
      public function loadTileData(param1:TDMapTileData) : void
      {
         this._roadIndex = param1.roadIndex;
         this._tileIndex = param1.index;
         this._column = param1.roadCol;
         this.updateSortIndex();
      }
      
      public function loadRoadData(param1:TDMapRoadData) : void
      {
         this._roadIndex = param1.index;
         this.updateSortIndex();
      }
      
      public function get tileIndex() : int
      {
         return this._tileIndex;
      }
      
      public function isAlive() : Boolean
      {
         return this.isVaild;
      }
      
      public function dispose() : void
      {
         this.cleanBuff();
         this.gameObject = null;
      }
      
      private function initBuff() : void
      {
         var _loc2_:IGameObject = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         this.buffList = new Array();
         var _loc1_:Array = this.staticInfo.initBuffList;
         if(_loc1_ != null)
         {
            _loc2_ = TDGameInfo.getInstance().getGameObjctByUID(this.uid);
            _loc3_ = 0;
            while(_loc3_ < _loc1_.length)
            {
               _loc4_ = _loc1_[_loc3_];
               this.addBuff(_loc4_,_loc2_);
               _loc3_++;
            }
         }
      }
      
      public function cleanBuff() : void
      {
         var _loc1_:TDBuffInfo = null;
         for each(_loc1_ in this.buffList)
         {
            _loc1_.dispose();
         }
         this.buffList = new Array();
      }
      
      public function addBuff(param1:int, param2:IGameObject) : void
      {
         var _loc3_:TDBuffInfo = null;
         var _loc4_:IGameObject = null;
         var _loc5_:TDZombieStaticInfo = null;
         var _loc6_:CamelGroup = null;
         var _loc7_:TDBuffInfo = null;
         if(!this.hasSameTypeBuff(param1))
         {
            _loc3_ = new TDBuffInfo();
            _loc3_.init(param1,this.gameObject,param2);
            if(_loc3_.buffStaticInfo == null)
            {
               return;
            }
            switch(this.unitCatalog)
            {
               case TDConstant.UnitCatalog_Zombie:
                  if((_loc5_ = this.staticInfo as TDZombieStaticInfo) == null)
                  {
                     break;
                  }
                  if(PvzMathUtil.checkBitPosition(_loc3_.buffStaticInfo.invalidZombieCatalog,_loc5_.catalog))
                  {
                     return;
                  }
                  if((_loc4_ = TDGameInfo.getInstance().getGameObjctByUID(this.uid)) && _loc4_.getActionID() == TDConstant.ZAction_Wolf_Knight_Swoop)
                  {
                     return;
                  }
                  this.buffList.push(_loc3_);
                  _loc3_.onAddedBuffEffect();
                  if(this.groupId && this.groupId != "")
                  {
                     (_loc6_ = GroupManager.getInstance().getGroupFromID(this.groupId) as CamelGroup).addBuff(param1);
                  }
                  addr74:
            }
            §§goto(addr74);
         }
         else if((_loc7_ = this.getBuffByID(param1)) != null)
         {
            _loc7_.resetEndTime(param2);
         }
         else if((_loc7_ = this.getHasSameTypeBuff(param1)) != null)
         {
            if(_loc7_.buffStaticInfo.id < param1)
            {
               this.removeBuff(_loc7_.buffStaticInfo.id);
               this.addBuff(param1,param2);
            }
         }
      }
      
      public function getBuffByID(param1:int) : TDBuffInfo
      {
         var _loc3_:TDBuffInfo = null;
         var _loc2_:TDBuffStaticInfo = DataCacheManager.getInstance().getTemplateDataById(ClientDBTableName.Table_TDBuffInfo,param1,TDBuffStaticInfo);
         if(_loc2_ == null)
         {
            return null;
         }
         for each(_loc3_ in this.buffList)
         {
            if(_loc3_.buffStaticInfo.id == _loc2_.id)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public function getHasSameTypeBuff(param1:int) : TDBuffInfo
      {
         var _loc3_:TDBuffInfo = null;
         var _loc2_:TDBuffStaticInfo = DataCacheManager.getInstance().getTemplateDataById(ClientDBTableName.Table_TDBuffInfo,param1,TDBuffStaticInfo);
         if(_loc2_ == null)
         {
            return null;
         }
         for each(_loc3_ in this.buffList)
         {
            if(_loc3_.buffStaticInfo.catalog == _loc2_.catalog)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public function hasBuff(param1:int) : Boolean
      {
         var _loc2_:TDBuffInfo = null;
         for each(_loc2_ in this.buffList)
         {
            if(_loc2_.buffStaticInfo.id == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      public function hasSameTypeBuff(param1:int) : Boolean
      {
         var _loc2_:TDBuffStaticInfo = DataCacheManager.getInstance().getTemplateDataById(ClientDBTableName.Table_TDBuffInfo,param1,TDBuffStaticInfo);
         if(_loc2_ == null)
         {
            return false;
         }
         return this.hasBuffByType(_loc2_.catalog);
      }
      
      public function hasBuffByType(param1:int) : Boolean
      {
         var _loc2_:TDBuffInfo = null;
         for each(_loc2_ in this.buffList)
         {
            if(_loc2_.buffStaticInfo.catalog == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      public function removeBuff(param1:int, param2:Boolean = false) : void
      {
         var _loc4_:TDBuffInfo = null;
         var _loc5_:CamelGroup = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.buffList.length)
         {
            if((_loc4_ = this.buffList[_loc3_]).buffStaticInfo.id == param1)
            {
               if(param2 && this.groupId && this.groupId != "")
               {
                  (_loc5_ = GroupManager.getInstance().getGroupFromID(this.groupId) as CamelGroup).removeBuff(param1);
               }
               this.buffList.splice(_loc3_,1);
               _loc4_.dispose();
               return;
            }
            _loc3_++;
         }
      }
      
      public function removeBuffByType(param1:int, param2:Boolean = false) : void
      {
         var _loc4_:TDBuffInfo = null;
         var _loc5_:CamelGroup = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.buffList.length)
         {
            if((_loc4_ = this.buffList[_loc3_]).buffStaticInfo.catalog == param1)
            {
               if(param2 && this.groupId && this.groupId != "")
               {
                  (_loc5_ = GroupManager.getInstance().getGroupFromID(this.groupId) as CamelGroup).removeBuff(_loc4_.buffStaticInfo.id);
               }
               this.buffList.splice(_loc3_,1);
               _loc3_--;
               _loc4_.dispose();
            }
            _loc3_++;
         }
      }
      
      public function removeBuffByElementType(param1:int, param2:Boolean = false) : void
      {
         var _loc4_:TDBuffInfo = null;
         var _loc5_:CamelGroup = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.buffList.length)
         {
            if((_loc4_ = this.buffList[_loc3_]).buffStaticInfo.elementType == param1)
            {
               if(param2 && this.groupId && this.groupId != "")
               {
                  (_loc5_ = GroupManager.getInstance().getGroupFromID(this.groupId) as CamelGroup).removeBuff(_loc4_.buffStaticInfo.id);
               }
               this.buffList.splice(_loc3_,1);
               _loc3_--;
               _loc4_.dispose();
            }
            _loc3_++;
         }
      }
      
      public function runBuffEffect() : void
      {
         var _loc1_:Array = null;
         var _loc2_:TDBuffInfo = null;
         if(this.buffList.length > 0)
         {
            _loc1_ = this.buffList.concat();
            for each(_loc2_ in _loc1_)
            {
               _loc2_.update();
            }
         }
      }
      
      public function isPermitNormalAttack() : Boolean
      {
         if(this.checkState(TDConstant.TDUnitState_God))
         {
            return false;
         }
         return true;
      }
      
      public function isPermitAttack() : Boolean
      {
         if(this.checkState(TDConstant.TDUnitState_God))
         {
            return false;
         }
         return true;
      }
      
      public function isPermitMove() : Boolean
      {
         if(this.checkState(TDConstant.TDUnitState_Frozen))
         {
            return false;
         }
         return true;
      }
      
      public function initState() : void
      {
         this._state = 0;
      }
      
      public function setState(param1:uint) : void
      {
         this._state |= param1;
      }
      
      public function checkState(param1:uint) : Boolean
      {
         return param1 == (this._state & param1);
      }
      
      public function cleanState(param1:uint) : void
      {
         var _loc2_:* = 0;
         if(this.checkState(param1))
         {
            _loc2_ = this._state ^ param1;
            this._state = _loc2_;
         }
      }
   }
}
