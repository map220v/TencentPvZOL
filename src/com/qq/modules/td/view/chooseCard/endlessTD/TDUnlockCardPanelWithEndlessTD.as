package com.qq.modules.td.view.chooseCard.endlessTD
{
   import asgui.containers.Tile;
   import asgui.core.Container;
   import asgui.core.ScrollPolicy;
   import asgui.resources.AssetManager;
   import flash.display.SimpleButton;
   import org.robotlegs.extend.command.RobotlegExtendCmd;
   
   public class TDUnlockCardPanelWithEndlessTD extends Container
   {
       
      
      public var cardContainer:Tile;
      
      public var prevBtn:SimpleButton;
      
      public var nextBtn:SimpleButton;
      
      public function TDUnlockCardPanelWithEndlessTD()
      {
         super();
         RobotlegExtendCmd.registerMapView(TDUnlockCardPanelWithEndlessTD,TDUnlockCardPanelWithEndlessTDMediator);
         RobotlegExtendCmd.createMediator(this);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.cardContainer = new Tile();
         this.addChild(this.cardContainer);
         this.cardContainer.x = 50;
         this.cardContainer.SetStyle("horizontalGap","0");
         this.cardContainer.SetStyle("verticalGap","0");
         this.cardContainer.verticalScrollPolicy = ScrollPolicy.OFF;
         this.cardContainer = new Tile();
         this.addChild(this.cardContainer);
         this.cardContainer.x = 50;
         this.cardContainer.columnCount = 7;
         this.cardContainer.rowCount = 1;
         this.prevBtn = AssetManager.instance.GetNewClass("TD_UI_BTN_LEFT") as SimpleButton;
         this.nextBtn = AssetManager.instance.GetNewClass("TD_UI_BTN_RIGHT") as SimpleButton;
         this.addChild(this.prevBtn);
         this.addChild(this.nextBtn);
         this.nextBtn.x = 465;
         this.prevBtn.y = this.nextBtn.y = 35;
      }
      
      override public function Dispose() : void
      {
         RobotlegExtendCmd.removeMediatorByView(this);
         super.Dispose();
      }
   }
}
