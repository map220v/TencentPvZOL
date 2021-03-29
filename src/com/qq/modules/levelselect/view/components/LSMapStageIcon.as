package com.qq.modules.levelselect.view.components
{
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.controls.Text;
   import com.qq.constant.ls.LSConstant;
   import com.qq.display.QCanvas;
   import com.qq.managers.FilterManager;
   import com.qq.modules.levelselect.model.templates.LSLevelTemplate;
   import com.qq.modules.levelselect.model.templates.LSLevelTemplateFactory;
   import com.qq.templates.font.FontNormal;
   import com.qq.utils.UrlManager;
   
   public class LSMapStageIcon extends QCanvas
   {
       
      
      public var img:Image;
      
      public var highlight:Image;
      
      public var imgChallenge:Image;
      
      public var highlightChallenge:Image;
      
      private var stageId:int;
      
      private var _enabled:Boolean;
      
      private var _hasChallengeLevel:Boolean;
      
      private var l_challengeWord:Label;
      
      private var txt_challengeTimes:Text;
      
      public function LSMapStageIcon(param1:int, param2:Boolean = true)
      {
         this.stageId = param1;
         this._enabled = param2;
         super();
         this.updateToolTip();
      }
      
      public function setEnabled(param1:Boolean) : void
      {
         this._enabled = param1;
         if(param1)
         {
            FilterManager.clean(this);
         }
         else
         {
            FilterManager.addMonoChrome(this);
         }
         this.updateToolTip();
      }
      
      public function isEnabled() : Boolean
      {
         return this._enabled;
      }
      
      public function setSelected(param1:Boolean) : void
      {
         if(this._hasChallengeLevel)
         {
            this.highlightChallenge.visible = param1;
            this.highlight.visible = false;
         }
         else
         {
            this.highlight.visible = param1;
            this.highlightChallenge.visible = false;
         }
      }
      
      public function isSelected() : Boolean
      {
         return this.highlight.visible;
      }
      
      public function setChallengeLevel(param1:Boolean) : void
      {
         this._hasChallengeLevel = param1;
         if(this._hasChallengeLevel)
         {
            this.width = 131;
         }
         else
         {
            this.width = 100;
         }
         this.imgChallenge.visible = this.l_challengeWord.visible = this.txt_challengeTimes.visible = this._hasChallengeLevel;
      }
      
      public function hasChallengeLevel() : Boolean
      {
         return this._hasChallengeLevel;
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 131;
         this.height = 121;
         this.img = new Image();
         this.img.buttonMode = true;
         this.img.x = 35;
         this.img.y = 37;
         this.img.source = UrlManager.getUrl(UrlManager.Url_ICON,"lsstage/s_" + this.stageId + ".swf");
         this.addChild(this.img);
         this.highlight = new Image();
         this.highlight.visible = this.stageId == 1;
         this.highlight.mouseChildren = false;
         this.highlight.mouseEnabled = false;
         this.highlight.source = UrlManager.getUrl(UrlManager.Url_ICON,"lsstage/s_highlight.swf");
         this.highlight.visible = false;
         this.highlight.x = this.img.x - 11;
         this.highlight.y = this.img.y - 10;
         this.addChild(this.highlight);
         this.imgChallenge = new Image();
         this.imgChallenge.buttonMode = true;
         this.imgChallenge.x = 9.5;
         this.imgChallenge.y = 6.5;
         this.imgChallenge.source = UrlManager.getUrl(UrlManager.Url_ICON,"lsstage/challenge.png");
         this.addChildAt(this.imgChallenge,0);
         this.highlightChallenge = new Image();
         this.highlightChallenge.x = 0;
         this.highlightChallenge.y = 0;
         this.highlightChallenge.mouseChildren = this.highlightChallenge.mouseEnabled = false;
         this.highlightChallenge.source = UrlManager.getUrl(UrlManager.Url_ICON,"lsstage/highLight_Challenge.png");
         this.addChildAt(this.highlightChallenge,0);
         this.highlightChallenge.visible = false;
         this.l_challengeWord = new Label();
         this.l_challengeWord.styleName = ".TXT_HKHB_21_Yellow_Shadow";
         this.l_challengeWord.SetStyle("color","#FFA8A6");
         this.l_challengeWord.SetStyle("fontSize","16");
         this.l_challengeWord.width = 40;
         this.l_challengeWord.text = "挑战";
         this.addChild(this.l_challengeWord);
         this.l_challengeWord.x = 44.5;
         this.l_challengeWord.y = 22.5;
         this.txt_challengeTimes = new Text();
         this.txt_challengeTimes.width = 100;
         this.txt_challengeTimes.SetStyle("color","#ffffff");
         this.txt_challengeTimes.SetStyle("textShadowColor","#000000");
         this.txt_challengeTimes.SetStyle("fontWeight","bold");
         this.txt_challengeTimes.SetStyle("textShadowStrength","4");
         this.txt_challengeTimes.SetStyle("fontSize","12");
         this.txt_challengeTimes.text = "今日可挑战:0关";
         this.addChild(this.txt_challengeTimes);
         this.txt_challengeTimes.x = 20.5;
         this.txt_challengeTimes.y = 91.5;
      }
      
      private function updateToolTip() : void
      {
         var _loc1_:LSLevelTemplate = null;
         var _loc2_:String = null;
         if(this._enabled)
         {
            if(this.stageId == 1)
            {
               this.toolTip = "本章挑战关开启";
            }
            else
            {
               this.toolTip = LSConstant.STAGE_NAME_LIST[this.stageId - 1];
            }
         }
         else
         {
            _loc1_ = LSLevelTemplateFactory.instance.getTemplateByStageIdAndLevelId(this.stageId,1,1);
            if(_loc1_ != null)
            {
               _loc2_ = FontNormal.LS_StageLock_Tooltip_2;
               this.toolTip = _loc2_;
            }
         }
      }
      
      public function setChallengeTimes(param1:int) : void
      {
         this.txt_challengeTimes.text = "今日可挑战:" + param1 + "关";
      }
   }
}
