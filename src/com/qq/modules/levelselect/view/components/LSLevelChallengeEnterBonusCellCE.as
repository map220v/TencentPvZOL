package com.qq.modules.levelselect.view.components
{
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   import com.qq.display.QCanvas;
   
   public class LSLevelChallengeEnterBonusCellCE extends QCanvas
   {
       
      
      public var l_name:Label;
      
      public var imgArrow:Image;
      
      public function LSLevelChallengeEnterBonusCellCE(param1:Class = null, param2:Boolean = true)
      {
         super(!!param2 ? (!!param1 ? param1 : LSLevelChallengeEnterBonusCellMediator) : null);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 250;
         this.height = 20;
         this.l_name = new Label();
         this.l_name.text = "第一名奖励";
         this.l_name.styleName = ".TXT_HKHB_16_Yellow_Shadow";
         this.l_name.x = 0;
         this.l_name.y = 0;
         this.l_name.width = 115;
         this.l_name.height = 24;
         this.l_name.id = "l_name";
         this.addChild(this.l_name);
         this.imgArrow = new Image();
         this.imgArrow.width = 17;
         this.imgArrow.height = 16;
         this.imgArrow.source = AssetManager.GetClass("LS_Rank_Arrow_Right_Small");
         this.imgArrow.x = 128;
         this.imgArrow.y = 3;
         this.imgArrow.id = "imgArrow";
         this.addChild(this.imgArrow);
      }
      
      override public function Dispose() : void
      {
         this.l_name = null;
         this.imgArrow = null;
         super.Dispose();
      }
   }
}
