package com.qq.modules.levelselect.view.components
{
   import asgui.controls.Image;
   import com.qq.utils.UrlManager;
   import flash.display.MovieClip;
   
   public class LSChallengeRankItemCell extends LSChallengeRankItemCellCE
   {
       
      
      public var rankImage:Image;
      
      public function LSChallengeRankItemCell(param1:Class = null, param2:Boolean = true)
      {
         super(param1,param2);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.l_rank.SetStyle("fontSize","15");
         this.l_rank.SetStyle("textShadowColor","#4b2b16");
         this.l_name.SetStyle("fontSize","15");
         this.l_name.SetStyle("textShadowColor","#4b2b16");
         this.l_name.SetStyle("textDecoration","underline");
         this.l_name.buttonMode = true;
         this.l_level.SetStyle("fontSize","15");
         this.l_level.SetStyle("textShadowColor","#4b2b16");
         this.l_score.SetStyle("fontSize","15");
         this.l_score.SetStyle("textShadowColor","#4b2b16");
         this.l_date.SetStyle("fontSize","15");
         this.l_date.SetStyle("textShadowColor","#4b2b16");
         this.rankImage = new Image();
         this.rankImage.width = 23;
         this.rankImage.height = 26;
         addChild(this.rankImage);
         this.rankImage.x = this.l_rank.x - 3;
         this.rankImage.y = this.l_rank.y - 3;
      }
      
      override public function set data(param1:Object) : void
      {
         reset(param1);
      }
      
      public function setSelected(param1:Boolean) : void
      {
         this.imageBG.mcHolder["selecMC"].visible = param1;
      }
      
      public function setBGFrame(param1:uint) : void
      {
         (this.imageBG.mcHolder as MovieClip).gotoAndStop(param1);
      }
      
      public function setRank(param1:uint) : void
      {
         if(param1 >= 1 && param1 <= 3)
         {
            this.rankImage.visible = true;
            this.rankImage.source = UrlManager.getUrl(0,"swf/mapinfo/challenge_icon/" + param1 + ".png");
            this.l_rank.visible = false;
         }
         else
         {
            this.rankImage.visible = false;
            this.l_rank.visible = true;
            this.l_rank.text = param1.toString();
         }
      }
   }
}
