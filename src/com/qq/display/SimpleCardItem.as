package com.qq.display
{
   import asgui.controls.Image;
   import asgui.resources.AssetManager;
   import com.qq.modules.main.model.settings.battle.BattleLineupTemplateFactory;
   import com.qq.modules.main.model.settings.battle.ce.BattleLineupCardTemp;
   import com.qq.utils.UrlManager;
   
   public class SimpleCardItem extends QCanvas
   {
       
      
      protected var imgBg:Image;
      
      protected var cardImg:Image;
      
      protected var selfImgBg:Image;
      
      public function SimpleCardItem(param1:Class = null)
      {
         super(param1);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 24;
         this.height = 40;
         this.imgBg = new Image();
         this.imgBg.width = 24;
         this.imgBg.height = 30;
         this.imgBg.source = AssetManager.GetClass("Card_bj_quality_small");
         addChild(this.imgBg);
         this.selfImgBg = new Image();
         this.selfImgBg.width = 24;
         this.selfImgBg.height = 30;
         this.selfImgBg.source = AssetManager.GetClass("Card_selected_small");
         addChild(this.selfImgBg);
         this.cardImg = new Image();
         this.cardImg.width = 21;
         this.cardImg.height = 23;
         addChild(this.cardImg);
         this.cardImg.x = (this.imgBg.width - this.cardImg.width) * 0.5;
         this.cardImg.y = (this.imgBg.height - this.cardImg.height) * 0.5;
      }
      
      public function setCardId(param1:int, param2:Boolean = false) : void
      {
         var _loc4_:int = 0;
         var _loc5_:BattleLineupCardTemp = null;
         if(param1 % 10 == 0)
         {
            param1 += 1;
         }
         var _loc3_:BattleLineupCardTemp = BattleLineupTemplateFactory.instance.getBattleLineupCardTemplateById(param1);
         if(_loc3_)
         {
            _loc4_ = _loc3_.tdId;
            _loc5_ = BattleLineupTemplateFactory.instance.getBattleLineupCardTemplateByTdPlantId(_loc4_);
            this.cardImg.source = UrlManager.getUrl(UrlManager.Url_Card_icon,"smallIcon/" + _loc5_.icon + "_" + _loc5_.id + ".png");
         }
         this.selfImgBg.visible = param2;
      }
   }
}
