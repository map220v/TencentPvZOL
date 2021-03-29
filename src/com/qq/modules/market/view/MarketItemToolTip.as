package com.qq.modules.market.view
{
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.controls.Text;
   import asgui.core.IToolTip;
   import asgui.resources.AssetManager;
   import com.qq.display.QCanvas;
   import com.qq.templates.font.FontHKHB;
   
   public class MarketItemToolTip extends QCanvas implements IToolTip
   {
       
      
      public var nameTxt:Label;
      
      public var cutOff:Image;
      
      public var hasName:Label;
      
      public var hasData:Label;
      
      public var useName:Label;
      
      public var useData:Text;
      
      public var getWayName:Label;
      
      public var getWayData:Text;
      
      public var _data:String;
      
      public function MarketItemToolTip(param1:Class = null)
      {
         super(MarketItemToolTipMediator);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 230;
         this.height = 500;
         this.styleName = "ToolTip";
         this.nameTxt = new Label();
         addChild(this.nameTxt);
         this.nameTxt.text = "向日葵";
         this.nameTxt.left = 0;
         this.nameTxt.right = 0;
         this.nameTxt.height = 20;
         this.nameTxt.styleName = ".TXT_Panel_Title";
         this.nameTxt.SetStyle("textAlign","left");
         this.cutOff = new Image();
         addChild(this.cutOff);
         this.cutOff.source = AssetManager.GetClass("skin_battle_cutOff");
         this.cutOff.y = this.nameTxt.y + this.nameTxt.height;
         this.cutOff.left = 0;
         this.cutOff.right = 10;
         this.hasName = new Label();
         addChild(this.hasName);
         this.hasName.text = FontHKHB.MARKET_HAS_ITEM;
         this.hasName.styleName = ".TXT_HKHB_13_White";
         this.hasName.SetStyle("color","#EBB00C");
         this.hasName.width = 50;
         this.hasName.height = 20;
         this.hasName.y = this.nameTxt.y + this.nameTxt.height + 10;
         this.hasData = new Label();
         this.hasData.text = "100";
         this.hasData.styleName = ".TXT_HKHB_13_White";
         this.hasData.SetStyle("embedFonts","false");
         addChild(this.hasData);
         this.hasData.width = 60;
         this.hasData.height = 20;
         this.hasData.y = this.hasName.y;
         this.hasData.x = this.hasName.x + this.hasName.width;
         this.useName = new Label();
         this.useName.text = FontHKHB.MARKET_USE;
         this.useName.styleName = ".TXT_HKHB_13_White";
         this.useName.SetStyle("color","#EBB00C");
         addChild(this.useName);
         this.useName.width = 50;
         this.useName.height = 20;
         this.useName.y = this.hasData.y + this.hasData.height;
         this.useData = new Text();
         addChild(this.useData);
         this.useData.text = "市场中用来兑换好东西";
         this.useData.styleName = ".TXT_HKHB_13_White";
         this.useData.SetStyle("embedFonts","false");
         this.useData.width = 140;
         this.useData.height = 20;
         this.useData.y = this.useName.y;
         this.useData.x = this.useName.x + this.useName.width;
         this.getWayName = new Label();
         addChild(this.getWayName);
         this.getWayName.text = FontHKHB.MARKET_GET_WAY;
         this.getWayName.styleName = ".TXT_HKHB_13_White";
         this.getWayName.SetStyle("color","#EBB00C");
         this.getWayName.width = 120;
         this.getWayName.height = 20;
         this.getWayName.y = this.useData.y + this.useData.height;
         this.getWayData = new Text();
         addChild(this.getWayData);
         this.getWayData.text = "怪物掉落";
         this.getWayData.styleName = ".TXT_HKHB_13_White";
         this.getWayData.SetStyle("color","#00EC32");
         this.getWayData.SetStyle("embedFonts","false");
         this.getWayData.left = 0;
         this.getWayData.right = 0;
      }
      
      public function layout() : void
      {
         this.useData.height = this.useData.textHeight + 5;
         if(this.useData.text == "" || this.useData.text == null)
         {
            this.getWayName.y = this.useName.y + this.useName.height + 5;
         }
         else
         {
            this.getWayName.y = this.useData.y + this.useData.height;
         }
         this.getWayData.y = this.getWayName.y + this.getWayName.height;
         this.getWayData.height = this.getWayData.textHeight + 5;
         this.height = this.getWayData.y + this.getWayData.height + 18;
      }
      
      public function get text() : Object
      {
         return this._data;
      }
      
      public function set text(param1:Object) : void
      {
         this._data = param1 as String;
         (getMediator() as MarketItemToolTipMediator).update();
      }
   }
}
