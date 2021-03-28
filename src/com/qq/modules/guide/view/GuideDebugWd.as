package com.qq.modules.guide.view
{
   import asgui.containers.HBox;
   import asgui.containers.VBox;
   import asgui.controls.Button;
   import asgui.controls.TextArea;
   import asgui.controls.TextInput;
   import asgui.core.ScrollPolicy;
   import com.qq.display.QWindow;
   
   public class GuideDebugWd extends QWindow
   {
       
      
      public var txt:TextArea;
      
      public var box:VBox;
      
      public var GMBtn:Button;
      
      public var GMInput:TextInput;
      
      public function GuideDebugWd()
      {
         super(GuideDebugWdMediator);
      }
      
      override public function Dispose() : void
      {
         super.Dispose();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 450;
         this.height = 600;
         this.box = new VBox();
         this.box.verticalScrollPolicy = ScrollPolicy.ON;
         this.box.right = 10;
         this.box.left = 0;
         this.box.top = 0;
         this.box.bottom = 0;
         this.addChild(this.box);
         this.txt = new TextArea(false);
         this.txt.styleName = ".TextInput_Gray";
         this.txt.SetStyle("paddingRight","20");
         this.txt.SetStyle("scrollBarPaddingRight","20");
         this.txt.editable = true;
         this.txt.verticalScrollPolicy = ScrollPolicy.AUTO;
         this.txt.width = 400;
         this.txt.height = 350;
         this.box.addChild(this.txt);
         var _loc1_:HBox = new HBox();
         this.box.addChild(_loc1_);
         this.GMInput = new TextInput();
         this.GMInput.width = 300;
         this.GMInput.height = 25;
         this.GMInput.styleName = ".TextInput_Gray";
         _loc1_.addChild(this.GMInput);
         this.GMBtn = new Button();
         this.GMBtn.styleName = ".GreenButtonMid";
         this.GMBtn.label = "run";
         _loc1_.addChild(this.GMBtn);
         this.box.verticalScrollPolicy = ScrollPolicy.OFF;
      }
   }
}
