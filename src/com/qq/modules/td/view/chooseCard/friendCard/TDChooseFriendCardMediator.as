package com.qq.modules.td.view.chooseCard.friendCard
{
   import com.qq.CommandName;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.view.chooseCard.selfCard.TDChooseCardMediator;
   import com.qq.utils.CommandDispatcher;
   import flash.events.MouseEvent;
   
   public class TDChooseFriendCardMediator extends TDChooseCardMediator
   {
       
      
      public function TDChooseFriendCardMediator()
      {
         super();
      }
      
      override protected function onClickCard(param1:MouseEvent) : void
      {
         CommandDispatcher.send(CommandName.TD_DownEffectImmediately);
         if(!this.checkEnable())
         {
            return;
         }
         TDSoundCmd.chooseCard();
         CommandDispatcher.send(CommandName.TD_ChooseFriendCard,{
            "chooseCard":view,
            "fromPanel":1
         });
         updateStatus();
      }
      
      override protected function checkEnable() : Boolean
      {
         var _loc1_:Boolean = !checkCardCondition() && !TDGameInfo.getInstance().friendCardsData.hasPlantType(view.cardData.plantStaticInfo.type);
         if(_loc1_ && view.cardData.plantStaticInfo.baseInfo.prePlantType > 0)
         {
            _loc1_ = TDGameInfo.getInstance().hasPlantCardByType(view.cardData.plantStaticInfo.baseInfo.prePlantType);
         }
         return _loc1_;
      }
   }
}
