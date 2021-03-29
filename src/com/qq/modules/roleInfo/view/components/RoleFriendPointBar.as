package com.qq.modules.roleInfo.view.components
{
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   
   public class RoleFriendPointBar extends BasicRoleBar
   {
       
      
      public function RoleFriendPointBar()
      {
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         bg = new Image();
         bg.source = AssetManager.instance.GetClass("ModuleRole_FriendPointBar");
         bg.name = "Role_friendPointBar";
         addChild(bg);
         tf = new Label();
         tf.width = 60;
         tf.styleName = ".ProgressBar_Level";
         tf.x = 34;
         tf.y = 14;
         addChild(tf);
      }
   }
}
