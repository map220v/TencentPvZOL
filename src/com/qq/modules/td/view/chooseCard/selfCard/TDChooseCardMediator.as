package com.qq.modules.td.view.chooseCard.selfCard
{
   import com.qq.CommandName;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDStageInfo;
   import com.qq.modules.td.view.helpers.TDStaticInfoToolTipHelper;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.StateMachine;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class TDChooseCardMediator extends BasicScreenMediator
   {
       
      
      public var view:TDBasicChooseCard;
      
      private var _stateMachine:StateMachine;
      
      private var toolTipHelper:TDStaticInfoToolTipHelper;
      
      public function TDChooseCardMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         this.view = viewComponent as TDBasicChooseCard;
         this.onResetPrepareChooseCardState(null);
         this.toolTipHelper = new TDStaticInfoToolTipHelper();
         this.toolTipHelper.addListen(this.view,this.view.cardData);
         this.updateStatus();
      }
      
      override protected function initListener() : void
      {
         addContextListener(CommandName.TD_ChangeChoosePlant,this.onResetPrepareChooseCardState,CommonEvent);
         addComponentListener(this.view,MouseEvent.CLICK,this.onClickCard);
      }
      
      override public function dispose() : void
      {
         if(this._stateMachine != null)
         {
            this._stateMachine.clean();
            this._stateMachine = null;
         }
         if(this.toolTipHelper)
         {
            this.toolTipHelper.removeListen();
            this.toolTipHelper = null;
         }
         super.dispose();
      }
      
      protected function checkCardCondition() : int
      {
         var _loc1_:int = 0;
         if(this.view.cardData.plantStaticInfo.baseInfo.useSunOrNight != TDConstant.Time_All)
         {
            if(this.view.cardData.plantStaticInfo.baseInfo.useSunOrNight != TDStageInfo.getInstance().time.get())
            {
               if(TDStageInfo.getInstance().time.get() == TDConstant.Time_Day)
               {
                  return TDConstant.CardNotRecommandReason_UseInSun;
               }
               return TDConstant.CardNotRecommandReason_UseInNight;
            }
         }
         if(this.view.cardData.plantStaticInfo.baseInfo.prePlantType != 0 && !TDGameInfo.getInstance().normalCardsData.hasPlantType(this.view.cardData.plantStaticInfo.baseInfo.prePlantType))
         {
            return TDConstant.CardNotRecommandReason_NoPrePlant;
         }
         if(TDStageInfo.getInstance().banNormalPlant.indexOf(this.view.cardData.plantStaticInfo.type) >= 0)
         {
            return TDConstant.CardNotRecommandReason_InBanList;
         }
         if(!TDStageInfo.getInstance().isUnderWater && this.view.cardData.plantStaticInfo.baseInfo.isSeaPlant > 0)
         {
            return TDConstant.CardNotRecommandReason_UseSeaPlantOnLand;
         }
         return _loc1_;
      }
      
      private function onResetPrepareChooseCardState(param1:Event) : void
      {
         this.updateStatus();
      }
      
      protected function onClickCard(param1:MouseEvent) : void
      {
         CommandDispatcher.send(CommandName.TD_DownEffectImmediately);
         if(!this.checkEnable())
         {
            return;
         }
         TDSoundCmd.chooseCard();
         CommandDispatcher.send(CommandName.TD_ChooseCard,{
            "chooseCard":this.view,
            "fromPanel":1
         });
         this.updateStatus();
      }
      
      protected function checkEnable() : Boolean
      {
         var _loc1_:Boolean = !this.checkCardCondition() && !TDGameInfo.getInstance().hasPlantCardByCardData(this.view.cardData);
         if(_loc1_ && this.view.cardData.plantStaticInfo.baseInfo.prePlantType > 0)
         {
            _loc1_ = TDGameInfo.getInstance().hasPlantCardByType(this.view.cardData.plantStaticInfo.baseInfo.prePlantType);
         }
         return _loc1_;
      }
      
      protected function updateStatus() : void
      {
         var _loc1_:Boolean = this.checkEnable();
         this.view.buttonMode = _loc1_;
         this.view.notRecommendedSp.visible = !_loc1_;
         if(this.checkCardCondition() > 0)
         {
            this.view.forbidFlag.visible = true;
         }
         else
         {
            this.view.forbidFlag.visible = false;
         }
         if(this.toolTipHelper)
         {
            this.toolTipHelper.addListen(this.view,this.view.cardData);
         }
      }
   }
}
