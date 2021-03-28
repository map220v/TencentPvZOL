package com.qq.modules.td.view.chooseCard.ui
{
   import asgui.controls.Image;
   import com.qq.constant.td.TDObjTypeID;
   import com.qq.display.QCanvas;
   import com.qq.utils.UrlManager;
   
   public class TDCardEnergyTile extends QCanvas
   {
       
      
      public var img:Image;
      
      public function TDCardEnergyTile(param1:Class = null)
      {
         super(param1);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.img = new Image();
         $addChild(this.img);
      }
      
      public function set energyTileType(param1:uint) : void
      {
         this.img.source = UrlManager.getUrl(UrlManager.Url_TDPowerTile,"powerTile" + uint((param1 - TDObjTypeID.Obj_PowerTile1 + 100) / 100) + ".swf");
      }
   }
}
