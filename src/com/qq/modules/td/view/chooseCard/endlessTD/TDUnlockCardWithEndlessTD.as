package com.qq.modules.td.view.chooseCard.endlessTD
{
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   import com.qq.modules.td.view.chooseCard.selfCard.TDBasicChooseCard;
   import flash.display.MovieClip;
   
   public class TDUnlockCardWithEndlessTD extends TDBasicChooseCard
   {
       
      
      public var lockMc:MovieClip;
      
      public var ticketCostBg:Image;
      
      public var txtTicketCost:Label;
      
      private var _costTicket:int;
      
      public function TDUnlockCardWithEndlessTD(param1:Class, param2:Object)
      {
         super(TDUnlockCardWithEndlessTDMediator,param2);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.height = 95;
         this.lockMc = AssetManager.instance.GetNewClass("TD_UI_Lock") as MovieClip;
         this.lockMc.x = width - this.lockMc.width - 5;
         this.lockMc.y = 0;
         addChild(this.lockMc);
         this.ticketCostBg = new Image();
         this.ticketCostBg.y = 70;
         this.ticketCostBg.source = AssetManager.instance.GetClass("TDUI_TicketCostBar");
         this.addChild(this.ticketCostBg);
         this.txtTicketCost = new Label();
         this.txtTicketCost.styleName = ".TXT_TD_Card";
         this.txtTicketCost.width = this.width - 5;
         this.txtTicketCost.height = 20;
         this.txtTicketCost.x = 8;
         this.txtTicketCost.y = 68;
         this._costTicket = cardData.plantStaticInfo.baseInfo.costTicket;
         this.txtTicketCost.text = this._costTicket.toString();
         this.addChild(this.txtTicketCost);
      }
      
      public function get costTicket() : int
      {
         return this._costTicket;
      }
   }
}
