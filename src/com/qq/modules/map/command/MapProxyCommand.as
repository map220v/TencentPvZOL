package com.qq.modules.map.command
{
   import PVZ.Cmd.Cmd_War_GetMapHistory_CS;
   import PVZ.Cmd.Cmd_WorldMap_GetInfo_CS;
   import PVZ.Cmd.Cmd_WorldMap_OperateStatInfo_CS;
   import PVZ.Cmd.Dto_WorldMap_CellInfo;
   import PVZ.Cmd.Dto_WorldMap_Pos;
   import asgui.core.Application;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.main.server.PvzSocketService;
   import com.qq.modules.map.MapGlobals;
   import com.qq.modules.map.model.MapProxy;
   import com.tencent.protobuf.Int64;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.clearTimeout;
   import flash.utils.getTimer;
   import flash.utils.setTimeout;
   import org.allencuilib.map.interfaces.IMapBackground;
   import org.as3commons.logging.api.getLogger;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class MapProxyCommand extends StrongRobotlegCommand
   {
      
      private static var lastCheckRequestAreaInfoTime:int;
      
      private static var checkRequestAreaInfoTimeout:uint;
       
      
      [Inject]
      public var server:PvzSocketService;
      
      [Inject]
      public var proxy:MapProxy;
      
      public function MapProxyCommand()
      {
         super();
      }
      
      public function checkRequestAreaInfo(param1:int, param2:int, param3:Boolean) : void
      {
         var _loc4_:int = getTimer();
         clearTimeout(checkRequestAreaInfoTimeout);
         checkRequestAreaInfoTimeout = setTimeout(this.doCheckRequestAreaInfo,200,param1,param2,param3);
         lastCheckRequestAreaInfoTime = _loc4_;
      }
      
      public function doCheckRequestAreaInfo(param1:int, param2:int, param3:Boolean) : void
      {
         var bg:IMapBackground = null;
         var rectNewData:Rectangle = null;
         var topLeft:Point = null;
         var bottomRight:Point = null;
         var leftBottom:Point = null;
         var rightTop:Point = null;
         var scrollX:int = param1;
         var scrollY:int = param2;
         var isEnterMap:Boolean = param3;
         var checkCell:Function = function(param1:Point):void
         {
            param1.x /= bg.data.xLength;
            param1.y /= bg.data.yLength;
            param1.x = Math.floor(param1.x);
            param1.y = Math.floor(param1.y);
         };
         if(this.proxy.hasDisposed)
         {
            return;
         }
         getLogger("map").info("[doCheckRequestAreaInfo] : " + scrollX + ", " + scrollY);
         bg = MapGlobals.bg;
         var rectScreen:Rectangle = MapGlobals.getViewPort(MapGlobals.MAP_VIEW_PORT_REQUEST_INNER,scrollX,scrollY);
         var rectData:Rectangle = this.proxy.getLastRequestArea();
         if(!rectData.containsRect(rectScreen))
         {
            rectNewData = MapGlobals.getViewPort(MapGlobals.MAP_VIEW_PORT_REQUEST_OUTTER,scrollX,scrollY);
            topLeft = bg.CoordToTile(rectNewData.topLeft);
            bottomRight = bg.CoordToTile(rectNewData.bottomRight);
            leftBottom = bg.CoordToTile(new Point(rectNewData.x,rectNewData.y + rectNewData.height));
            rightTop = bg.CoordToTile(new Point(rectNewData.x + rectNewData.width,rectNewData.y));
            checkCell(topLeft);
            checkCell(bottomRight);
            checkCell(leftBottom);
            checkCell(rightTop);
            this.proxy.setLastRequestArea(rectNewData);
            this.getMapAreaInfo(topLeft,rightTop,leftBottom,bottomRight,isEnterMap);
            this.proxy.data.caneraCenterPoint = MapGlobals.pointToCell(new Point(scrollX + Application.application.width / 2,scrollY + Application.application.height / 2));
            this.dispatch(new CommonEvent(MapGlobals.MAP_AFTER_CAMERA_TO));
         }
         if(this.proxy.scrollingLog)
         {
            this.proxy.scrollingLog.push(new Point(scrollX + bg.stageWidth / 2,scrollY + bg.stageHeight / 2));
         }
      }
      
      private function getMapAreaInfo(param1:Point, param2:Point, param3:Point, param4:Point, param5:Boolean) : void
      {
         var _loc6_:Cmd_WorldMap_GetInfo_CS;
         (_loc6_ = new Cmd_WorldMap_GetInfo_CS()).isEnterMap = param5;
         _loc6_.areaType = this.proxy.areaId;
         _loc6_.leftTop = new Dto_WorldMap_Pos();
         _loc6_.leftTop.posX = int(param1.x);
         _loc6_.leftTop.posY = int(param1.y);
         _loc6_.rightBottom = new Dto_WorldMap_Pos();
         _loc6_.rightBottom.posX = int(param4.x);
         _loc6_.rightBottom.posY = int(param4.y);
         _loc6_.rightTop = new Dto_WorldMap_Pos();
         _loc6_.rightTop.posX = int(param2.x);
         _loc6_.rightTop.posY = int(param2.y);
         _loc6_.leftBottom = new Dto_WorldMap_Pos();
         _loc6_.leftBottom.posX = int(param3.x);
         _loc6_.leftBottom.posY = int(param3.y);
         this.server.sendMessage(_loc6_);
      }
      
      private function createDto_WorldMap_CellInfo(param1:Point, param2:Point) : Dto_WorldMap_CellInfo
      {
         var _loc3_:Dto_WorldMap_CellInfo = new Dto_WorldMap_CellInfo();
         _loc3_.roleId = new Int64(Math.random() * 1000);
         _loc3_.type = 1;
         _loc3_.roleName = _loc3_.roleId.toString(16);
         _loc3_.pos = new Dto_WorldMap_Pos();
         _loc3_.pos.posX = param1.x + (param2.x - param1.x) * Math.random();
         _loc3_.pos.posY = param1.y + (param2.y - param1.y) * Math.random();
         return _loc3_;
      }
      
      public function getArmyRelativeInfo() : void
      {
         var _loc1_:Cmd_War_GetMapHistory_CS = new Cmd_War_GetMapHistory_CS();
         this.server.sendMessage(_loc1_);
      }
      
      public function sendLogOperateToSvr() : void
      {
         var _loc1_:Rectangle = null;
         var _loc2_:Point = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Application = null;
         var _loc6_:Cmd_WorldMap_OperateStatInfo_CS = null;
         if(this.proxy.scrollingLog.length > 0)
         {
            _loc1_ = new Rectangle(this.proxy.scrollingLog[0].x,this.proxy.scrollingLog[0].y);
            _loc4_ = this.proxy.scrollingLog.length;
            while(_loc3_ < _loc4_)
            {
               _loc2_ = this.proxy.scrollingLog[_loc3_];
               if(_loc2_.x < _loc1_.x)
               {
                  _loc1_.x = _loc2_.x;
               }
               if(_loc2_.y < _loc1_.y)
               {
                  _loc1_.y = _loc2_.y;
               }
               if(_loc2_.x > _loc1_.right)
               {
                  _loc1_.right = _loc2_.x;
               }
               if(_loc2_.y > _loc1_.bottom)
               {
                  _loc1_.bottom = _loc2_.y;
               }
               _loc3_++;
            }
            _loc5_ = Application.application;
            _loc1_.left -= _loc5_.width / 2;
            _loc1_.top -= _loc5_.height / 2;
            _loc1_.right += _loc5_.width / 2;
            _loc1_.bottom += _loc5_.height / 2;
            (_loc6_ = new Cmd_WorldMap_OperateStatInfo_CS()).operateTimes = _loc4_;
            _loc6_.resolutionX = _loc5_.width;
            _loc6_.resolutionY = _loc5_.height;
            _loc2_ = MapGlobals.pointToCell(_loc1_.topLeft);
            _loc6_.leftTop = new Dto_WorldMap_Pos();
            _loc6_.leftTop.posX = _loc2_.x;
            _loc6_.leftTop.posY = _loc2_.y;
            _loc2_ = MapGlobals.pointToCell(new Point(_loc1_.right,_loc1_.top));
            _loc6_.rightTop = new Dto_WorldMap_Pos();
            _loc6_.rightTop.posX = _loc2_.x;
            _loc6_.rightTop.posY = _loc2_.y;
            _loc2_ = MapGlobals.pointToCell(new Point(_loc1_.left,_loc1_.bottom));
            _loc6_.leftBottom = new Dto_WorldMap_Pos();
            _loc6_.leftBottom.posX = _loc2_.x;
            _loc6_.leftBottom.posY = _loc2_.y;
            _loc2_ = MapGlobals.pointToCell(_loc1_.bottomRight);
            _loc6_.rightBottom = new Dto_WorldMap_Pos();
            _loc6_.rightBottom.posX = _loc2_.x;
            _loc6_.rightBottom.posY = _loc2_.y;
            this.server.sendMessage(_loc6_);
            this.proxy.scrollingLog.length = 0;
         }
      }
   }
}
