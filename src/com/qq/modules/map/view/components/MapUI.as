package com.qq.modules.map.view.components
{
   import asgui.containers.HBox;
   import com.qq.display.QIconWithLabel;
   import com.qq.modules.city.view.components.CityMailButton;
   import com.qq.templates.font.FontHKHB;
   import com.qq.utils.UrlManager;
   import org.allencuilib.map.MapStage;
   
   public class MapUI extends MapUICE
   {
       
      
      public var btnExit:QIconWithLabel;
      
      public var btnPreview:QIconWithLabel;
      
      public var btnSwitch:QIconWithLabel;
      
      public var btnBag:QIconWithLabel;
      
      public var btnMail:CityMailButton;
      
      public var btnExped:QIconWithLabel;
      
      public var btnMylineup:QIconWithLabel;
      
      public var mini:MapMiniMap;
      
      private var stg:MapStage;
      
      private var m_btnBox:HBox;
      
      public function MapUI(param1:MapStage)
      {
         this.stg = param1;
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.btnExit = this.createSwfButton(FontHKHB.RETURN_TO_CITY,"btn_to_city.swf","btnExit");
         this.btnExit.height = 70;
         this.btnExit.txt.SetStyle("color","#5DCFFF");
         this.btnExit.right = 0;
         this.addChild(this.btnExit);
         this.mini = new MapMiniMap(this.stg,this.stg.backgroud.data);
         this.mini.mouseBackground = true;
         this.mini.right = 0;
         this.mini.bottom = 0;
         this.addChild(this.mini);
         this.m_btnBox = new HBox();
         this.m_btnBox.name = "btnBox";
         this.m_btnBox.scrollRectEnabled = false;
         this.m_btnBox.SetStyle("horizontalAlign","right");
         this.m_btnBox.SetStyle("verticalAlign","bottom");
         this.m_btnBox.SetStyle("horizontalGap","5");
         this.m_btnBox.width = 620;
         this.m_btnBox.bottom = 15;
         this.m_btnBox.right = this.mini.width + 20;
         this.addChild(this.m_btnBox);
         this.btnExped = this.createSwfButton(FontHKHB.EXPED_TITLE,"btnExped.swf","btnExped");
         this.m_btnBox.addChild(this.btnExped);
         this.btnMylineup = this.createSwfButton(FontHKHB.MAP_MYLINEUP,"btn_lineup.swf","btnlineup");
         this.m_btnBox.addChild(this.btnMylineup);
         this.btnMail = new CityMailButton();
         this.btnMail.buttonMode = true;
         this.m_btnBox.addChild(this.btnMail);
         this.btnBag = this.createSwfButton(FontHKHB.CITY_BAG,"btn_to_bag.swf","btnPreview");
         this.m_btnBox.addChild(this.btnBag);
         this.btnPreview = this.createSwfButton(FontHKHB.MAP_PREVIEW,"btn_preview.swf","btnPreview");
         this.m_btnBox.addChild(this.btnPreview);
         this.btnSwitch = this.createSwfButton(FontHKHB.MAP_SWITCH,"btn_switch.swf","btnSwitch");
         this.m_btnBox.addChild(this.btnSwitch);
      }
      
      private function createSwfButton(param1:String, param2:String, param3:String) : QIconWithLabel
      {
         var _loc4_:QIconWithLabel;
         (_loc4_ = new QIconWithLabel(param1,UrlManager.getUrl(0,"swf/city/" + param2),".TXT_HKHB_20_White_BEVEL_CENTER")).width = 90;
         _loc4_.height = 80;
         _loc4_.id = param3;
         _loc4_.buttonMode = true;
         _loc4_.txt.mouseChildren = false;
         _loc4_.txt.mouseEnabled = false;
         return _loc4_;
      }
   }
}
