package com.qq.modules.roleInfo.view.components
{
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.controls.Text;
   import asgui.resources.AssetManager;
   import com.qq.templates.font.FontNormal;
   import flash.display.MovieClip;
   
   public class RoleVipBar extends BasicRoleBar
   {
      
      public static var isShow:Boolean = true;
       
      
      public var icon:MovieClip;
      
      public var l_tip:Text;
      
      public function RoleVipBar()
      {
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 110;
         bg = new Image();
         bg.width = 110;
         bg.height = 46;
         bg.source = AssetManager.instance.GetClass("ModuleRoleInfo_VipBar");
         bg.ifRemovePreChildWhenChangeSource = true;
         bg.name = "Role_sunBar";
         addChild(bg);
         bg.scrollRectEnabled = false;
         scrollRectEnabled = false;
         this.l_tip = new Text();
         this.l_tip.width = 130;
         this.l_tip.x = -6;
         this.l_tip.y = 45;
         this.l_tip.height = 30;
         this.l_tip.SetStyle("textShadowColor","#000000");
         this.l_tip.text = FontNormal.VIP_NO_V3_TIPS;
         addChild(this.l_tip);
         tf = new Label();
         tf.width = 60;
         tf.styleName = ".ProgressBar_Level";
         tf.x = 40;
         tf.y = 12;
         addChild(tf);
         this.icon = (bg.mcHolder as MovieClip).getChildByName("icon") as MovieClip;
         this.buttonMode = true;
      }
      
      public function set tipVisible(param1:Boolean) : void
      {
         MovieClip(bg.mcHolder["tip_mc"]).visible = param1;
         this.l_tip.visible = param1;
      }
      
      public function update(param1:Number, param2:Number) : void
      {
      }
   }
}
