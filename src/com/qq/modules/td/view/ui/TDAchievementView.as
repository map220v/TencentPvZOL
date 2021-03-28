package com.qq.modules.td.view.ui
{
   import asgui.containers.HBox;
   import com.qq.display.QCanvas;
   
   public class TDAchievementView extends QCanvas
   {
       
      
      public var ctBox:HBox;
      
      public function TDAchievementView(param1:Class = null)
      {
         super(TDAchievementViewMediator);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.ctBox = new HBox();
         addChild(this.ctBox);
      }
   }
}
