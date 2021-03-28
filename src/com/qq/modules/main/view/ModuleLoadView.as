package com.qq.modules.main.view
{
   import asgui.core.Application;
   import asgui.resources.AssetManager;
   import com.qq.GameGloble;
   import com.qq.IMyApplication;
   import com.qq.display.QCanvas;
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public class ModuleLoadView extends QCanvas
   {
       
      
      public var mc:MovieClip;
      
      public var inner:MovieClip;
      
      public var percentTF:TextField;
      
      public function ModuleLoadView()
      {
         super(ModuleLoadMediator);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.mc = AssetManager.instance.GetNewClass("loading") as MovieClip;
         addChild(this.mc);
         this.width = GameGloble.stage.stageWidth;
         this.height = GameGloble.stage.stageHeight;
         visible = false;
         scrollRectEnabled = false;
         mouseBackground = true;
         this.percentTF = this.mc["txt"];
         this.inner = this.mc["mc"];
      }
      
      public function play() : void
      {
         if(this.mc)
         {
            this.inner.gotoAndPlay(1);
            visible = true;
         }
      }
      
      public function stop() : void
      {
         if(this.mc)
         {
            this.inner.stop();
            visible = false;
         }
         (Application.application as IMyApplication).bg.visible = false;
      }
   }
}
