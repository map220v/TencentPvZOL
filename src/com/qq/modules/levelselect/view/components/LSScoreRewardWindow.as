package com.qq.modules.levelselect.view.components
{
   import com.qq.constant.ItemID;
   import com.qq.modules.activity.view.components.ActivityItemTooptip;
   import com.qq.modules.bag.model.ItemTemplateFactory;
   import com.qq.modules.bag.view.components.BagItemIcon;
   
   public class LSScoreRewardWindow extends LSScoreRewardWindowCE
   {
       
      
      private var m_icon:BagItemIcon;
      
      public function LSScoreRewardWindow()
      {
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         txtGO.mouseEnabled = false;
         this.m_icon = new BagItemIcon();
         this.m_icon.toolTipClass = ActivityItemTooptip;
         this.m_icon.toolTip = ItemID.Coin.toString();
         this.m_icon.hcenter = 0;
         this.m_icon.y = 70;
         this.m_icon.setTemplate(ItemTemplateFactory.instance.getBagItemTemplateById(ItemID.Coin),true,true);
         this.addChild(this.m_icon);
         txtNewScore.SetStyle("fontSize","18");
         txtOldScore.SetStyle("fontSize","18");
         txtOldScore.SetStyle("textAlign","right");
      }
      
      public function set goldCount(param1:int) : void
      {
         this.m_icon.setItemNum(param1);
      }
   }
}
