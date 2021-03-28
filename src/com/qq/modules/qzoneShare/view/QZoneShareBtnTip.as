package com.qq.modules.qzoneShare.view
{
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.managers.PopUpManager;
   import com.qq.display.QCanvas;
   import com.qq.modules.bag.view.components.BagItemIcon;
   import com.qq.utils.UrlManager;
   
   public class QZoneShareBtnTip extends QCanvas
   {
       
      
      public var l_txt:Label;
      
      public var bagItem:BagItemIcon;
      
      public function QZoneShareBtnTip()
      {
         super(QZoneShareBtnTipMediator);
      }
      
      override public function InitializeComponent() : void
      {
         var _loc1_:Image = null;
         super.InitializeComponent();
         _loc1_ = new Image();
         _loc1_.source = UrlManager.getUrl(UrlManager.URL_QZoneShare,"tips.png");
         _loc1_.width = 126;
         _loc1_.height = 49;
         addChild(_loc1_);
         this.bagItem = new BagItemIcon();
         this.bagItem.x = 22;
         this.bagItem.y = 2;
         this.bagItem.scaleX = this.bagItem.scaleY = 0.5;
         addChild(this.bagItem);
         this.l_txt = new Label();
         this.l_txt.y = 10;
         this.l_txt.x = 10;
         this.l_txt.styleName = ".TXT_HKHB_14_Golden_Black";
         this.l_txt.SetStyle("textAlign","left");
         this.l_txt.width = 121;
         this.l_txt.height = 30;
         addChild(this.l_txt);
      }
      
      public function Close() : void
      {
         PopUpManager.RemovePopUp(this);
         super.Dispose();
      }
   }
}
