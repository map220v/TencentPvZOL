package com.qq.modules.mapinfo.view.components
{
   import asgui.controls.Button;
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.controls.TextInput;
   import com.qq.display.QCanvas;
   import com.qq.utils.UrlManager;
   
   public class MapInfoMoviCityFixWndCE extends QCanvas
   {
       
      
      public var imgBack:Image;
      
      public var btnClose:Image;
      
      public var txtName:Label;
      
      public var txtDesc:Label;
      
      public var txtX:TextInput;
      
      public var txtY:TextInput;
      
      public var btnConfirm:Button;
      
      public var btnCancel:Button;
      
      public function MapInfoMoviCityFixWndCE(param1:Class = null, param2:Boolean = true)
      {
         super(!!param2 ? (!!param1 ? param1 : MapInfoMoviCityFixWndMediator) : null);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 302;
         this.height = 166;
         this.styleName = ".LightBluePanel";
         this.imgBack = new Image();
         this.imgBack.width = 284;
         this.imgBack.height = 117;
         this.imgBack.x = 9;
         this.imgBack.y = 10;
         this.imgBack.id = "imgBack";
         this.imgBack.source = UrlManager.getUrl(0,"swf/mapinfo/move_ctiy_fix_back.swf");
         this.addChild(this.imgBack);
         this.btnClose = new Image();
         this.btnClose.width = 32;
         this.btnClose.height = 29;
         this.btnClose.source = UrlManager.getUrl(0,"swf/mapinfo/btn_close.swf");
         this.btnClose.x = 222;
         this.btnClose.y = 58;
         this.btnClose.id = "btnClose";
         this.btnClose.right = 12;
         this.btnClose.top = 14;
         this.addChild(this.btnClose);
         this.txtName = new Label();
         this.txtName.text = "高级小镇搬迁卡";
         this.txtName.styleName = ".TXT_HKHB_18_Golden";
         this.txtName.x = 90;
         this.txtName.y = 22;
         this.txtName.width = 180;
         this.txtName.height = 24;
         this.txtName.id = "txtName";
         this.addChild(this.txtName);
         this.txtDesc = new Label();
         this.txtDesc.text = "迁移到本国内指定的一个地点";
         this.txtDesc.styleName = ".TXT_HKHB_12_White";
         this.txtDesc.x = 90;
         this.txtDesc.y = 54;
         this.txtDesc.width = 180;
         this.txtDesc.height = 24;
         this.txtDesc.id = "txtDesc";
         this.addChild(this.txtDesc);
         this.txtX = new TextInput();
         this.txtX.text = "0";
         this.txtX.styleName = ".textInputNoBackground";
         this.txtX.x = 100;
         this.txtX.y = 94;
         this.txtX.width = 48;
         this.txtX.height = 24;
         this.txtX.id = "txtX";
         this.addChild(this.txtX);
         this.txtY = new TextInput();
         this.txtY.text = "0";
         this.txtY.styleName = ".textInputNoBackground";
         this.txtY.x = 203;
         this.txtY.y = 94;
         this.txtY.width = 48;
         this.txtY.height = 24;
         this.txtY.id = "txtY";
         this.addChild(this.txtY);
         this.btnConfirm = new Button();
         this.btnConfirm.label = "确定";
         this.btnConfirm.styleName = ".GreenButton_Bigger";
         this.btnConfirm.x = 65;
         this.btnConfirm.y = 130;
         this.btnConfirm.width = 74;
         this.btnConfirm.height = 29;
         this.btnConfirm.id = "btnConfirm";
         this.addChild(this.btnConfirm);
         this.btnCancel = new Button();
         this.btnCancel.label = "取消";
         this.btnCancel.styleName = ".GreenButton_Bigger";
         this.btnCancel.x = 162;
         this.btnCancel.y = 130;
         this.btnCancel.width = 74;
         this.btnCancel.height = 29;
         this.btnCancel.id = "btnCancel";
         this.addChild(this.btnCancel);
      }
      
      override public function Dispose() : void
      {
         this.imgBack = null;
         this.btnClose = null;
         this.txtName = null;
         this.txtDesc = null;
         this.txtX = null;
         this.txtY = null;
         this.btnConfirm = null;
         this.btnCancel = null;
         super.Dispose();
      }
   }
}
