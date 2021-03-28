package com.qq.modules.embattle.view
{
   import asgui.containers.Canvas;
   import asgui.containers.Tile;
   import asgui.events.DragEvent;
   import asgui.managers.DragManager;
   import asgui.managers.drags.DragProxy;
   import asgui.managers.drags.IReceivableImpl;
   import com.qq.display.QPanel;
   import com.qq.modules.basic.view.components.QPagerSmall;
   
   public class EmbattleCardListView extends QPanel implements IReceivableImpl
   {
       
      
      public var cardBox:Tile;
      
      public var pageBar:QPagerSmall;
      
      public function EmbattleCardListView(param1:Class = null)
      {
         super(param1 == null ? EmbattleCardListViewMediator : param1);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 340;
         this.height = 500;
         var _loc1_:Canvas = new Canvas();
         addChild(_loc1_);
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         this.cardBox = new Tile();
         addChild(this.cardBox);
         this.cardBox.left = 0;
         this.cardBox.right = 0;
         this.cardBox.top = -20;
         this.cardBox.bottom = 50;
         this.cardBox.SetStyle("paddingLeft","5");
         this.cardBox.SetStyle("paddingRight","10");
         this.cardBox.SetStyle("paddingTop","20");
         this.cardBox.SetStyle("horizontalGap","5");
         this.cardBox.SetStyle("verticalGap","5");
         this.pageBar = new QPagerSmall();
         addChild(this.pageBar);
         this.pageBar.bottom = 5;
         this.pageBar.hcenter = 0;
         DragManager.AddReceiver(this);
      }
      
      override public function Dispose() : void
      {
         DragManager.RemoveReceiver(this);
         super.Dispose();
      }
      
      public function get hasItem() : Boolean
      {
         return false;
      }
      
      public function DropHandler(param1:DragProxy) : void
      {
      }
      
      public function DropImplHandler(param1:DragProxy) : void
      {
         var _loc2_:DragEvent = new DragEvent(DragEvent.DRAG_DROP,false,true,param1.dragInitiator,param1.action);
         this.dispatchEvent(_loc2_);
      }
      
      public function OverHandler(param1:DragProxy) : void
      {
      }
      
      public function OutHandler(param1:DragProxy) : void
      {
      }
      
      public function StartHandler(param1:DragProxy) : void
      {
      }
      
      public function EndHandler(param1:DragProxy) : void
      {
         var _loc2_:DragEvent = new DragEvent(DragEvent.DRAG_EXIT,false,true,param1.dragInitiator,param1.action);
         dispatchEvent(_loc2_);
      }
   }
}
