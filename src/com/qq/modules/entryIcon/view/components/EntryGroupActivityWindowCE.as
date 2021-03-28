package com.qq.modules.entryIcon.view.components
{
   import asgui.containers.Tile;
   import com.qq.display.QWindow;
   
   public class EntryGroupActivityWindowCE extends QWindow
   {
       
      
      public var tile_list:Tile;
      
      public function EntryGroupActivityWindowCE(param1:Class = null, param2:Boolean = true)
      {
         super(!!param2 ? (!!param1 ? param1 : EntryGroupActivityWindowMediator) : null);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 315;
         this.height = 210;
         this.tile_list = new Tile();
         this.tile_list.width = 400;
         this.tile_list.height = 300;
         this.tile_list.y = 83;
         this.tile_list.id = "tile_list";
         this.tile_list.left = 5;
         this.tile_list.right = 5;
         this.tile_list.top = 5;
         this.tile_list.bottom = 5;
         this.tile_list.tileHeight = 80;
         this.tile_list.tileWidth = 70;
         this.tile_list.rowCount = 2;
         this.tile_list.columnCount = 4;
         this.tile_list.verticalScrollPolicy = "auto";
         this.tile_list.scrollRectEnabled = false;
         this.addChild(this.tile_list);
      }
      
      override public function Dispose() : void
      {
         this.tile_list = null;
         super.Dispose();
      }
   }
}
