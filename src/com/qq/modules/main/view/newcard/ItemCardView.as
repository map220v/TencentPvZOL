package com.qq.modules.main.view.newcard
{
   import asgui.controls.Label;
   import com.qq.display.CardIcon;
   import com.qq.modules.bag.model.BagItemTemplate;
   import com.qq.modules.main.model.SettingsModel;
   
   public class ItemCardView extends BaseCardView
   {
       
      
      protected var img_card:CardIcon;
      
      protected var label_num:Label;
      
      protected var label_name:Label;
      
      public function ItemCardView()
      {
         super();
         width = 140;
         width = 181;
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.img_card = new CardIcon();
         this.img_card.x = 45;
         this.img_card.y = 65;
         addChild(this.img_card);
         this.label_name = new Label();
         this.label_name.x = 0;
         this.label_name.y = 15;
         this.label_name.width = 140;
         this.label_name.height = 33;
         this.label_name.styleName = ".TXT_HKHB_16_Yellow_Shadow";
         addChild(this.label_name);
         this.label_num = new Label();
         this.label_num.x = 0;
         this.label_num.y = 135;
         this.label_num.width = 140;
         this.label_num.height = 33;
         this.label_num.styleName = ".TXT_HKHB_24_Yellow_Shadow";
         this.label_num.SetStyle("textAlign","center");
         addChild(this.label_num);
      }
      
      override public function resetCardForItem(param1:int, param2:int) : void
      {
         var _loc3_:BagItemTemplate = SettingsModel.instance.itemSetting.getBagItemTemplateById(param1);
         this.img_card.source = _loc3_.iconSource;
         this.img_card.scrollRectEnabled = false;
         this.label_num.text = "x" + param2;
         this.label_name.text = _loc3_.name;
      }
      
      override public function Dispose() : void
      {
         super.Dispose();
         this.toolTip = null;
         this.toolTipClass = null;
      }
   }
}
