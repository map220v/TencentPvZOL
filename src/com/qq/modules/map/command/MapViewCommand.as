package com.qq.modules.map.command
{
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.main.command.CommonCmd;
   import com.qq.modules.main.command.GameFlowCmd;
   import com.qq.modules.map.MapGlobals;
   import com.qq.modules.map.model.MapProxy;
   import com.qq.modules.map.model.vo.MapBasicCellVO;
   import com.qq.modules.map.model.vo.MapMineCellVO;
   import com.qq.modules.map.model.vo.MapTempleCellVO;
   import com.qq.modules.mapinfo.command.MapInfoProxyCmd;
   import com.qq.modules.mapinfo.model.MapInfoProxy;
   import com.qq.modules.mapinfo.model.vo.MapInfoWarHistoryVO;
   import com.qq.modules.mine.command.MineViewCmd;
   import com.qq.modules.temple.command.TempleViewCmd;
   import flash.geom.Point;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class MapViewCommand extends StrongRobotlegCommand
   {
       
      
      [Inject]
      public var proxy:MapProxy;
      
      [Inject]
      public var infoProxy:MapInfoProxy;
      
      public function MapViewCommand()
      {
         super();
      }
      
      public function cameraToCell(param1:Point, param2:int = 0) : void
      {
         var _loc3_:Point = null;
         if(param2 == 0 || this.proxy.areaId == param2)
         {
            this.proxy.data.initPos = param1;
            _loc3_ = MapGlobals.cellToPoint(param1);
            this.dispatch(new CommonEvent(MapGlobals.MAP_CAMERA_TO,_loc3_));
            MapProxyCmd.sendLogOperateToSvr();
         }
         else
         {
            this.infoProxy.data.nextMapInitPos = param1;
            GameFlowCmd.gotoMap(param2);
         }
      }
      
      public function cameraToMapInfoWarHistoryVO(param1:Object) : void
      {
         var _loc2_:MapInfoWarHistoryVO = param1 as MapInfoWarHistoryVO;
         var _loc3_:Point = _loc2_.getCurrentCell();
         if(_loc3_)
         {
            this.cameraToCell(_loc3_);
         }
      }
      
      public function showCityBuildingTag(param1:Boolean = true) : void
      {
         this.infoProxy.data.showNullCity = true;
         if(param1)
         {
            this.proxy.updateCellInArea(null,this.proxy.data.mapCellsInArea);
         }
      }
      
      public function hideCityBuildingTag(param1:Boolean = true) : void
      {
         var _loc2_:int = 0;
         var _loc4_:MapBasicCellVO = null;
         this.infoProxy.data.showNullCity = false;
         MapInfoProxyCmd.changeShowNullCity(false);
         var _loc3_:Vector.<MapBasicCellVO> = this.proxy.data.mapCellsInArea.concat();
         _loc2_ = 0;
         while(_loc2_ < _loc3_.length)
         {
            if((_loc4_ = _loc3_[_loc2_]).type == MapGlobals.MAP_CELL_TYPE_CITY_BUILDING_TAG)
            {
               _loc3_.splice(_loc2_,1);
               _loc2_--;
            }
            _loc2_++;
         }
         if(param1)
         {
            this.proxy.updateCellInArea(null,_loc3_);
         }
      }
      
      public function showMineWnd(param1:Object) : void
      {
         var _loc2_:MapMineCellVO = param1 as MapMineCellVO;
         CommonCmd.showLoading();
         MineViewCmd.openMineInfo(_loc2_.pos.x,_loc2_.pos.y);
      }
      
      public function showTempleWnd(param1:Object) : void
      {
         var _loc2_:MapTempleCellVO = param1 as MapTempleCellVO;
         CommonCmd.showLoading();
         TempleViewCmd.openTempleWindow(_loc2_.pos.x,_loc2_.pos.y,this.proxy.areaId);
      }
   }
}
