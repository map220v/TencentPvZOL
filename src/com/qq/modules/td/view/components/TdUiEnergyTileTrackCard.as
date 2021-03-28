package com.qq.modules.td.view.components
{
   import com.qq.display.QCanvas;
   import com.qq.modules.td.data.TDDataFactory;
   import com.qq.modules.td.data.game.unit.TDNormalObjectStaticInfo;
   import com.qq.modules.td.view.chooseCard.ui.TDCardEnergyTile;
   
   public class TdUiEnergyTileTrackCard extends QCanvas
   {
      
      private static var counter:int;
       
      
      public var energyTileData:TDNormalObjectStaticInfo;
      
      public var energyTileId:String;
      
      public function TdUiEnergyTileTrackCard(param1:uint)
      {
         this.energyTileData = TDDataFactory.instance.getNormalObjectInfoByID(param1);
         this.energyTileId = "energy_tile_" + ++counter;
         super(TdUiEnergyTileTrackCardMediator);
      }
      
      public function Close() : void
      {
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
         this.Dispose();
      }
      
      override public function Dispose() : void
      {
         this.energyTileData = null;
         super.Dispose();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         var _loc1_:TDCardEnergyTile = new TDCardEnergyTile();
         _loc1_.energyTileType = this.energyTileData.type;
         $addChild(_loc1_);
         this.mouseBackground = true;
      }
      
      override public function set x(param1:Number) : void
      {
         setX(param1);
      }
   }
}
