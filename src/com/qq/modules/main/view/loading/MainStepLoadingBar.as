package com.qq.modules.main.view.loading
{
   import asgui.managers.LoaderManager;
   import asgui.managers.PopUpManager;
   import asgui.resources.AssetManager;
   import com.qq.GameGloble;
   import com.qq.display.QCanvas;
   import flash.text.TextField;
   import flash.utils.setTimeout;
   
   public class MainStepLoadingBar extends QCanvas
   {
       
      
      public var mc;
      
      protected var txt:TextField;
      
      public function MainStepLoadingBar(param1:Class = null)
      {
         super(param1);
      }
      
      public static function createLoadingViewWhenManagerClose(param1:int = -1) : void
      {
         var wd:MainStepLoadingBar = null;
         var autoSkip:int = param1;
         if(LoaderManager.impl.isOpening)
         {
            wd = new MainStepLoadingBar();
            PopUpManager.AddPopUp(wd,null,true,false);
            LoaderManager.impl.AddCompleteCallback(function():void
            {
               wd.Close();
            });
            if(autoSkip > 0)
            {
               setTimeout(wd.Close,autoSkip);
            }
         }
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 90;
         this.height = 60;
         this.initMc();
      }
      
      public function Close() : void
      {
         if(!hasDisposed)
         {
            PopUpManager.RemovePopUp(this);
            Dispose();
         }
      }
      
      protected function initMc() : void
      {
         this.mc = AssetManager.instance.GetNewClass("loading");
         this.txt = this.mc["txt"];
      }
      
      protected function showLoading() : void
      {
         var _loc1_:int = GameGloble.stage.stageWidth;
         var _loc2_:int = GameGloble.stage.stageHeight;
         this.txt.text = "";
         this.mc.x = (_loc1_ - this.mc.width) / 2;
         this.mc.y = (_loc2_ - this.mc.height) / 2 + 100;
         this.addChild(this.mc);
      }
   }
}
