package com.qq.modules.td.view.game.ui
{
   import asgui.blit.display.IBlitClip;
   import asgui.blit.display.IBlitDisplayContainer;
   import com.qq.modules.td.view.game.layer.TDBasicLayer;
   import com.qq.templates.font.FontNormal;
   import com.qq.utils.blit.QBlitUI;
   import com.qq.utils.blit.QBlitUIContainerHelper;
   
   public class TDShovelPanel extends TDBasicLayer
   {
       
      
      public var shovelView:IBlitDisplayContainer;
      
      private var tip:QBlitUIContainerHelper;
      
      public function TDShovelPanel()
      {
         super();
      }
      
      override protected function init() : void
      {
         var _loc1_:IBlitDisplayContainer = null;
         var _loc2_:IBlitClip = null;
         super.init();
         _loc2_ = QBlitUI.createClipFromClassName("TD_UI_ShovelBank");
         _loc2_.name = "TD_UI_ShovelBank";
         addComponentToLayer(_loc2_);
         this.shovelView = QBlitUI.createContainer();
         var _loc3_:IBlitClip = QBlitUI.createClipFromClassName("TD_UI_ShovelItem");
         _loc3_.name = "TD_UI_ShovelItem";
         _loc3_.x = 3;
         _loc3_.y = 3;
         this.shovelView.AddChild(_loc3_);
         addComponentToLayer(this.shovelView);
         this.tip = new QBlitUIContainerHelper(this.shovelView,FontNormal.TD_Btn_Shovel);
      }
      
      override public function Dispose() : void
      {
         this.tip.Dispose();
         super.Dispose();
      }
   }
}
