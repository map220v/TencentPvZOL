package com.qq.modules.td.view.game.ui
{
   import asgui.styles.StyleManager;
   import com.qq.GameGloble;
   import com.qq.constant.ResLibID;
   import com.qq.modules.basic.view.BasicPage;
   import com.qq.utils.ResLibManager;
   import com.qq.utils.UtilsManager;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.text.TextField;
   
   public class TDProcessBar extends BasicPage
   {
       
      
      public var barBg:MovieClip;
      
      public var zombieFlagStartX:int;
      
      public var barW:Number;
      
      public var levelInfoTF:TextField;
      
      public var panelW:int;
      
      private var barMaskRight:int;
      
      public function TDProcessBar()
      {
         super();
      }
      
      override protected function init() : void
      {
         this.panelW = 183;
         this.barBg = ResLibManager.getInstance().createDisplayObject("TD_UI_ProcessBar",ResLibID.TDRes) as MovieClip;
         addChild(this.barBg);
         this.barW = this.barBg.barMask.width;
         this.zombieFlagStartX = 0;
         this.levelInfoTF = new TextField();
         addChild(this.levelInfoTF);
         StyleManager.GetStyleDeclaration(".TXT_FZYHJW_16_d2af5c").SetTextFieldStyle(this.levelInfoTF);
         this.onResize(null);
         GameGloble.stage.addEventListener(Event.RESIZE,this.onResize);
         this.barMaskRight = this.barBg.barMask.x + this.barBg.barMask.width;
      }
      
      public function setProcessValue(param1:Number) : void
      {
         var _loc2_:MovieClip = this.barBg.barMask;
         while(_loc2_.numChildren > 0)
         {
            _loc2_.removeChildAt(0);
         }
         if(isNaN(param1) || param1 <= 0)
         {
            return;
         }
         _loc2_.graphics.clear();
         _loc2_.graphics.beginFill(0);
         _loc2_.graphics.drawRect(this.barMaskRight - this.barW * param1,0,this.barW * param1,24);
         _loc2_.graphics.endFill();
      }
      
      public function cleanProcessBar() : void
      {
         while(this.barBg.flagLayer.numChildren > 0)
         {
            this.barBg.flagLayer.removeChildAt(0);
         }
         this.setProcessValue(1);
      }
      
      private function onResize(param1:Event) : void
      {
         x = GameGloble.stage.stageWidth - this.panelW;
         y = GameGloble.stage.stageHeight - height + 15;
      }
      
      override public function Dispose() : void
      {
         if(this.barBg != null)
         {
            UtilsManager.removeFromContainer(this.barBg);
            this.barBg = null;
         }
         GameGloble.stage.removeEventListener(Event.RESIZE,this.onResize);
         super.Dispose();
      }
   }
}
