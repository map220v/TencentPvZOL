package com.qq.modules.td.view.game.ui.skill
{
   import com.qq.CommandName;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenSupportStarlingMediator;
   import com.qq.modules.td.command.game.drag.TDMouseActionCmd;
   import com.qq.modules.td.command.ui.TDUICmd;
   import com.qq.modules.td.logic.TDCropUtil;
   import com.qq.modules.td.logic.talent.TalentManager;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.view.helpers.TDStaticInfoToolTipHelper;
   import com.qq.utils.CommandDispatcher;
   import com.qq.utils.StateMachine;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class TDSkillSlotMediator extends BasicScreenSupportStarlingMediator
   {
      
      private static const State_ChooseMode:String = "State_ChooseMode";
      
      private static const State_Disable:String = "State_Disable";
      
      private static const State_CoolDown:String = "State_CoolDown";
      
      private static const State_Usable:String = "State_Usable";
      
      private static const State_Wait:String = "State_Wait";
       
      
      [Inject]
      public var view:TDSkillSlot;
      
      private var _noCard:Boolean;
      
      private var _lastTime:Number = -1;
      
      private var _cardRefreshDuration:int;
      
      private var _stateMachine:StateMachine;
      
      private var toolTipHelper:TDStaticInfoToolTipHelper;
      
      private var isChooseMode:Boolean = false;
      
      public function TDSkillSlotMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         this._stateMachine = new StateMachine();
         this._stateMachine.addState(State_ChooseMode,this.enterState_ChooseMode,this.runningState_ChooseMode,this.leaveState_ChooseMode);
         this._stateMachine.addState(State_Disable,this.enterState_Disable,this.runningState_Disable,this.leaveState_Disable);
         this._stateMachine.addState(State_Usable,this.enterState_Usable,this.runningState_Usable,this.leaveState_Usable);
         this._stateMachine.addState(State_Wait,this.enterState_WaitCrop,this.runningState_WaitCrop,this.leaveState_WaitCrop);
         this.checkCardUsable();
         this.toolTipHelper = new TDStaticInfoToolTipHelper();
         this.toolTipHelper.addListen(this.view,this.view.plantInfo);
         this.refreshInfo();
      }
      
      private function refreshInfo() : void
      {
         if(this.view.plantInfo == null)
         {
            this.view.priceTF.setText("");
         }
         else
         {
            this.view.priceTF.setText(this.view.plantInfo.baseInfo.price.toString());
         }
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addComponentListener(this.view,MouseEvent.CLICK,this.onClick);
         addContextListener(CommandName.TDGameEvent_StartInitUI,this.onStartInitUI,CommonEvent);
         addContextListener(CommandName.TD_ClickSkillCard,this.onClickSkillCard,CommonEvent);
         addContextListener(CommandName.TD_CancelUseCard,this.onCancelUseSkill,CommonEvent);
         addContextListener(CommandName.TD_StartCropPlant,this.onStartSkill,CommonEvent);
         addContextListener(CommandName.TD_StartCardCooldown,this.onDoCropPlant,CommonEvent);
         addContextListener(CommandName.TD_ChangeSun,this.onChangeSun,CommonEvent);
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
      
      private function checkCardUsable() : void
      {
         var _loc1_:* = false;
         if(this._noCard)
         {
            return;
         }
         _loc1_ = TDCropUtil.isPlantUsable(this.view.plantInfo.type) == 0;
         if(!_loc1_)
         {
            this._stateMachine.setState(State_Disable);
         }
         else if(this._lastTime == -1)
         {
            this._stateMachine.setState(State_Usable);
         }
      }
      
      private function enterState_Disable(param1:Array = null) : void
      {
         this._lastTime = -1;
         this.view.setCooldown(1);
         this.view.disableSp.setVisible(true);
      }
      
      private function runningState_Disable() : void
      {
      }
      
      private function leaveState_Disable() : void
      {
         this.view.disableSp.setVisible(false);
      }
      
      private function enterState_Usable(param1:Array = null) : void
      {
         this._lastTime = -1;
         this.view.cooldownSp.setVisible(false);
         this.view.disableSp.setVisible(false);
      }
      
      private function runningState_Usable() : void
      {
      }
      
      private function leaveState_Usable() : void
      {
      }
      
      private function enterState_WaitCrop(param1:Array = null) : void
      {
         this._lastTime = TDGameInfo.getInstance().getCurGameTime();
         this.view.setCooldown(1);
         this.view.cooldownSp.setVisible(true);
         this.view.disableSp.setVisible(true);
         addComponentListener(this.view,Event.ENTER_FRAME,this.runningState_WaitCrop,Event);
      }
      
      private function runningState_WaitCrop(param1:Event = null) : void
      {
         var _loc2_:Number = TDGameInfo.getInstance().getCurGameTime() - this._lastTime;
         this._cardRefreshDuration = TalentManager.instance.getPlantCardCoolTime(this.view.plantInfo);
         if(_loc2_ > this._cardRefreshDuration)
         {
            this._lastTime = -1;
            this.checkCardUsable();
         }
         else
         {
            this.view.setCooldown(1 - _loc2_ / this._cardRefreshDuration);
         }
      }
      
      private function leaveState_WaitCrop() : void
      {
         removeComponentListener(this.view,Event.ENTER_FRAME,this.onUpdateCoolDown,Event);
         removeComponentListener(this.view.display,MouseEvent.CLICK,this.onUseCard,MouseEvent);
      }
      
      private function enterState_ChooseMode(param1:Array = null) : void
      {
         this.view.cooldownSp.setVisible(false);
         this.view.disableSp.setVisible(false);
         this.isChooseMode = true;
      }
      
      private function runningState_ChooseMode() : void
      {
      }
      
      private function leaveState_ChooseMode() : void
      {
         this.isChooseMode = false;
      }
      
      private function onClickSkillCard(param1:CommonEvent) : void
      {
         var _loc2_:String = param1.readCustomParam("id");
         if(_loc2_ == this.view.cardState.id)
         {
            this.onUseCard(null);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(this._noCard)
         {
            return;
         }
         if(this.isChooseMode)
         {
            CommandDispatcher.send(CommandName.TD_CancelChooseFriendCard,{"chooseCard":this.view});
         }
         else
         {
            this.onUseCard(null);
         }
      }
      
      private function onUseCard(param1:MouseEvent) : void
      {
         if(this._noCard)
         {
            return;
         }
         if(this._stateMachine.getCurState() != State_Usable)
         {
            TDMouseActionCmd.cleanMouseAction();
         }
         else
         {
            TDUICmd.startPlantSettingByID(this.view.plantInfo.type,this.view.cardState.id);
         }
      }
      
      private function onStartInitUI(param1:Event) : void
      {
         if(this._noCard)
         {
            return;
         }
         if(this.view.plantInfo != null)
         {
            this.checkCardUsable();
         }
      }
      
      private function onUpdateCoolDown(param1:Event) : void
      {
         if(this._noCard)
         {
            return;
         }
         if(this._stateMachine != null)
         {
            this._stateMachine.doRunningFunc();
         }
      }
      
      private function onCancelUseSkill(param1:CommonEvent) : void
      {
         if(this._noCard)
         {
            return;
         }
         if(this._stateMachine.getCurState() == State_Wait)
         {
            this.checkCardUsable();
         }
      }
      
      private function onStartSkill(param1:CommonEvent) : void
      {
         var _loc2_:String = param1.readCustomParam_String("cardID");
         if(_loc2_ != this.view.cardState.id)
         {
            return;
         }
         this.checkCardUsable();
      }
      
      private function onDoSkill(param1:CommonEvent) : void
      {
         if(this._noCard)
         {
            return;
         }
         var _loc2_:String = param1.readCustomParam("id");
         if(_loc2_ == this.view.cardState.id)
         {
            this._stateMachine.setState(State_CoolDown);
         }
      }
      
      private function onDoCropPlant(param1:CommonEvent) : void
      {
         if(this._noCard)
         {
            return;
         }
         var _loc2_:String = param1.readCustomParam("id");
         if(_loc2_ == this.view.cardState.id)
         {
            this._stateMachine.setState(State_Wait);
         }
         this.checkCardUsable();
      }
      
      private function onChangeSun(param1:CommonEvent) : void
      {
         if(this._noCard)
         {
            return;
         }
         var _loc2_:String = this._stateMachine.getCurState();
         if(_loc2_ != State_Wait && _loc2_ != State_CoolDown && _loc2_ != State_ChooseMode)
         {
            this.checkCardUsable();
         }
      }
   }
}
