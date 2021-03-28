package com.qq.modules.td.view.game
{
   import com.qq.GameGloble;
   import com.qq.display.QCanvas;
   import com.qq.modules.td.logic.TDUILayerManager;
   import com.qq.modules.td.view.game.layer.TDScene;
   import flash.display.Sprite;
   
   public class TDBGView extends QCanvas
   {
       
      
      public var topEffectLayer:TDTopEffectLayer;
      
      public var uiPanel:TDUIPanel;
      
      public var scene:TDScene;
      
      public var topScence:TDTopSceneLayer;
      
      public var debugLayer:Sprite;
      
      public function TDBGView()
      {
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.setFullSize();
         addChild(this.scene = GameGloble.injector.instantiate(TDScene));
         this.uiPanel = new TDUIPanel();
         this.uiPanel.name = "uiPanel";
         this.uiPanel.id = "uiPanel";
         this.uiPanel.setFullSize();
         addChild(this.uiPanel);
         TDUILayerManager.uiPanel = this.uiPanel;
         this.topScence = GameGloble.injector.instantiate(TDTopSceneLayer);
         TDUILayerManager.topSceneLayer = this.topScence;
         addChildAt(this.topScence,numChildren);
         this.topEffectLayer = GameGloble.injector.instantiate(TDTopEffectLayer);
         TDUILayerManager.topEffectLayer = this.topEffectLayer;
         addChildAt(this.topEffectLayer,numChildren);
         this.debugLayer = new Sprite();
         this.addChild(this.debugLayer);
      }
      
      override public function Dispose() : void
      {
         super.Dispose();
      }
   }
}
