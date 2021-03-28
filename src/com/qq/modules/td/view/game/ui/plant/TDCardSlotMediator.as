package com.qq.modules.td.view.game.ui.plant
{
   import asgui.managers.CursorManager;
   import com.qq.CommandName;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenSupportStarlingMediator;
   import com.qq.modules.td.command.game.drag.TDMouseActionCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.command.ui.TDUICmd;
   import com.qq.modules.td.logic.TDCropUtil;
   import com.qq.modules.td.logic.talent.TalentManager;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.vo.TDCardData;
   import com.qq.modules.td.view.helpers.TDStaticInfoToolTipHelper;
   import com.qq.utils.StateMachine;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class TDCardSlotMediator extends BasicScreenSupportStarlingMediator
   {
      
      private static const State_ChooseMode:String = "State_ChooseMode";
      
      private static const State_Disable:String = "State_Disable";
      
      private static const State_Usable:String = "State_Usable";
      
      private static const State_WaitCorp:String = "State_WaitCorp";
       
      
      [Inject]
      public var view:TDCardSlot;
      
      private var _cardState:TDCardData;
      
      private var _stateMachine:StateMachine;
      
      private var toolTipHelper:TDStaticInfoToolTipHelper;
      
      public function TDCardSlotMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         this._cardState = this.view.cardState;
         this.refresh();
         this._stateMachine = new StateMachine();
         this._stateMachine.addState(State_ChooseMode,this.enterState_ChooseMode,this.runningState_ChooseMode,this.leaveState_ChooseMode);
         this._stateMachine.addState(State_Disable,this.enterState_Disable,this.runningState_Disable,this.leaveState_Disable);
         this._stateMachine.addState(State_Usable,this.enterState_Usable,this.runningState_Usable,this.leaveState_Usable);
         this._stateMachine.addState(State_WaitCorp,this.enterState_WaitCrop,this.runningState_WaitCrop,this.leaveState_WaitCrop);
         this.checkCardUsable();
         this.toolTipHelper = new TDStaticInfoToolTipHelper();
         this.toolTipHelper.addListen(this.view.content,this._cardState);
         this.view.cooldownSp.visible = false;
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         this.view.content.addEventListener(MouseEvent.CLICK,this.onClick);
         addContextListener(CommandName.TD_ResetGameInfoPanelBG,this.onResetCardSoltBG,CommonEvent);
         addContextListener(CommandName.TD_StartCardCooldown,this.onDoCropPlant,CommonEvent);
         addContextListener(CommandName.TDGameEvent_StartInitUI,this.onStartInitUI,CommonEvent);
         addContextListener(CommandName.TD_ChangeSun,this.onChangeSun);
         addContextListener(CommandName.TD_RefreshCardCost,this.onChangeSun);
         addContextListener(CommandName.TD_CancelUseCard,this.onCancelUseCard,CommonEvent);
         addContextListener(CommandName.TD_StartCropPlant,this.onStartCropPlant,CommonEvent);
         addContextListener(CommandName.TD_TALENT_UPDATE,this.onTalentUpdate,CommonEvent);
         addContextListener(CommandName.TDGameEvent_StartTDGame,this.onTalentUpdate1,CommonEvent);
      }
      
      private function onTalentUpdate(param1:CommonEvent) : void
      {
         this.refreshInfo();
      }
      
      private function onTalentUpdate1(param1:CommonEvent) : void
      {
         this.refreshInfo();
      }
      
      private function onResetCardSoltBG(param1:Event) : void
      {
      }
      
      private function refresh() : void
      {
         this.refreshInfo();
      }
      
      private function refreshInfo() : void
      {
         this._cardState.updatePrice();
         if(TDGameInfo.getInstance().sun.get() < this._cardState.price)
         {
            this.view.priceTF.setTextColor(16711680);
         }
         else if(TalentManager.instance.isGrowPlantSunCostChange(this._cardState.plantStaticInfo))
         {
            this.view.priceTF.setTextColor(65280);
         }
         else
         {
            this.view.priceTF.setTextColor(16514962);
         }
         this.view.priceTF.setText(this._cardState.price.toString());
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
         this._cardState = null;
         super.dispose();
      }
      
      private function checkCardUsable() : void
      {
         var _loc1_:* = false;
         if(this._cardState.getCoolDownTime() == -1)
         {
            _loc1_ = TDCropUtil.isPlantUsable(this._cardState.plantStaticInfo.type) == 0;
         }
         if(_loc1_ && this._cardState.cardSourceType == TDCardData.CARD_SOURCE_VIP)
         {
            _loc1_ = Boolean(this._cardState.isCanUse);
         }
         if(!_loc1_)
         {
            this._stateMachine.setState(State_Disable);
         }
         else
         {
            this._stateMachine.setState(State_Usable);
         }
      }
      
      private function startCoolDown() : void
      {
         this.view.setCooldown(1);
         this.view.cooldownSp.visible = true;
         this._cardState.setCoolDown(TDGameInfo.getInstance().getCurGameTime());
         addComponentListener(this.view,Event.ENTER_FRAME,this.onUpdateCoolDown,Event);
      }
      
      private function onUpdateCoolDown(param1:Event) : void
      {
         var _loc2_:Number = NaN;
         _loc2_ = TDGameInfo.getInstance().getCurGameTime() - this._cardState.getCoolDownTime();
         this._cardState.cardRefreshDuration = TalentManager.instance.getPlantCardCoolTime(this.view.plantInfo);
         this._cardState.cardRefreshDuration += TalentManager.instance.getPlugPlantDieCardCoolTime(this.view.plantInfo);
         if(_loc2_ > this._cardState.cardRefreshDuration)
         {
            this._cardState.setCoolDown(-1);
            this.checkCardUsable();
            this.leaveState_CoolDown();
         }
         else
         {
            this.view.setCooldown(1 - _loc2_ / this._cardState.cardRefreshDuration);
         }
      }
      
      private function leaveState_CoolDown() : void
      {
         removeComponentListener(this.view,Event.ENTER_FRAME,this.onUpdateCoolDown,Event);
         this.view.cooldownSp.visible = false;
      }
      
      private function enterState_Disable(param1:Array = null) : void
      {
         this.view.disableSp.visible = true;
      }
      
      private function runningState_Disable() : void
      {
      }
      
      private function leaveState_Disable() : void
      {
      }
      
      private function enterState_Usable(param1:Array = null) : void
      {
         this.view.disableSp.visible = false;
      }
      
      private function runningState_Usable() : void
      {
      }
      
      private function leaveState_Usable() : void
      {
      }
      
      private function enterState_WaitCrop(param1:Array = null) : void
      {
         this.view.disableSp.visible = true;
      }
      
      private function runningState_WaitCrop() : void
      {
      }
      
      private function leaveState_WaitCrop() : void
      {
      }
      
      private function enterState_ChooseMode(param1:Array = null) : void
      {
         this.view.disableSp.visible = false;
      }
      
      private function runningState_ChooseMode() : void
      {
      }
      
      private function leaveState_ChooseMode() : void
      {
      }
      
      private function onClickPlantCard(param1:CommonEvent) : void
      {
         var _loc2_:int = param1.readCustomParam_Number("type");
         if(_loc2_ == this._cardState.plantStaticInfo.type)
         {
            this.onUseCard(null);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         this.onUseCard(null);
         CursorManager.currentCursorID = CursorManager.NO_CURSOR;
      }
      
      private function onUseCard(param1:MouseEvent) : void
      {
         var _loc2_:Rectangle = null;
         var _loc3_:Point = null;
         if(!TDGameInfo.getInstance().isRunningGame)
         {
            return;
         }
         if(this._stateMachine.getCurState() != State_Usable)
         {
            TDMouseActionCmd.cleanMouseAction();
         }
         else
         {
            TDSoundCmd.chooseCard();
            _loc2_ = this.view.disableSp.GetBounds(this.view.disableSp);
            _loc3_ = new Point(_loc2_.x,_loc2_.y);
            _loc3_ = this.view.disableSp.localToGlobal(_loc3_);
            _loc2_.x = _loc3_.x;
            _loc2_.y = _loc3_.y;
            TDUICmd.startPlantSettingByID(this._cardState.plantStaticInfo.id,this._cardState.id,false,_loc2_);
         }
      }
      
      private function onStartCropPlant(param1:CommonEvent) : void
      {
         var _loc2_:String = param1.readCustomParam_String("cardID");
         if(_loc2_ != this._cardState.id)
         {
            return;
         }
         if(this._stateMachine.getCurState() == State_Usable)
         {
            this._stateMachine.setState(State_WaitCorp);
         }
      }
      
      private function onCancelUseCard(param1:Event) : void
      {
         if(this._stateMachine.getCurState() == State_WaitCorp)
         {
            this.checkCardUsable();
         }
      }
      
      private function onStartInitUI(param1:Event) : void
      {
         this.checkCardUsable();
      }
      
      private function onDoCropPlant(param1:CommonEvent) : void
      {
         var _loc2_:int = param1.readCustomParam_Number("plantType");
         if(this._cardState.id == TDGameInfo.getInstance().lastCropPlantID)
         {
            this.startCoolDown();
            TDGameInfo.getInstance().lastCropPlantID = null;
         }
         this.checkCardUsable();
      }
      
      private function onChangeSun(param1:CommonEvent) : void
      {
         var _loc2_:String = this._stateMachine.getCurState();
         if(_loc2_ != State_WaitCorp && _loc2_ != State_ChooseMode)
         {
            this.checkCardUsable();
         }
         this.refreshInfo();
      }
   }
}
