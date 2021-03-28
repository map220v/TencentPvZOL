package com.qq.modules.td.view.game
{
   import com.qq.GameGloble;
   import com.qq.display.QCanvas;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.modules.td.model.TDStartParam;
   import com.qq.modules.td.view.chooseCard.endlessTD.TDChooseCardPanelWithEndlessTD;
   import com.qq.modules.td.view.chooseCard.friendCard.TDChooseFriendCardPanel;
   import com.qq.modules.td.view.chooseCard.selfCard.TDChooseCardPanel;
   import com.qq.modules.td.view.components.TDYetiKeyPanel;
   import com.qq.modules.td.view.game.ui.TDGameMenuPanel;
   import com.qq.modules.td.view.game.ui.TDGameTipTextView;
   import com.qq.modules.td.view.game.ui.TDNewTipPanel;
   import com.qq.modules.td.view.game.ui.TDProcessBar;
   import com.qq.modules.td.view.game.ui.TDSpecailSkillCastIcon;
   import com.qq.modules.td.view.ui.TDAchievementView;
   import com.qq.modules.td.view.ui.TDBossHpBarCt;
   import com.qq.modules.td.view.ui.TDPlantFoodProgressCt;
   import com.qq.modules.td.view.ui.TDRainBarCt;
   import com.qq.modules.td.view.ui.TDSunBarCt;
   
   public class TDUIPanel extends QCanvas
   {
       
      
      public var yetiKeyPanel:TDYetiKeyPanel;
      
      public var chooseCardPanel:TDChooseCardPanel;
      
      public var chooseFriendCardPanel:TDChooseFriendCardPanel;
      
      public var chooseCardPanelWithEndlessTD:TDChooseCardPanelWithEndlessTD;
      
      public var processBar:TDProcessBar;
      
      public var textTipView:TDGameTipTextView;
      
      public var gameMenuPanel:TDGameMenuPanel;
      
      public var sunBar:TDSunBarCt;
      
      public var rainBar:TDRainBarCt;
      
      public var specialSkillCastIcon:TDSpecailSkillCastIcon;
      
      public var plantFoodProgressCt:TDPlantFoodProgressCt;
      
      public var bossHpBar:TDBossHpBarCt;
      
      public var achievementView:TDAchievementView;
      
      public var newTipPanel:TDNewTipPanel;
      
      public function TDUIPanel()
      {
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.processBar = new TDProcessBar();
         addChild(this.processBar);
         this.textTipView = new TDGameTipTextView();
         this.textTipView.visible = false;
         addChild(this.textTipView);
         this.gameMenuPanel = new TDGameMenuPanel();
         this.gameMenuPanel.name = "gameMenuPanel";
         this.gameMenuPanel.right = 0;
         addChild(this.gameMenuPanel);
         this.plantFoodProgressCt = new TDPlantFoodProgressCt();
         this.plantFoodProgressCt.name = "plantFoodProgressCt";
         this.plantFoodProgressCt.left = 17;
         this.plantFoodProgressCt.top = 0;
         this.addChild(this.plantFoodProgressCt);
         this.sunBar = new TDSunBarCt();
         this.sunBar.left = 10;
         this.addChild(this.sunBar);
         this.rainBar = new TDRainBarCt();
         this.rainBar.x = 20;
         this.rainBar.y = 90;
         this.addChild(this.rainBar);
         this.showChooseFriendCardPanel();
         this.achievementView = new TDAchievementView();
         this.achievementView.bottom = 5;
         this.achievementView.left = 60;
         this.addChild(this.achievementView);
         this.specialSkillCastIcon = GameGloble.injector.getInstance(TDSpecailSkillCastIcon);
         this.specialSkillCastIcon.visible = false;
         addChild(this.specialSkillCastIcon);
         this.bossHpBar = new TDBossHpBarCt();
         this.bossHpBar.x = 760;
         this.bossHpBar.y = 20;
         this.bossHpBar.visible = false;
         this.addChild(this.bossHpBar);
         this.newTipPanel = new TDNewTipPanel();
         addChild(this.newTipPanel);
         if(TDStageInfo.getInstance().startParam.gameType == TDStartParam.Yeti)
         {
            this.yetiKeyPanel = new TDYetiKeyPanel();
            this.yetiKeyPanel.top = 10;
            this.yetiKeyPanel.right = 200;
            addChild(this.yetiKeyPanel);
         }
      }
      
      public function showChooseCardPanel() : void
      {
         if(!this.chooseCardPanel)
         {
            this.chooseCardPanel = new TDChooseCardPanel();
            this.chooseCardPanel.name = "chooseCardPanel";
            this.chooseCardPanel.visible = false;
            addChild(this.chooseCardPanel);
         }
      }
      
      public function removeChooseCardPanel() : void
      {
         if(this.chooseCardPanel)
         {
            this.chooseCardPanel.Dispose();
            this.chooseCardPanel = null;
         }
      }
      
      public function showChooseFriendCardPanel() : void
      {
         this.chooseFriendCardPanel = new TDChooseFriendCardPanel();
         this.chooseFriendCardPanel.visible = false;
         addChild(this.chooseFriendCardPanel);
      }
      
      public function removeChooseFriendCardPanel() : void
      {
         if(this.chooseFriendCardPanel)
         {
            this.chooseFriendCardPanel.Dispose();
            this.chooseFriendCardPanel = null;
         }
      }
      
      public function showChooseCardPanelWithEndlessTD() : void
      {
         if(!this.chooseCardPanelWithEndlessTD)
         {
            this.chooseCardPanelWithEndlessTD = new TDChooseCardPanelWithEndlessTD();
            this.chooseCardPanelWithEndlessTD.name = "chooseCardPanelWithEndlessTD";
            this.chooseCardPanelWithEndlessTD.visible = false;
            addChild(this.chooseCardPanelWithEndlessTD);
         }
      }
      
      public function removeChooseCardPanelWithEndlessTD() : void
      {
         if(this.chooseCardPanelWithEndlessTD)
         {
            this.chooseCardPanelWithEndlessTD.Dispose();
            this.chooseCardPanel = null;
         }
      }
      
      override public function Dispose() : void
      {
         if(hasDisposed)
         {
            return;
         }
         if(this.yetiKeyPanel != null)
         {
            this.yetiKeyPanel.Dispose();
            this.yetiKeyPanel = null;
         }
         this.removeChooseCardPanel();
         this.removeChooseFriendCardPanel();
         this.removeChooseCardPanelWithEndlessTD();
         super.Dispose();
      }
   }
}
