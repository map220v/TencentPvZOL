package com.qq.modules.td.view.components
{
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   import com.qq.display.QCanvas;
   
   public class TDPrivilegeItemCellCE extends QCanvas
   {
       
      
      public var img_bk:Image;
      
      public var l_name:Label;
      
      public var l_desc_1:Label;
      
      public var l_desc_2:Label;
      
      public function TDPrivilegeItemCellCE(param1:Class = null, param2:Boolean = true)
      {
         super(!!param2 ? (!!param1 ? param1 : TDPrivilegeItemCellMediator) : null);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 575;
         this.height = 74;
         this.enabled = false;
         this.img_bk = new Image();
         this.img_bk.width = 575;
         this.img_bk.height = 74;
         this.img_bk.source = AssetManager.GetClass("UI_TD_Privilege_Item_BK");
         this.img_bk.x = 0;
         this.img_bk.y = 0;
         this.img_bk.id = "img_bk";
         this.img_bk.scrollRectEnabled = false;
         this.addChild(this.img_bk);
         this.l_name = new Label();
         this.l_name.text = "卡牌槽";
         this.l_name.styleName = ".TXT_HKHB_21_Yellow_Shadow";
         this.l_name.x = 30;
         this.l_name.y = 25;
         this.l_name.width = 120;
         this.l_name.height = 24;
         this.l_name.id = "l_name";
         this.addChild(this.l_name);
         this.l_desc_1 = new Label();
         this.l_desc_1.text = "永久拥有额外卡牌槽一个！";
         this.l_desc_1.styleName = ".TXT_HKHB_14_White_Gray_Center";
         this.l_desc_1.x = 248;
         this.l_desc_1.y = 11;
         this.l_desc_1.width = 260;
         this.l_desc_1.height = 24;
         this.l_desc_1.id = "l_desc_1";
         this.addChild(this.l_desc_1);
         this.l_desc_2 = new Label();
         this.l_desc_2.text = "只有特权贵族才有具备提前解锁的资格哦！";
         this.l_desc_2.styleName = ".TXT_HKHB_14_White_Gray_Center";
         this.l_desc_2.x = 221;
         this.l_desc_2.y = 40;
         this.l_desc_2.width = 300;
         this.l_desc_2.height = 24;
         this.l_desc_2.id = "l_desc_2";
         this.addChild(this.l_desc_2);
      }
      
      override public function Dispose() : void
      {
         this.img_bk = null;
         this.l_name = null;
         this.l_desc_1 = null;
         this.l_desc_2 = null;
         super.Dispose();
      }
   }
}
