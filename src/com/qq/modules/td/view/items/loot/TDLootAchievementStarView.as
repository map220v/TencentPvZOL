package com.qq.modules.td.view.items.loot
{
   import asgui.controls.Image;
   import asgui.resources.AssetManager;
   
   public class TDLootAchievementStarView extends TDLootItemView
   {
       
      
      private var _img:Image;
      
      public function TDLootAchievementStarView()
      {
         super(TDLootAchievementStarViewMediator);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this._img = new Image();
         this._img.source = AssetManager.GetClass("main_star_big");
         this._img.x = -this._img.width * 0.5;
         this._img.y = -this._img.height * 0.5;
         $addChild(this._img);
      }
   }
}
