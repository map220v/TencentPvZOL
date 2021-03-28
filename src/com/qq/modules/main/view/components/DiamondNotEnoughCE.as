package com.qq.modules.main.view.components
{
   import asgui.controls.Button;
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.controls.TextArea;
   import asgui.resources.AssetManager;
   import com.qq.display.QCanvas;
   
   public class DiamondNotEnoughCE extends QCanvas
   {
       
      
      public var image_bg:Image;
      
      public var textarea_desc:TextArea;
      
      public var button_recharge:Button;
      
      public var button_cancel:Button;
      
      public var label_title:Label;
      
      public function DiamondNotEnoughCE(param1:Class = null, param2:Boolean = true)
      {
         super(!!param2 ? (!!param1 ? param1 : DiamondNotEnoughMediator) : null);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 314;
         this.height = 234;
         this.image_bg = new Image();
         this.image_bg.width = 314;
         this.image_bg.height = 234;
         this.image_bg.source = AssetManager.GetClass("UI_use_diamond_confirm_bg");
         this.image_bg.x = 0;
         this.image_bg.y = 0;
         this.image_bg.id = "image_bg";
         this.addChild(this.image_bg);
         this.textarea_desc = new TextArea();
         this.textarea_desc.width = 100;
         this.textarea_desc.height = 90;
         this.textarea_desc.x = 7;
         this.textarea_desc.y = 43;
         this.textarea_desc.id = "textarea_desc";
         this.textarea_desc.selectable = false;
         this.textarea_desc.verticalScrollPolicy = "false";
         this.textarea_desc.horizontalScrollPolicy = "false";
         this.textarea_desc.left = 30;
         this.textarea_desc.right = 20;
         this.textarea_desc.top = 70;
         this.textarea_desc.styleName = ".textAreaNoBackground_17";
         this.addChild(this.textarea_desc);
         this.button_recharge = new Button();
         this.button_recharge.label = "充值";
         this.button_recharge.styleName = ".GreenButtonMid";
         this.button_recharge.x = 38;
         this.button_recharge.y = 156;
         this.button_recharge.width = 58;
         this.button_recharge.height = 24;
         this.button_recharge.id = "button_recharge";
         this.button_recharge.hcenter = -50;
         this.button_recharge.bottom = 14;
         this.addChild(this.button_recharge);
         this.button_cancel = new Button();
         this.button_cancel.label = "取消";
         this.button_cancel.styleName = ".GreenButtonMid";
         this.button_cancel.x = 160;
         this.button_cancel.y = 14;
         this.button_cancel.width = 58;
         this.button_cancel.height = 24;
         this.button_cancel.id = "button_cancel";
         this.button_cancel.hcenter = 50;
         this.button_cancel.bottom = 14;
         this.addChild(this.button_cancel);
         this.label_title = new Label();
         this.label_title.text = "提示";
         this.label_title.styleName = ".TXT_Panel_Title";
         this.label_title.x = 138;
         this.label_title.y = 15;
         this.label_title.width = 48;
         this.label_title.height = 24;
         this.label_title.id = "label_title";
         this.label_title.hcenter = 0;
         this.addChild(this.label_title);
      }
      
      override public function Dispose() : void
      {
         this.image_bg = null;
         this.textarea_desc = null;
         this.button_recharge = null;
         this.button_cancel = null;
         this.label_title = null;
         super.Dispose();
      }
   }
}
