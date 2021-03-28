package com.qq.modules.map.model
{
   import PVZ.Cmd.Cmd_City_FixedMove_SC;
   import PVZ.Cmd.Cmd_Mine_StateChange_SC;
   import PVZ.Cmd.Cmd_Outpost_GetAllyTeam_SC;
   import PVZ.Cmd.Cmd_War_DeclareWar_SC;
   import PVZ.Cmd.Cmd_War_GetMapHistory_SC;
   import PVZ.Cmd.Cmd_War_SyncHistory_SC;
   import PVZ.Cmd.Cmd_WorldMap_GetCityInfo_SC;
   import PVZ.Cmd.Cmd_WorldMap_GetInfo_SC;
   import PVZ.Cmd.Dto_War_History;
   import PVZ.Cmd.Dto_WorldMap_CellInfo;
   import PVZ.Cmd.Dto_WorldMap_MineCar;
   import PVZ.Cmd.Dto_WorldMap_Pos;
   import PVZ.Cmd.E_MineHoldState;
   import PVZ.Cmd.E_MineStateChange;
   import PVZ.Cmd.E_TeamState;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.main.model.ActorModel;
   import com.qq.modules.map.MapGlobals;
   import com.qq.modules.map.command.MapViewCmd;
   import com.qq.modules.map.model.templates.MapCellSkinTemplate;
   import com.qq.modules.map.model.templates.MapTemplateFactory;
   import com.qq.modules.map.model.templates.MapTempleTemplate;
   import com.qq.modules.map.model.vo.MapBasicCellVO;
   import com.qq.modules.map.model.vo.MapCityBuildingCellVO;
   import com.qq.modules.map.model.vo.MapCityCellVO;
   import com.qq.modules.map.model.vo.MapMineCartVO;
   import com.qq.modules.map.model.vo.MapMineCellVO;
   import com.qq.modules.map.model.vo.MapTempleCellVO;
   import com.qq.modules.mapinfo.model.MapInfoProxy;
   import com.qq.modules.mapinfo.model.vo.MapInfoWarHistoryVO;
   import com.qq.modules.union.model.UnionModel;
   import com.tencent.protobuf.Int64;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import org.allencuilib.map.tiled.graphics.TiledObjectData;
   import org.as3commons.logging.api.getLogger;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class MapProxy extends BasicProxy
   {
       
      
      public var data:MapData;
      
      [Inject]
      public var infoProxy:MapInfoProxy;
      
      [Inject]
      public var unionModel:UnionModel;
      
      [Inject]
      public var actor:ActorModel;
      
      public var scrollingLog:Vector.<Point>;
      
      public var areaId:int = 0;
      
      private var lastRequestArea:Rectangle;
      
      public function MapProxy()
      {
         this.data = new MapData();
         this.scrollingLog = new Vector.<Point>();
         this.lastRequestArea = new Rectangle();
         super();
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
         if(this.infoProxy.data.nextMapInitPos)
         {
            this.data.initPos = this.infoProxy.data.nextMapInitPos;
            this.infoProxy.data.nextMapInitPos = null;
         }
         else
         {
            this.data.initPos = this.infoProxy.data.myPos;
         }
         this.areaId = param1[0];
         MapGlobals.myAllianceId = !!this.unionModel.playerUnionInfo.isVaild() ? this.unionModel.playerUnionInfo.id : null;
      }
      
      override public function listMsgInterests() : Array
      {
         return [[Cmd_War_SyncHistory_SC.$MessageID,this.onCmd_War_SyncHistory_SC],[Cmd_WorldMap_GetInfo_SC.$MessageID,this.onCmd_Map_GetInfo_SC],[Cmd_WorldMap_GetCityInfo_SC.$MessageID,this.onCmd_WorldMap_GetCityInfo_SC],[Cmd_War_DeclareWar_SC.$MessageID,this.onCmd_War_DeclareWar_SC],[Cmd_War_GetMapHistory_SC.$MessageID,this.onCmd_War_GetMapHistory_SC],[Cmd_City_FixedMove_SC.$MessageID,this.onCmd_City_FixedMove_SC],[Cmd_Mine_StateChange_SC.$MessageID,this.onCmd_Mine_StateChange_SC],[Cmd_Outpost_GetAllyTeam_SC.$MessageID,this.onCmd_Outpost_GetAllyTeam_SC]];
      }
      
      private function onCmd_Outpost_GetAllyTeam_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Outpost_GetAllyTeam_SC = param1.socketData as Cmd_Outpost_GetAllyTeam_SC;
      }
      
      private function onCmd_City_FixedMove_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_City_FixedMove_SC = param1.socketData as Cmd_City_FixedMove_SC;
         this.data.initPos = this.infoProxy.data.myPos = new Point(_loc2_.newPos.posX,_loc2_.newPos.posY);
         this.areaId = this.infoProxy.data.myAreaId = _loc2_.area;
         MapViewCmd.hideCityBuildingTag(true);
         this.setLastRequestArea(new Rectangle());
         MapViewCmd.cameraToCell(this.data.initPos);
      }
      
      private function onCmd_Mine_StateChange_SC(param1:SocketServiceEvent) : void
      {
         var _loc8_:MapMineCartVO = null;
         var _loc9_:Dto_WorldMap_MineCar = null;
         var _loc2_:Vector.<MapBasicCellVO> = new Vector.<MapBasicCellVO>();
         var _loc3_:Vector.<MapBasicCellVO> = new Vector.<MapBasicCellVO>();
         var _loc4_:Vector.<MapBasicCellVO> = new Vector.<MapBasicCellVO>();
         var _loc5_:Cmd_Mine_StateChange_SC = param1.socketData as Cmd_Mine_StateChange_SC;
         var _loc6_:MapCityCellVO = this.data.getCellVoByPos(_loc5_.rolePos.posX,_loc5_.rolePos.posY) as MapCityCellVO;
         var _loc7_:MapMineCellVO = this.data.getCellVoByPos(_loc5_.minePos.posX,_loc5_.minePos.posY) as MapMineCellVO;
         if(_loc5_.type == E_MineStateChange.E_MineStateChange_Hold || _loc5_.type == E_MineStateChange.E_MineStateChange_Mining)
         {
            (_loc9_ = new Dto_WorldMap_MineCar()).harverst = 0;
            _loc9_.maxHarverst = 10000;
            _loc9_.minePos = new Dto_WorldMap_Pos();
            _loc9_.minePos = _loc5_.minePos;
            if(_loc6_)
            {
               _loc8_ = _loc6_.addCartByDto(_loc9_);
               _loc2_.push(_loc6_);
               if(_loc7_)
               {
                  _loc7_.addCart(_loc8_,_loc6_);
                  _loc2_.push(_loc7_);
               }
            }
         }
         else if(_loc5_.type == E_MineStateChange.E_MineStateChange_Collect)
         {
            if(_loc6_)
            {
               if(_loc8_ = _loc6_.getCartAt(_loc5_.minePos.posX,_loc5_.minePos.posY))
               {
                  _loc2_.push(_loc6_);
               }
               if(_loc7_)
               {
                  if(_loc8_ = _loc7_.getCartByFromCity(_loc6_))
                  {
                     _loc2_.push(_loc7_);
                  }
               }
            }
         }
         else if(_loc5_.type == E_MineStateChange.E_MineStateChange_CancelMining)
         {
            if(_loc6_)
            {
               _loc6_.removeCartAt(_loc5_.minePos.posX,_loc5_.minePos.posY);
               _loc2_.push(_loc6_);
               if(_loc7_)
               {
                  _loc7_.removeCartByFromCity(_loc6_);
                  _loc2_.push(_loc7_);
               }
            }
         }
         if(_loc2_.length != 0)
         {
            this.dispatch(new CommonEvent(MapGlobals.MAP_CELLS_IN_AREA_MODIFIED,_loc2_));
         }
      }
      
      public function updateCellInArea(param1:Vector.<Dto_WorldMap_CellInfo> = null, param2:Vector.<MapBasicCellVO> = null) : void
      {
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Dto_WorldMap_CellInfo = null;
         var _loc11_:Dto_WorldMap_CellInfo = null;
         var _loc12_:MapBasicCellVO = null;
         var _loc13_:MapBasicCellVO = null;
         var _loc15_:TiledObjectData = null;
         var _loc16_:MapMineCellVO = null;
         var _loc17_:MapTempleTemplate = null;
         var _loc18_:Dto_WorldMap_MineCar = null;
         var _loc19_:Vector.<TiledObjectData> = null;
         var _loc20_:Array = null;
         var _loc21_:MapCellSkinTemplate = null;
         var _loc22_:Vector.<MapCityBuildingCellVO> = null;
         var _loc23_:MapBasicCellVO = null;
         var _loc24_:MapCityCellVO = null;
         var _loc25_:MapMineCartVO = null;
         var _loc3_:Vector.<MapBasicCellVO> = new Vector.<MapBasicCellVO>();
         var _loc4_:Vector.<MapBasicCellVO> = new Vector.<MapBasicCellVO>();
         var _loc5_:Vector.<MapBasicCellVO> = new Vector.<MapBasicCellVO>();
         var _loc6_:Vector.<MapBasicCellVO> = new Vector.<MapBasicCellVO>();
         var _loc14_:Vector.<MapBasicCellVO> = this.data.mapCellsInArea;
         if(param1)
         {
            _loc7_ = 0;
            while(_loc7_ < param1.length)
            {
               if((_loc10_ = param1[_loc7_]).type == MapGlobals.MAP_CELL_TYPE_TEMPLE)
               {
                  _loc17_ = MapTemplateFactory.instance.getMapTempleTemplateById(_loc10_.templeId);
                  _loc10_.pos = new Dto_WorldMap_Pos();
                  _loc10_.pos.posX = _loc17_.getPos().x;
                  _loc10_.pos.posY = _loc17_.getPos().y;
                  if(_loc17_.type == 1)
                  {
                     _loc10_.avatar = 12;
                  }
                  else if(_loc17_.type == 2)
                  {
                     _loc10_.avatar = 11;
                  }
               }
               else if(_loc10_.type == MapGlobals.MAP_CELL_TYPE_CITY)
               {
                  _loc8_ = 0;
                  while(_loc8_ < _loc10_.mineCar.length)
                  {
                     _loc18_ = _loc10_.mineCar[_loc8_];
                     _loc9_ = 0;
                     while(_loc9_ < param1.length)
                     {
                        if((_loc11_ = param1[_loc9_]).type == MapGlobals.MAP_CELL_TYPE_MINE && _loc11_.pos.posX == _loc18_.minePos.posX && _loc11_.pos.posY == _loc18_.minePos.posY)
                        {
                           break;
                        }
                        _loc9_++;
                     }
                     if(_loc9_ == param1.length)
                     {
                        (_loc11_ = new Dto_WorldMap_CellInfo()).type = MapGlobals.MAP_CELL_TYPE_MINE;
                        _loc11_.roleId = new Int64();
                        _loc11_.pos = _loc18_.minePos;
                        _loc11_.mineState = E_MineHoldState.E_MineHoldState_EnemyHold;
                        _loc11_.guildFlag = _loc10_.guildFlag;
                        param1.push(_loc11_);
                     }
                     _loc8_++;
                  }
               }
               _loc7_++;
            }
         }
         if(this.infoProxy.data.showNullCity)
         {
            if(param2 == null)
            {
               param2 = new Vector.<MapBasicCellVO>();
            }
            _loc19_ = MapGlobals.bg.data.GetObjectDatasByRangeAndType(this.lastRequestArea,MapGlobals.MAP_OBJECT_TYPE);
            _loc20_ = [];
            _loc22_ = new Vector.<MapCityBuildingCellVO>();
            _loc7_ = 0;
            for(; _loc7_ < _loc19_.length; _loc7_++)
            {
               _loc15_ = _loc19_[_loc7_];
               if(MapTemplateFactory.instance.checkPosValid(_loc15_.cellX,_loc15_.cellY,this.areaId) != false)
               {
                  if(param1)
                  {
                     _loc8_ = 0;
                     while(_loc8_ < param1.length)
                     {
                        _loc10_ = param1[_loc8_];
                        if(!_loc20_[_loc10_.type])
                        {
                           _loc20_[_loc10_.type] = MapTemplateFactory.instance.getMapCellPropTemplateById(_loc10_.type).skinTemplate;
                        }
                        if((_loc21_ = _loc20_[_loc10_.type]).contain(new Point(_loc10_.pos.posX,_loc10_.pos.posY),new Point(_loc15_.cellX,_loc15_.cellY)))
                        {
                           break;
                        }
                        _loc8_++;
                     }
                     if(_loc8_ != param1.length)
                     {
                        continue;
                     }
                  }
                  if(param2)
                  {
                     _loc8_ = 0;
                     while(_loc8_ < param2.length)
                     {
                        if((_loc12_ = param2[_loc8_]).compareTiledObjectData(_loc15_))
                        {
                           break;
                        }
                        _loc8_++;
                     }
                     if(_loc8_ != param2.length)
                     {
                        continue;
                     }
                  }
                  _loc22_.push(new MapCityBuildingCellVO(_loc19_[_loc7_]));
               }
            }
            getLogger("map").info("ShowingCityBuildingTag   点总数 : " + _loc19_.length + ", 实际总数 : " + _loc22_.length);
            param2 = param2.concat(_loc22_);
         }
         if(param1 != null)
         {
            _loc7_ = 0;
            while(_loc7_ < param1.length)
            {
               _loc10_ = param1[_loc7_];
               _loc8_ = 0;
               while(_loc8_ < _loc14_.length)
               {
                  if((_loc12_ = _loc14_[_loc8_]).compareDTO(_loc10_))
                  {
                     _loc12_.loadDto(_loc10_);
                     _loc3_.push(_loc12_);
                     _loc6_.push(_loc12_);
                     break;
                  }
                  _loc8_++;
               }
               if(_loc8_ == _loc14_.length)
               {
                  _loc12_ = this.createCellVoByDto(_loc10_);
                  _loc4_.push(_loc12_);
                  _loc6_.push(_loc12_);
               }
               _loc7_++;
            }
         }
         if(param2 != null)
         {
            _loc7_ = 0;
            while(_loc7_ < param2.length)
            {
               _loc23_ = param2[_loc7_];
               _loc8_ = 0;
               while(_loc8_ < _loc14_.length)
               {
                  if((_loc12_ = _loc14_[_loc8_]).compare(_loc23_))
                  {
                     _loc12_.loadVo(_loc23_);
                     _loc3_.push(_loc12_);
                     if(_loc12_.isRealCell)
                     {
                        _loc6_.push(_loc12_);
                     }
                     break;
                  }
                  _loc8_++;
               }
               if(_loc8_ == _loc14_.length)
               {
                  _loc4_.push(_loc23_);
                  _loc6_.push(_loc23_);
               }
               _loc7_++;
            }
         }
         _loc8_ = 0;
         while(_loc8_ < _loc14_.length)
         {
            _loc12_ = _loc14_[_loc8_];
            _loc7_ = 0;
            while(_loc7_ < _loc6_.length)
            {
               if(_loc12_.compare(_loc6_[_loc7_]))
               {
                  break;
               }
               _loc7_++;
            }
            if(_loc7_ == _loc6_.length)
            {
               _loc5_.push(_loc12_);
            }
            _loc8_++;
         }
         _loc8_ = 0;
         while(_loc8_ < _loc6_.length)
         {
            if((_loc12_ = _loc6_[_loc8_]).type == MapGlobals.MAP_CELL_TYPE_MINE)
            {
               (_loc16_ = _loc12_ as MapMineCellVO).resetCarts();
            }
            _loc8_++;
         }
         _loc8_ = 0;
         while(_loc8_ < _loc6_.length)
         {
            if((_loc12_ = _loc6_[_loc8_]).type == MapGlobals.MAP_CELL_TYPE_CITY)
            {
               _loc24_ = _loc12_ as MapCityCellVO;
               _loc7_ = 0;
               while(_loc7_ < _loc24_.carts.length)
               {
                  _loc25_ = _loc24_.carts[_loc7_];
                  _loc9_ = 0;
                  while(_loc9_ < _loc6_.length)
                  {
                     if((_loc13_ = _loc6_[_loc9_]).type == MapGlobals.MAP_CELL_TYPE_MINE && _loc13_.pos.equals(_loc25_.pos))
                     {
                        (_loc16_ = _loc13_ as MapMineCellVO).addCart(_loc25_,_loc24_);
                        break;
                     }
                     _loc9_++;
                  }
                  _loc7_++;
               }
            }
            _loc8_++;
         }
         this.data.mapCellsInArea = _loc6_;
         if(_loc3_.length != 0)
         {
            this.dispatch(new CommonEvent(MapGlobals.MAP_CELLS_IN_AREA_MODIFIED,_loc3_));
         }
         if(_loc4_.length != 0)
         {
            this.dispatch(new CommonEvent(MapGlobals.MAP_CELLS_IN_AREA_ADDED,_loc4_));
         }
         if(_loc5_.length != 0)
         {
            this.dispatch(new CommonEvent(MapGlobals.MAP_CELLS_IN_AREA_REMOVED,_loc5_));
         }
         getLogger("map").info("MAP_CELLS_UPDATED\tTOTAL：" + _loc6_.length + ", \tMODIFIED：" + _loc3_.length + ", ADDED : " + _loc4_.length + ", REMOVED : " + _loc5_.length);
         this.dispatch(new CommonEvent(MapGlobals.MAP_CELLS_IN_AREA_UPDATED,_loc6_));
      }
      
      private function onCmd_Map_GetInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_WorldMap_GetInfo_SC = param1.socketData as Cmd_WorldMap_GetInfo_SC;
         getLogger("map").info("[onCmd_Map_GetInfo_SC]    cellList.length : " + _loc2_.cellList.length);
         var _loc3_:Vector.<Dto_WorldMap_CellInfo> = Vector.<Dto_WorldMap_CellInfo>(_loc2_.cellList);
         this.updateCellInArea(_loc3_);
      }
      
      private function onCmd_WorldMap_GetCityInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc4_:Vector.<MapBasicCellVO> = null;
         var _loc2_:Cmd_WorldMap_GetCityInfo_SC = param1.socketData as Cmd_WorldMap_GetCityInfo_SC;
         var _loc3_:MapCityCellVO = this.data.getCellVoByRoleId(_loc2_.roleId) as MapCityCellVO;
         if(_loc3_)
         {
            _loc3_.loadCmd_WorldMap_GetCityInfo_SC(_loc2_);
            if((_loc4_ = Vector.<MapBasicCellVO>([_loc3_])).length != 0)
            {
               this.dispatch(new CommonEvent(MapGlobals.MAP_CELLS_IN_AREA_MODIFIED,_loc4_));
            }
            this.dispatch(new CommonEvent(MapGlobals.MAP_CELLS_IN_AREA_UPDATED,this.data.mapCellsInArea));
         }
      }
      
      private function onCmd_War_DeclareWar_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_War_DeclareWar_SC = param1.socketData as Cmd_War_DeclareWar_SC;
         var _loc3_:MapCityCellVO = this.data.getCellVoByRoleId(_loc2_.roleId) as MapCityCellVO;
         if(_loc3_)
         {
            _loc3_.loadCmd_War_DeclareWar_SC(_loc2_);
            this.dispatch(new CommonEvent(MapGlobals.MAP_CELLS_IN_AREA_MODIFIED,Vector.<MapBasicCellVO>([_loc3_])));
            this.dispatch(new CommonEvent(MapGlobals.MAP_CELLS_IN_AREA_UPDATED,this.data.mapCellsInArea));
         }
      }
      
      public function getLastRequestArea() : Rectangle
      {
         return this.lastRequestArea;
      }
      
      public function setLastRequestArea(param1:Rectangle) : void
      {
         this.lastRequestArea = param1;
      }
      
      private function onCmd_War_GetMapHistory_SC(param1:SocketServiceEvent) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Dto_War_History = null;
         var _loc2_:Cmd_War_GetMapHistory_SC = param1.socketData as Cmd_War_GetMapHistory_SC;
         this.data.armyRelatived.length = 0;
         _loc3_ = 0;
         while(_loc3_ < _loc2_.historys.length)
         {
            if((_loc4_ = _loc2_.historys[_loc3_]).teamState != E_TeamState.E_TeamState_Guarding && _loc4_.teamState != E_TeamState.E_TeamState_Home && _loc4_.areaId == this.areaId)
            {
               this.data.armyRelatived.push(new MapInfoWarHistoryVO(this.actor.roleId,_loc4_));
            }
            _loc3_++;
         }
         this.dispatch(new CommonEvent(MapGlobals.MAP_ARMYS_RELATIVED_UPDATED,this.data.armyRelatived));
      }
      
      private function onCmd_War_SyncHistory_SC(param1:SocketServiceEvent) : void
      {
         var _loc3_:MapInfoWarHistoryVO = null;
         var _loc4_:int = 0;
         var _loc2_:Cmd_War_SyncHistory_SC = param1.socketData as Cmd_War_SyncHistory_SC;
         if(_loc2_.history.areaId == this.areaId)
         {
            if(_loc2_.history.teamState == E_TeamState.E_TeamState_Home || _loc2_.history.teamState == E_TeamState.E_TeamState_Guarding)
            {
               this.data.removeVOByDtoCompare(_loc2_.history);
            }
            else
            {
               _loc3_ = this.data.getVOByDtoCompare(_loc2_.history);
               if(_loc3_)
               {
                  _loc3_.loadDto(this.actor.roleId,_loc2_.history);
               }
               else
               {
                  this.data.armyRelatived.push(new MapInfoWarHistoryVO(this.actor.roleId,_loc2_.history));
               }
            }
            this.dispatch(new CommonEvent(MapGlobals.MAP_ARMYS_RELATIVED_UPDATED,this.data.armyRelatived));
         }
      }
      
      private function createCellVoByDto(param1:Dto_WorldMap_CellInfo) : MapBasicCellVO
      {
         switch(param1.type)
         {
            case MapGlobals.MAP_CELL_TYPE_CITY:
               return new MapCityCellVO(param1,this.actor.roleId);
            case MapGlobals.MAP_CELL_TYPE_MINE:
               return new MapMineCellVO(param1,this.actor.roleId);
            case MapGlobals.MAP_CELL_TYPE_TEMPLE:
               return new MapTempleCellVO(param1,this.actor.roleId);
            default:
               return null;
         }
      }
   }
}
