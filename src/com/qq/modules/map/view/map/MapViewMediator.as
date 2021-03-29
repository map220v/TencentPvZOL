package com.qq.modules.map.view.map
{
   import asgui.core.Application;
   import asgui.managers.ToolTipManager;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.map.MapGlobals;
   import com.qq.modules.map.command.MapProxyCmd;
   import com.qq.modules.map.command.MapViewCmd;
   import com.qq.modules.map.model.MapProxy;
   import com.qq.modules.map.model.vo.MapBasicCellVO;
   import com.qq.modules.map.model.vo.MapMineCellVO;
   import com.qq.modules.mapinfo.command.MapInfoProxyCmd;
   import com.qq.modules.mapinfo.command.MapInfoViewCmd;
   import com.qq.modules.mapinfo.model.MapInfoProxy;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.allencuilib.map.events.MapRoleEvent;
   import org.allencuilib.map.events.MapStageEvent;
   import org.as3commons.logging.api.getLogger;
   
   public class MapViewMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:MapView;
      
      [Inject]
      public var proxy:MapProxy;
      
      [Inject]
      public var infoProxy:MapInfoProxy;
      
      public var isOver:Boolean;
      
      private var checkAreaRequestTimeout:uint;
      
      public function MapViewMediator()
      {
         super();
      }
      
      private static function createCellByVo(param1:MapBasicCellVO) : MapBasicCell
      {
         var _loc2_:MapBasicCell = null;
         switch(param1.type)
         {
            case MapGlobals.MAP_CELL_TYPE_CITY:
               _loc2_ = new MapCityCell();
               break;
            case MapGlobals.MAP_CELL_TYPE_MINE:
               _loc2_ = new MapMineCell();
               break;
            case MapGlobals.MAP_CELL_TYPE_TEMPLE:
               _loc2_ = new MapTempleCell();
               break;
            case MapGlobals.MAP_CELL_TYPE_CITY_BUILDING_TAG:
            default:
               _loc2_ = new MapBasicCell();
         }
         return _loc2_;
      }
      
      override protected function init() : void
      {
         super.init();
      }
      
      override public function dispose() : void
      {
         MapTroopManager.instance.Dispose();
         super.dispose();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         this.addContextListener(MapGlobals.MAP_CELLS_IN_AREA_MODIFIED,this.onMAP_CELLS_IN_AREA_MODIFIED);
         this.addContextListener(MapGlobals.MAP_CELLS_IN_AREA_ADDED,this.onMAP_CELLS_IN_AREA_ADDED);
         this.addContextListener(MapGlobals.MAP_CELLS_IN_AREA_REMOVED,this.onMAP_CELLS_IN_AREA_REMOVED);
         this.addContextListener(MapGlobals.MAP_CELLS_IN_AREA_UPDATED,this.onMAP_CELLS_IN_AREA_UPDATED);
         this.addContextListener(MapGlobals.MAP_ARMYS_RELATIVED_UPDATED,this.onMAP_ARMYS_RELATIVED_UPDATED);
         this.addContextListener(MapGlobals.MAP_CAMERA_TO,this.onMAP_CAMERA_TO);
      }
      
      private function onMAP_CAMERA_TO(param1:CommonEvent) : void
      {
         var _loc2_:Point = param1.param as Point;
         _loc2_.x -= Application.application.width / 2;
         _loc2_.y -= Application.application.height / 2;
         this.view.stg.CameraTo(_loc2_.x,_loc2_.y);
      }
      
      private function onMAP_ARMYS_RELATIVED_UPDATED(param1:CommonEvent) : void
      {
         MapTroopManager.instance.update(this.proxy.data.armyRelatived);
      }
      
      public function onDataCompleted() : void
      {
         this.view.stg.addEventListener(MapStageEvent.SCROLLING,this.onSCROLLING,false,0,true);
         this.view.stg.roleStage.addEventListener(MouseEvent.CLICK,this.clickHandler,false,0,true);
         this.view.stg.roleStage.addEventListener(MapRoleEvent.OVER_CHANGED,this.roleOverChangedHandler,false,0,true);
         MapTroopManager.instance.init(this);
         this.view.stg.addEventListener(MouseEvent.ROLL_OVER,function():void
         {
            isOver = true;
         });
         this.view.stg.addEventListener(MouseEvent.ROLL_OUT,function():void
         {
            isOver = false;
            roleOverChangedHandler();
         });
         var pt:Point = this.proxy.data.initPos.clone();
         if(pt.x > this.view.bg.data.width - 1)
         {
            pt.x = this.view.bg.data.width / 2;
         }
         if(pt.y > this.view.bg.data.height - 1)
         {
            pt.y = this.view.bg.data.height / 2;
         }
         pt = MapGlobals.cellToPoint(pt);
         this.view.stg.$CameraTo(pt.x - Application.application.width / 2,pt.y - Application.application.height / 2);
         this.checkAreaRequest(true);
         MapProxyCmd.getArmyRelativeInfo();
         MapInfoProxyCmd.getSimplelArmyHistory();
      }
      
      protected function onSCROLLING(param1:MapStageEvent) : void
      {
         this.checkAreaRequest(false);
      }
      
      private function checkAreaRequest(param1:Boolean) : void
      {
         if(this.view.bg == null)
         {
            return;
         }
         MapProxyCmd.checkRequestAreaInfo(this.view.bg.scrollX,this.view.bg.scrollY,param1);
      }
      
      private function onMAP_CELLS_IN_AREA_MODIFIED(param1:CommonEvent) : void
      {
         var _loc2_:int = 0;
         var _loc5_:MapBasicCellVO = null;
         var _loc6_:MapBasicCell = null;
         var _loc3_:Vector.<MapBasicCellVO> = param1.param as Vector.<MapBasicCellVO>;
         var _loc4_:int = _loc3_.length;
         _loc2_ = 0;
         while(_loc2_ < _loc4_)
         {
            _loc5_ = _loc3_[_loc2_];
            if(_loc6_ = this.view.stg.roleStage.GetRoleByName(_loc5_.name) as MapBasicCell)
            {
               _loc6_.loadVO(_loc5_);
            }
            _loc2_++;
         }
      }
      
      private function onMAP_CELLS_IN_AREA_ADDED(param1:CommonEvent) : void
      {
         var _loc2_:int = 0;
         var _loc5_:MapBasicCellVO = null;
         var _loc6_:MapBasicCell = null;
         var _loc3_:Vector.<MapBasicCellVO> = param1.param as Vector.<MapBasicCellVO>;
         var _loc4_:int = _loc3_.length;
         _loc2_ = 0;
         while(_loc2_ < _loc4_)
         {
            _loc5_ = _loc3_[_loc2_];
            (_loc6_ = createCellByVo(_loc5_)).loadVO(_loc5_);
            this.view.stg.roleStage.AddRole(_loc6_);
            this.view.tiledData.addRule(_loc5_);
            this.view.bg.InvalidateView(true);
            _loc2_++;
         }
      }
      
      private function onMAP_CELLS_IN_AREA_REMOVED(param1:CommonEvent) : void
      {
         var _loc2_:int = 0;
         var _loc5_:MapBasicCellVO = null;
         var _loc6_:MapBasicCell = null;
         var _loc3_:Vector.<MapBasicCellVO> = param1.param as Vector.<MapBasicCellVO>;
         var _loc4_:int = _loc3_.length;
         _loc2_ = 0;
         while(_loc2_ < _loc4_)
         {
            _loc5_ = _loc3_[_loc2_];
            if(_loc6_ = this.view.stg.roleStage.GetRoleByName(_loc5_.name) as MapBasicCell)
            {
               this.view.stg.roleStage.RemoveRole(_loc6_);
               _loc6_.Dispose();
               this.view.tiledData.removeRule(_loc5_);
               this.view.bg.InvalidateView(true);
            }
            else
            {
               getLogger("map").error("onMAP_CELLS_IN_AREA_REMOVED can\'t find : " + _loc5_.name);
            }
            _loc2_++;
         }
      }
      
      private function onMAP_CELLS_IN_AREA_UPDATED(param1:CommonEvent) : void
      {
         getLogger("map").info("onMAP_CELLS_IN_AREA_UPDATED numChildren : " + this.view.stg.roleStage.numChildren);
      }
      
      protected function clickHandler(param1:MouseEvent) : void
      {
         var _loc2_:MapBasicCell = null;
         switch(param1.currentTarget)
         {
            case this.view.stg.roleStage:
               if(this.view.stg.roleStage.overRole)
               {
                  _loc2_ = this.view.stg.roleStage.overRole as MapBasicCell;
                  this.clickVo(_loc2_.vo);
               }
         }
      }
      
      protected function roleOverChangedHandler(param1:MapRoleEvent = null) : void
      {
         var _loc2_:MapBasicCell = param1 != null ? param1.role as MapBasicCell : null;
         if(_loc2_ && this.isOver)
         {
            ToolTipManager.CreateToolTip(_loc2_.vo.getTip(this.proxy.areaId));
         }
         else
         {
            ToolTipManager.DestroyToolTip();
         }
      }
      
      private function clickVo(param1:MapBasicCellVO) : void
      {
         var _loc2_:MapMineCellVO = null;
         switch(param1.type)
         {
            case 1:
               MapInfoViewCmd.showMapRoleWnd(param1);
               break;
            case 2:
               _loc2_ = param1 as MapMineCellVO;
               if(!_loc2_.isFakeMine)
               {
                  MapViewCmd.showMineWnd(param1);
               }
               break;
            case 3:
               MapViewCmd.showTempleWnd(param1);
               break;
            case 11:
               MapInfoViewCmd.showAdvancedMoveCityWnd(this.proxy.areaId,param1.pos);
         }
      }
   }
}
