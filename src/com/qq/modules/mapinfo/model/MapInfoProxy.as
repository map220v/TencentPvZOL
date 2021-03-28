package com.qq.modules.mapinfo.model
{
   import PVZ.Cmd.Cmd_City_ChangeArea_SC;
   import PVZ.Cmd.Cmd_City_Init_SC;
   import PVZ.Cmd.Cmd_City_RandomMove_SC;
   import PVZ.Cmd.Cmd_Outpost_GetAllyTeam_SC;
   import PVZ.Cmd.Cmd_Outpost_ReturnAllyTeam_SC;
   import PVZ.Cmd.Cmd_War_DeclareWar_SC;
   import PVZ.Cmd.Cmd_War_GetDeclareWarStat_SC;
   import PVZ.Cmd.Cmd_War_GetHistory_SC;
   import PVZ.Cmd.Cmd_War_GetMapHistory_SC;
   import PVZ.Cmd.Cmd_War_GetSimpleHistory_SC;
   import PVZ.Cmd.Cmd_War_RecallTeam_SC;
   import PVZ.Cmd.Cmd_War_SpeedUpTeam_SC;
   import PVZ.Cmd.Cmd_War_SyncHistory_SC;
   import PVZ.Cmd.Cmd_WorldMap_GetCellInfo_SC;
   import PVZ.Cmd.Cmd_WorldMap_GetCityInfo_SC;
   import PVZ.Cmd.Dto_War_History;
   import PVZ.Cmd.E_TeamState;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.modle.BasicProxy;
   import com.qq.modules.main.command.CommonCmd;
   import com.qq.modules.main.logic.initData.InitDataManager;
   import com.qq.modules.main.model.ActorModel;
   import com.qq.modules.map.model.vo.MapCityCellVO;
   import com.qq.modules.mapinfo.MapInfoGlobals;
   import com.qq.modules.mapinfo.command.MapInfoProxyCmd;
   import com.qq.modules.mapinfo.command.MapInfoViewCmd;
   import com.qq.modules.mapinfo.model.vo.MapInfoWarHistoryVO;
   import com.qq.templates.font.FontNormal;
   import flash.geom.Point;
   import tencent.io.service.events.SocketServiceEvent;
   
   public class MapInfoProxy extends BasicProxy
   {
       
      
      public var data:MapInfoData;
      
      [Inject]
      public var actor:ActorModel;
      
      private var m_totalDeclareCount:uint = 0;
      
      private var m_leftDeclareCount:uint = 0;
      
      public var beExiled:Boolean = false;
      
      public var needEnterMap:Boolean = false;
      
      public var lastCellVO:MapCityCellVO;
      
      public function MapInfoProxy()
      {
         this.data = new MapInfoData();
         super();
      }
      
      override public function init(param1:Array = null) : void
      {
         super.init(param1);
      }
      
      override public function listMsgInterests() : Array
      {
         return [[Cmd_War_SyncHistory_SC.$MessageID,this.onCmd_War_SyncHistory_SC],[Cmd_War_GetHistory_SC.$MessageID,this.onCmd_War_GetHistory_SC],[Cmd_War_GetMapHistory_SC.$MessageID,this.onCmd_War_GetMapHistory_SC],[Cmd_War_GetSimpleHistory_SC.$MessageID,this.onCmd_War_GetSimpleHistory_SC],[Cmd_City_Init_SC.$MessageID,this.onCmd_City_Init_SC],[Cmd_War_RecallTeam_SC.$MessageID,this.onCmd_War_RecallTeam_SC],[Cmd_WorldMap_GetCellInfo_SC.$MessageID,this.onCmd_WorldMap_GetCellInfo_SC],[Cmd_WorldMap_GetCityInfo_SC.$MessageID,this.onCmd_WorldMap_GetCityInfo_SC],[Cmd_Outpost_GetAllyTeam_SC.$MessageID,this.getAllyTeamHandler],[Cmd_War_DeclareWar_SC.$MessageID,this.onCmd_War_DeclareWar_SC],[Cmd_Outpost_ReturnAllyTeam_SC.$MessageID,this.returnAllyTeamHandler],[Cmd_City_ChangeArea_SC.$MessageID,this.onCmd_City_ChangeArea_SC],[Cmd_War_GetDeclareWarStat_SC.$MessageID,this.onCmd_War_GetDeclareWarStat_SC],[Cmd_City_RandomMove_SC.$MessageID,this.onCmd_City_RandomMove_SC],[Cmd_War_SpeedUpTeam_SC.$MessageID,this.onCmd_War_SpeedUpTeam_SC]];
      }
      
      private function onCmd_War_GetDeclareWarStat_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_War_GetDeclareWarStat_SC = param1.socketData as Cmd_War_GetDeclareWarStat_SC;
         this.m_totalDeclareCount = _loc2_.totalDeclareTimes;
         this.m_leftDeclareCount = _loc2_.leftDeclareTimes;
      }
      
      public function get totalDeclareCount() : uint
      {
         return this.m_totalDeclareCount;
      }
      
      public function get leftDeclareCount() : uint
      {
         return this.m_leftDeclareCount;
      }
      
      private function onCmd_City_ChangeArea_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_City_ChangeArea_SC = param1.socketData as Cmd_City_ChangeArea_SC;
         this.data.changeCityCD = _loc2_.changeCDEndTime;
      }
      
      private function onCmd_City_RandomMove_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_City_RandomMove_SC = param1.socketData as Cmd_City_RandomMove_SC;
         this.data.myPos = new Point(_loc2_.newPos.posX,_loc2_.newPos.posY);
         this.data.myAreaId = _loc2_.area;
         this.beExiled = _loc2_.beAttack;
         this.needEnterMap = true;
         MapInfoViewCmd.checkBeExiled();
      }
      
      private function getAllyTeamHandler(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Outpost_GetAllyTeam_SC = param1.socketData as Cmd_Outpost_GetAllyTeam_SC;
         this.data.setAllyTeam(_loc2_.allyTeam);
         this.dispatch(new CommonEvent(MapInfoGlobals.ALLY_INFO_AT_HOME_UPDATE));
      }
      
      private function returnAllyTeamHandler(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_Outpost_ReturnAllyTeam_SC = param1.socketData as Cmd_Outpost_ReturnAllyTeam_SC;
         this.data.removeAllyTeam(_loc2_.allyId,_loc2_.teamId);
         this.dispatch(new CommonEvent(MapInfoGlobals.ALLY_INFO_AT_HOME_UPDATE));
      }
      
      private function onCmd_WorldMap_GetCellInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_WorldMap_GetCellInfo_SC = param1.socketData as Cmd_WorldMap_GetCellInfo_SC;
         this.lastCellVO = new MapCityCellVO(_loc2_.cellInfo,this.actor.roleId);
         this.dispatch(new CommonEvent(MapInfoGlobals.MAP_INFO_ROLE_CELL_UPDATED,this.lastCellVO));
         MapInfoProxyCmd.getMapCityInfo(_loc2_.cellInfo.roleId);
      }
      
      private function onCmd_WorldMap_GetCityInfo_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_WorldMap_GetCityInfo_SC = param1.socketData as Cmd_WorldMap_GetCityInfo_SC;
         if(this.lastCellVO && this.lastCellVO.roleId.compare(_loc2_.roleId))
         {
            this.lastCellVO.loadCmd_WorldMap_GetCityInfo_SC(_loc2_);
            this.dispatch(new CommonEvent(MapInfoGlobals.MAP_INFO_ROLE_CELL_UPDATED,this.lastCellVO));
         }
      }
      
      private function onCmd_War_RecallTeam_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_War_RecallTeam_SC = param1.socketData as Cmd_War_RecallTeam_SC;
      }
      
      private function onCmd_City_Init_SC(param1:SocketServiceEvent) : void
      {
         var _loc2_:Cmd_City_Init_SC = param1.socketData as Cmd_City_Init_SC;
         this.data.myPos = new Point(_loc2_.rolePos.posX,_loc2_.rolePos.posY);
         this.data.myAreaId = _loc2_.area == 0 ? 1 : int(_loc2_.area);
         this.data.changeCityCD = _loc2_.changeCDEndTime;
         this.data.showNullCity = _loc2_.showNullCity;
         InitDataManager.getInstance().finishTask(InitDataManager.Init_MapInfo);
      }
      
      private function onCmd_War_DeclareWar_SC(param1:SocketServiceEvent) : void
      {
         this.m_leftDeclareCount = this.m_leftDeclareCount - 1;
         this.dispatch(new CommonEvent(MapInfoGlobals.ROLE_DECLARE_SUCCESS));
      }
      
      private function onCmd_War_SyncHistory_SC(param1:SocketServiceEvent) : void
      {
         var _loc3_:MapInfoWarHistoryVO = null;
         var _loc4_:int = 0;
         var _loc2_:Cmd_War_SyncHistory_SC = param1.socketData as Cmd_War_SyncHistory_SC;
         if(_loc2_.history.teamState == E_TeamState.E_TeamState_Home)
         {
            this.data.removeVOByDtoCompare(_loc2_.history);
         }
         else
         {
            _loc3_ = this.data.getVOByDtoCompare(_loc2_.history,true);
            if(_loc3_)
            {
               _loc3_.loadDto(this.actor.roleId,_loc2_.history);
            }
            else
            {
               _loc3_ = new MapInfoWarHistoryVO(this.actor.roleId,_loc2_.history);
               this.data.addVO(_loc3_,true);
            }
         }
         this.dispatch(new CommonEvent(MapInfoGlobals.MAP_INFO_DETAILED_HISTORIES_UPDATED,this.data.detailedHistories));
         _loc3_ = this.data.getVOByDtoCompare(_loc2_.history,false);
         if(_loc3_)
         {
            _loc3_.loadDto(this.actor.roleId,_loc2_.history);
         }
         else
         {
            _loc3_ = new MapInfoWarHistoryVO(this.actor.roleId,_loc2_.history);
            this.data.addVO(_loc3_,false);
         }
         _loc4_ = 0;
         while(_loc4_ < this.data.simpleHistories.length)
         {
            _loc3_ = this.data.simpleHistories[_loc4_];
            if(_loc3_.hasExpired)
            {
               this.data.simpleHistories.splice(_loc4_,1);
               _loc4_--;
            }
            _loc4_++;
         }
         while(this.data.simpleHistories.length > 3)
         {
            this.data.simpleHistories.shift();
         }
         this.dispatch(new CommonEvent(MapInfoGlobals.MAP_INFO_SIMPLE_HISTORIES_UPDATED,this.data.simpleHistories));
      }
      
      private function onCmd_War_GetHistory_SC(param1:SocketServiceEvent) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Dto_War_History = null;
         var _loc2_:Cmd_War_GetHistory_SC = param1.socketData as Cmd_War_GetHistory_SC;
         this.data.detailedHistories.length = 0;
         _loc3_ = 0;
         while(_loc3_ < _loc2_.historys.length)
         {
            _loc4_ = _loc2_.historys[_loc3_];
            this.data.detailedHistories.push(new MapInfoWarHistoryVO(this.actor.roleId,_loc4_));
            _loc3_++;
         }
         this.dispatch(new CommonEvent(MapInfoGlobals.MAP_INFO_DETAILED_HISTORIES_UPDATED,this.data.detailedHistories));
      }
      
      private function onCmd_War_GetMapHistory_SC(param1:SocketServiceEvent) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Dto_War_History = null;
         var _loc2_:Cmd_War_GetMapHistory_SC = param1.socketData as Cmd_War_GetMapHistory_SC;
         this.data.detailedHistories.length = 0;
         _loc3_ = 0;
         while(_loc3_ < _loc2_.historys.length)
         {
            _loc4_ = _loc2_.historys[_loc3_];
            this.data.detailedHistories.push(new MapInfoWarHistoryVO(this.actor.roleId,_loc4_));
            _loc3_++;
         }
         this.dispatch(new CommonEvent(MapInfoGlobals.MAP_INFO_DETAILED_HISTORIES_UPDATED,this.data.detailedHistories));
      }
      
      private function onCmd_War_GetSimpleHistory_SC(param1:SocketServiceEvent) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Dto_War_History = null;
         var _loc2_:Cmd_War_GetSimpleHistory_SC = param1.socketData as Cmd_War_GetSimpleHistory_SC;
         _loc2_.historys.sortOn("timeStamp");
         while(_loc2_.historys.length > 3)
         {
            _loc2_.historys.shift();
         }
         this.data.simpleHistories.length = 0;
         _loc3_ = 0;
         while(_loc3_ < _loc2_.historys.length)
         {
            _loc4_ = _loc2_.historys[_loc3_];
            this.data.simpleHistories.push(new MapInfoWarHistoryVO(this.actor.roleId,_loc4_));
            _loc3_++;
         }
         this.dispatch(new CommonEvent(MapInfoGlobals.MAP_INFO_SIMPLE_HISTORIES_UPDATED,this.data.simpleHistories));
      }
      
      private function onCmd_War_SpeedUpTeam_SC(param1:SocketServiceEvent) : void
      {
         CommonCmd.txtFly(FontNormal.MAP_SPEED_SUCCESS);
      }
   }
}
