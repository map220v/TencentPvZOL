package com.qq.modules.embattle.view.components
{
   import asgui.events.AsguiEvent;
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.embattle.constant.EmbattleConst;
   import com.qq.modules.embattle.service.EmbattleService;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class HeathAutoRecoverSettingPanelMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:HeathAutoRecoverSettingPanel;
      
      [Inject]
      public var embattleService:EmbattleService;
      
      private var _autoThresholdIndex:int;
      
      private var _isAuto:Boolean;
      
      private var _healthLimit:int;
      
      public function HeathAutoRecoverSettingPanelMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
      }
      
      override protected function initialized() : void
      {
         super.initialized();
         this._autoThresholdIndex = 0;
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addComponentListener(this.view.checkbox_auto,AsguiEvent.DATA_CHANGE,this.onClickAutoFixHp);
         addContextListener(EmbattleConst.EMBATTLE_AUTO_FIX_HP_CHANGE,this.onAutoFixHpChange);
         addComponentListener(this.view.button_left,MouseEvent.CLICK,this.onClickBtnLeft);
         addComponentListener(this.view.button_right,MouseEvent.CLICK,this.onClickBtnRight);
      }
      
      override public function reset(param1:Object = null) : void
      {
         super.reset(param1);
         this.embattleService.getAutoFixHp();
      }
      
      private function onClickBtnLeft(param1:Event) : void
      {
         if(this._autoThresholdIndex - 1 >= 0)
         {
            this._autoThresholdIndex = this._autoThresholdIndex - 1;
            this.refresh();
            this.embattleService.setAutoFixHp(int(this.view.textinput_value.text),this.view.checkbox_auto.selected);
         }
      }
      
      private function onClickBtnRight(param1:Event) : void
      {
         if(this._autoThresholdIndex + 1 < this.view.heathThresholdList.length)
         {
            this._autoThresholdIndex += 1;
            this.refresh();
            this.embattleService.setAutoFixHp(int(this.view.textinput_value.text),this.view.checkbox_auto.selected);
         }
      }
      
      private function refresh() : void
      {
         this.view.checkbox_auto.selected = this._isAuto;
         this.view.setThresholdIndex(this._autoThresholdIndex);
      }
      
      private function onAutoFixHpChange(param1:CommonEvent) : void
      {
         var _loc2_:Array = param1.param as Array;
         if(_loc2_ == null || _loc2_.length == 0)
         {
            return;
         }
         this._isAuto = _loc2_[1];
         this._healthLimit = _loc2_[0];
         this.view.checkbox_auto.selected = this._isAuto;
         this._autoThresholdIndex = this.view.setThresholdValue(this._healthLimit);
      }
      
      private function onClickAutoFixHp(param1:Event) : void
      {
         this.embattleService.setAutoFixHp(int(this.view.textinput_value.text),this.view.checkbox_auto.selected);
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
