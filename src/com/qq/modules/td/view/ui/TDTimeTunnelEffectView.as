package com.qq.modules.td.view.ui
{
   import asgui.resources.AssetManager;
   import com.qq.GameGloble;
   import com.qq.display.QCanvasSelfFullSize;
   import com.qq.utils.GraphicsUtils;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   
   public class TDTimeTunnelEffectView extends QCanvasSelfFullSize
   {
       
      
      public var bg:Sprite;
      
      public var mc:MovieClip;
      
      public function TDTimeTunnelEffectView()
      {
         super(TDTimeTunnelEffectViewMediater);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.mc = AssetManager.instance.GetNewClass("TD_Time_Tunnel") as MovieClip;
         addChild(this.mc);
         this.bg = new Sprite();
         addChildAt(this.bg,0);
         this.onRESIZE(null);
      }
      
      override protected function onRESIZE(param1:Event) : void
      {
         super.onRESIZE(param1);
         GraphicsUtils.cleanContainer(this.bg);
         GraphicsUtils.drawRect(this.bg,0,0,GameGloble.stage.stageWidth,GameGloble.stage.stageHeight,0,1);
         this.mc.x = GameGloble.stage.stageWidth * 0.5 - 1919 * 0.5;
         this.mc.y = GameGloble.stage.stageHeight * 0.5 - 1211 * 0.5;
      }
   }
}
