package com.qq.modules.td.view.game.ui
{
   import asgui.controls.Image;
   import com.qq.display.QCanvas;
   import com.qq.utils.UrlManager;
   
   public class TDNewTipView extends QCanvas
   {
       
      
      public var img:Image;
      
      public function TDNewTipView()
      {
         super(TDNewTipViewMediator);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.img = new Image();
         this.img.source = UrlManager.getUrl(0,"swf/td/ui/newTip.swf");
         this.img.buttonMode = true;
         addChild(this.img);
      }
   }
}
