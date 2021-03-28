package com.qq.modules.main.view.components
{
   import asgui.controls.Button;
   import asgui.controls.CheckBox;
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.controls.TextArea;
   import asgui.resources.AssetManager;
   import com.qq.display.QCanvas;
   
   public class ConfirmWindowCE extends QCanvas
   {
       
      
      public var image_bg:Image;
      
      public var textarea_desc:TextArea;
      
      public var button_ok:Button;
      
      public var button_cancel:Button;
      
      public var label_500:Label;
      
      public var checkbox_tip:CheckBox;
      
      public var label_only_this:Label;
      
      public function ConfirmWindowCE(param1:Class = null, param2:Boolean = true)
      {
         super(!!param2 ? (!!param1 ? param1 : ConfirmWindowMediator) : null);
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
         this.textarea_desc.width = 283;
         this.textarea_desc.height = 114;
         this.textarea_desc.x = 14;
         this.textarea_desc.y = 50;
         this.textarea_desc.id = "textarea_desc";
         this.textarea_desc.selectable = false;
         this.textarea_desc.verticalScrollPolicy = "false";
         this.textarea_desc.horizontalScrollPolicy = "false";
         this.textarea_desc.styleName = ".textAreaNoBackground_17";
         this.addChild(this.textarea_desc);
         this.button_ok = new Button();
         this.button_ok.label = "确认";
         this.button_ok.styleName = ".GreenButtonMid";
         this.button_ok.x = 38;
         this.button_ok.y = 156;
         this.button_ok.width = 58;
         this.button_ok.height = 24;
         this.button_ok.id = "button_ok";
         this.button_ok.hcenter = -50;
         this.button_ok.bottom = 14;
         this.addChild(this.button_ok);
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
         this.label_500 = new Label();
         this.label_500.text = "提示";
         this.label_500.styleName = ".TXT_Panel_Title";
         this.label_500.x = 128;
         this.label_500.y = 14;
         this.label_500.width = 54;
         this.label_500.height = 24;
         this.label_500.id = "label_500";
         this.addChild(this.label_500);
         this.checkbox_tip = new CheckBox();
         this.checkbox_tip.label = "不再提醒";
         this.checkbox_tip.styleName = ".CheckBox_Blue";
         this.checkbox_tip.x = 107;
         this.checkbox_tip.y = 168;
         this.checkbox_tip.width = 48;
         this.checkbox_tip.height = 27;
         this.checkbox_tip.id = "checkbox_tip";
         this.addChild(this.checkbox_tip);
         this.label_only_this = new Label();
         this.label_only_this.text = "（本次登录有效）";
         this.label_only_this.styleName = ".TXT_HKHB_15_Red";
         this.label_only_this.x = 186;
         this.label_only_this.y = 172;
         this.label_only_this.width = 116;
         this.label_only_this.height = 24;
         this.label_only_this.id = "label_only_this";
         this.addChild(this.label_only_this);
      }
      
      override public function Dispose() : void
      {
         this.image_bg = null;
         this.textarea_desc = null;
         this.button_ok = null;
         this.button_cancel = null;
         this.label_500 = null;
         this.checkbox_tip = null;
         this.label_only_this = null;
         super.Dispose();
      }
   }
}
