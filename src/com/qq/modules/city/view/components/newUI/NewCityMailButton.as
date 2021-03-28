package com.qq.modules.city.view.components.newUI
{
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   import com.qq.constant.city.CityButtonConstant;
   import com.qq.display.QCanvas;
   import com.qq.modules.city.CityGlobals;
   import com.qq.templates.font.FontHKHB;
   
   public class NewCityMailButton extends QCanvas
   {
       
      
      private var m_imgTag:Image;
      
      private var m_imgContent:Image;
      
      private var m_txtContent:Label;
      
      public function NewCityMailButton()
      {
         super(NewCityMailButtonMediator);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.scrollRectEnabled = false;
         this.m_imgContent = new Image();
         this.addChild(this.m_imgContent);
         this.m_imgTag = new Image();
         this.m_imgTag.left = 0;
         this.m_imgTag.top = 0;
         this.m_imgTag.source = AssetManager.GetNewClass("City_tipRedPointImg");
         this.addChild(this.m_imgTag);
         this.m_txtContent = new Label();
         this.m_txtContent.styleName = ".TXT_HKHB_18_White_BEVEL_CENTER";
         this.m_txtContent.left = 0;
         this.m_txtContent.right = 0;
         this.m_txtContent.bottom = 10;
         this.m_txtContent.height = 25;
         this.m_txtContent.mouseEnabled = false;
         this.m_txtContent.text = FontHKHB.CITY_MAIL;
         this.addChild(this.m_txtContent);
         this.width = CityGlobals.New_ButtonW;
         this.height = CityGlobals.New_ButtonH;
         this.iconSource = CityButtonConstant.buttonResList[CityButtonConstant.Name_MAIL];
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
