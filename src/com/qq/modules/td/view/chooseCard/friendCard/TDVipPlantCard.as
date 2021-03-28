package com.qq.modules.td.view.chooseCard.friendCard
{
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   import com.qq.display.CardIcon;
   import com.qq.display.QCanvas;
   import com.qq.managers.FilterManager;
   import com.qq.modules.td.model.vo.TDCardData;
   import com.qq.modules.td.view.helpers.TDStaticInfoToolTipHelper;
   import com.qq.templates.font.FontFZYH;
   import com.qq.templates.font.FontHKHB;
   
   public class TDVipPlantCard extends QCanvas
   {
       
      
      public var priceTF:Label;
      
      public var priceBg:Image;
      
      public var bg:Image;
      
      public var loader:CardIcon;
      
      private var txtTip:Label;
      
      private var toolTipHelper:TDStaticInfoToolTipHelper;
      
      private var _cardData:TDCardData;
      
      private var _isEnable:Boolean;
      
      public function TDVipPlantCard()
      {
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 54;
         this.height = 100;
         this.scrollRectEnabled = false;
         this.bg = new Image();
         var _loc1_:* = AssetManager.GetNewClass("TD_UI_CardBG4");
         this.bg.source = _loc1_;
         this.addChild(this.bg);
         this.loader = new CardIcon();
         addChild(this.loader);
         this.priceBg = new Image();
         this.priceBg.y = 55;
         this.priceBg.source = AssetManager.instance.GetClass("TD_UI_CardBar2");
         this.addChild(this.priceBg);
         this.priceTF = new Label();
         this.priceTF.styleName = ".TXT_TD_Card";
         this.priceTF.width = this.width - 5;
         this.priceTF.height = 20;
         this.priceTF.x = 3;
         this.priceTF.y = 53;
         this.addChild(this.priceTF);
         this.txtTip = new Label();
         this.txtTip.x = -20;
         this.txtTip.y = 75;
         this.txtTip.width = 100;
         this.txtTip.styleName = ".TXT_HKHB_13_Yellow";
         this.txtTip.text = FontHKHB.TD_VIP_PLANT_DESC;
         this.addChild(this.txtTip);
         this.toolTipHelper = new TDStaticInfoToolTipHelper(false);
      }
      
      public function get cardData() : TDCardData
      {
         return this._cardData;
      }
      
      public function set cardData(param1:TDCardData) : void
      {
         this._cardData = param1 as TDCardData;
         if(this._cardData.plantStaticInfo)
         {
            this.loader.setCardIconByPlantId(this._cardData.plantStaticInfo.id,this._cardData.plantInfo.avatarId);
            this.isEnable = this._cardData.isCanUse;
            this.toolTipHelper.addListen(this,this.cardData);
         }
      }
      
      public function get isEnable() : Boolean
      {
         return this._isEnable;
      }
      
      public function set isEnable(param1:Boolean) : void
      {
         this._isEnable = param1;
         if(this._isEnable)
         {
            this.priceTF.text = this._cardData.plantStaticInfo.baseInfo.price.toString();
            this.filters = null;
         }
         else
         {
            this.priceTF.text = FontFZYH.NOT_ACTIVE;
            this.filters = [FilterManager.getGaryFilter()];
         }
      }
      
      override public function Dispose() : void
      {
         if(this.toolTipHelper)
         {
            this.toolTipHelper.removeListen();
            this.toolTipHelper = null;
         }
         super.Dispose();
      }
   }
}
