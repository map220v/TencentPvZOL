package com.qq.modules.levelselect.view.components
{
   import com.qq.utils.UrlManager;
   import flash.display.MovieClip;
   
   public class LSChallengeLevelItemCell extends LSChallengeLevelItemCellCE
   {
       
      
      public function LSChallengeLevelItemCell(param1:Class = null, param2:Boolean = true)
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
         this.l_date.SetStyle("fontSize","15");
         this.l_date.SetStyle("textShadowColor","#4b2b16");
         this.imgStage.scaleX = this.imgStage.scaleY = 0.5;
         this.imgStage.x += 25;
         this.imgStage.y += 3;
         this.imgRank.x = this.l_rank.x;
      }
      
      override public function set data(param1:Object) : void
      {
         reset(param1);
      }
      
      public function setBGFrame(param1:uint) : void
      {
         (this.imageBG.mcHolder as MovieClip).gotoAndStop(param1);
      }
      
      public function setSelected(param1:Boolean) : void
      {
         this.imageBG.mcHolder["selecMC"].visible = param1;
      }
      
      public function setStageSource(param1:uint) : void
      {
         this.imgStage.source = UrlManager.getUrl(0,"swf/mapinfo/challenge_icon/icon_" + param1 + ".png");
      }
      
      public function setRank(param1:uint) : void
      {
         var _loc2_:String = null;
         if(param1 >= 1 && param1 <= 3)
         {
            this.imgRank.visible = true;
            this.imgRank.source = UrlManager.getUrl(0,"swf/mapinfo/challenge_icon/" + param1 + ".png");
            this.l_rank.visible = false;
         }
         else
         {
            this.imgRank.visible = false;
            this.l_rank.visible = true;
            if(param1 == 0)
            {
               _loc2_ = "未上榜";
            }
            else
            {
               _loc2_ = param1.toString();
            }
            this.l_rank.text = _loc2_;
         }
      }
   }
}
