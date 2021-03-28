package com.qq.modules.td.view.components
{
   import com.qq.display.QCanvas;
   import com.qq.modules.td.view.game.layer.ITDLocationUpdatable;
   
   public class TDLimitCountCardSlotPanel extends QCanvas implements ITDLocationUpdatable
   {
       
      
      public var cardList:Array;
      
      public function TDLimitCountCardSlotPanel()
      {
         super(TDLimitCountCardSlotPanelMediator);
         this.cardList = [];
      }
      
      public function updateLocation() : void
      {
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
      }
      
      public function addCard(param1:TDLimitCountCard) : void
      {
         this.cardList.push(param1);
         param1.x = 250 + 70 * this.cardList.length;
         this.addChild(param1);
      }
   }
}
