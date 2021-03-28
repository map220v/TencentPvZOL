package com.qq.display
{
   import asgui.core.Application;
   import com.qq.modules.main.view.PopupLayerView;
   
   public class ScreenViewContainer
   {
      
      private static var _instance:ScreenViewContainer;
       
      
      public var bglayer:QCanvas;
      
      public var popuplayer:PopupLayerView;
      
      public var tiplayer:QCanvas;
      
      public var debugLayer:QCanvas;
      
      public function ScreenViewContainer()
      {
         super();
         this.tiplayer = new QCanvas();
         this.bglayer = new QCanvas();
         this.debugLayer = new QCanvas();
         this.popuplayer = new PopupLayerView();
      }
      
      public static function getInstance() : ScreenViewContainer
      {
         if(_instance == null)
         {
            _instance = new ScreenViewContainer();
         }
         return _instance;
      }
      
      public function setContainer(param1:Application) : void
      {
         if(param1 == null)
         {
            return;
         }
         this.bglayer.setFullSize();
         param1.addChild(this.bglayer);
         param1.addChild(this.popuplayer);
         this.tiplayer.setFullSize();
         param1.addChild(this.tiplayer);
         this.debugLayer.setFullSize();
         param1.addChild(this.debugLayer);
      }
   }
}
