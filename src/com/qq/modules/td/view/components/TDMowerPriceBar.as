package com.qq.modules.td.view.components
{
   import asgui.blit.display.IBlitClip;
   import asgui.blit.display.IBlitDisplayContainer;
   import asgui.containers.Canvas;
   import asgui.controls.Image;
   import asgui.core.IDisposable;
   import asgui.resources.AssetManager;
   import com.qq.utils.blit.QBlitUI;
   import flash.filters.GlowFilter;
   import flash.text.TextField;
   
   public class TDMowerPriceBar implements IDisposable
   {
       
      
      private var txt_price:TextField;
      
      private var _priceClip:IBlitClip;
      
      private var _container:IBlitDisplayContainer;
      
      private var _bgImg:Image;
      
      private var _con:Canvas;
      
      public function TDMowerPriceBar()
      {
         super();
         this._container = QBlitUI.createContainer();
         this._container.mouseEnabled = false;
         this._con = new Canvas();
         this._bgImg = new Image();
         this._bgImg.width = 53;
         this._bgImg.height = 16;
         this._bgImg.source = AssetManager.GetClass("TDUI_GoldTicketCostBar");
         this._con.addChild(this._bgImg);
      }
      
      public function setPrice(param1:int) : void
      {
         if(this.txt_price)
         {
            return;
         }
         this.txt_price = new TextField();
         this.txt_price.width = 40;
         this.txt_price.height = 20;
         this.txt_price.htmlText = "<font color=\'#FFF668\'><b>" + param1.toString() + "</b></font>";
         this.txt_price.x = 25;
         this.txt_price.y = -1;
         this.txt_price.filters = [new GlowFilter(0,1,2,2,10)];
         this._con.addChild(this.txt_price);
         this._priceClip = QBlitUI.createClipFromSource(this._con);
         this._container.AddChild(this._priceClip);
      }
      
      public function get container() : IBlitDisplayContainer
      {
         return this._container;
      }
      
      public function Dispose() : void
      {
         this._container.RemoveAllChildren();
         this._priceClip.Dispose();
         this._container.Dispose();
      }
      
      public function get hasDisposed() : Boolean
      {
         return false;
      }
   }
}
