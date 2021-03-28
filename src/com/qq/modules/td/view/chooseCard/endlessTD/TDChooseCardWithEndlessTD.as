package com.qq.modules.td.view.chooseCard.endlessTD
{
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   import com.qq.modules.td.view.chooseCard.selfCard.TDBasicChooseCard;
   
   public class TDChooseCardWithEndlessTD extends TDBasicChooseCard
   {
       
      
      private var rainCostBg:Image;
      
      private var txtRainCost:Label;
      
      public function TDChooseCardWithEndlessTD(param1:Object)
      {
         super(TDChooseCardWithEndlessTDMediator,param1);
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.height = 95;
         this.rainCostBg = new Image();
         this.rainCostBg.y = 70;
         this.rainCostBg.source = AssetManager.instance.GetClass("TDUI_WaterCostBar");
         this.addChild(this.rainCostBg);
         this.txtRainCost = new Label();
         this.txtRainCost.styleName = ".TXT_TD_Card";
         this.txtRainCost.width = this.width - 5;
         this.txtRainCost.height = 20;
         this.txtRainCost.x = 3;
         this.txtRainCost.y = 72;
         this.txtRainCost.text = cardData.plantStaticInfo.baseInfo.costWater.toString();
         this.addChild(this.txtRainCost);
      }
   }
}
