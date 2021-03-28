package com.qq.modules.td.view.components
{
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   import com.qq.display.CardIcon;
   import com.qq.display.QCanvas;
   import com.qq.modules.td.model.vo.TDCardData;
   import flash.display.Shape;
   
   public class TDLimitCountCard extends QCanvas
   {
       
      
      public var txtCardCount:Label;
      
      private var bg:Image;
      
      private var icon:CardIcon;
      
      public var cardData:TDCardData;
      
      public var maskShape:Shape;
      
      private var _cardCount:int;
      
      private var _selected:Boolean;
      
      public function TDLimitCountCard(param1:TDCardData)
      {
         this.cardData = param1;
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 70;
         this.height = 90;
         this.bg = new Image();
         this.bg.source = AssetManager.GetClass("Card_bj_quality_5");
         addChild(this.bg);
         this.txtCardCount = new Label();
         this.txtCardCount.y = 67;
         this.txtCardCount.SetStyle("textAlign","center");
         this.txtCardCount.width = 70;
         this.addChild(this.txtCardCount);
         this.icon = new CardIcon();
         addChild(this.icon);
         this.icon.setCardIconByPlantId(this.cardData.plantStaticInfo.id);
         this.icon.x = 5;
         this.icon.y = 5;
         this.maskShape = new Shape();
         this.maskShape.x = 0;
         this.maskShape.y = 0;
         this.maskShape.graphics.beginFill(0,0.3);
         this.maskShape.graphics.drawRect(0,0,70,90);
         this.maskShape.graphics.endFill();
         this.addChild(this.maskShape);
         this.selected = false;
      }
      
      public function get cardCount() : int
      {
         return this._cardCount;
      }
      
      public function set cardCount(param1:int) : void
      {
         this._cardCount = param1;
         this.txtCardCount.text = "剩余x" + this._cardCount;
      }
      
      public function set selected(param1:Boolean) : void
      {
         this.maskShape.visible = param1;
      }
      
      override public function Dispose() : void
      {
         super.Dispose();
      }
   }
}
