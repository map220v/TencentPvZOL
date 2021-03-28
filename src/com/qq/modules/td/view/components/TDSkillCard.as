package com.qq.modules.td.view.components
{
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   import com.qq.display.QCanvas;
   import com.qq.managers.FilterManager;
   import com.qq.modules.td.logic.talent.TalentManager;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.vo.TDCardData;
   import com.qq.modules.td.view.helpers.TDStaticInfoToolTipHelper;
   import com.qq.utils.UrlManager;
   import flash.display.Shape;
   import flash.events.Event;
   
   public class TDSkillCard extends QCanvas
   {
       
      
      private var border:Image;
      
      public var plantImg:Image;
      
      private var txtCardCount:Label;
      
      private var maskShape:Shape;
      
      private var rainCostBg:Image;
      
      private var txtRainCost:Label;
      
      private var cooldownSp:Shape;
      
      public var cardData:TDCardData;
      
      private var customCDTime:int;
      
      private var timesUsed:Boolean;
      
      private var toolTipHelper:TDStaticInfoToolTipHelper;
      
      private var _selected:Boolean;
      
      public function TDSkillCard(param1:TDCardData)
      {
         this.cardData = param1;
         super();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.width = 110;
         this.height = 90;
         this.plantImg = new Image();
         this.plantImg.x = 12;
         this.plantImg.y = 7;
         this.plantImg.source = UrlManager.getUrl(UrlManager.Url_TDImageIcon,"skill/" + this.cardData.plantStaticInfo.baseInfo.iconID + ".png");
         this.addChild(this.plantImg);
         this.maskShape = new Shape();
         this.maskShape.x = this.plantImg.x;
         this.maskShape.y = this.plantImg.y;
         this.maskShape.graphics.beginFill(0,0.3);
         this.maskShape.graphics.drawRect(0,0,50,50);
         this.maskShape.graphics.endFill();
         this.addChild(this.maskShape);
         this.cooldownSp = new Shape();
         this.cooldownSp.x = this.plantImg.x;
         this.cooldownSp.y = this.plantImg.y;
         this.cooldownSp.graphics.beginFill(0,0.7);
         this.cooldownSp.graphics.drawRect(0,0,50,50);
         this.cooldownSp.graphics.endFill();
         this.cooldownSp.visible = false;
         this.addChild(this.cooldownSp);
         this.border = new Image();
         this.border.x = 5;
         this.border.source = AssetManager.GetNewClass("TDUI_SkillIconBorderImg");
         this.addChild(this.border);
         this.border.mouseEnabled = this.border.mouseChildren = false;
         this.txtCardCount = new Label();
         this.txtCardCount.x = this.plantImg.x;
         this.txtCardCount.y = 40;
         this.txtCardCount.width = 50;
         this.txtCardCount.SetStyle("textAlign","right");
         this.addChild(this.txtCardCount);
         this.txtCardCount.mouseEnabled = false;
         this.rainCostBg = new Image();
         this.rainCostBg.x = this.border.x + 3;
         this.rainCostBg.y = 55;
         this.rainCostBg.source = AssetManager.instance.GetClass("TDUI_WaterCostBar");
         this.addChild(this.rainCostBg);
         this.txtRainCost = new Label();
         this.txtRainCost.styleName = ".TXT_TD_Card";
         this.txtRainCost.width = 50;
         this.txtRainCost.height = 20;
         this.txtRainCost.x = this.plantImg.x;
         this.txtRainCost.y = 57;
         this.txtRainCost.text = this.cardData.plantStaticInfo.baseInfo.costWater.toString();
         this.addChild(this.txtRainCost);
         this.toolTipHelper = new TDStaticInfoToolTipHelper(false);
         this.toolTipHelper.addListen(this.plantImg,this.cardData);
         this.selected = false;
      }
      
      public function set selected(param1:Boolean) : void
      {
         this.maskShape.visible = param1;
      }
      
      public function startCoolDown() : void
      {
         this.setCooldown(1);
         this.cooldownSp.visible = true;
         this.cardData.setCoolDown(TDGameInfo.getInstance().getCurGameTime());
         this.addEventListener(Event.ENTER_FRAME,this.onUpdateCoolDown);
      }
      
      public function customCoolDown(param1:int) : void
      {
         this.customCDTime = param1;
      }
      
      public function onUpdateCoolDown(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = TDGameInfo.getInstance().getCurGameTime() - this.cardData.getCoolDownTime();
         if(this.customCDTime > 0)
         {
            _loc2_ = this.customCDTime;
         }
         else
         {
            this.cardData.cardRefreshDuration = TalentManager.instance.getPlantCardCoolTime(this.cardData.plantStaticInfo);
            this.cardData.cardRefreshDuration += TalentManager.instance.getPlugPlantDieCardCoolTime(this.cardData.plantStaticInfo);
            _loc2_ = this.cardData.cardRefreshDuration;
         }
         if(_loc3_ > _loc2_)
         {
            this.cardData.setCoolDown(-1);
            this.leaveState_CoolDown();
            if(!this.timesUsed)
            {
               this.toolTip = null;
            }
         }
         else
         {
            this.setCooldown(1 - _loc3_ / _loc2_);
            if(!this.timesUsed)
            {
               this.toolTip = "冷却中...";
            }
         }
      }
      
      private function leaveState_CoolDown() : void
      {
         this.removeEventListener(Event.ENTER_FRAME,this.onUpdateCoolDown);
         this.cooldownSp.visible = false;
      }
      
      private function setCooldown(param1:Number) : void
      {
         this.cooldownSp.scaleY = param1;
      }
      
      public function isCoolDown() : Boolean
      {
         return this.cooldownSp.visible;
      }
      
      public function updateEnoughRain() : void
      {
         if(TDGameInfo.getInstance().rain.get() >= this.cardData.plantStaticInfo.baseInfo.costWater)
         {
            this.filters = [];
         }
         else
         {
            this.filters = [FilterManager.getGaryFilter()];
         }
      }
      
      public function updateEnoughTicket(param1:uint) : void
      {
         if(param1 >= this.cardData.plantStaticInfo.baseInfo.costDiamond)
         {
            this.filters = [];
         }
         else
         {
            this.filters = [FilterManager.getGaryFilter()];
         }
      }
      
      public function setUseEnvironment(param1:Boolean) : void
      {
         if(param1)
         {
            this.txtRainCost.text = this.cardData.plantStaticInfo.baseInfo.costWater.toString();
            this.txtRainCost.y = 57;
            this.rainCostBg.source = AssetManager.instance.GetClass("TDUI_WaterCostBar");
         }
         else
         {
            this.txtRainCost.text = this.cardData.plantStaticInfo.baseInfo.costDiamond.toString();
            this.txtRainCost.y = 52;
            this.rainCostBg.source = AssetManager.instance.GetClass("TDUI_GoldTicketCostBar");
         }
      }
      
      public function setTimesUsed(param1:Boolean) : void
      {
         this.timesUsed = param1;
      }
      
      override public function Dispose() : void
      {
         this.removeEventListener(Event.ENTER_FRAME,this.onUpdateCoolDown);
         if(this.toolTipHelper)
         {
            this.toolTipHelper.removeListen();
            this.toolTipHelper = null;
         }
         this.customCDTime = 0;
         super.Dispose();
      }
   }
}
