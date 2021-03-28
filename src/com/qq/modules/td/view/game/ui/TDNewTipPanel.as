package com.qq.modules.td.view.game.ui
{
   import asgui.containers.VBox;
   import com.qq.GameGloble;
   import com.qq.display.QCanvas;
   import flash.events.Event;
   
   public class TDNewTipPanel extends QCanvas
   {
       
      
      public var list:VBox;
      
      public function TDNewTipPanel()
      {
         super(TDNewTipPanelMediator);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.list = new VBox();
         this.list.mouseEnabled = false;
         addChild(this.list);
         this.onResize(null);
         GameGloble.stage.addEventListener(Event.RESIZE,this.onResize);
      }
      
      private function onResize(param1:Event) : void
      {
         x = 32;
         y = 81;
      }
      
      override public function Dispose() : void
      {
         GameGloble.stage.removeEventListener(Event.RESIZE,this.onResize);
         super.Dispose();
      }
   }
}
