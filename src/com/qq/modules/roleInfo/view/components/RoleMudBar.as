package com.qq.modules.roleInfo.view.components
{
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   
   public class RoleMudBar extends BasicRoleBar
   {
       
      
      public function RoleMudBar()
      {
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         bg = new Image();
         bg.source = AssetManager.instance.GetClass("ModuleRoleInfo_Mud");
         bg.name = "ModuleRoleInfo_Mud";
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
