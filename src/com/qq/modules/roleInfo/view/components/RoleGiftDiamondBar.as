package com.qq.modules.roleInfo.view.components
{
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   
   public class RoleGiftDiamondBar extends BasicRoleBar
   {
       
      
      public function RoleGiftDiamondBar()
      {
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         bg = new Image();
         bg.source = AssetManager.instance.GetClass("ModuleRole_diamondBar");
         addChild(bg);
         tf = new Label();
         tf.width = 60;
         tf.styleName = ".ProgressBar_Level";
         tf.x = 30;
         tf.y = 13;
         addChild(tf);
      }
   }
}
