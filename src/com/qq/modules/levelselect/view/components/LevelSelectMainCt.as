package com.qq.modules.levelselect.view.components
{
   import asgui.containers.HBox;
   import asgui.core.IDisposable;
   import com.qq.display.QCanvas;
   import com.qq.display.QIconWithLabel;
   import com.qq.templates.font.FontHKHB;
   import com.qq.utils.UrlManager;
   
   public class LevelSelectMainCt extends QCanvas
   {
       
      
      public var map:LSMapCt;
      
      public var menuStage:HBox;
      
      public var menuBtns:HBox;
      
      public var btnRetrun:QIconWithLabel;
      
      public function LevelSelectMainCt()
      {
         super(LevelSelectMainCtMediator);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.map = new LSMapCt();
         this.map.setFullSize();
         this.addChild(this.map);
         this.menuStage = new HBox();
         this.menuStage.width = 650;
         this.menuStage.height = 121;
         this.menuStage.left = 9;
         this.menuStage.bottom = 0;
         this.addChild(this.menuStage);
         this.menuBtns = new HBox();
         this.menuBtns.height = 60;
         this.menuBtns.right = 9;
         this.menuBtns.bottom = 0;
         this.addChild(this.menuBtns);
         this.btnRetrun = new QIconWithLabel(FontHKHB.RETURN_TO_CITY,UrlManager.getUrl(0,"swf/city/btn_to_city.swf"),".TXT_HKHB_21_Yellow_Shadow");
         this.btnRetrun.name = "btnRetrun";
         this.btnRetrun.width = 108;
         this.btnRetrun.height = 70;
         this.btnRetrun.right = 0;
         this.btnRetrun.top = 0;
         this.btnRetrun.txt.SetStyle("color","#5DCFFF");
         this.btnRetrun.txt.mouseEnabled = false;
         this.btnRetrun.txt.mouseChildren = false;
         this.btnRetrun.visible = false;
         this.addChild(this.btnRetrun);
      }
      
      override public function Dispose() : void
      {
         while(this.menuStage.numChildren > 0)
         {
            (this.menuStage.removeChildAt(0) as IDisposable).Dispose();
         }
         super.Dispose();
      }
   }
}
