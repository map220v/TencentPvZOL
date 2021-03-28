package com.qq.modules.td.command.game
{
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDObjTypeID;
   import com.qq.modules.basic.model.templates.ServerConfigTemplateFactory;
   import com.qq.modules.endlessTD.model.EndlessTDPlantRecord;
   import com.qq.modules.endlessTD.model.EndlessTDStageRecord;
   import com.qq.modules.endlessTD.model.EndlessTDTileRecord;
   import com.qq.modules.guide.command.GuideCmd;
   import com.qq.modules.td.command.game.drag.TDMouseActionCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.command.tips.ShowTipCmd;
   import com.qq.modules.td.data.TDDataFactory;
   import com.qq.modules.td.data.game.unit.TDZombieStaticInfo;
   import com.qq.modules.td.data.map.TDMapRoadData;
   import com.qq.modules.td.data.map.TDMapTileData;
   import com.qq.modules.td.data.map.TDMapWaveEnemyData;
   import com.qq.modules.td.logic.TDCropUtil;
   import com.qq.modules.td.logic.TDFactory;
   import com.qq.modules.td.logic.TDSpecialSkillTrigger;
   import com.qq.modules.td.logic.bt_ai.aiUtils.TDSearchTargetUtils;
   import com.qq.modules.td.logic.log.TDLogCmd;
   import com.qq.modules.td.logic.process.TDAddUnitDelayProcess;
   import com.qq.modules.td.logic.talent.TalentManager;
   import com.qq.modules.td.logic.trigger.TDTrigConst;
   import com.qq.modules.td.logic.trigger.events.TriggerEvent;
   import com.qq.modules.td.logic.unit.basic.GameObject;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.logic.unit.object.TDNormalObject;
   import com.qq.modules.td.logic.unit.object.TDSampleMower;
   import com.qq.modules.td.logic.unit.object.TDSun;
   import com.qq.modules.td.logic.unit.object.TDSunBomb;
   import com.qq.modules.td.logic.unit.object.TDSunBombTrack;
   import com.qq.modules.td.logic.unit.object.TDZombieDropItem;
   import com.qq.modules.td.logic.unit.object.TDZombieMagnetArmor;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.logic.unit.zombie.BasicZombie;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.modules.td.model.TDStartParam;
   import com.qq.modules.td.model.vo.TDPathPointVO;
   import com.qq.modules.td.model.vo.TDUnitInitVO;
   import com.qq.modules.td.view.game.layer.floor.TDFloorManager;
   import com.qq.modules.td.view.game.ui.TDSpecailSkillCastIcon;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.DMath;
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Int64Util;
   import flash.geom.Point;
   import flash.utils.setTimeout;
   import org.as3commons.logging.api.getLogger;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class TDGameObjectCommand extends StrongRobotlegCommand
   {
      
      private static var count:int = 0;
       
      
      public function TDGameObjectCommand()
      {
         super();
      }
      
      private function getRandomFreePos(param1:Array) : int
      {
         if(param1.length == 0)
         {
            return 0;
         }
         var _loc2_:int = DMath.randNum(0,param1.length - 1);
         var _loc3_:int = param1[_loc2_];
         param1.splice(_loc2_,1);
         return _loc3_;
      }
      
      public function reviewZombie() : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:TDZombieStaticInfo = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc1_:Array = new Array();
         var _loc2_:int = 0;
         while(_loc2_ < 4 * 4)
         {
            _loc1_[_loc2_] = _loc2_;
            _loc2_++;
         }
         var _loc3_:Array = TDStageInfo.getInstance().getAppearUnitListByType(TDConstant.UnitCatalog_Zombie);
         var _loc4_:Array = new Array();
         for each(_loc5_ in _loc3_)
         {
            if(!((_loc9_ = TDDataFactory.instance.getZombieInfoByID(_loc5_)) == null || _loc9_.notPreview == 1))
            {
               _loc4_.push(_loc9_.type);
            }
         }
         _loc6_ = Math.max(_loc4_.length,DMath.randNum(8,12));
         if((_loc7_ = _loc4_.length) < _loc6_)
         {
            _loc10_ = _loc7_;
            while(_loc10_ < _loc6_)
            {
               _loc11_ = DMath.randNum(0,_loc7_ - 1);
               _loc12_ = _loc4_[_loc11_];
               _loc4_.push(_loc12_);
               _loc10_++;
            }
         }
         for each(_loc8_ in _loc4_)
         {
            if(_loc8_ == TDConstant.ZombieType_CAMEL_HEAD)
            {
               _loc13_ = this.getRandomFreePos(_loc1_);
               _loc13_ = int(_loc13_ / 4) * 4;
               this.addReviewZombie(TDConstant.ZombieType_CAMEL_HEAD,_loc13_,false);
               _loc13_++;
               this.addReviewZombie(TDConstant.ZombieType_CAMEL_HUMP,_loc13_,false);
               _loc13_++;
               this.addReviewZombie(TDConstant.ZombieType_CAMEL_TAIL,_loc13_,false);
            }
            else if(_loc8_ == TDConstant.ZombieType_CAMEL_HEAD_FlipCard)
            {
               _loc13_ = this.getRandomFreePos(_loc1_);
               _loc13_ = int(_loc13_ / 4) * 4;
               this.addReviewZombie(TDConstant.ZombieType_CAMEL_HEAD_FlipCard,_loc13_,false);
               _loc13_++;
               this.addReviewZombie(TDConstant.ZombieType_CAMEL_HUMP_FlipCard,_loc13_,false);
               _loc13_++;
               this.addReviewZombie(TDConstant.ZombieType_CAMEL_TAIL_FlipCard,_loc13_,false);
            }
            else
            {
               _loc13_ = this.getRandomFreePos(_loc1_);
               this.addReviewZombie(_loc8_,_loc13_);
            }
         }
      }
      
      private function addReviewZombie(param1:int, param2:int, param3:Boolean = true) : void
      {
         var _loc8_:int = 0;
         var _loc4_:BasicZombie = TDFactory.createBT_Zombie(param1);
         var _loc5_:int = param2 % 4;
         var _loc6_:int = param2 / 4;
         var _loc7_:int = TDGameInfo.getInstance().groundW - 320 + _loc5_ * 50;
         if(param3)
         {
            _loc8_ = 250 + _loc6_ * 100 + (_loc5_ % 2 == 1 ? 30 : 0);
         }
         else
         {
            _loc8_ = 250 + _loc6_ * 100;
         }
         _loc4_.zombieData.isReview = true;
         _loc4_.addTooltip();
         _loc4_.startIdle();
         CommandDispatcher.send(CommandName.TD_Add_UnitToScreen,{
            "object":_loc4_,
            "x":_loc7_,
            "y":_loc8_
         });
      }
      
      private function startZombieIdle(param1:BasicZombie) : void
      {
         if(param1 != null)
         {
            param1.startIdle();
         }
      }
      
      public function removeReviewZombie() : void
      {
         var _loc2_:BasicZombie = null;
         var _loc1_:Array = TDGameInfo.getInstance().getGameObjectMapByCatalg(TDConstant.UnitCatalog_Zombie);
         for each(_loc2_ in _loc1_)
         {
            if(_loc2_.zombieData.isReview)
            {
               _loc2_.dispose();
            }
         }
      }
      
      public function switchZombie(param1:*, param2:int) : void
      {
         var _loc3_:BasicZombie = param1 as BasicZombie;
         if(_loc3_.zombieData.curHp.get() <= 0)
         {
            return;
         }
         var _loc4_:BasicZombie;
         (_loc4_ = this.$addZombie(param2,_loc3_.x,_loc3_.y)).zombieData.hasSwitched = true;
         _loc4_.zombieData.curHp.set(_loc4_.zombieData.zombiestaticInfo.hp * _loc3_.zombieData.curHp.get() / _loc3_.zombieData.zombiestaticInfo.hp);
         _loc3_.dispose();
      }
      
      private function $addZombie(param1:int, param2:int, param3:int, param4:Array = null, param5:Object = null) : BasicZombie
      {
         var _loc6_:BasicZombie = TDFactory.createBT_Zombie(param1,null,param5);
         this.addZombieToStageByPos(_loc6_,new Point(param2,param3),param4);
         return _loc6_;
      }
      
      private function updateProtectedPlantData(param1:BasicPlant, param2:int) : void
      {
         var _loc3_:Array = null;
         var _loc4_:BasicPlant = null;
         if(param1 == null)
         {
            return;
         }
         if(param1.plantData.plantStaticInfo.baseInfo.usefulness == TDConstant.PlantUsefulness_Protected)
         {
            _loc3_ = TDGameInfo.getInstance().getPlantByTileIndex(param2,TDConstant.PlantUsefulness_Plant);
            if(_loc3_.length > 0)
            {
               (_loc4_ = _loc3_[0]).plantData.setProtectedPlant(param1);
            }
            else
            {
               getLogger("TD").error("设置保护植物数据出错");
            }
         }
         else if(param1.plantData.plantStaticInfo.baseInfo.usefulness == TDConstant.PlantUsefulness_Plant)
         {
            _loc3_ = TDGameInfo.getInstance().getPlantByTileIndex(param2,TDConstant.PlantUsefulness_Protected);
            if(_loc3_.length > 0)
            {
               _loc4_ = _loc3_[0];
               param1.plantData.setProtectedPlant(_loc4_);
            }
         }
      }
      
      public function addZombieToStageByPos(param1:Object, param2:Point, param3:Array = null) : void
      {
         var _loc6_:* = null;
         var _loc4_:BasicZombie = param1 as BasicZombie;
         var _loc5_:int = TDGameInfo.getInstance().getRoadIndex(param2.y);
         _loc4_.objectModel.roadIndex = _loc5_;
         if(param3 != null)
         {
            for(_loc6_ in param3)
            {
               _loc4_.setRunningProp(int(_loc6_),param3[_loc6_]);
            }
         }
         CommandDispatcher.send(CommandName.TD_Add_UnitToScreen,{
            "object":_loc4_,
            "x":param2.x,
            "y":param2.y
         });
         _loc4_.revive();
      }
      
      public function addPlant(param1:int, param2:Object, param3:Boolean = true, param4:String = null, param5:Boolean = false, param6:Boolean = false, param7:uint = 0) : void
      {
         var _loc10_:String = null;
         var _loc11_:int = 0;
         var _loc12_:Boolean = false;
         var _loc13_:Point = null;
         var _loc14_:int = 0;
         var _loc15_:Boolean = false;
         var _loc16_:Boolean = false;
         var _loc17_:TDMapTileData = null;
         var _loc18_:Array = null;
         var _loc19_:BasicPlant = null;
         var _loc8_:TDMapTileData = param2 as TDMapTileData;
         var _loc9_:BasicPlant = TDFactory.createGameobject(TDConstant.UnitCatalog_Plant,param1) as BasicPlant;
         if(param7 > 0)
         {
            _loc9_.plantData.curHp.set(param7);
         }
         _loc9_.plantData.isCoolDown = param5;
         if(param4 != null)
         {
            _loc10_ = param4.split("_")[1];
            _loc9_.plantData.roleID = new Int64(Number(_loc10_));
         }
         if(_loc9_.plantData.plantStaticInfo.baseInfo.catalog == TDConstant.PlantCatalog_Skill)
         {
            if(TDGameInfo.getInstance().sun.get() >= TDCropUtil.getPlantSunCost(_loc9_.plantData.plantStaticInfo))
            {
               TDGameCmd.changeSun(-TDCropUtil.getPlantSunCost(_loc9_.plantData.plantStaticInfo));
               CommandDispatcher.send(CommandName.TD_StartCardCooldown,{
                  "plantType":_loc9_.plantData.plantStaticInfo.baseInfo.type,
                  "cardID":param4
               });
               _loc9_.castSkill();
               _loc9_.Dispose();
            }
         }
         else if(_loc8_ != null)
         {
            if((_loc11_ = TDCropUtil.isPermitAddPlant(_loc9_.plantData.plantStaticInfo.id,_loc8_)) == TDConstant.PermitAddPlant_NotPreplant && param6)
            {
               _loc11_ = TDConstant.PermitAddPlant_OK;
            }
            if(_loc11_ == TDConstant.PermitAddPlant_OK)
            {
               _loc12_ = false;
               if(TDStageInfo.getInstance().checkGameType(TDConstant.TDgameType_Param_CropConsumeSun))
               {
                  if(!param3)
                  {
                     _loc12_ = true;
                  }
                  if(!_loc12_)
                  {
                     if(TDGameInfo.getInstance().sun.get() >= TDCropUtil.getPlantSunCost(_loc9_.plantData.plantStaticInfo))
                     {
                        TDGameCmd.changeSun(-TDCropUtil.getPlantSunCost(_loc9_.plantData.plantStaticInfo));
                        _loc12_ = true;
                     }
                  }
               }
               else
               {
                  _loc12_ = true;
               }
               if(_loc12_)
               {
                  _loc13_ = TDGameInfo.getInstance().getPlantPos(_loc8_.index,_loc9_.plantData.plantStaticInfo.id);
                  _loc9_.plantData.loadTileData(_loc8_);
                  _loc8_.addPlantType(_loc9_.plantData.plantStaticInfo.baseInfo.id);
                  this.updateProtectedPlantData(_loc9_,_loc8_.index);
                  if((_loc14_ = TDCropUtil.getPlantSunCost(_loc9_.plantData.plantStaticInfo)) > 0)
                  {
                     CommandDispatcher._dispatcher.dispatchEvent(new TriggerEvent(TDTrigConst.TYPE_USE_SUN,[_loc14_]));
                  }
                  _loc9_.revive();
                  CommandDispatcher.send(CommandName.TD_Add_UnitToScreen,{
                     "object":_loc9_,
                     "x":_loc13_.x,
                     "y":_loc13_.y
                  });
                  this.addBuffByTileStatus(_loc9_,_loc8_);
                  if(TDStageInfo.getInstance().isUnderWater && _loc9_.plantData.plantStaticInfo.baseInfo.isSeaPlant == 0)
                  {
                     _loc17_ = TDGameInfo.getInstance().getRoadTileByGamePos(_loc13_.x,_loc13_.y);
                     if(TDSearchTargetUtils.coveredByOxygen(_loc17_))
                     {
                        _loc9_.plantData.addBuff(TDConstant.TDBuffID_OxygenSupplyedAlways,_loc9_);
                     }
                     _loc9_.plantData.addBuff(TDConstant.TDBuffID_ShortOfOxygen,_loc9_);
                  }
                  _loc15_ = false;
                  if(!Int64Util.isEqual(_loc9_.plantData.roleID,GameGloble.actorModel.roleId))
                  {
                     _loc15_ = true;
                  }
                  TDLogCmd.cropPlant(_loc9_.plantData.plantStaticInfo.id,_loc8_.roadCol,_loc8_.roadRow,_loc15_);
                  TDSoundCmd.cropPlant(_loc9_.plantData.plantStaticInfo.id);
                  _loc16_ = false;
                  if(_loc9_.plantData.plantStaticInfo.baseInfo.prePlantType != 0)
                  {
                     _loc18_ = TDGameInfo.getInstance().getPlantByTileIndex(_loc8_.index);
                     for each(_loc19_ in _loc18_)
                     {
                        if(_loc19_.plantData.plantStaticInfo.baseInfo.id == _loc9_.plantData.plantStaticInfo.baseInfo.prePlantType)
                        {
                           _loc19_.killByPrePlantType = true;
                           _loc19_.dispose();
                           _loc16_ = true;
                        }
                     }
                  }
                  if(!_loc16_)
                  {
                     CommandDispatcher._dispatcher.dispatchEvent(new TriggerEvent(TDTrigConst.TYPE_PLANT_GROW,[_loc9_]));
                  }
                  CommandDispatcher.send(CommandName.TD_StartCardCooldown,{
                     "plantType":_loc9_.plantData.plantStaticInfo.baseInfo.type,
                     "cardID":param4
                  });
                  TalentManager.instance.growPlantSunDrop(_loc9_);
               }
               TDMouseActionCmd.cleanMouseAction();
            }
            else if(_loc11_ == TDConstant.PermitAddPlant_NotPreplant)
            {
               ShowTipCmd.showPlantSetError(_loc9_.model.staticInfo.type);
            }
            else
            {
               TDMouseActionCmd.cleanMouseAction();
            }
         }
         else
         {
            TDMouseActionCmd.cleanMouseAction();
         }
      }
      
      public function showInitUnit() : void
      {
         var _loc2_:int = 0;
         var _loc4_:TDUnitInitVO = null;
         var _loc1_:Vector.<TDUnitInitVO> = TDStageInfo.getInstance().initUnits;
         var _loc3_:int = _loc1_.length;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if((_loc4_ = _loc1_[_loc2_]).delay == 0)
            {
               this.addGameObjectByTDUnitInitVO(_loc4_);
            }
            else
            {
               (TDGameInfo.getInstance().updateProcessList[TDAddUnitDelayProcess.ID] as TDAddUnitDelayProcess).addDelayUnit(_loc4_);
            }
            _loc2_++;
         }
         if(TDStageInfo.getInstance().startParam.gameType == TDStartParam.Endless && TDStageInfo.getInstance().startParam.endlessTDRecord)
         {
            this.readEndlessTDSaveRecord();
         }
      }
      
      private function readEndlessTDSaveRecord() : void
      {
         var _loc2_:TDGameInfo = null;
         var _loc3_:EndlessTDPlantRecord = null;
         var _loc4_:EndlessTDTileRecord = null;
         var _loc1_:EndlessTDStageRecord = TDStageInfo.getInstance().startParam.endlessTDRecord as EndlessTDStageRecord;
         if(_loc1_ && _loc1_.level > 0)
         {
            _loc2_ = TDGameInfo.getInstance();
            for each(_loc3_ in _loc1_.allRecord)
            {
               this.addPlant(_loc3_.plantID,_loc2_.getRoadTileByIndex(_loc3_.tileIndex),false,null,true,true,_loc3_.currentHP);
            }
            for each(_loc4_ in _loc1_.allTile)
            {
               this.addNormalGameObjectByTile(_loc4_.tileType,_loc2_.getRoadTileByIndex(_loc4_.tileIndex));
            }
            TDGameCmd.changeEndlessScore(_loc1_.score);
         }
      }
      
      public function showLastProtecter() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc4_:TDUnitInitVO = null;
         var _loc5_:Array = null;
         var _loc6_:IGameObject = null;
         var _loc7_:int = 0;
         var _loc8_:TDMapRoadData = null;
         var _loc9_:IGameObject = null;
         if(TDStageInfo.getInstance().startParam.gameType == TDStartParam.Endless)
         {
            _loc5_ = TDGameInfo.getInstance().getGameObjectMapByCatalgAndType(TDConstant.UnitCatalog_Object,TDStageInfo.getInstance().toyCarType);
            for each(_loc6_ in _loc5_)
            {
               _loc6_.Dispose();
            }
         }
         var _loc3_:Number = 0;
         if(TDStageInfo.getInstance().hasToyCar())
         {
            _loc3_ += TDGameInfo.getInstance().roadList.length * 100;
            _loc7_ = 0;
            for each(_loc8_ in TDGameInfo.getInstance().roadList)
            {
               if(TDStageInfo.getInstance().toyCarList[_loc7_] == 1)
               {
                  (_loc9_ = TDFactory.createGameobject(TDConstant.UnitCatalog_Object,TDStageInfo.getInstance().toyCarType)).objectModel.loadRoadData(_loc8_);
                  TDGameInfo.getInstance().setToyCarFlag(_loc8_.index,true);
                  _loc1_ = TDGameInfo.getInstance().toycarPosX - 48;
                  _loc2_ = _loc8_.endY - 30;
                  _loc9_.setLocation(_loc1_,_loc2_);
                  _loc3_ -= 100;
                  setTimeout(CommandDispatcher.send,_loc3_,CommandName.TD_Add_UnitToScreen,{
                     "object":_loc9_,
                     "x":_loc1_,
                     "y":_loc2_
                  });
               }
               _loc7_++;
            }
         }
         for each(_loc4_ in TDStageInfo.getInstance().initRoadUnits)
         {
            this.addGameObjectByTDUnitInitVO(_loc4_);
         }
      }
      
      public function addGameObjectByTDUnitInitVO(param1:Object) : void
      {
         var _loc2_:TDUnitInitVO = param1 as TDUnitInitVO;
         if(_loc2_.row != 0 || _loc2_.column != 0)
         {
            this.addGameObjectByColAndRow(_loc2_.catalog,_loc2_.type,_loc2_.column,_loc2_.row,_loc2_.extraParam,_loc2_);
         }
         else
         {
            this.addGameObjectByPos(_loc2_.catalog,_loc2_.type,_loc2_.posX,_loc2_.posY,_loc2_.extraParam,_loc2_);
         }
      }
      
      public function addGameObjectByPos(param1:int, param2:int, param3:int, param4:int, param5:Array = null, param6:Object = null) : void
      {
         var _loc7_:Boolean = false;
         var _loc8_:TDMapTileData = null;
         switch(param1)
         {
            case TDConstant.UnitCatalog_Object:
               _loc7_ = param6 != null && param6.hasOwnProperty("isBottom") ? Boolean(param6.isBottom) : false;
               this.addNormalGameObjectByPos(param2,param3,param4,param5,_loc7_);
               break;
            case TDConstant.UnitCatalog_Zombie:
               this.$addZombie(param2,param3,param4,null,param6);
               break;
            case TDConstant.UnitCatalog_Plant:
               _loc8_ = TDGameInfo.getInstance().getRoadTileByScreenPos(param3,param4);
               this.addPlant(param2,_loc8_,false);
         }
      }
      
      public function addGameObjectByColAndRow(param1:int, param2:int, param3:int, param4:int, param5:Array = null, param6:Object = null) : void
      {
         var _loc8_:Point = null;
         var _loc7_:TDMapTileData = TDGameInfo.getInstance().getRoadTileInf(param3,param4);
         switch(param1)
         {
            case TDConstant.UnitCatalog_Object:
               this.addNormalGameObjectByTile(param2,_loc7_,param5);
               break;
            case TDConstant.UnitCatalog_Plant:
               this.addPlant(param2,_loc7_,false);
               break;
            case TDConstant.UnitCatalog_Zombie:
               _loc8_ = TDGameInfo.getInstance().getZomebiePosByTile(param3,param4);
               this.$addZombie(param2,_loc8_.x,_loc8_.y,param5,param6);
         }
      }
      
      public function addNormalGameObjectByPos(param1:int, param2:int, param3:int, param4:Array = null, param5:Boolean = false) : void
      {
         var _loc7_:IGameObject = null;
         var _loc6_:int = TDGameInfo.getInstance().getRoadIndex(param3);
         (_loc7_ = TDFactory.createGameobject(TDConstant.UnitCatalog_Object,param1,param4)).setRunningPropList(param4);
         _loc7_.objectModel.roadIndex = _loc6_;
         if(!param5)
         {
            CommandDispatcher.send(CommandName.TD_Add_UnitToScreen,{
               "object":_loc7_,
               "x":param2,
               "y":param3
            });
         }
         else
         {
            CommandDispatcher.send(CommandName.TD_Add_UnitToBottomLayer,{
               "object":_loc7_,
               "x":param2,
               "y":param3
            });
         }
      }
      
      public function addNormalGameObjectByColRow(param1:Object, param2:int, param3:int) : void
      {
         var _loc5_:TDMapTileData = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc4_:GameObject;
         if((_loc4_ = param1 as GameObject).objectModel.unitCatalog == TDConstant.UnitCatalog_Object)
         {
            _loc6_ = (_loc5_ = TDGameInfo.getInstance().getRoadTileInf(param2,param3)).rect.x + _loc5_.rect.width * 0.5 + 5;
            _loc7_ = _loc5_.rect.y + _loc5_.rect.height - 20;
            _loc4_.objectModel.loadTileData(_loc5_);
            CommandDispatcher.send(CommandName.TD_Add_UnitToScreen,{
               "object":_loc4_,
               "x":_loc6_,
               "y":_loc7_
            });
            return;
         }
         throw Error("the obj is not normalGameObject");
      }
      
      public function addNormalGameObjectByTile(param1:int, param2:Object, param3:Array = null) : void
      {
         var _loc7_:IGameObject = null;
         var _loc4_:TDMapTileData;
         var _loc5_:int = (_loc4_ = param2 as TDMapTileData).rect.x + _loc4_.rect.width * 0.5 + 5;
         var _loc6_:int = _loc4_.rect.y + _loc4_.rect.height - 20;
         (_loc7_ = TDFactory.createGameobject(TDConstant.UnitCatalog_Object,param1,param3)).objectModel.loadTileData(_loc4_);
         CommandDispatcher.send(CommandName.TD_Add_UnitToScreen,{
            "object":_loc7_,
            "x":_loc5_,
            "y":_loc6_
         });
      }
      
      public function generateSun(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         var _loc6_:TDSun;
         if((_loc6_ = TDFactory.createGameobject(TDConstant.UnitCatalog_Object,param1) as TDSun) == null)
         {
            return;
         }
         ++TDGameInfo.getInstance().generateSunCount;
         _loc6_.setLocation(param2,param3);
         _loc6_.setTarget(param4,param5);
         CommandDispatcher.send(CommandName.TD_AddObjectToScreen,{"object":_loc6_});
         GuideCmd.tryGuide("td_sun_guide_" + TDGameInfo.getInstance().generateSunCount);
      }
      
      public function generateSunBomb(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Number) : void
      {
         var _loc7_:TDSunBomb = TDFactory.createGameobject(TDConstant.UnitCatalog_Object,param1) as TDSunBomb;
         var _loc8_:TDSunBombTrack = TDFactory.createGameobject(TDConstant.UnitCatalog_Object,param2) as TDSunBombTrack;
         if(_loc7_ == null || _loc8_ == null)
         {
            return;
         }
         _loc7_.isBig = param5;
         _loc7_.speed = param6;
         _loc7_.setLocation(param3,param4);
         _loc7_.setTarget(param3,param4);
         _loc7_.sunBombTrack = _loc8_;
         _loc8_.setLocation(param3,param4);
         CommandDispatcher.send(CommandName.TD_AddObjectToScreen,{"object":_loc8_});
         CommandDispatcher.send(CommandName.TD_AddObjectToScreen,{"object":_loc7_});
      }
      
      public function addLootItem(param1:int, param2:int, param3:int, param4:Array = null) : void
      {
         var _loc5_:TDNormalObject;
         if((_loc5_ = TDFactory.createNormalObject(param1,param4)) == null)
         {
            return;
         }
         _loc5_.setLocation(param2,param3);
         CommandDispatcher.send(CommandName.TD_AddObjectToScreen,{"object":_loc5_});
         if(param1 == TDConstant.UnitType_Leaf)
         {
            ++TDGameInfo.getInstance().lootLeafCount;
            GuideCmd.tryGuide("td_leaf_guide_" + TDGameInfo.getInstance().lootLeafCount);
         }
      }
      
      public function dropZombiePart(param1:Object, param2:Array, param3:int, param4:String = null) : void
      {
         var _loc6_:int = 0;
         var _loc7_:TDZombieDropItem = null;
         var _loc5_:IGameObject = param1 as IGameObject;
         if(param3 == 0)
         {
            getLogger().error("掉落部件类型错误");
            return;
         }
         if(_loc5_ == null || param2 == null)
         {
            return;
         }
         switch(param3)
         {
            case TDConstant.DropPart_Head:
               _loc6_ = TDConstant.UnitType_DropHead;
               break;
            case TDConstant.DropPart_Hand:
               _loc6_ = TDConstant.UnitType_DropHand;
               break;
            default:
               _loc6_ = TDConstant.UnitType_DropItem;
         }
         if(_loc5_.isVaild)
         {
            (_loc7_ = TDFactory.createGameobject(TDConstant.UnitCatalog_Object,_loc6_) as TDZombieDropItem).model.roadIndex = _loc5_.objectModel.roadIndex;
            _loc7_.initDrop(_loc5_,param2);
            CommandDispatcher.send(CommandName.TD_Add_UnitToScreen,{
               "object":_loc7_,
               "x":_loc5_.x,
               "y":_loc5_.y
            });
            _loc7_.setShadeVisible(false);
         }
      }
      
      public function magnetArmor(param1:Object, param2:Array, param3:int, param4:String, param5:int, param6:int) : void
      {
         var _loc7_:IGameObject = param1 as IGameObject;
         if(param3 == 0)
         {
            getLogger().error("掉落部件类型错误");
            return;
         }
         if(_loc7_ == null)
         {
            return;
         }
         var _loc8_:TDZombieMagnetArmor;
         (_loc8_ = TDFactory.createGameobject(TDConstant.UnitCatalog_Object,TDConstant.UnitType_MagnetArmor) as TDZombieMagnetArmor).targetX = param5;
         _loc8_.targetY = param6;
         _loc8_.model.roadIndex = _loc7_.objectModel.roadIndex;
         _loc8_.initDropItem(_loc7_.objectModel.unitCatalog,_loc7_.objectModel.unitType,param2,_loc7_.objectModel.roadIndex,param3,param4);
         CommandDispatcher.send(CommandName.TD_Add_UnitToScreen,{
            "object":_loc8_,
            "x":_loc7_.x,
            "y":_loc7_.y
         });
         _loc8_.setShadeVisible(false);
      }
      
      public function showSpecialSkillPanel(param1:int, param2:int, param3:int) : void
      {
         var _loc5_:BasicPlant = null;
         var _loc6_:TDSpecailSkillCastIcon = null;
         if(TDSpecialSkillTrigger.getInstance().targetUID != 0 && TDSpecialSkillTrigger.getInstance().targetUID != param3)
         {
            if((_loc5_ = TDGameInfo.getInstance().getGameObjctByUID(TDSpecialSkillTrigger.getInstance().targetUID) as BasicPlant) != null)
            {
               _loc5_.hideSpecialSkillChooseEffect();
            }
         }
         var _loc4_:IGameObject;
         if((_loc4_ = TDGameInfo.getInstance().getGameObjctByUID(param3)) != null && _loc4_ is BasicPlant)
         {
            if(TDSpecialSkillTrigger.getInstance().meetSpecialSkillRequirement(_loc4_ as BasicPlant,true))
            {
               (_loc6_ = GameGloble.injector.getInstance(TDSpecailSkillCastIcon)).x = (param1 - TDConstant.passWarfieldPosX - _loc6_.width * 0.5) * GameGloble.scaleCurrent + GameGloble.xAddForUI;
               _loc6_.y = (param2 - 140) * GameGloble.scaleCurrent;
               _loc6_.scaleX = _loc6_.scaleY = GameGloble.scaleCurrent;
               TDSpecialSkillTrigger.getInstance().targetUID = param3;
               _loc6_.setVisable(true);
               (_loc4_ as BasicPlant).showSpecialSkillChooseEffect();
            }
         }
      }
      
      public function hideSpeicalSkillPanel() : void
      {
         var _loc1_:BasicPlant = TDGameInfo.getInstance().getGameObjctByUID(TDSpecialSkillTrigger.getInstance().targetUID) as BasicPlant;
         if(_loc1_ != null)
         {
            _loc1_.hideSpecialSkillChooseEffect();
         }
         TDSpecialSkillTrigger.getInstance().targetUID = -1;
         var _loc2_:TDSpecailSkillCastIcon = GameGloble.injector.getInstance(TDSpecailSkillCastIcon);
         _loc2_.setVisable(false);
      }
      
      public function releaseSpecialSkill(param1:int, param2:Boolean = true) : void
      {
         var _loc3_:IGameObject = TDGameInfo.getInstance().getGameObjctByUID(param1);
         if(_loc3_ != null && _loc3_ is BasicPlant)
         {
            if(!TDSpecialSkillTrigger.getInstance().meetSpecialSkillRequirement(_loc3_ as BasicPlant,param2))
            {
               return;
            }
            if(param2)
            {
               ++TDStageInfo.getInstance().totalFuel;
               TDGameCmd.changeFuel(-TDGameInfo.getInstance().useFuelValue.get());
            }
            TDSoundCmd.useSpecialSkill();
            TDSpecialSkillTrigger.getInstance().runSpecialSkill(_loc3_ as BasicPlant);
            CommandDispatcher.send(CommandName.TD_StartSkill,_loc3_);
         }
      }
      
      public function addBlowZombie(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:Point = TDGameInfo.getInstance().getZombieStartWalkPos(param2);
         var _loc5_:TDMapRoadData = TDGameInfo.getInstance().getRoadInfo(param2);
         var _loc6_:int = 0;
         var _loc7_:TDMapTileData;
         if((_loc7_ = TDGameInfo.getInstance().getRoadTileInf(param3 - 1,1)) != null)
         {
            _loc6_ = _loc7_.rect.x;
         }
         var _loc8_:TDUnitInitVO;
         (_loc8_ = new TDUnitInitVO()).init(TDConstant.UnitCatalog_Object,TDConstant.UnitType_BlowZombieEffect);
         _loc8_.setPosByCoord(_loc4_.x,_loc4_.y);
         _loc8_.setExtraParam(TDConstant.GameObject_Prop_BlowZombie_Type,param1);
         _loc8_.setExtraParam(TDConstant.GameObject_Prop_EndBlowRow,_loc6_);
         this.addGameObjectByTDUnitInitVO(_loc8_);
      }
      
      public function summonZombie(param1:int, param2:int, param3:int, param4:Boolean = true) : void
      {
         var _loc5_:TDUnitInitVO;
         (_loc5_ = new TDUnitInitVO()).init(TDConstant.UnitCatalog_Object,TDConstant.UnitType_SummonZombieEffect);
         _loc5_.setPosByColRow(param2,param3);
         _loc5_.setExtraParam(TDConstant.Gameobject_Prop_SummonZombie_Type,param1);
         _loc5_.setExtraParam(TDConstant.Gameobject_Prop_SummonZombie_row,param3);
         _loc5_.setExtraParam(TDConstant.Gameobject_Prop_SummonZombie_col,param2);
         _loc5_.setExtraParam(TDConstant.Gameobject_Prop_SummonZombie_IsCanClick,param4);
         this.addGameObjectByTDUnitInitVO(_loc5_);
      }
      
      public function summonZombieInArea(param1:Array, param2:int, param3:int, param4:Boolean = true) : void
      {
         var _loc7_:TDMapRoadData = null;
         var _loc8_:int = 0;
         var _loc9_:TDMapTileData = null;
         var _loc10_:int = 0;
         var _loc11_:TDMapTileData = null;
         var _loc5_:int = param1.length;
         var _loc6_:Array = new Array();
         for each(_loc7_ in TDGameInfo.getInstance().roadList)
         {
            for each(_loc9_ in _loc7_.tileList)
            {
               if(_loc9_.roadCol >= param2 && _loc9_.roadCol <= param3)
               {
                  _loc6_.push(_loc9_);
               }
            }
         }
         _loc8_ = 0;
         while(_loc8_ < _loc5_)
         {
            _loc10_ = DMath.randNum(0,_loc6_.length - 1);
            if((_loc11_ = _loc6_[_loc10_]) != null)
            {
               _loc6_.splice(_loc10_,1);
               this.summonZombie(param1[_loc8_],_loc11_.roadCol,_loc11_.roadRow,param4);
            }
            _loc8_++;
         }
      }
      
      public function popZombieInArea(param1:Array, param2:int, param3:int, param4:int, param5:int, param6:Array = null) : void
      {
         var _loc9_:TDMapRoadData = null;
         var _loc10_:int = 0;
         var _loc11_:TDMapTileData = null;
         var _loc12_:int = 0;
         var _loc13_:TDMapTileData = null;
         var _loc14_:TDUnitInitVO = null;
         if(param4 > param5)
         {
            return;
         }
         var _loc7_:int = param1.length;
         var _loc8_:Array = new Array();
         for each(_loc9_ in TDGameInfo.getInstance().roadList)
         {
            for each(_loc11_ in _loc9_.tileList)
            {
               if(!(param6 && param6.indexOf(_loc11_.roadRow) < 0))
               {
                  if(_loc11_.roadCol >= param4 && _loc11_.roadCol <= param5)
                  {
                     _loc8_.push(_loc11_);
                  }
               }
            }
         }
         _loc10_ = 0;
         while(_loc10_ < _loc7_)
         {
            _loc12_ = DMath.randNum(0,_loc8_.length - 1);
            if((_loc13_ = _loc8_[_loc12_]) != null)
            {
               _loc8_.splice(_loc12_,1);
               (_loc14_ = new TDUnitInitVO()).init(TDConstant.UnitCatalog_Object,TDConstant.UnitType_PopObjectEffect);
               _loc14_.setPosByCoord(param2,param3);
               _loc14_.setExtraParam(TDConstant.Gameobject_Prop_SummonZombie_Type,param1[_loc10_]);
               _loc14_.setExtraParam(TDConstant.Gameobject_Prop_SummonZombie_row,_loc13_.roadRow);
               _loc14_.setExtraParam(TDConstant.Gameobject_Prop_SummonZombie_col,_loc13_.roadCol);
               this.addGameObjectByTDUnitInitVO(_loc14_);
            }
            _loc10_++;
         }
      }
      
      public function throwPotatoToRoadTile(param1:Array, param2:Number, param3:Number) : void
      {
         var _loc5_:TDUnitInitVO = null;
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            (_loc5_ = new TDUnitInitVO()).init(TDConstant.UnitCatalog_Object,TDConstant.UnitType_PopPotato);
            _loc5_.setPosByCoord(param2,param3);
            _loc5_.setExtraParam(TDConstant.Gameobject_Prop_PotatoObj,param1[_loc4_]);
            this.addGameObjectByTDUnitInitVO(_loc5_);
            _loc4_++;
         }
      }
      
      public function addConveyEffect(param1:Object, param2:int, param3:int) : void
      {
         var _loc4_:IGameObject;
         if((_loc4_ = param1 as IGameObject) == null)
         {
            return;
         }
         var _loc5_:IGameObject;
         if((_loc5_ = TDGameInfo.getInstance().getGameObjctByUID(param2)) == null)
         {
            return;
         }
         var _loc6_:TDUnitInitVO;
         (_loc6_ = new TDUnitInitVO()).init(TDConstant.UnitCatalog_Object,TDConstant.UnitType_TDConveyEffect);
         _loc6_.setPosByCoord(_loc4_.x,_loc4_.y);
         _loc6_.setExtraParam(TDConstant.GameObject_Prop_ConveryEffect_ZombieUID,_loc4_.uid);
         _loc6_.setExtraParam(TDConstant.GameObject_Prop_ConveryEffect_EndX,param3);
         _loc6_.setExtraParam(TDConstant.Gameobject_Prop_ConveryObj,_loc5_);
         this.addGameObjectByTDUnitInitVO(_loc6_);
      }
      
      public function removeMudsByColomn(param1:Array) : void
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < param1.length)
         {
            setTimeout(this.$removeMudsByColomn,_loc2_ * 500,[param1[_loc2_]]);
            _loc2_++;
         }
      }
      
      private function $removeMudsByColomn(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Vector.<TDPathPointVO> = new Vector.<TDPathPointVO>();
         var _loc5_:int = TDGameInfo.getInstance().getRoadNum();
         _loc2_ = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = 1;
            while(_loc3_ <= _loc5_)
            {
               _loc4_.push(new TDPathPointVO(_loc3_,param1[_loc2_]));
               _loc3_++;
            }
            _loc2_++;
         }
         TDFloorManager.instance.removeMuds(_loc4_,2);
      }
      
      public function removeRoadById(param1:int) : void
      {
         TDFloorManager.instance.removePath(param1,1);
      }
      
      public function addRoadById(param1:int) : void
      {
         TDFloorManager.instance.addPath(param1,1);
      }
      
      public function showQuickSand(param1:Array) : void
      {
         var _loc9_:int = 0;
         var _loc10_:IGameObject = null;
         var _loc2_:int = DMath.randNum(1,param1.length);
         var _loc3_:int = param1[_loc2_ - 1];
         var _loc4_:int = 3;
         var _loc5_:int = _loc3_;
         var _loc6_:TDMapTileData = TDGameInfo.getInstance().getRoadTileInf(_loc4_,_loc5_);
         this.addNormalGameObjectByPos(TDConstant.UnitType_QuickSand,_loc6_.rect.x,_loc6_.rect.y + _loc6_.rect.height * 0.5);
         var _loc8_:int;
         var _loc7_:Array;
         if((_loc8_ = (_loc7_ = TDGameInfo.getInstance().getGameObjectMapByCatalg(TDConstant.UnitCatalog_Plant)).length) > 0)
         {
            _loc9_ = 0;
            while(_loc9_ < _loc8_)
            {
               if((_loc10_ = _loc7_[_loc9_]) != null && _loc10_.isVaild)
               {
                  if(_loc10_.objectModel.roadIndex >= _loc5_ - 1 && _loc10_.objectModel.roadIndex <= _loc5_ + 1)
                  {
                     if(_loc10_.objectModel.column >= 0 && _loc10_.objectModel.column <= _loc4_)
                     {
                        _loc10_.Dispose();
                     }
                  }
               }
               _loc9_++;
            }
         }
      }
      
      public function portalZombie(param1:int, param2:int, param3:int, param4:Boolean = false) : void
      {
         var _loc5_:TDUnitInitVO;
         (_loc5_ = new TDUnitInitVO()).init(TDConstant.UnitCatalog_Object,TDConstant.UnitType_PortalZombieEffect);
         _loc5_.setPosByColRow(param2,param3);
         var _loc6_:TDMapWaveEnemyData;
         (_loc6_ = new TDMapWaveEnemyData()).type = param1;
         _loc6_.roadIndex = param3;
         _loc6_.startCol = param2;
         _loc6_.hasFuel = param4;
         _loc5_.setExtraParam(TDConstant.Gameobject_Prop_InitUnitParam,_loc6_);
         this.addGameObjectByTDUnitInitVO(_loc5_);
      }
      
      public function addSeaSplashEffect(param1:Object) : void
      {
         (param1 as IGameObject).animation.setBoneVisibleRule(TDConstant.SplashEffect_BoneName,true);
      }
      
      public function removeSeaSplashEffect(param1:Object) : void
      {
         if(param1 && (param1 as IGameObject).animation)
         {
            (param1 as IGameObject).animation.setBoneVisibleRule(TDConstant.SplashEffect_BoneName,false);
         }
      }
      
      public function destoryObjByTile(param1:int, param2:int, param3:Boolean = true, param4:Boolean = true, param5:Boolean = true) : void
      {
         var _loc6_:Vector.<BasicPlant> = null;
         var _loc7_:BasicPlant = null;
         var _loc8_:TDMapTileData = null;
         var _loc9_:Array = null;
         var _loc10_:IGameObject = null;
         if(param3)
         {
            _loc6_ = TDGameInfo.getInstance().getPlantsAllByPos(param1,param2);
            for each(_loc7_ in _loc6_)
            {
               _loc7_.Dispose();
            }
         }
         if(param4)
         {
            if(_loc8_ = TDGameInfo.getInstance().getRoadTileInf(param2,param1))
            {
               _loc9_ = TDGameInfo.getInstance().getZombieList([param1],TDConstant.TDCamp_Enemy,true,true,param5,null,[TDConstant.ZombieCatalog_Boss]);
               for each(_loc10_ in _loc9_)
               {
                  if(_loc8_.rect.contains(_loc10_.x,_loc10_.y))
                  {
                     _loc10_.Dispose();
                  }
               }
            }
         }
      }
      
      private function addBuffByTileStatus(param1:BasicPlant, param2:TDMapTileData) : void
      {
         if(param2.hasState(TDConstant.RoadTileState_Poison))
         {
            if(param1.plantData.plantStaticInfo.id == 1500)
            {
               return;
            }
            param1.plantData.removeBuff(TDConstant.TDBuffID_Poisoned);
            param1.plantData.addBuff(TDConstant.TDBuffID_Poisoned,param1);
            param2.cleanState(TDConstant.RoadTileState_Poison);
         }
      }
      
      public function addSampleMower(param1:int, param2:Number, param3:Number) : void
      {
         var _loc4_:TDSampleMower = null;
         if(TDStageInfo.getInstance().startParam.gameType == TDStartParam.Yeti)
         {
            return;
         }
         if(TDGameInfo.getInstance().getMowerBoughtRecordByRoad(param1) < ServerConfigTemplateFactory.instance.getTDToyCarBuyTimes())
         {
            this.addGameObjectByPos(TDConstant.UnitCatalog_Object,TDObjTypeID.Obj_Sample_Mower,param2,param3);
            if(_loc4_ = TDGameInfo.getInstance().getGameObjctByUID(TDFactory.getLastUnitUin()) as TDSampleMower)
            {
               _loc4_.roadIndex = param1;
               TDGameInfo.getInstance().recordBoughtMower(param1);
            }
         }
      }
      
      public function cleanAllSampleMower() : void
      {
         var _loc2_:IGameObject = null;
         var _loc1_:Array = TDGameInfo.getInstance().getGameObjectMapByCatalgAndType(TDConstant.UnitCatalog_Object,TDObjTypeID.Obj_Sample_Mower);
         for each(_loc2_ in _loc1_)
         {
            _loc2_.Dispose();
         }
      }
   }
}
