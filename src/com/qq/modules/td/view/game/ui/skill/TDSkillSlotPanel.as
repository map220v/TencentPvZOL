package com.qq.modules.td.view.game.ui.skill
{
   import com.qq.modules.td.view.game.layer.TDBasicLayer;
   import com.qq.utils.UIFactory;
   import com.qq.utils.ui.MixTextField;
   import flash.geom.Point;
   
   public class TDSkillSlotPanel extends TDBasicLayer
   {
      
      private static const PROG_X_MIN:int = 8;
      
      private static const PROG_X_MAX:int = 205;
       
      
      public var cardList:Array;
      
      public var bgLayer:TDBasicLayer;
      
      public var cardLayer:TDBasicLayer;
      
      public var topLayer:TDBasicLayer;
      
      public var txt:MixTextField;
      
      private var coinValue:int;
      
      private var coinTotal:int;
      
      private var initX:int;
      
      private var initY:int;
      
      private var targetPercent:Number;
      
      public function TDSkillSlotPanel()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         this.bgLayer = new TDBasicLayer();
         addMixLayer(this.bgLayer);
         this.cardLayer = new TDBasicLayer();
         addMixLayer(this.cardLayer);
         this.topLayer = new TDBasicLayer();
         this.topLayer.mouseChildren = false;
         this.topLayer.mouseEnabled = false;
         this.topLayer.x = 6;
         this.cardList = new Array();
         addMixLayer(this.topLayer);
         this.txt = UIFactory.createMixTextField(192,75,54,24,"center",0,14,"Arial Black");
         this.txt.setText("0");
      }
      
      override public function Dispose() : void
      {
         super.Dispose();
      }
      
      public function getCardPosByIndex(param1:int) : Point
      {
         var _loc3_:int = 0;
         var _loc4_:TDSkillSlot = null;
         var _loc2_:Point = new Point();
         if(this.cardList.length > 0)
         {
            _loc3_ = (_loc4_ = this.cardList[0]).width;
         }
         _loc2_.x = (_loc3_ + 1) * param1;
         _loc2_.y = 0;
         return this.cardLayer.display.localToGlobal(_loc2_);
      }
      
      public function getCardNum() : int
      {
         return this.cardList.length;
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
   }
}
