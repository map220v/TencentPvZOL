package com.qq.modules.basic.view.components
{
   import asgui.controls.Button;
   import asgui.controls.Label;
   import com.qq.display.QCanvas;
   
   public class QPagerSmallCE extends QCanvas
   {
       
      
      public var btnPrev:Button;
      
      public var btnNext:Button;
      
      public var txtPager:Label;
      
      public function QPagerSmallCE(param1:Class = null, param2:Boolean = true)
      {
         super(!!param2 ? (!!param1 ? param1 : QPagerSmallMediator) : null);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 90;
         this.height = 24;
         this.btnPrev = new Button();
         this.btnPrev.styleName = ".Button_To_LeftSmall";
         this.btnPrev.x = 0;
         this.btnPrev.y = 8;
         this.btnPrev.width = 15;
         this.btnPrev.height = 20;
         this.btnPrev.id = "btnPrev";
         this.btnPrev.left = 0;
         this.btnPrev.vcenter = 0;
         this.addChild(this.btnPrev);
         this.btnNext = new Button();
         this.btnNext.styleName = ".Button_To_RightSmall";
         this.btnNext.x = 30;
         this.btnNext.y = 6;
         this.btnNext.width = 15;
         this.btnNext.height = 20;
         this.btnNext.id = "btnNext";
         this.btnNext.right = 0;
         this.btnNext.vcenter = 0;
         this.addChild(this.btnNext);
         this.txtPager = new Label();
         this.txtPager.text = "1 / 1";
         this.txtPager.styleName = ".TXT_ArialBd_14";
         this.txtPager.x = 0;
         this.txtPager.y = 6;
         this.txtPager.width = 60;
         this.txtPager.height = 24;
         this.txtPager.id = "txtPager";
         this.txtPager.hcenter = 0;
         this.txtPager.vcenter = 0;
         this.addChild(this.txtPager);
      }
      
      override public function Dispose() : void
      {
         this.btnPrev = null;
         this.btnNext = null;
         this.txtPager = null;
         super.Dispose();
      }
   }
}
