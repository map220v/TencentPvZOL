package com.qq.modules.mapinfo.view.components
{
   import com.qq.display.QWindow;
   import com.qq.modules.map.model.templates.MapLevelTemplate;
   import com.qq.modules.map.model.templates.MapTemplateFactory;
   import com.qq.templates.font.FontNormal;
   
   public class MapInfoSwitchChapterCell extends MapInfoSwitchChapterCellCE
   {
       
      
      private var m_areaID:int;
      
      private var m_dependWindow:QWindow;
      
      public var template:MapLevelTemplate;
      
      public function MapInfoSwitchChapterCell(param1:int, param2:QWindow)
      {
         this.m_dependWindow = param2;
         this.m_areaID = param1;
         this.template = MapTemplateFactory.instance.getMapLevelTemplateById(this.m_areaID);
         super();
      }
      
      private static function getTitleColor(param1:int) : String
      {
         var _loc2_:String = null;
         switch(param1)
         {
            case 1:
               _loc2_ = "#89F12B";
               break;
            case 2:
               _loc2_ = "#31EDF8";
               break;
            case 3:
               _loc2_ = "#FAE355";
         }
         return _loc2_;
      }
      
      public function get dependWindow() : QWindow
      {
         return this.m_dependWindow;
      }
      
      public function get areaID() : int
      {
         return this.m_areaID;
      }
      
      override public function Dispose() : void
      {
         this.m_dependWindow = null;
         super.Dispose();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.txtTitle.SetStyle("textAlign","center");
         this.txtTitle.SetStyle("fontSize","30");
         this.txtTitle.SetStyle("textShadowStrength","20");
         this.txtTitle.SetStyle("textShadowDistance","2");
         this.txtTitle.SetStyle("textShadowColor","#000000");
         this.txtTitle.mouseEnabled = false;
         this.txtTitle.text = this.template.name;
         this.txtDesc.mouseEnabled = false;
         this.txtDesc.SetStyle("fontSize","14");
         this.txtTitle.SetStyle("color",getTitleColor(this.m_areaID));
         this.txtReward.SetStyle("textAlign","center");
         this.selectedBG.mouseEnabled = false;
         this.rewardBG.mouseEnabled = false;
         this.txtReward.mouseEnabled = false;
         this.imgBack.scaleContent = true;
         this.imgBack.buttonMode = true;
         this.imgBack.toolTip = FontNormal.MAP_VIEW_INFO;
      }
      
      public function set rewardContent(param1:String) : void
      {
         if(param1)
         {
            this.txtReward.htmlText = param1;
            this.rewardBG.visible = true;
            this.txtReward.visible = true;
         }
         else
         {
            this.rewardBG.visible = false;
            this.txtReward.visible = false;
         }
      }
   }
}
