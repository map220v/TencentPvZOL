package com.qq.modules.mergeServer.view.components
{
   import asgui.containers.VBox;
   import asgui.controls.Button;
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.controls.Text;
   import com.qq.display.QCanvas;
   import com.qq.utils.UrlManager;
   
   public class MergeServerTipPanelCE extends QCanvas
   {
       
      
      public var panelBG:Image;
      
      public var btnOK:Button;
      
      public var txtTitle:Label;
      
      public var txtTip:Label;
      
      public var contentBox:VBox;
      
      public var txtTip_0:Text;
      
      public var txtTip_1:Text;
      
      public var txtTip_2:Text;
      
      public function MergeServerTipPanelCE(param1:Class = null, param2:Boolean = true)
      {
         super(!!param2 ? (!!param1 ? param1 : MergeServerTipPanelMediator) : null);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 528;
         this.height = 387;
         this.panelBG = new Image();
         this.panelBG.width = 528;
         this.panelBG.height = 387;
         this.panelBG.source = UrlManager.getUrl(0,"image/mergeServer/panelBG.png");
         this.panelBG.x = 0;
         this.panelBG.y = 0;
         this.panelBG.id = "panelBG";
         this.addChild(this.panelBG);
         this.btnOK = new Button();
         this.btnOK.label = "确定";
         this.btnOK.styleName = ".GreenButtonRect_font_16";
         this.btnOK.width = 80;
         this.btnOK.height = 32;
         this.btnOK.id = "btnOK";
         this.btnOK.hcenter = 0;
         this.btnOK.bottom = 40;
         this.addChild(this.btnOK);
         this.txtTitle = new Label();
         this.txtTitle.text = "合服公告";
         this.txtTitle.styleName = ".TXT_HKHB_16_Yellow_BrownBorder_Center";
         this.txtTitle.y = 50;
         this.txtTitle.width = 200;
         this.txtTitle.height = 32;
         this.txtTitle.id = "txtTitle";
         this.txtTitle.hcenter = 0;
         this.addChild(this.txtTitle);
         this.txtTip = new Label();
         this.txtTip.text = "以上道具将通过邮件发送到您的邮箱中，请仔细查阅";
         this.txtTip.styleName = ".TXT_HKHB_16_Yellow_BrownBorder_Center";
         this.txtTip.y = 285;
         this.txtTip.width = 500;
         this.txtTip.height = 24;
         this.txtTip.id = "txtTip";
         this.txtTip.hcenter = 0;
         this.addChild(this.txtTip);
         this.contentBox = new VBox();
         this.contentBox.width = 480;
         this.contentBox.height = 180;
         this.contentBox.styleName = ".Box_Center";
         this.contentBox.y = 100;
         this.contentBox.id = "contentBox";
         this.contentBox.hcenter = 0;
         this.txtTip_0 = new Text();
         this.txtTip_0.text = "两个世界已互通，您的小镇将随机搬迁到一个位置，同时赠送一个高级小镇搬迁卡给您！";
         this.txtTip_0.styleName = ".TXT_HKHB_15_White_Blank_Frame";
         this.txtTip_0.width = 400;
         this.txtTip_0.height = 48;
         this.txtTip_0.id = "txtTip_0";
         this.contentBox.addChild(this.txtTip_0);
         this.txtTip_1 = new Text();
         this.txtTip_1.text = "您与其他玩家重名，已增加前缀区分，同时赠送一个改名卡给您！";
         this.txtTip_1.styleName = ".TXT_HKHB_15_White_Blank_Frame";
         this.txtTip_1.width = 400;
         this.txtTip_1.height = 48;
         this.txtTip_1.id = "txtTip_1";
         this.contentBox.addChild(this.txtTip_1);
         this.txtTip_2 = new Text();
         this.txtTip_2.text = "您的联盟与其他联盟重名，已增加前缀区分，同时赠送一个联盟改名卡给您！";
         this.txtTip_2.styleName = ".TXT_HKHB_15_White_Blank_Frame";
         this.txtTip_2.width = 400;
         this.txtTip_2.height = 48;
         this.txtTip_2.id = "txtTip_2";
         this.contentBox.addChild(this.txtTip_2);
         this.addChild(this.contentBox);
      }
      
      override public function Dispose() : void
      {
         this.panelBG = null;
         this.btnOK = null;
         this.txtTitle = null;
         this.txtTip = null;
         this.contentBox = null;
         super.Dispose();
      }
   }
}
