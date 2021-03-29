package com.qq.modules.roleInfo.view.components
{
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   
   public class RoleSunBar extends BasicRoleBar
   {
       
      
      public function RoleSunBar()
      {
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         bg = new Image();
         bg.source = AssetManager.instance.GetClass("ModuleRoleInfo_SunBar");
         bg.name = "Role_sunBar";
         addChild(bg);
         tf = new Label();
         tf.width = 60;
         tf.styleName = ".ProgressBar_Level";
         tf.x = 40;
         tf.y = 14;
         addChild(tf);
      }
   }
}
