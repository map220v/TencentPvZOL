package com.qq.modules.arena.view.comps
{
   import asgui.controls.Label;
   import com.qq.display.QCanvas;
   import flash.text.TextFormat;
   
   public class NameDataBar extends QCanvas
   {
       
      
      public var txt_name:Label;
      
      public var txt_data:Label;
      
      public function NameDataBar(param1:Class = null)
      {
         super(param1);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 140;
         this.height = 30;
         this.txt_name = new Label();
         addChild(this.txt_name);
         this.txt_name.styleName = ".TXT_HKHB_13_Yellow";
         this.txt_name.SetStyle("color","#FDEA69");
         this.txt_name.width = 75;
         this.txt_data = new Label();
         addChild(this.txt_data);
         this.txt_data.styleName = ".TXT_HKHB_13_Yellow";
         this.txt_data.SetStyle("color","#55A7B3");
         this.txt_data.width = width - this.txt_name.width;
         this.txt_data.height = 22;
         this.txt_data.x = this.txt_name.width;
      }
      
      public function setUnderline(param1:Boolean) : void
      {
         var _loc2_:TextFormat = this.txt_data.textField.defaultTextFormat;
         _loc2_.underline = param1;
         this.txt_data.textField.setTextFormat(_loc2_);
      }
      
      public function setDataToolTip(param1:String) : void
      {
         this.setUnderline(true);
         this.txt_data.toolTip = param1;
      }
      
      public function setName(param1:String) : void
      {
         this.txt_name.text = param1;
      }
      
      public function setData(param1:String) : void
      {
         this.txt_data.text = param1;
      }
      
      public function setDataColor(param1:String = "#55A7B3") : void
      {
         this.txt_data.SetStyle("color",param1);
      }
   }
}
