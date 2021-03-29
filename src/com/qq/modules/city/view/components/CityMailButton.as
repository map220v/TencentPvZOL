package com.qq.modules.city.view.components
{
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   import com.qq.constant.city.CityButtonConstant;
   import com.qq.display.QCanvas;
   import com.qq.templates.font.FontHKHB;
   
   public class CityMailButton extends QCanvas
   {
       
      
      private var m_imgTag:Image;
      
      private var m_imgContent:Image;
      
      private var m_txtContent:Label;
      
      public function CityMailButton()
      {
         super(CityMailButtonMediator);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.scrollRectEnabled = false;
         this.m_imgContent = new Image();
         this.addChild(this.m_imgContent);
         this.m_imgTag = new Image();
         this.m_imgTag.right = 20;
         this.m_imgTag.top = 20;
         this.m_imgTag.source = AssetManager.GetNewClass("City_tipRedPointImg");
         this.addChild(this.m_imgTag);
         this.m_txtContent = new Label();
         this.m_txtContent.styleName = ".TXT_HKHB_20_White_BEVEL_CENTER";
         this.m_txtContent.left = 0;
         this.m_txtContent.right = 0;
         this.m_txtContent.bottom = 0;
         this.m_txtContent.width = 70;
         this.m_txtContent.height = 30;
         this.m_txtContent.mouseEnabled = false;
         this.m_txtContent.text = FontHKHB.CITY_MAIL;
         this.addChild(this.m_txtContent);
         this.width = 80;
         this.height = 80;
         this.iconSource = CityButtonConstant.buttonResList[CityButtonConstant.Name_MAIL2];
      }
      
      public function set showTag(param1:Boolean) : void
      {
         this.m_imgTag.visible = param1;
      }
      
      public function set iconSource(param1:String) : void
      {
         this.m_imgContent.source = param1;
      }
   }
}
