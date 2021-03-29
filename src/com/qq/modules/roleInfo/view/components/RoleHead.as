package com.qq.modules.roleInfo.view.components
{
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   import com.qq.display.QCanvas;
   import com.qq.modules.main.model.PrivilegeDiamond;
   import com.qq.modules.roleInfo.privilege.PrivilegeIcon;
   import flash.events.Event;
   
   public class RoleHead extends QCanvas
   {
       
      
      public var headIcon:Image;
      
      public var headBG:Image;
      
      public var nameLabel:Label;
      
      private var nameBG:Image;
      
      private var privilegeIcon:PrivilegeIcon;
      
      public function RoleHead()
      {
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.headBG = new Image();
         this.headBG.x = 3 + 25;
         this.headBG.y = 3;
         addChild(this.headBG);
         this.headBG.source = AssetManager.GetClass("ModuleRoleInfo_HeadBG");
         this.headIcon = new Image();
         this.headIcon.loadTimeout = 5000;
         this.headIcon.useLoaderManager = false;
         this.headIcon.width = this.headIcon.height = 50;
         this.headIcon.scaleContent = true;
         this.headIcon.addEventListener(Event.COMPLETE,this.onLoadHeadComplete);
         addChild(this.headIcon);
         var _loc1_:Image = new Image();
         _loc1_.x = 25;
         addChild(_loc1_);
         _loc1_.source = AssetManager.GetClass("ModuleRoleInfo_HeadMask");
         this.nameBG = new Image();
         this.nameBG.source = AssetManager.GetClass("ModuleRoleInfo_NameBG");
         this.nameBG.y = _loc1_.y + _loc1_.height + 2;
         addChild(this.nameBG);
         this.nameLabel = new Label();
         this.nameLabel.width = 130;
         this.nameLabel.y = _loc1_.y + _loc1_.height + 7;
         this.nameLabel.SetStyle("textAlign","center");
         this.nameLabel.SetStyle("color","#5becee");
         this.nameLabel.SetStyle("textShadowStrength","5");
         this.nameLabel.SetStyle("textShadowDistance","0");
         this.nameLabel.SetStyle("textShadowBlurX","2");
         this.nameLabel.SetStyle("textShadowBlurY","2");
         this.nameLabel.SetStyle("textShadowColor","#000000");
         this.nameLabel.SetStyle("textShadowAlpha","1");
         this.nameLabel.SetStyle("fontWeight","bold");
         addChild(this.nameLabel);
         this.privilegeIcon = PrivilegeIcon.create();
         this.privilegeIcon.right = 50;
         this.privilegeIcon.y = 42;
         this.privilegeIcon.needClick = true;
         addChild(this.privilegeIcon);
      }
      
      private function onLoadHeadComplete(param1:Event) : void
      {
         this.headIcon.removeEventListener(Event.COMPLETE,this.onLoadHeadComplete);
         this.headIcon.x = (this.headBG.width - this.headIcon.width) * 0.5 + 27;
         this.headIcon.y = (this.headBG.height - this.headIcon.height) * 0.5 + 2;
      }
      
      public function setPrivilege(param1:PrivilegeDiamond) : void
      {
         this.privilegeIcon.privilege = param1;
      }
      
      public function set growLevel(param1:int) : void
      {
         this.privilegeIcon.extraParam = param1;
      }
      
      override public function Dispose() : void
      {
         this.headIcon.removeEventListener(Event.COMPLETE,this.onLoadHeadComplete);
         super.Dispose();
      }
   }
}
