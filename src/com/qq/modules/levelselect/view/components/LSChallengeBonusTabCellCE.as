package com.qq.modules.levelselect.view.components
{
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   import com.qq.display.QCanvas;
   
   public class LSChallengeBonusTabCellCE extends QCanvas
   {
       
      
      public var img_bk:Image;
      
      public var l_tabName:Label;
      
      public var img_excal:Image;
      
      public function LSChallengeBonusTabCellCE(param1:Class = null, param2:Boolean = true)
      {
         super(!!param2 ? (!!param1 ? param1 : LSChallengeBonusTabCellMediator) : null);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 181;
         this.height = 63;
         this.img_bk = new Image();
         this.img_bk.x = 0;
         this.img_bk.width = 181;
         this.img_bk.height = 63;
         this.img_bk.source = AssetManager.GetClass("LS_Challenge_Bonus_TabCell");
         this.img_bk.id = "img_bk";
         this.addChild(this.img_bk);
         this.l_tabName = new Label();
         this.l_tabName.text = "晋级奖励";
         this.l_tabName.styleName = ".TXT_HKHB_21_Yellow_Shadow";
         this.l_tabName.x = 35;
         this.l_tabName.y = 16;
         this.l_tabName.width = 120;
         this.l_tabName.height = 25;
         this.l_tabName.id = "l_tabName";
         this.addChild(this.l_tabName);
         this.img_excal = new Image();
         this.img_excal.x = 135;
         this.img_excal.y = 0;
         this.img_excal.width = 32;
         this.img_excal.height = 32;
         this.img_excal.source = AssetManager.GetClass("LS_Challenge_Bonus_Excal_Img");
         this.img_excal.id = "img_excal";
         this.addChild(this.img_excal);
      }
      
      override public function Dispose() : void
      {
         this.img_bk = null;
         this.l_tabName = null;
         this.img_excal = null;
         super.Dispose();
      }
   }
}
