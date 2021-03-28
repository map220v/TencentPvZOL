package com.qq.modules.td.view.chooseCard.selfCard
{
   import asgui.controls.Image;
   import asgui.controls.Label;
   import asgui.resources.AssetManager;
   import com.qq.GameGloble;
   import com.qq.display.CardIcon;
   import com.qq.display.QCanvas;
   import com.qq.modules.plantTalent.model.PlantTalentModel;
   import com.qq.modules.td.model.vo.TDCardData;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.display.Shape;
   
   public class TDBasicChooseCard extends QCanvas
   {
       
      
      public var cardData:TDCardData;
      
      public var priceTF:Label;
      
      public var priceBg:Image;
      
      public var bg:Image;
      
      public var notRecommendedSp:Shape;
      
      public var forbidFlag:MovieClip;
      
      public var loader:CardIcon;
      
      public function TDBasicChooseCard(param1:Class, param2:Object)
      {
         this.cardData = param2 as TDCardData;
         super(param1);
      }
      
      override public function InitializeComponent() : void
      {
         var _loc2_:PlantTalentModel = null;
         var _loc3_:int = 0;
         super.InitializeComponent();
         this.width = 54;
         this.height = 72;
         this.bg = new Image();
         var _loc1_:* = !!this.cardData.plantStaticInfo ? AssetManager.GetNewClass("TD_UI_CardBG" + this.cardData.plantStaticInfo.baseInfo.bgID) : new BitmapData(50,50,false,0);
         this.bg.source = _loc1_;
         this.addChild(this.bg);
         if(GameGloble.injector.hasMapping(PlantTalentModel))
         {
            _loc2_ = GameGloble.injector.getInstance(PlantTalentModel);
            _loc3_ = _loc2_.getTalentLevelByPlant(this.cardData.plantStaticInfo.id);
            if(_loc3_ == 0)
            {
               this.bg.source = AssetManager.GetNewClass("TD_UI_CardBG9");
            }
            else
            {
               switch(_loc3_)
               {
                  case 1:
                     this.bg.source = AssetManager.GetNewClass("TD_UI_CardBG5");
                     break;
                  case 2:
                     this.bg.source = AssetManager.GetNewClass("TD_UI_CardBG6");
                     break;
                  case 3:
                     this.bg.source = AssetManager.GetNewClass("TD_UI_CardBG7");
                     break;
                  case 4:
                     this.bg.source = AssetManager.GetNewClass("TD_UI_CardBG8");
                     break;
                  case 5:
                     this.bg.source = AssetManager.GetNewClass("TD_UI_CardBG8");
               }
            }
         }
         this.loader = new CardIcon();
         if(this.cardData.plantStaticInfo)
         {
            this.loader.setCardIconByPlantId(this.cardData.plantStaticInfo.id,this.cardData.plantInfo.avatarId);
         }
         addChild(this.loader);
         this.priceBg = new Image();
         this.priceBg.y = 55;
         this.priceBg.source = AssetManager.instance.GetClass("TD_UI_CardBar");
         this.addChild(this.priceBg);
         this.priceTF = new Label();
         this.priceTF.styleName = ".TXT_TD_Card";
         this.priceTF.width = this.width + 5;
         this.priceTF.height = 20;
         this.priceTF.x = 0;
         this.priceTF.y = 53;
         this.priceTF.text = this.cardData.plantStaticInfo.baseInfo.price.toString();
         this.addChild(this.priceTF);
         this.notRecommendedSp = new Shape();
         this.notRecommendedSp.graphics.beginFill(0,0.5);
         this.notRecommendedSp.graphics.drawRect(0,0,this.width - 2,this.height - 1);
         this.notRecommendedSp.graphics.endFill();
         this.addChild(this.notRecommendedSp);
         this.forbidFlag = AssetManager.instance.GetNewClass("TD_UI_BanFlag") as MovieClip;
         this.forbidFlag.x = (width - this.forbidFlag.width) * 0.5;
         this.forbidFlag.y = (height - this.forbidFlag.height) * 0.5;
         this.forbidFlag.visible = false;
         addChild(this.forbidFlag);
      }
      
      override public function Dispose() : void
      {
         super.Dispose();
      }
   }
}
