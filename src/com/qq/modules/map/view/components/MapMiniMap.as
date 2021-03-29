package com.qq.modules.map.view.components
{
   import asgui.core.Application;
   import com.qq.modules.map.view.mini.MapMiniBottomToolTip;
   import com.qq.modules.map.view.mini.MapMiniView;
   import flash.geom.Point;
   import org.allencuilib.map.MapStage;
   import org.allencuilib.map.interfaces.ITiledData;
   
   public class MapMiniMap extends MapMiniMapCE
   {
       
      
      public var mini:MapMiniView;
      
      public var map:MapStage;
      
      public var tiledData:ITiledData;
      
      private var overCell:Point;
      
      public function MapMiniMap(param1:MapStage, param2:ITiledData)
      {
         this.tiledData = param2;
         this.map = param1;
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         var _loc1_:Application = Application.application;
         this.mini = new MapMiniView(this.map);
         this.mini.setSize(194,158,190 / _loc1_.maxWidth,155 / _loc1_.maxHeight);
         this.ctContent.addChild(this.mini);
         this.btnHome1.toolTipClass = MapMiniBottomToolTip;
         this.btnHome2.toolTipClass = MapMiniBottomToolTip;
      }
      
      override public function Dispose() : void
      {
         super.Dispose();
         this.tiledData = null;
         this.map = null;
         if(this.mini)
         {
            this.mini.Dispose();
            this.mini = null;
         }
      }
   }
}
