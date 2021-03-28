package com.qq.modules.td.view.chooseCard.selfCard
{
   import com.qq.CommandName;
   import com.qq.modules.td.model.vo.TDCardData;
   import com.qq.modules.td.view.helpers.TDStaticInfoToolTipHelper;
   import com.qq.utils.CommandDispatcher;
   import flash.events.MouseEvent;
   import org.robotlegs.mvcs.Mediator;
   
   public class TDBeChoosedCardMediator extends Mediator
   {
       
      
      [Inject]
      public var view:TDBeChoosedCard;
      
      private var toolTipHelper:TDStaticInfoToolTipHelper;
      
      public function TDBeChoosedCardMediator()
      {
         super();
      }
      
      override public function onRegister() : void
      {
         this.toolTipHelper = new TDStaticInfoToolTipHelper();
         this.toolTipHelper.addListen(this.view,this.view.cardData);
         this.view.addEventListener(MouseEvent.CLICK,this.cardClickHandler);
         this.updateStatus();
      }
      
      protected function cardClickHandler(param1:MouseEvent) : void
      {
         this.view.cardData.choosePos = TDCardData.CARD_CHOOSE_POS_NONE;
         CommandDispatcher.send(CommandName.TD_DownEffectImmediately);
         CommandDispatcher.send(CommandName.TD_CancelChoosePlantCard,{"chooseCard":this.view});
      }
      
      private function updateStatus() : void
      {
         var _loc1_:Boolean = true;
         this.view.buttonMode = _loc1_;
         this.view.notRecommendedSp.visible = !_loc1_;
         if(this.toolTipHelper)
         {
            this.toolTipHelper.addListen(this.view,this.view.cardData);
         }
      }
      
      override public function onRemove() : void
      {
         this.view.removeEventListener(MouseEvent.CLICK,this.cardClickHandler);
         this.view = null;
      }
   }
}
