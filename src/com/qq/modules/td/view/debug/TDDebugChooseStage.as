package com.qq.modules.td.view.debug
{
   import asgui.containers.VBox;
   import asgui.controls.Button;
   import asgui.controls.TextInput;
   import com.qq.display.QWindow;
   
   public class TDDebugChooseStage extends QWindow
   {
       
      
      public var inputLabel:TextInput;
      
      public var okBtn:Button;
      
      public function TDDebugChooseStage()
      {
         super(TDDebugChooseStageMediator);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 265;
         this.height = 213;
         this.title = "输入进入的关卡";
         var _loc1_:VBox = new VBox();
         this.inputLabel = new TextInput();
         this.inputLabel.restrict = "0123456789";
         this.inputLabel.width = 100;
         _loc1_.addChild(this.inputLabel);
         this.okBtn = new Button();
         this.okBtn.label = "确定";
         _loc1_.addChild(this.okBtn);
         _loc1_.vcenter = 0;
         _loc1_.hcenter = 0;
         addChild(_loc1_);
      }
      
      override public function Dispose() : void
      {
         super.Dispose();
      }
   }
}
