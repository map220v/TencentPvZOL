package com.qq.modules.td.view.items.loot
{
   import asgui.resources.AssetManager;
   import flash.display.MovieClip;
   
   public class TDLootRewardBagView extends TDLootItemView
   {
       
      
      public var bagMc:MovieClip;
      
      public function TDLootRewardBagView()
      {
         super(TDLootRewardBagViewMediator);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.scrollRectEnabled = false;
         buttonMode = true;
         this.bagMc = AssetManager.GetNewClass("TD_RewardBag") as MovieClip;
         this.addChild(this.bagMc);
      }
   }
}
