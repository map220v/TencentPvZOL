package com.qq.modules.td.view.chooseCard.friendCard
{
   import com.qq.CommandName;
   import com.qq.modules.td.view.helpers.TDStaticInfoToolTipHelper;
   import com.qq.utils.CommandDispatcher;
   import flash.events.MouseEvent;
   import org.robotlegs.mvcs.Mediator;
   
   public class TDBeChoosedFriendCardMediator extends Mediator
   {
       
      
      [Inject]
      public var view:TDBeChoosedFriendCard;
      
      private var toolTipHelper:TDStaticInfoToolTipHelper;
      
      public function TDBeChoosedFriendCardMediator()
      {
         super();
      }
      
      override public function onRegister() : void
      {
         this.toolTipHelper = new TDStaticInfoToolTipHelper();
         this.toolTipHelper.addListen(this.view,this.view.cardData.plantStaticInfo);
         this.updateStatus();
         this.view.addEventListener(MouseEvent.CLICK,this.cardClickHandler);
      }
      
      protected function cardClickHandler(param1:MouseEvent) : void
      {
         CommandDispatcher.send(CommandName.TD_CancelChooseFriendCard,{"chooseCard":this.view});
      }
      
      private function updateStatus() : void
      {
         var _loc1_:Boolean = false;
         _loc1_ = true;
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
