package com.qq.modules.td.view.game.ui.plant
{
   import asgui.blit.Blit;
   import asgui.blit.data.BlitDataManager;
   import asgui.blit.display.IBlitClip;
   import asgui.blit.display.IBlitDisplayContainer;
   import asgui.managers.CursorManager;
   import com.qq.GameGloble;
   import com.qq.display.CardIcon;
   import com.qq.modules.plantTalent.model.PlantTalentModel;
   import com.qq.modules.td.data.game.unit.TDPlantStaticInfo;
   import com.qq.modules.td.model.vo.TDCardData;
   import com.qq.modules.td.view.game.layer.TDBasicLayer;
   import com.qq.net.Uin;
   import com.qq.utils.UIFactory;
   import com.qq.utils.blit.QBlitUI;
   import com.qq.utils.ui.MixTextField;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   
   public class TDCardSlot extends TDBasicLayer
   {
      
      private static const WIDTH:int = 54;
      
      private static const HEIGHT:int = 72;
       
      
      public var content:IBlitDisplayContainer;
      
      public var cardState:TDCardData;
      
      public var uin:Uin;
      
      public var priceTF:MixTextField;
      
      public var plantInfo:TDPlantStaticInfo;
      
      public var cooldownSp:IBlitClip;
      
      public var disableSp:IBlitDisplayContainer;
      
      public var bg:IBlitClip;
      
      public function TDCardSlot(param1:TDCardData, param2:Boolean = false)
      {
         var bitmapData:BitmapData = null;
         var iconLoaderCompleteHandler:Function = null;
         var icon:IBlitClip = null;
         var cardItem:CardIcon = null;
         var service:PlantTalentModel = null;
         var level:int = 0;
         var cardState:TDCardData = param1;
         var useNormalMode:Boolean = param2;
         iconLoaderCompleteHandler = function(param1:Event):void
         {
            (param1.currentTarget as IEventDispatcher).removeEventListener(Event.COMPLETE,iconLoaderCompleteHandler);
            var _loc2_:BitmapData = new BitmapData(54,72,true,0);
            _loc2_.draw(cardItem,new Matrix(0.5,0,0,0.5,-3,2 + cardItem.offsetY * 0.5));
            icon.dataProvider = BlitDataManager.GetBlitDataByObject(new Bitmap(_loc2_));
            icon.Render();
         };
         super();
         this.cardState = cardState;
         this.name = "slot_" + cardState.plantStaticInfo.id;
         this.plantInfo = cardState.plantStaticInfo;
         this.content = QBlitUI.createContainer();
         addComponentToLayer(this.content);
         if(GameGloble.injector.hasMapping(PlantTalentModel))
         {
            service = GameGloble.injector.getInstance(PlantTalentModel);
            level = service.getTalentLevelByPlant(cardState.plantStaticInfo.id);
            if(level == 0)
            {
               this.bg = QBlitUI.createClipFromClassName("TD_UI_CardBG9");
            }
            else
            {
               switch(level)
               {
                  case 1:
                     this.bg = QBlitUI.createClipFromClassName("TD_UI_CardBG5");
                     break;
                  case 2:
                     this.bg = QBlitUI.createClipFromClassName("TD_UI_CardBG6");
                     break;
                  case 3:
                     this.bg = QBlitUI.createClipFromClassName("TD_UI_CardBG7");
                     break;
                  case 4:
                     this.bg = QBlitUI.createClipFromClassName("TD_UI_CardBG8");
                     break;
                  case 5:
                     this.bg = QBlitUI.createClipFromClassName("TD_UI_CardBG8");
               }
            }
         }
         this.content.AddChild(this.bg);
         icon = Blit.factory.CreateBlitClip({"smoothing":true});
         cardItem = new CardIcon();
         cardItem.addEventListener(Event.COMPLETE,iconLoaderCompleteHandler);
         cardItem.setCardIconByPlantId(cardState.plantStaticInfo.id,cardState.plantInfo.avatarId);
         cardItem.OnAddedToStage();
         this.content.AddChild(icon);
         this.cooldownSp = QBlitUI.createClipByRect(WIDTH,HEIGHT,1291845632);
         this.cooldownSp.visible = false;
         this.content.AddChild(this.cooldownSp);
         this.disableSp = QBlitUI.createContainer();
         var disableClip:IBlitClip = QBlitUI.createClipByRect(WIDTH,HEIGHT,1291845632);
         this.disableSp.AddChild(disableClip);
         this.disableSp.visible = false;
         this.content.AddChild(this.disableSp);
         var bar:IBlitClip = QBlitUI.createClipFromClassName("TD_UI_CardBar");
         bar.x = 0;
         bar.y = this.height - bar.height - 3;
         this.content.AddChild(bar);
         this.priceTF = UIFactory.createMixTextField(0,52,WIDTH,20,"center",16514962,14,".TXT_TD_Card");
         addComponentToLayer(this.priceTF,false,useNormalMode);
         this.content.addEventListener(MouseEvent.ROLL_OVER,this.overHandler);
         this.content.addEventListener(MouseEvent.ROLL_OUT,this.outHandler);
      }
      
      private function overHandler(param1:Event) : void
      {
         CursorManager.currentCursorID = CursorManager.BUTTON;
      }
      
      private function outHandler(param1:Event) : void
      {
         CursorManager.currentCursorID = CursorManager.NO_CURSOR;
      }
      
      public function setCooldown(param1:Number) : void
      {
         this.cooldownSp.scaleY = param1;
      }
      
      public function isCoolDown() : Boolean
      {
         return this.cooldownSp.visible;
      }
      
      override public function Dispose() : void
      {
         this.cardState = null;
         super.Dispose();
      }
   }
}
