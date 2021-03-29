package com.qq.modules.levelselect.view.components
{
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   import com.qq.display.QCanvas;
   import flash.display.MovieClip;
   import flash.events.Event;
   
   public class LSLevelWdRankRoleCell extends QCanvas
   {
       
      
      public var headIcon:Image;
      
      public var headBG:Image;
      
      public var headMask:Image;
      
      public var imgLvBack:Image;
      
      public var txtLv:Label;
      
      public var txtName:Label;
      
      public var score:Label;
      
      public var rank:Label;
      
      public function LSLevelWdRankRoleCell(param1:Class = null)
      {
         super(LSLevelWdRankRoleCellMediator);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 175;
         this.height = 96;
         this.headBG = new Image();
         this.headBG.x = 3 + 5;
         this.headBG.y = 27;
         addChild(this.headBG);
         this.headBG.source = AssetManager.GetClass("LS_RoleInfo_HeadBG");
         this.headIcon = new Image();
         this.headIcon.loadTimeout = 5000;
         this.headIcon.useLoaderManager = false;
         this.headIcon.width = this.headIcon.height = 50;
         this.headIcon.scaleContent = true;
         this.headIcon.addEventListener(Event.COMPLETE,this.onLoadHeadComplete);
         addChild(this.headIcon);
         this.headMask = new Image();
         this.headMask.x = 5;
         this.headMask.width = 66;
         this.headMask.height = 89;
         addChild(this.headMask);
         this.headMask.source = AssetManager.GetClass("LS_RoleInfo_HeadMask");
         (this.headMask.mcHolder as MovieClip).gotoAndStop(2);
         this.imgLvBack = new Image();
         this.imgLvBack.source = AssetManager.GetClass("LS_RoleInfo_LevelBG");
         this.imgLvBack.x = -3;
         this.imgLvBack.y = 15;
         this.imgLvBack.width = 32;
         this.imgLvBack.height = 33;
         this.imgLvBack.mouseEnabled = false;
         this.$addChild(this.imgLvBack);
         this.txtLv = new Label();
         this.txtLv.width = 30;
         this.txtLv.height = 20;
         this.txtLv.text = "100";
         this.txtLv.styleName = ".TXT_ArialBd_14";
         this.txtLv.SetStyle("color","#fff661");
         this.txtLv.x = -3;
         this.txtLv.y = 25;
         this.txtLv.rotation = -15;
         this.txtLv.mouseEnabled = false;
         this.$addChild(this.txtLv);
         this.txtName = new Label();
         this.txtName.width = 100;
         this.txtName.height = 20;
         this.txtName.x = 70;
         this.txtName.y = 42;
         this.txtName.text = "名字不超过七个";
         this.txtName.SetStyle("color","#ffff00");
         this.txtName.SetStyle("fontSize","12");
         this.txtName.mouseEnabled = false;
         this.$addChild(this.txtName);
         this.score = new Label();
         this.score.width = 100;
         this.score.height = 20;
         this.score.x = 70;
         this.score.y = 57;
         this.score.text = "1234567";
         this.score.SetStyle("color","#ffff00");
         this.score.SetStyle("fontSize","12");
         this.score.mouseEnabled = false;
         this.$addChild(this.score);
         this.rank = new Label();
         this.rank.width = 60;
         this.rank.height = 40;
         this.rank.x = -55;
         this.rank.y = 75;
         this.rank.text = "1234";
         this.rank.SetStyle("color","#ffff00");
         this.rank.SetStyle("fontSize","22");
         this.rank.SetStyle("fontWeight","bold");
         this.rank.SetStyle("textAlign","right");
         this.rank.mouseEnabled = false;
         this.$addChild(this.rank);
         buttonMode = true;
      }
      
      private function onLoadHeadComplete(param1:Event) : void
      {
         this.headIcon.removeEventListener(Event.COMPLETE,this.onLoadHeadComplete);
         this.headIcon.x = (this.headBG.width - this.headIcon.width) * 0.5 + 10;
         this.headIcon.y = (this.headBG.height - this.headIcon.height) * 0.5 + 28;
      }
   }
}
