package com.qq.modules.td.view.game.ui.plant
{
   import asgui.blit.display.IBlitDisplayObject;
   import com.qq.modules.td.view.game.layer.TDBasicLayer;
   import com.qq.utils.QDisplayUtil;
   import flash.geom.Point;
   
   public class TDCardSlotPanel extends TDBasicLayer
   {
       
      
      public var cardList:Array;
      
      public var bgId:int;
      
      private var initX:int;
      
      private var initY:int;
      
      public function TDCardSlotPanel(param1:int)
      {
         this.bgId = param1;
         this.name = "TDCardSlotPanel";
         super();
      }
      
      override public function Dispose() : void
      {
         if(hasDisposed)
         {
            return;
         }
         QDisplayUtil.unregisterView("$TDCardSlotPanel");
         super.Dispose();
      }
      
      override protected function init() : void
      {
         super.init();
         this.cardList = new Array();
         QDisplayUtil.registerView("$TDCardSlotPanel",this);
      }
      
      public function getCardPosByIndex(param1:int) : Point
      {
         var _loc3_:TDCardSlot = null;
         var _loc4_:int = 0;
         var _loc2_:Point = new Point();
         if(this.cardList.length > 0)
         {
            _loc3_ = this.cardList[0];
            _loc4_ = _loc3_.width;
         }
         _loc2_.x = (_loc4_ + 1) * param1;
         _loc2_.y = 0;
         return this.display.localToGlobal(_loc2_);
      }
      
      public function getCardBgByIndex(param1:int) : IBlitDisplayObject
      {
         var _loc2_:TDCardSlot = this.cardList[param1];
         return _loc2_.content;
      }
      
      public function show() : void
      {
         setVisible(true);
      }
      
      public function hide() : void
      {
         setVisible(false);
      }
      
      public function initLocation(param1:int, param2:int) : void
      {
         this.initY = param2;
         this.initX = param1;
         this.setLocation(param1,param2);
      }
      
      public function getCardBarWidth() : int
      {
         var _loc3_:TDCardSlot = null;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this.cardList.length)
         {
            _loc3_ = this.cardList[_loc2_];
            _loc1_ += _loc3_.width + 1;
            _loc2_++;
         }
         return _loc1_;
      }
   }
}
