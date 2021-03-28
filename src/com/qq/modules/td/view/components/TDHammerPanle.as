package com.qq.modules.td.view.components
{
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   import com.qq.display.QCanvas;
   import com.qq.modules.td.view.game.layer.ITDLocationUpdatable;
   
   public class TDHammerPanle extends QCanvas implements ITDLocationUpdatable
   {
       
      
      public var hammerImage:Image;
      
      public var txtHammerCount:Label;
      
      public function TDHammerPanle()
      {
         super(TDHammerPanelMediator);
      }
      
      public function updateLocation() : void
      {
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.x = 400;
         this.hammerImage = new Image();
         this.hammerImage.source = AssetManager.GetNewClass("TD_UI_Hammer");
         this.addChild(this.hammerImage);
         this.txtHammerCount = new Label();
         this.txtHammerCount.width = 40;
         this.txtHammerCount.x = 35;
         this.txtHammerCount.y = 38;
         this.addChild(this.txtHammerCount);
      }
      
      public function setHammerCount(param1:int) : void
      {
         if(this.hammerImage)
         {
            this.txtHammerCount.text = "x" + param1;
         }
      }
   }
}
