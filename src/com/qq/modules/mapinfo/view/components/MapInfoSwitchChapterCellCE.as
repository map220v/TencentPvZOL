package com.qq.modules.mapinfo.view.components
{
   import asgui.containers.Canvas;
   import asgui.controls.Button;
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.controls.TextArea;
   import com.qq.display.QCanvas;
   import com.qq.utils.UrlManager;
   
   public class MapInfoSwitchChapterCellCE extends QCanvas
   {
       
      
      public var imgBack:Image;
      
      public var imgBottomBar:Image;
      
      public var txtTitle:Label;
      
      public var txtDesc:Label;
      
      public var btnEnter:Button;
      
      public var rewardBG:Canvas;
      
      public var selectedBG:Image;
      
      public var txtReward:TextArea;
      
      public function MapInfoSwitchChapterCellCE(param1:Class = null, param2:Boolean = true)
      {
         super(!!param2 ? (!!param1 ? param1 : MapInfoSwitchChapterCellMediator) : null);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 240;
         this.height = 438;
         this.imgBack = new Image();
         this.imgBack.width = 220;
         this.imgBack.height = 382;
         this.imgBack.source = UrlManager.getUrl(0,"swf/mapinfo/map_chapter_1_on.png");
         this.imgBack.y = 10;
         this.imgBack.id = "imgBack";
         this.imgBack.hcenter = 2;
         this.addChild(this.imgBack);
         this.imgBottomBar = new Image();
         this.imgBottomBar.width = 233;
         this.imgBottomBar.height = 56;
         this.imgBottomBar.source = UrlManager.getUrl(0,"swf/mapinfo/map_chapter_cell_top.png");
         this.imgBottomBar.x = 0;
         this.imgBottomBar.y = 374;
         this.imgBottomBar.id = "imgBottomBar";
         this.imgBottomBar.hcenter = 0;
         this.addChild(this.imgBottomBar);
         this.txtTitle = new Label();
         this.txtTitle.text = "初级世界";
         this.txtTitle.styleName = ".TXT_Green_LIGHT_16";
         this.txtTitle.y = 49;
         this.txtTitle.width = 232;
         this.txtTitle.height = 40;
         this.txtTitle.id = "txtTitle";
         this.txtTitle.hcenter = 0;
         this.addChild(this.txtTitle);
         this.txtDesc = new Label();
         this.txtDesc.text = "通过冒险0关";
         this.txtDesc.styleName = ".TXT_Center";
         this.txtDesc.y = 405;
         this.txtDesc.width = 232;
         this.txtDesc.height = 24;
         this.txtDesc.id = "txtDesc";
         this.txtDesc.hcenter = 0;
         this.addChild(this.txtDesc);
         this.btnEnter = new Button();
         this.btnEnter.label = "进入";
         this.btnEnter.styleName = ".GreenButton";
         this.btnEnter.x = 0;
         this.btnEnter.y = 0;
         this.btnEnter.width = 80;
         this.btnEnter.height = 51;
         this.btnEnter.id = "btnEnter";
         this.btnEnter.hcenter = 0;
         this.btnEnter.bottom = 14;
         this.addChild(this.btnEnter);
         this.rewardBG = new Canvas();
         this.rewardBG.width = 205;
         this.rewardBG.styleName = ".Canvas_Gray_2";
         this.rewardBG.height = 150;
         this.rewardBG.y = 220;
         this.rewardBG.id = "rewardBG";
         this.rewardBG.hcenter = 3;
         this.addChild(this.rewardBG);
         this.selectedBG = new Image();
         this.selectedBG.width = 240;
         this.selectedBG.height = 438;
         this.selectedBG.source = UrlManager.getUrl(0,"swf/mapinfo/map_chapter_selected.png");
         this.selectedBG.x = 0;
         this.selectedBG.y = 0;
         this.selectedBG.id = "selectedBG";
         this.addChild(this.selectedBG);
         this.txtReward = new TextArea();
         this.txtReward.styleName = ".textAreaNoBackground_White15";
         this.txtReward.x = 25;
         this.txtReward.y = 230;
         this.txtReward.width = 196;
         this.txtReward.height = 150;
         this.txtReward.id = "txtReward";
         this.txtReward.selectable = false;
         this.addChild(this.txtReward);
      }
      
      override public function Dispose() : void
      {
         this.imgBack = null;
         this.imgBottomBar = null;
         this.txtTitle = null;
         this.txtDesc = null;
         this.btnEnter = null;
         this.rewardBG = null;
         this.selectedBG = null;
         this.txtReward = null;
         super.Dispose();
      }
   }
}
