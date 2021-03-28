package com.qq.modules.td.view.chooseCard.friendCard
{
   import asgui.containers.Canvas;
   import asgui.containers.HBox;
   import asgui.controls.Button;
   import asgui.controls.Image;
   import asgui.controls.Text;
   import asgui.controls.TextArea;
   import asgui.resources.AssetManager;
   import com.qq.constant.ResLibID;
   import com.qq.display.QPanel;
   import com.qq.modules.basic.view.components.QPagerSmall;
   import com.qq.templates.font.FontHKHB;
   import com.qq.utils.ResLibManager;
   
   public class TDChooseFriendCardPanel extends QPanel
   {
       
      
      public var friendPointTipText:Text;
      
      public var cardListPanel:TDFriendCardListPanel;
      
      public var cardChooseListPanel:TDFriendCardListChoosePanel;
      
      public var vipCard:TDVipPlantCard;
      
      public var bg:Canvas;
      
      public var okBtn:Button;
      
      public var prevBtn:Image;
      
      public var resultText:TextArea;
      
      public var achievementBox:HBox;
      
      public var pager:QPagerSmall;
      
      public function TDChooseFriendCardPanel()
      {
         super(TDChooseFriendCardPanelMediator);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.styleName = "Window";
         this.SetStyle("paddingLeft","0");
         this.SetStyle("paddingRight","0");
         this.width = 536;
         this.height = 551;
         this.bg = new Canvas();
         this.addChild(this.bg);
         this.friendPointTipText = new Text();
         this.friendPointTipText.left = 15;
         this.friendPointTipText.top = 10;
         this.friendPointTipText.width = 150;
         this.friendPointTipText.SetStyle("embedFonts","true");
         this.friendPointTipText.SetStyle("fontFamily","hkhb");
         this.friendPointTipText.SetStyle("color","#a4e4f0");
         this.friendPointTipText.SetStyle("fontSize","14");
         this.addChild(this.friendPointTipText);
         this.cardListPanel = new TDFriendCardListPanel();
         this.cardListPanel.left = 35;
         this.cardListPanel.right = 20;
         this.cardListPanel.top = 108;
         this.addChild(this.cardListPanel);
         this.cardChooseListPanel = new TDFriendCardListChoosePanel();
         this.cardChooseListPanel.x = 200;
         this.cardChooseListPanel.width = 100;
         this.addChild(this.cardChooseListPanel);
         this.vipCard = new TDVipPlantCard();
         this.vipCard.x = 450;
         this.vipCard.y = 5;
         this.addChild(this.vipCard);
         this.resultText = new TextArea();
         this.resultText.width = 180;
         this.resultText.top = 50;
         this.resultText.left = 15;
         this.resultText.height = 100;
         this.resultText.mouseEnabled = false;
         this.resultText.mouseChildren = false;
         this.resultText.styleName = ".textAreaNoBackground";
         this.addChild(this.resultText);
         this.okBtn = new Button();
         this.okBtn.width = 156;
         this.okBtn.bottom = 10;
         this.okBtn.hcenter = 0;
         this.addChild(this.okBtn);
         var _loc1_:Image = new Image();
         _loc1_.source = AssetManager.getInstance().GetClass("TD_UI_chooseCardBG");
         addChild(_loc1_);
         _loc1_.y = 91;
         _loc1_.x = 7;
         this.pager = new QPagerSmall();
         this.pager.y = 397;
         this.pager.hcenter = 0;
         addChild(this.pager);
         this.bg.styleName = ".HBox_Gray_With_Leaves";
         this.bg.width = 538;
         this.bg.height = 340;
         this.bg.y = 100;
         this.okBtn.styleName = ".GreenButton";
         this.okBtn.label = FontHKHB.TXT_StartFight;
         this.achievementBox = new HBox();
         addChild(this.achievementBox);
         this.achievementBox.y = 360;
         this.achievementBox.width = 420;
         this.achievementBox.height = 50;
         this.achievementBox.x = 63;
         this.prevBtn = new Image();
         this.prevBtn.source = ResLibManager.getInstance().getClassFromRes("TD_UI_PreBtn",ResLibID.TDRes);
         this.prevBtn.bottom = 16;
         this.prevBtn.left = 23;
         this.addChild(this.prevBtn);
         this.prevBtn.buttonMode = true;
         this.prevBtn.visible = true;
         this.title = FontHKHB.TITLE_YOUR_FRIEND_PLANT;
      }
   }
}
