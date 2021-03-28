package com.qq.modules.td.view.chooseCard.ui
{
   import asgui.controls.Button;
   import asgui.controls.Image;
   import asgui.resources.AssetManager;
   import com.qq.display.QCanvas;
   
   public class TDInviteFriendBtnCE extends QCanvas
   {
       
      
      public var bg:Image;
      
      public var button_10:Button;
      
      public function TDInviteFriendBtnCE(param1:Class = null, param2:Boolean = true)
      {
         super(!!param2 ? (!!param1 ? param1 : TDInviteFriendBtnMediator) : null);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 105;
         this.height = 125;
         this.bg = new Image();
         this.bg.width = 105;
         this.bg.height = 125;
         this.bg.source = AssetManager.GetClass("TD_UI_FriendCardBG");
         this.bg.x = 0;
         this.bg.y = 0;
         this.bg.id = "bg";
         this.addChild(this.bg);
         this.button_10 = new Button();
         this.button_10.label = "邀请好友";
         this.button_10.x = 0;
         this.button_10.y = 26;
         this.button_10.width = 82;
         this.button_10.height = 73;
         this.button_10.id = "button_10";
         this.button_10.hcenter = 0;
         this.button_10.styleName = ".Button_Plus_Big";
         this.addChild(this.button_10);
      }
      
      override public function Dispose() : void
      {
         this.bg = null;
         this.button_10 = null;
         super.Dispose();
      }
   }
}
