package com.qq.modules.main.view.components
{
   import asgui.controls.Button;
   import asgui.controls.Text;
   import com.qq.display.QWindow;
   
   public class VIPConfirmPanelCE extends QWindow
   {
       
      
      public var l_desc:Text;
      
      public var btn_vip:Button;
      
      public var btn_ok:Button;
      
      public function VIPConfirmPanelCE(param1:Class = null, param2:Boolean = true)
      {
         super(!!param2 ? (!!param1 ? param1 : VIPConfirmPanelMediator) : null);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.title = "温馨提示";
         this.width = 300;
         this.height = 180;
         this.l_desc = new Text();
         this.l_desc.text = "  只有vip 3 才能打开第三个箱子3123123123123123123123123123123123123123123123123";
         this.l_desc.x = 0;
         this.l_desc.y = 10;
         this.l_desc.width = 250;
         this.l_desc.height = 60;
         this.l_desc.id = "l_desc";
         this.l_desc.styleName = ".TXT_HKHB_13_Yellow";
         this.l_desc.hcenter = 0;
         this.addChild(this.l_desc);
         this.btn_vip = new Button();
         this.btn_vip.label = "成为VIP";
         this.btn_vip.styleName = ".GreenButton_Bigger";
         this.btn_vip.x = 40;
         this.btn_vip.y = 80;
         this.btn_vip.width = 90;
         this.btn_vip.height = 40;
         this.btn_vip.id = "btn_vip";
         this.addChild(this.btn_vip);
         this.btn_ok = new Button();
         this.btn_ok.label = "确 定";
         this.btn_ok.styleName = ".GreenButton_Bigger";
         this.btn_ok.x = 160;
         this.btn_ok.y = 80;
         this.btn_ok.width = 90;
         this.btn_ok.height = 40;
         this.btn_ok.id = "btn_ok";
         this.addChild(this.btn_ok);
      }
      
      override public function Dispose() : void
      {
         this.l_desc = null;
         this.btn_vip = null;
         this.btn_ok = null;
         super.Dispose();
      }
   }
}
