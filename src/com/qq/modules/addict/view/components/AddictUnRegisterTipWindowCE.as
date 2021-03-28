package com.qq.modules.addict.view.components
{
   import asgui.controls.Button;
   import asgui.controls.Label;
   import asgui.controls.TextArea;
   import com.qq.display.QWindow;
   
   public class AddictUnRegisterTipWindowCE extends QWindow
   {
       
      
      public var okBtn:Button;
      
      public var leftTimeTipLabel:Label;
      
      public var contentText:TextArea;
      
      public function AddictUnRegisterTipWindowCE(param1:Class = null, param2:Boolean = true)
      {
         super(!!param2 ? (!!param1 ? param1 : AddictUnRegisterTipWindowMediator) : null);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 380;
         this.height = 220;
         this.okBtn = new Button();
         this.okBtn.label = "确认";
         this.okBtn.styleName = ".GreenButton";
         this.okBtn.x = 0;
         this.okBtn.y = 0;
         this.okBtn.width = 130;
         this.okBtn.height = 54;
         this.okBtn.id = "okBtn";
         this.okBtn.hcenter = 0;
         this.okBtn.bottom = 10;
         this.addChild(this.okBtn);
         this.leftTimeTipLabel = new Label();
         this.leftTimeTipLabel.text = "10秒后自动关闭";
         this.leftTimeTipLabel.x = 175;
         this.leftTimeTipLabel.y = 138;
         this.leftTimeTipLabel.width = 105;
         this.leftTimeTipLabel.height = 24;
         this.leftTimeTipLabel.id = "leftTimeTipLabel";
         this.leftTimeTipLabel.right = 4;
         this.leftTimeTipLabel.bottom = 25;
         this.addChild(this.leftTimeTipLabel);
         this.contentText = new TextArea();
         this.contentText.styleName = ".textAreaNoBackground";
         this.contentText.x = 39;
         this.contentText.y = 62;
         this.contentText.width = 48;
         this.contentText.height = 24;
         this.contentText.id = "contentText";
         this.contentText.left = 20;
         this.contentText.right = 20;
         this.contentText.top = 10;
         this.contentText.bottom = 70;
         this.contentText.enabled = false;
         this.addChild(this.contentText);
      }
      
      override public function Dispose() : void
      {
         this.okBtn = null;
         this.leftTimeTipLabel = null;
         this.contentText = null;
         super.Dispose();
      }
   }
}
