package com.qq.modules.levelselect.view.components
{
   import asgui.controls.Image;
   import asgui.controls.Label;
   import com.qq.display.QCanvas;
   import com.qq.modules.levelselect.model.templates.LSChallengeFactory;
   import com.qq.modules.td.model.templates.ce.TDChallengeAchiTemplateCE;
   import com.qq.utils.UrlManager;
   
   public class LSChallengeAchivementIcon extends QCanvas
   {
       
      
      public var img:Image;
      
      private var achievementId:int;
      
      private var iconIndex:int;
      
      private var l_name:Label;
      
      public function LSChallengeAchivementIcon(param1:int, param2:int)
      {
         this.achievementId = param1;
         this.iconIndex = param2;
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 75;
         this.height = 87;
         this.img = new Image();
         this.img.source = UrlManager.getUrl(0,"swf/icons/achievement/challenge/" + this.achievementId + ".png");
         this.addChild(this.img);
         var _loc1_:TDChallengeAchiTemplateCE = LSChallengeFactory.instance.getAchiById(this.achievementId);
         this.l_name = new Label();
         this.l_name.bottom = 0;
         this.l_name.left = 0;
         this.l_name.right = 0;
         this.l_name.styleName = ".TXT_HKHB_14_White_Shadow";
         this.l_name.SetStyle("color","#F4FF75");
         this.l_name.text = _loc1_.name;
         this.addChild(this.l_name);
         this.toolTip = _loc1_.desc;
      }
   }
}
