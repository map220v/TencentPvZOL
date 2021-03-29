package com.qq.modules.map.view.map
{
   import asgui.core.Application;
   import asgui.simples.CanvasSimple;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.map.MapGlobals;
   import com.qq.modules.map.util.QMapTiledData;
   import flash.events.Event;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   import org.allencuilib.map.MapStage;
   import org.allencuilib.map.MapStageScrollMode;
   import org.allencuilib.map.MapStageScrollMode2;
   import org.allencuilib.map.events.MapMouseEventsListener;
   import org.allencuilib.map.scroll.DuratingMapScrollEffect;
   import org.allencuilib.map.tiled.display.TiledBackground;
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.RobotlegExtendCmd;
   
   public class MapView extends CanvasSimple
   {
       
      
      public var bg:TiledBackground;
      
      public var stg:MapStage;
      
      public var tiledData:QMapTiledData;
      
      public function MapView()
      {
         super();
         RobotlegExtendCmd.registerMapView(getDefinitionByName(getQualifiedClassName(this)),MapViewMediator);
         RobotlegExtendCmd.createMediator(this);
      }
      
      override public function Dispose() : void
      {
         Application.application.removeEventListener(Event.RESIZE,this.ResizeHandler);
         RobotlegExtendCmd.removeMediatorByView(this);
         MapGlobals.bg = null;
         if(this.bg)
         {
            this.bg.Dispose();
            this.bg = null;
         }
         if(this.stg)
         {
            this.stg.Dispose();
            this.stg = null;
         }
         if(this.tiledData)
         {
            this.tiledData.Dispose();
            this.tiledData = null;
         }
         super.Dispose();
      }
      
      public function Load1(param1:int) : void
      {
         var _loc6_:Class = null;
         var _loc2_:Application = Application.application;
         Application.application.addEventListener(Event.RESIZE,this.ResizeHandler);
         var _loc3_:int = Application.application.width;
         var _loc4_:int = Application.application.height;
         this.bg = new TiledBackground(_loc3_,_loc4_,512,512);
         this.stg = new MapStage(_loc3_,_loc4_,this.bg);
         this.addChild(this.stg);
         var _loc5_:int = MapGlobals.getMapSize(param1);
         switch(param1)
         {
            case 1:
               _loc6_ = WorldMapRes1.map_res;
               break;
            case 2:
               _loc6_ = WorldMapRes2.map_res;
         }
         this.tiledData = new QMapTiledData(null,_loc5_);
         this.tiledData.LoadTmx(XML(new _loc6_()),"assets/map/maoxian_2/");
         this.stg.backgroud.SetData(this.tiledData,0,0,0,0);
         this.stg.backgroud.data.addEventListener(Event.COMPLETE,this.DataCompletedHandler);
         this.bg.alwaysDrawOverTile = true;
         this.stg.SetStageSize(_loc2_.width,_loc2_.height,MapStageScrollMode.MOUSE_DOWN_SCROLL);
         this.stg.AddEventsListener(new MapMouseEventsListener());
         this.stg.scrollEffect = new DuratingMapScrollEffect(this);
         MapGlobals.bg = this.bg;
      }
      
      public function ZoomIn() : void
      {
         var _loc1_:Number = 1;
         if(this.stg.scaleX > 0.25)
         {
            _loc1_ = this.stg.scaleX / 2;
            this.stg.scaleX = this.stg.scaleY = _loc1_;
            this.stg.SetStageSize(stage.stageWidth / this.stg.scaleX,stage.stageHeight / this.stg.scaleY,MapStageScrollMode.MOUSE_DOWN_SCROLL);
         }
      }
      
      public function ZoomOut() : void
      {
         var _loc1_:Number = 1;
         if(this.stg.scaleX < 1)
         {
            _loc1_ = this.stg.scaleX * 2;
            this.stg.scaleX = this.stg.scaleY = _loc1_;
            this.stg.SetStageSize(stage.stageWidth / this.stg.scaleX,stage.stageHeight / this.stg.scaleY,MapStageScrollMode.MOUSE_DOWN_SCROLL);
         }
      }
      
      private function ResizeHandler(param1:Event) : void
      {
         var _loc2_:int = Application.application.width;
         var _loc3_:int = Application.application.height;
         this.stg.SetStageSize(_loc2_ / this.stg.scaleX,_loc3_ / this.stg.scaleY,MapStageScrollMode.MOUSE_DOWN_SCROLL,MapStageScrollMode2.LAYERS_XY);
      }
      
      private function DataCompletedHandler(param1:Event) : void
      {
         this.stg.AddEventsListener(new MapMouseEventsListener(),true);
         (this.getMediator() as MapViewMediator).onDataCompleted();
      }
      
      public function getMediator() : BasicScreenMediator
      {
         return ExtendContext.instance.getMediatorMap().retrieveMediator(this) as BasicScreenMediator;
      }
   }
}
