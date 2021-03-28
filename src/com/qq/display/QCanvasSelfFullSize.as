package com.qq.display
{
   import asgui.core.Application;
   import flash.events.Event;
   
   public class QCanvasSelfFullSize extends QCanvas
   {
       
      
      public function QCanvasSelfFullSize(param1:Class = null)
      {
         super(param1);
      }
      
      override public function Dispose() : void
      {
         Application.application.removeEventListener(Event.RESIZE,this.onRESIZE);
         super.Dispose();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         Application.application.addEventListener(Event.RESIZE,this.onRESIZE);
         this.updateFullSize();
      }
      
      protected function onRESIZE(param1:Event) : void
      {
         this.updateFullSize();
      }
      
      protected function updateFullSize() : void
      {
         this.x = 0;
         this.y = 0;
         this.width = Application.application.width;
         this.height = Application.application.height;
      }
   }
}
