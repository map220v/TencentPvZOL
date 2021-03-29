package com.qq.modules.roleInfo.view.components
{
   import asgui.controls.Image;
   import com.qq.templates.font.FontHKHB;
   import com.qq.utils.UrlManager;
   
   public class SecondaryPasswordIcon extends RoleBuffIcon
   {
       
      
      private var img:Image;
      
      public function SecondaryPasswordIcon()
      {
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.img = new Image();
         this.img.source = UrlManager.getUrl(UrlManager.Url_RoleInfo,"secondary_password.png");
         this.addChild(this.img);
         this.buttonMode = true;
      }
      
      public function setData() : void
      {
         this.img.toolTip = FontHKHB.SECONDARY_PASSWORD_ICON_TIP;
      }
   }
}
