package com.qq.modules.roleInfo.view.components
{
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   
   public class RoleGoldDiamondBar extends BasicRoleBar
   {
       
      
      public var buyBar:DisplayObject;
      
      public function RoleGoldDiamondBar()
      {
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         bg = new Image();
         bg.source = AssetManager.instance.GetClass("ModuleRole_GoldDiamondBar");
         addChild(bg);
         tf = new Label();
         tf.width = 60;
         tf.styleName = ".ProgressBar_Level";
         tf.x = 30;
         tf.y = 13;
         addChild(tf);
         this.buyBar = (bg.mcHolder as MovieClip).getChildByName("btn") as DisplayObject;
      }
   }
}
