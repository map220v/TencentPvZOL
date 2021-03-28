package com.qq.modules.td.view.components
{
   import asgui.controls.Button;
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.controls.List;
   import asgui.resources.AssetManager;
   import com.qq.display.QWindow;
   
   public class TDPrivilegeWindowCE extends QWindow
   {
       
      
      public var img_bk:Image;
      
      public var l_columnTitle_1:Label;
      
      public var l_columnTitle_2:Label;
      
      public var l_time:Label;
      
      public var btnActive:Button;
      
      public var l_title:Label;
      
      public var list:List;
      
      public var l_title_state:Label;
      
      public function TDPrivilegeWindowCE(param1:Class = null, param2:Boolean = true)
      {
         super(!!param2 ? (!!param1 ? param1 : TDPrivilegeWindowMediator) : null);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 860;
         this.height = 612;
         this.title = "塔防特权";
         this.x = 0;
         this.y = 0;
         this.img_bk = new Image();
         this.img_bk.width = 852;
         this.img_bk.height = 562;
         this.img_bk.source = AssetManager.GetClass("UI_TD_Privilege_BK");
         this.img_bk.x = 0;
         this.img_bk.y = 0;
         this.img_bk.id = "img_bk";
         this.img_bk.scrollRectEnabled = false;
         this.addChild(this.img_bk);
         this.l_columnTitle_1 = new Label();
         this.l_columnTitle_1.text = "特权福利";
         this.l_columnTitle_1.styleName = ".TXT_HKHB_20_White_Shadow_Brown";
         this.l_columnTitle_1.x = 290;
         this.l_columnTitle_1.y = 98;
         this.l_columnTitle_1.width = 100;
         this.l_columnTitle_1.height = 30;
         this.l_columnTitle_1.id = "l_columnTitle_1";
         this.addChild(this.l_columnTitle_1);
         this.l_columnTitle_2 = new Label();
         this.l_columnTitle_2.text = "福利详情";
         this.l_columnTitle_2.styleName = ".TXT_HKHB_20_White_Shadow_Brown";
         this.l_columnTitle_2.x = 585;
         this.l_columnTitle_2.y = 98;
         this.l_columnTitle_2.width = 100;
         this.l_columnTitle_2.height = 30;
         this.l_columnTitle_2.id = "l_columnTitle_2";
         this.addChild(this.l_columnTitle_2);
         this.l_time = new Label();
         this.l_time.text = "有效期：90天";
         this.l_time.styleName = ".TXT_HKHB_20_White_Shadow_Brown";
         this.l_time.x = 653;
         this.l_time.y = 466;
         this.l_time.width = 125;
         this.l_time.height = 24;
         this.l_time.id = "l_time";
         this.addChild(this.l_time);
         this.btnActive = new Button();
         this.btnActive.label = "一键激活所有特权";
         this.btnActive.styleName = ".GreenButton";
         this.btnActive.x = 622;
         this.btnActive.y = 490;
         this.btnActive.width = 200;
         this.btnActive.height = 60;
         this.btnActive.id = "btnActive";
         this.addChild(this.btnActive);
         this.l_title = new Label();
         this.l_title.text = "特权福利：";
         this.l_title.styleName = ".TXT_HKHB_21_Blue";
         this.l_title.x = 336;
         this.l_title.y = 20;
         this.l_title.width = 105;
         this.l_title.height = 32;
         this.l_title.id = "l_title";
         this.addChild(this.l_title);
         this.list = new List();
         this.list.width = 583;
         this.list.height = 322;
         this.list.verticalScrollPolicy = "on";
         this.list.horizontalScrollPolicy = "off";
         this.list.x = 243;
         this.list.y = 130;
         this.list.id = "list";
         this.list.selectable = false;
         this.list.styleName = ".HonorRank_List";
         this.addChild(this.list);
         this.l_title_state = new Label();
         this.l_title_state.x = 442;
         this.l_title_state.y = 20;
         this.l_title_state.width = 118;
         this.l_title_state.height = 28;
         this.l_title_state.id = "l_title_state";
         this.l_title_state.text = "未激活";
         this.l_title_state.styleName = ".TXT_HKHB_21_Blue";
         this.addChild(this.l_title_state);
      }
      
      override public function Dispose() : void
      {
         this.img_bk = null;
         this.l_columnTitle_1 = null;
         this.l_columnTitle_2 = null;
         this.l_time = null;
         this.btnActive = null;
         this.l_title = null;
         this.list = null;
         this.l_title_state = null;
         super.Dispose();
      }
   }
}
