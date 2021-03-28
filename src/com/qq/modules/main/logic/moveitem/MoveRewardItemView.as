package com.qq.modules.main.logic.moveitem
{
   import asgui.controls.Label;
   import com.qq.display.CardIcon;
   import com.qq.display.QCanvas;
   
   public class MoveRewardItemView extends QCanvas
   {
       
      
      public var icon:CardIcon;
      
      public var text:Label;
      
      public function MoveRewardItemView()
      {
         super(MoveRewardItemViewMediator);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.mouseChildren = false;
         this.mouseEnabled = false;
         width = 150;
         height = 100;
         scrollRectEnabled = false;
         this.icon = new CardIcon();
         this.icon.width = 50;
         this.icon.height = 50;
         this.icon.vcenter = 0;
         addChild(this.icon);
         this.text = new Label();
         this.text.x = this.icon.width;
         this.text.vcenter = 10;
         this.text.width = 250;
         this.text.height = 50;
         this.text.SetStyle("textAlign","left");
         this.text.styleName = ".TXT_HKHB_25_White_BEVEL";
         addChild(this.text);
      }
      
      override public function Dispose() : void
      {
         if(this.icon)
         {
            this.icon.Dispose();
         }
         super.Dispose();
      }
   }
}
