package com.qq.modules.embattle.view
{
   import asgui.controls.Image;
   import asgui.controls.Text;
   import asgui.resources.AssetManager;
   import com.qq.templates.font.FontHKHB;
   
   public class EmbattleTreasureCardListView extends EmbattleCardListView
   {
       
      
      public var bk:Image;
      
      public var intrLabel:Text;
      
      public function EmbattleTreasureCardListView()
      {
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         SetStyle("upSkin","");
         scrollRectEnabled = false;
         this.bk = new Image();
         this.bk.x = -15;
         this.bk.y = -90;
         this.bk.source = AssetManager.GetClass("City_embattle_treasure_bk");
         addChildAt(this.bk,1);
         this.intrLabel = new Text();
         this.intrLabel.text = FontHKHB.TREASURE_EMBATTLE_INTR;
         this.intrLabel.styleName = ".TXT_HKHB_14_Golden_Black";
         this.intrLabel.x = 0;
         this.intrLabel.y = -70;
         this.intrLabel.width = 308;
         this.intrLabel.height = 60;
         this.intrLabel.id = "l_intr";
         this.intrLabel.hcenter = 0;
         this.intrLabel.SetStyle("textAlign","left");
         this.intrLabel.SetStyle("fontSize","16");
         this.intrLabel.SetStyle("textShadowColor","#735339");
         this.addChild(this.intrLabel);
      }
   }
}
