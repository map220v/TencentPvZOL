package com.qq.modules.map.view.components
{
   import asgui.core.Application;
   import asgui.resources.AssetManager;
   import com.greensock.TweenLite;
   import com.qq.display.QAlert;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.main.command.GameFlowCmd;
   import com.qq.modules.map.MapGlobals;
   import com.qq.modules.map.command.MapViewCmd;
   import com.qq.modules.map.model.MapProxy;
   import com.qq.modules.map.model.vo.MapBasicCellVO;
   import com.qq.modules.mapinfo.model.MapInfoProxy;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.allencuilib.map.events.MapTiledEvent;
   import org.allencuilib.map.tiled.graphics.LayedTiledPlotData;
   
   public class MapMiniMapMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:MapMiniMap;
      
      [Inject]
      public var proxy:MapProxy;
      
      [Inject]
      public var infoProxy:MapInfoProxy;
      
      public var maxHeight:int;
      
      public var minHeight:int;
      
      private var isInFocus:Boolean;
      
      private var isOver:Boolean;
      
      public function MapMiniMapMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         this.maxHeight = this.view.height;
         this.minHeight = 46;
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         this.view.btnJump.addEventListener(MouseEvent.CLICK,this.clickHandler,false,0,true);
         this.view.btnHome1.addEventListener(MouseEvent.CLICK,this.clickHandler,false,0,true);
         this.view.btnHome2.addEventListener(MouseEvent.CLICK,this.clickHandler,false,0,true);
         this.view.btnZoom.addEventListener(MouseEvent.CLICK,this.clickHandler,false,0,true);
         this.view.addEventListener(MouseEvent.ROLL_OVER,this.onROLL_OVER,false,0,true);
         this.view.addEventListener(MouseEvent.ROLL_OUT,this.onROLL_OUT,false,0,true);
         this.view.map.backgroud.addEventListener(MapTiledEvent.OVER_CELL_CHANGED,this.onOVER_CELL_CHANGED,false,0,true);
         this.addContextListener(MapGlobals.MAP_CELLS_IN_AREA_ADDED,this.onMAP_CELLS_IN_AREA_ADDED);
         this.addContextListener(MapGlobals.MAP_CELLS_IN_AREA_REMOVED,this.onMAP_CELLS_IN_AREA_REMOVED);
         this.view.txtX.addEventListener(FocusEvent.FOCUS_IN,this.onTextFOCUS_IN,false,0,true);
         this.view.txtY.addEventListener(FocusEvent.FOCUS_IN,this.onTextFOCUS_IN,false,0,true);
         this.view.txtX.addEventListener(FocusEvent.FOCUS_OUT,this.onTextFOCUS_OUT,false,0,true);
         this.view.txtY.addEventListener(FocusEvent.FOCUS_OUT,this.onTextFOCUS_OUT,false,0,true);
         this.view.txtX.addEventListener(Event.CHANGE,this.onTextChange,false,0,true);
         this.view.txtY.addEventListener(Event.CHANGE,this.onTextChange,false,0,true);
      }
      
      protected function onTextChange(param1:Event) : void
      {
         switch(param1.currentTarget)
         {
            case this.view.txtX:
               if(int(this.view.txtX.text) > this.view.tiledData.width - 1)
               {
                  this.view.txtX.text = (this.view.tiledData.width - 1).toString();
               }
               break;
            case this.view.txtY:
               if(int(this.view.txtY.text) > this.view.tiledData.height - 1)
               {
                  this.view.txtY.text = (this.view.tiledData.height - 1).toString();
               }
         }
      }
      
      protected function onTextFOCUS_OUT(param1:FocusEvent) : void
      {
         this.isInFocus = false;
      }
      
      protected function onTextFOCUS_IN(param1:FocusEvent) : void
      {
         this.isInFocus = true;
      }
      
      private function onOVER_CELL_CHANGED(param1:MapTiledEvent) : void
      {
         if(this.isInFocus)
         {
            return;
         }
         var _loc2_:Point = param1.overCell;
         if(!this.isOver)
         {
            this.view.txtX.text = _loc2_.x.toString();
            this.view.txtY.text = _loc2_.y.toString();
         }
      }
      
      protected function onROLL_OUT(param1:MouseEvent) : void
      {
         this.isOver = false;
      }
      
      protected function onROLL_OVER(param1:MouseEvent) : void
      {
         this.isOver = true;
      }
      
      private function onMAP_CELLS_IN_AREA_ADDED(param1:CommonEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Vector.<MapBasicCellVO> = param1.param as Vector.<MapBasicCellVO>;
         this.view.mini.addCells(_loc3_);
      }
      
      private function onMAP_CELLS_IN_AREA_REMOVED(param1:CommonEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Vector.<MapBasicCellVO> = param1.param as Vector.<MapBasicCellVO>;
         this.view.mini.removeCells(_loc3_);
      }
      
      protected function clickHandler(param1:MouseEvent) : void
      {
         var _loc2_:LayedTiledPlotData = null;
         var _loc3_:Application = null;
         switch(param1.currentTarget)
         {
            case this.view.btnJump:
               _loc3_ = Application.application;
               _loc2_ = this.view.tiledData.GetLayedPlotData(int(this.view.txtX.text),int(this.view.txtY.text),0);
               if(_loc2_ == null)
               {
                  QAlert.Show("无效的位置");
               }
               else
               {
                  MapViewCmd.cameraToCell(new Point(int(this.view.txtX.text),int(this.view.txtY.text)));
               }
               break;
            case this.view.btnHome1:
               if(this.infoProxy.data.showNullCity)
               {
                  MapViewCmd.hideCityBuildingTag();
               }
               else
               {
                  MapViewCmd.showCityBuildingTag();
               }
               break;
            case this.view.btnHome2:
               if(this.infoProxy.data.myAreaId == this.proxy.areaId)
               {
                  MapViewCmd.cameraToCell(this.infoProxy.data.myPos);
               }
               else
               {
                  GameFlowCmd.gotoMap(this.infoProxy.data.myAreaId);
               }
               break;
            case this.view.btnZoom:
               if(this.view.height == this.maxHeight)
               {
                  this.view.btnZoom.source = AssetManager.GetClass("Map_Mini_Btn_Up");
                  TweenLite.to(this.view,0.5,{"height":this.minHeight});
               }
               else if(this.view.height == this.minHeight)
               {
                  this.view.btnZoom.source = AssetManager.GetClass("Map_Mini_Btn_Down");
                  TweenLite.to(this.view,0.5,{"height":this.maxHeight});
               }
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
