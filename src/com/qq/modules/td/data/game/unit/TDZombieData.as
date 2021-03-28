package com.qq.modules.td.data.game.unit
{
   import com.qq.GameGloble;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.dailyTD.model.DailyTdData;
   import com.qq.modules.endlessTD.model.EndlessTDData;
   import com.qq.modules.endlessTD.model.templates.EndlessTemplateFactory;
   import com.qq.modules.levelselect.model.templates.LSLevelTemplate;
   import com.qq.modules.levelselect.model.templates.LSLevelTemplateFactory;
   import com.qq.modules.main.model.vo.BattleCardFormationVO;
   import com.qq.modules.td.data.TDDataFactory;
   import com.qq.modules.td.data.game.unit.basic.TDGameObjectData;
   import com.qq.modules.td.data.game.unit.ce.TDEndlessLevelTemplateCE;
   import com.qq.modules.td.data.map.TDMapWaveEnemyData;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.modules.td.model.TDStartParam;
   import com.qq.modules.td.model.templates.ce.DailyTDInfoTemplateCE;
   import com.qq.modules.td.model.templates.ce.DailyTDZombieTemplateCE;
   import com.qq.modules.td.model.vo.TDPathPointVO;
   import com.qq.modules.td.model.vo.TDPathVO;
   import com.qq.modules.td.model.vo.TDUnitInitVO;
   import com.qq.modules.yetiTD.model.YetiTDData;
   import com.qq.modules.yetiTD.model.templates.ce.YetiTDMapTemplateCE;
   import com.qq.modules.yetiTD.model.templates.ce.YetiTDTemplateFactory;
   import com.qq.utils.DMath;
   import flash.geom.Point;
   
   public class TDZombieData extends TDGameObjectData
   {
       
      
      public var hasSwitched:Boolean;
      
      public var zombiestaticInfo:TDZombieStaticInfo;
      
      public var dailyTDZombieInfo:DailyTDZombieTemplateCE;
      
      public var armorData:Array;
      
      public var dropPartMaxState:int;
      
      public var dropPartState:int;
      
      public var isDying:Boolean;
      
      public var isFinishDying:Boolean;
      
      public var dyingTime:Number = 1800;
      
      public var isReview:Boolean;
      
      public var canJump:Boolean;
      
      public var storeSun:int = 0;
      
      public var duration:Number = 0;
      
      private var _startColumn:int;
      
      private var _path:Vector.<TDPathPointVO>;
      
      public var pathId:int = 0;
      
      public function TDZombieData(param1:int, param2:int)
      {
         super(param1,param2);
         this.isDying = false;
         this.isFinishDying = false;
         this.isReview = false;
      }
      
      public function get startColumn() : int
      {
         return this._startColumn;
      }
      
      public function set startColumn(param1:int) : void
      {
         this._startColumn = param1;
      }
      
      override public function init() : void
      {
         var _loc2_:int = 0;
         var _loc4_:Array = null;
         var _loc5_:Array = null;
         var _loc1_:int = unitType;
         if(TDStageInfo.getInstance().startParam.gameType == TDStartParam.Daily)
         {
            this.dailyTDZombieInfo = TDDataFactory.instance.getDailyTDZombieInfo(_loc1_);
         }
         staticInfo = TDDataFactory.instance.getZombieInfoByID(_loc1_);
         this.zombiestaticInfo = staticInfo as TDZombieStaticInfo;
         super.init();
         if(TDStageInfo.getInstance().startParam.gameType == TDStartParam.Daily)
         {
            _loc2_ = this.dailyTDZombieInfo.hp;
            this.duration = this.dailyTDZombieInfo.duration;
         }
         else
         {
            _loc2_ = this.zombiestaticInfo.hp;
            this.duration = this.zombiestaticInfo.duration;
         }
         var _loc3_:Array = this.getPowerBuff();
         maxHp.set(int(_loc2_ * (100 + _loc3_[0]) / 100));
         curHp.set(int(_loc2_ * (100 + _loc3_[0]) / 100));
         curDyingHp.set(this.zombiestaticInfo.dyingHP);
         camp = TDConstant.TDCamp_Enemy;
         this.dyingTime = this.zombiestaticInfo.dyingDuration;
         this.dropPartState = this.dropPartMaxState = this.zombiestaticInfo.DropPartTypeList.length;
         this.armorData = new Array();
         for each(_loc4_ in this.zombiestaticInfo.armorData)
         {
            (_loc5_ = new Array())[TDConstant.Armor_Name] = _loc4_[TDConstant.Armor_Name];
            _loc5_[TDConstant.Armor_RelpaceBoneName] = _loc4_[TDConstant.Armor_RelpaceBoneName];
            _loc5_[TDConstant.Armor_TextureName] = _loc4_[TDConstant.Armor_TextureName];
            if(TDStageInfo.getInstance().startParam.gameType == TDStartParam.Daily)
            {
               _loc5_[TDConstant.Armor_Hp] = _loc5_[TDConstant.Armor_MaxHp] = int(this.dailyTDZombieInfo.armor * (100 + _loc3_[1]) / 100);
            }
            else
            {
               _loc5_[TDConstant.Armor_Hp] = _loc5_[TDConstant.Armor_MaxHp] = int(_loc4_[TDConstant.Armor_MaxHp] * (100 + _loc3_[1]) / 100);
            }
            _loc5_[TDConstant.Armor_State] = _loc5_[TDConstant.Armor_MaxState] = _loc4_[TDConstant.Armor_State];
            _loc5_[TDConstant.Armor_ExitBoneNameList] = _loc4_[TDConstant.Armor_ExitBoneNameList].concat();
            _loc5_[TDConstant.Armor_NoExitBoneNameList] = _loc4_[TDConstant.Armor_NoExitBoneNameList].concat();
            _loc5_[TDConstant.Armor_DropImmediately] = _loc4_[TDConstant.Armor_DropImmediately];
            _loc5_[TDConstant.Armor_IsDrop] = false;
            _loc5_[TDConstant.Armor_PackageName] = _loc4_[TDConstant.Armor_PackageName];
            _loc5_[TDConstant.Aromr_isIron] = _loc4_[TDConstant.Aromr_isIron];
            _loc5_[TDConstant.Armor_IsTrigger] = 0;
            _loc5_[TDConstant.Armor_AllPartName] = _loc4_[TDConstant.Armor_AllPartName];
            this.armorData.push(_loc5_);
         }
         if(staticInfo.hasParam(TDConstant.Zombie_Param_FlySpeed))
         {
            isFlying = true;
         }
         if(staticInfo.hasParam(TDConstant.Zombie_Param_CanJump))
         {
            this.canJump = true;
         }
         else
         {
            this.canJump = false;
         }
         this.initSpeed();
      }
      
      override protected function initSpeed() : void
      {
         super.initSpeed();
         if(TDStageInfo.getInstance().startParam.gameType == TDStartParam.Daily)
         {
            _baseSpeedList[SPEED_WALK] = this.getRandomSpeed(this.dailyTDZombieInfo.speed,this.zombiestaticInfo.moveFloatPercent);
         }
         else
         {
            _baseSpeedList[SPEED_WALK] = this.getRandomSpeed(this.zombiestaticInfo.moveSpeed,this.zombiestaticInfo.moveFloatPercent);
         }
         if(staticInfo.hasParam(TDConstant.Zombie_Param_FlySpeed))
         {
            _baseSpeedList[SPEED_FLY] = this.getRandomSpeed(staticInfo.getParam(TDConstant.Zombie_Param_FlySpeed),this.zombiestaticInfo.moveFloatPercent);
         }
         if(staticInfo.hasParam(TDConstant.Zombie_Param_RunSpeed))
         {
            _baseSpeedList[SPEED_RUN] = this.getRandomSpeed(staticInfo.getParam(TDConstant.Zombie_Param_RunSpeed),this.zombiestaticInfo.moveFloatPercent);
         }
         _baseSpeedList[SPEED_PUSH] = 30;
      }
      
      public function getArmorCurHpByName(param1:String) : Number
      {
         return this.getArmorData(param1,TDConstant.Armor_Hp);
      }
      
      public function getArmorData(param1:String, param2:int) : Number
      {
         var _loc3_:Array = null;
         for each(_loc3_ in this.armorData)
         {
            if(_loc3_[TDConstant.Armor_Name] == param1)
            {
               return _loc3_[param2];
            }
         }
         return 0;
      }
      
      public function setArmorData(param1:String, param2:int, param3:int) : void
      {
         var _loc4_:Array = null;
         for each(_loc4_ in this.armorData)
         {
            if(_loc4_[TDConstant.Armor_Name] == param1)
            {
               _loc4_[param2] = param3;
               break;
            }
         }
      }
      
      public function getAllArmorCurHp() : int
      {
         var _loc2_:Array = null;
         var _loc1_:Number = 0;
         for each(_loc2_ in this.armorData)
         {
            if(_loc2_[TDConstant.Armor_Hp] > 0)
            {
               _loc1_ += _loc2_[TDConstant.Armor_Hp];
            }
         }
         return _loc1_;
      }
      
      public function getAllArmorMaxHp() : int
      {
         var _loc2_:Array = null;
         var _loc1_:int = 0;
         for each(_loc2_ in this.armorData)
         {
            _loc1_ += _loc2_[TDConstant.Armor_MaxHp];
         }
         return _loc1_;
      }
      
      public function isExistArmor() : Boolean
      {
         var _loc1_:Array = null;
         for each(_loc1_ in this.armorData)
         {
            if(_loc1_[TDConstant.Armor_Hp] > 0)
            {
               return true;
            }
         }
         return false;
      }
      
      public function getRandomSpeed(param1:Number, param2:Number) : Number
      {
         param2 = DMath.randNum(-param2,param2) * 0.01;
         return Number(param1);
      }
      
      override public function isPermitNormalAttack() : Boolean
      {
         if(!super.isPermitNormalAttack())
         {
            return false;
         }
         if(!this.isAlive() && this.isFinishDying)
         {
            return false;
         }
         if(isFlying)
         {
            return false;
         }
         return true;
      }
      
      override public function isPermitAttack() : Boolean
      {
         if(!super.isPermitAttack())
         {
            return false;
         }
         if(!this.isAlive() && this.isFinishDying)
         {
            return false;
         }
         return true;
      }
      
      public function isHasDefencePart() : Boolean
      {
         return this.armorData.length > 0;
      }
      
      public function reduceDefencePartHp(param1:Number) : Number
      {
         var _loc2_:Array = null;
         if(param1 > 0)
         {
            return param1;
         }
         for each(_loc2_ in this.armorData)
         {
            if(_loc2_[TDConstant.Armor_Hp] > 0)
            {
               if(_loc2_[TDConstant.Armor_Hp] <= Math.abs(param1))
               {
                  param1 += _loc2_[TDConstant.Armor_Hp];
                  _loc2_[TDConstant.Armor_Hp] = 0;
               }
               else
               {
                  _loc2_[TDConstant.Armor_Hp] += param1;
                  param1 = 0;
               }
               if(param1 < 0)
               {
                  break;
               }
            }
         }
         return param1;
      }
      
      override protected function getSortValue() : int
      {
         return 9000;
      }
      
      override public function isAlive() : Boolean
      {
         if(!isVaild)
         {
            return false;
         }
         return curHp.get() > 0;
      }
      
      public function get path() : Vector.<TDPathPointVO>
      {
         return this._path;
      }
      
      public function set path(param1:Vector.<TDPathPointVO>) : void
      {
         this._path = param1;
      }
      
      public function getPathCopy() : Vector.<TDPathPointVO>
      {
         return this._path.concat();
      }
      
      public function loadCreateConfigObj(param1:Object) : void
      {
         var _loc2_:TDMapWaveEnemyData = null;
         if(param1 is TDMapWaveEnemyData)
         {
            _loc2_ = param1 as TDMapWaveEnemyData;
            _loc2_.initBeforeCreateZombie();
            this._path = _loc2_.getPath().pathCells.concat();
            this.pathId = _loc2_.pathId;
            groupId = _loc2_.groupId;
            hasFuel = _loc2_.hasFuel;
            dropCard = _loc2_.dropCard;
         }
         else if(param1 is TDUnitInitVO)
         {
            if((param1 as TDUnitInitVO).row > 0)
            {
               this._path = Vector.<TDPathPointVO>([new TDPathPointVO((param1 as TDUnitInitVO).row,TDPathVO.COL_MAX)]);
            }
            else
            {
               this._path = (param1 as TDUnitInitVO).path;
            }
            this.pathId = (param1 as TDUnitInitVO).pathID;
         }
      }
      
      override public function set roadIndex(param1:int) : void
      {
         super.roadIndex = param1;
         if(this._path == null)
         {
            this._path = Vector.<TDPathPointVO>([new TDPathPointVO(roadIndex,TDPathVO.COL_MAX)]);
         }
      }
      
      public function getNextTarget() : TDPathPointVO
      {
         if(this._path)
         {
            return this._path.shift();
         }
         return null;
      }
      
      public function getNextTargetPoint() : Point
      {
         var _loc1_:TDPathPointVO = this.getNextTarget();
         if(_loc1_ == null)
         {
            return null;
         }
         return TDGameInfo.getInstance().getZomebiePosByTile(_loc1_.col,_loc1_.row);
      }
      
      private function getPowerBuff() : Array
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:LSLevelTemplate = null;
         var _loc19_:DailyTdData = null;
         var _loc20_:DailyTDInfoTemplateCE = null;
         var _loc21_:EndlessTDData = null;
         var _loc22_:TDEndlessLevelTemplateCE = null;
         var _loc23_:YetiTDData = null;
         var _loc24_:YetiTDMapTemplateCE = null;
         var _loc25_:Vector.<BattleCardFormationVO> = null;
         var _loc26_:int = 0;
         var _loc27_:int = 0;
         var _loc28_:BattleCardFormationVO = null;
         var _loc1_:int = TDStageInfo.getInstance().stageID;
         var _loc2_:int = TDStageInfo.getInstance().levelID;
         var _loc3_:int = TDStageInfo.getInstance().subLevelID;
         var _loc4_:int = TDStageInfo.getInstance().challengeLevelID;
         if(TDStageInfo.getInstance().startParam.gameType == TDStartParam.Normal)
         {
            if(_loc4_ > 0)
            {
               _loc18_ = LSLevelTemplateFactory.instance.getTemplateByChallengeId(_loc1_,_loc2_,_loc3_,_loc4_);
            }
            else
            {
               _loc18_ = LSLevelTemplateFactory.instance.getTemplateByStageIdAndLevelId(_loc1_,_loc2_,_loc3_);
            }
            _loc5_ = _loc18_.standard;
            _loc6_ = _loc18_.lower1;
            _loc7_ = _loc18_.lower2;
            _loc8_ = _loc18_.higher1;
            _loc9_ = _loc18_.higher2;
            _loc10_ = _loc18_.hp1;
            _loc11_ = _loc18_.hp2;
            _loc12_ = _loc18_.hp3;
            _loc13_ = _loc18_.hp4;
            _loc14_ = _loc18_.armor1;
            _loc15_ = _loc18_.armor2;
            _loc16_ = _loc18_.armor3;
            _loc17_ = _loc18_.armor4;
         }
         else if(TDStageInfo.getInstance().startParam.gameType == TDStartParam.Daily)
         {
            if(GameGloble.injector.hasMapping(DailyTdData))
            {
               _loc19_ = GameGloble.injector.getInstance(DailyTdData);
               _loc5_ = (_loc20_ = LSLevelTemplateFactory.instance.getDailyTDInfo(_loc19_.iTDSeqId)).standard;
               _loc6_ = _loc20_.lower1;
               _loc7_ = _loc20_.lower2;
               _loc8_ = _loc20_.higher1;
               _loc9_ = _loc20_.higher2;
               _loc10_ = _loc20_.hp1;
               _loc11_ = _loc20_.hp2;
               _loc12_ = _loc20_.hp3;
               _loc13_ = _loc20_.hp4;
               _loc14_ = _loc20_.armor1;
               _loc15_ = _loc20_.armor2;
               _loc16_ = _loc20_.armor3;
               _loc17_ = _loc20_.armor4;
            }
         }
         else if(TDStageInfo.getInstance().startParam.gameType == TDStartParam.Endless)
         {
            if(GameGloble.injector.hasMapping(EndlessTDData))
            {
               _loc21_ = GameGloble.injector.getInstance(EndlessTDData);
               _loc5_ = (_loc22_ = EndlessTemplateFactory.instance.getLevelInfo(_loc21_.curMode.mapInfo[_loc21_.curLevel].level)).standard;
               _loc6_ = _loc22_.lower1;
               _loc7_ = _loc22_.lower2;
               _loc8_ = _loc22_.higher1;
               _loc9_ = _loc22_.higher2;
               _loc10_ = _loc22_.hp1;
               _loc11_ = _loc22_.hp2;
               _loc12_ = _loc22_.hp3;
               _loc13_ = _loc22_.hp4;
               _loc14_ = _loc22_.armor1;
               _loc15_ = _loc22_.armor2;
               _loc16_ = _loc22_.armor3;
               _loc17_ = _loc22_.armor4;
            }
         }
         else if(TDStageInfo.getInstance().startParam.gameType == TDStartParam.Yeti)
         {
            if(GameGloble.injector.hasMapping(YetiTDData))
            {
               _loc23_ = GameGloble.injector.getInstance(YetiTDData);
               _loc5_ = (_loc24_ = YetiTDTemplateFactory.instance.getMapTemplate(_loc23_.mapsInfo[0].mapId)).standard;
               _loc6_ = _loc24_.lower1;
               _loc7_ = _loc24_.lower2;
               _loc8_ = _loc24_.higher1;
               _loc9_ = _loc24_.higher2;
               _loc10_ = _loc24_.hp1;
               _loc11_ = _loc24_.hp2;
               _loc12_ = _loc24_.hp3;
               _loc13_ = _loc24_.hp4;
               _loc14_ = _loc24_.armor1;
               _loc15_ = _loc24_.armor2;
               _loc16_ = _loc24_.armor3;
               _loc17_ = _loc24_.armor4;
            }
         }
         if(_loc5_ > 0)
         {
            _loc25_ = GameGloble.actorModel.battleCardModel.getAttackBattleTeam();
            _loc26_ = 0;
            _loc27_ = 0;
            while(_loc27_ < _loc25_.length)
            {
               _loc28_ = _loc25_[_loc27_];
               if(_loc26_ < _loc28_.totalPower)
               {
                  _loc26_ = _loc28_.totalPower;
               }
               _loc27_++;
            }
            if(_loc26_ < _loc7_)
            {
               return [_loc11_,_loc15_];
            }
            if(_loc26_ > _loc9_)
            {
               return [-_loc13_,-_loc17_];
            }
            if(_loc26_ >= _loc7_ && _loc26_ < _loc6_)
            {
               return [_loc10_,_loc14_];
            }
            if(_loc26_ <= _loc9_ && _loc26_ > _loc8_)
            {
               return [-_loc12_,-_loc16_];
            }
         }
         return [0,0];
      }
   }
}
