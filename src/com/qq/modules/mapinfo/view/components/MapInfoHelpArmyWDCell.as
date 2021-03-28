package com.qq.modules.mapinfo.view.components
{
   import asgui.controls.Button;
   import asgui.controls.Label;
   import com.qq.display.QCanvas;
   
   public class MapInfoHelpArmyWDCell extends QCanvas
   {
       
      
      public var btn_sendBack:Button;
      
      public var info:Label;
      
      public function MapInfoHelpArmyWDCell()
      {
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 395;
         this.height = 28;
         this.styleName = ".ListBase_yellow_Cell";
         this.btn_sendBack = new Button();
         addChild(this.btn_sendBack);
         this.btn_sendBack.styleName = ".GreenButtonSmall";
         this.btn_sendBack.label = "送回";
         this.btn_sendBack.right = 10;
         this.btn_sendBack.vcenter = 0;
         this.info = new Label();
         this.info.height = 24;
         addChild(this.info);
         this.info.left = 10;
         this.info.right = this.btn_sendBack.width;
         this.info.y = 5;
         this.info.text = "  ";
      }
      
      public function setData(param1:String = null) : void
      {
         if(param1 == null || param1 == "")
         {
            this.btn_sendBack.enabled = false;
            this.btn_sendBack.visible = false;
            this.info.text = "";
            return;
         }
         this.btn_sendBack.visible = true;
         this.btn_sendBack.enabled = true;
         this.info.text = param1;
      }
      
      override public function Dispose() : void
      {
         super.Dispose();
      }
   }
}
