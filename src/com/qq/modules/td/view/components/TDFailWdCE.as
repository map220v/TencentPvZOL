package com.qq.modules.td.view.components
{
   import asgui.controls.Image;
   import asgui.resources.AssetManager;
   import com.qq.display.QCanvas;
   
   public class TDFailWdCE extends QCanvas
   {
       
      
      public var img_bk:Image;
      
      public function TDFailWdCE(param1:Class = null, param2:Boolean = true)
      {
         super(!!param2 ? (!!param1 ? param1 : TDFailWdMediator) : null);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 261;
         this.height = 351;
         this.enabled = false;
         this.img_bk = new Image();
         this.img_bk.width = 261;
         this.img_bk.height = 351;
         this.img_bk.source = AssetManager.GetClass("TD_UI_Fail_Bg");
         this.img_bk.x = 0;
         this.img_bk.y = 0;
         this.img_bk.id = "img_bk";
         this.img_bk.scrollRectEnabled = false;
         this.addChild(this.img_bk);
      }
      
      override public function Dispose() : void
      {
         this.img_bk = null;
         super.Dispose();
      }
   }
}
