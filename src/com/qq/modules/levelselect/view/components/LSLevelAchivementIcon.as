package com.qq.modules.levelselect.view.components
{
   import asgui.controls.Image;
   import asgui.controls.Label;
   import com.qq.display.QCanvas;
   import com.qq.managers.FilterManager;
   import com.qq.modules.levelselect.model.templates.LSLevelTemplate;
   import com.qq.modules.main.model.settings.achievement.ce.TDAchievementInfoTemplate;
   import com.qq.modules.main.model.settings.achievement.ce.TDAchievementInfoTemplateFactory;
   import com.qq.utils.UrlManager;
   
   public class LSLevelAchivementIcon extends QCanvas
   {
      
      private static const COLOR:Array = ["#BAFF9C","#F4FF75","#FFC281"];
       
      
      public var img:Image;
      
      public var txt:Label;
      
      private var achievementId:int;
      
      private var iconIndex:int;
      
      private var t:TDAchievementInfoTemplate;
      
      private var unlocked:Boolean;
      
      private var levelTemplate:LSLevelTemplate;
      
      public function LSLevelAchivementIcon(param1:int, param2:int, param3:Boolean, param4:LSLevelTemplate = null)
      {
         this.levelTemplate = param4;
         this.unlocked = param3;
         this.iconIndex = param2;
         this.achievementId = param1;
         this.t = TDAchievementInfoTemplateFactory.instance.getTemplateById(param1);
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 68;
         this.height = 80;
         this.img = new Image();
         this.img.source = UrlManager.getUrl(0,"swf/icons/achievement/" + this.achievementId + ".png");
         this.addChild(this.img);
         this.txt = new Label();
         this.txt.bottom = 0;
         this.txt.left = 0;
         this.txt.right = 0;
         this.txt.styleName = ".TXT_HKHB_14_White_Shadow";
         this.txt.SetStyle("color",COLOR[this.iconIndex]);
         this.txt.text = this.t.name;
         this.addChild(this.txt);
         if(this.levelTemplate)
         {
            this.toolTip = this.t.getDesc(this.levelTemplate.achievementList);
         }
         if(!this.unlocked)
         {
            FilterManager.addMonoChrome(this.img);
         }
         else
         {
            this.img.filters = [];
         }
      }
   }
}
