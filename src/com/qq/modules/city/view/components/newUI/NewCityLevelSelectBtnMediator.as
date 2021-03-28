package com.qq.modules.city.view.components.newUI
{
   import com.qq.CommandName;
   import com.qq.GameGloble;
   import com.qq.modules.basic.view.BasicScreenMediator;
   import com.qq.modules.main.command.GameFlowCmd;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class NewCityLevelSelectBtnMediator extends BasicScreenMediator
   {
       
      
      [Inject]
      public var view:NewCityLevelSelectBtn;
      
      public function NewCityLevelSelectBtnMediator()
      {
         super();
      }
      
      override protected function init() : void
      {
         super.init();
      }
      
      override protected function initListener() : void
      {
         super.initListener();
         addComponentListener(this.view.button_normal,MouseEvent.ROLL_OVER,this.onRollOver);
         addComponentListener(this.view.button_normal,MouseEvent.ROLL_OUT,this.onRollOut);
         addComponentListener(this.view.button_spec,MouseEvent.ROLL_OVER,this.onRollOver);
         addComponentListener(this.view.button_spec,MouseEvent.ROLL_OUT,this.onRollOut);
         addContextListener(CommandName.ChangeLevel,this.refresh);
      }
      
      override protected function initialized() : void
      {
         super.initialized();
         this.refresh();
      }
      
      public function refresh(param1:Event = null) : void
      {
         if(GameGloble.actorModel.actorLevel > 21)
         {
            removeComponentListener(this.view,MouseEvent.CLICK,this.onClickNorTD);
            removeComponentListener(this.view,MouseEvent.ROLL_OVER,this.onRollOver);
            removeComponentListener(this.view,MouseEvent.ROLL_OUT,this.onRollOut);
            addComponentListener(this.view.button_normal,MouseEvent.CLICK,this.onClickNorTD);
            addComponentListener(this.view.button_spec,MouseEvent.CLICK,this.onClickSpecTD);
            this.view.button_spec.enabled = true;
            this.view.button_normal.mouseChildren = true;
            this.view.button_normal.mouseEnabled = true;
            this.view.button_spec.mouseChildren = true;
            this.view.button_spec.mouseEnabled = true;
         }
         else
         {
            addComponentListener(this.view,MouseEvent.CLICK,this.onClickNorTD);
            addComponentListener(this.view,MouseEvent.ROLL_OVER,this.onRollOver);
            addComponentListener(this.view,MouseEvent.ROLL_OUT,this.onRollOut);
            removeComponentListener(this.view.button_normal,MouseEvent.CLICK,this.onClickNorTD);
            removeComponentListener(this.view.button_spec,MouseEvent.CLICK,this.onClickSpecTD);
            this.view.button_spec.enabled = false;
            this.view.button_spec.toolTip = "21级才能开启挑战关";
            this.view.button_normal.mouseChildren = false;
            this.view.button_normal.mouseEnabled = false;
            this.view.button_spec.mouseChildren = false;
            this.view.button_spec.mouseEnabled = false;
         }
      }
      
      private function onRollOver(param1:Event) : void
      {
         this.view.buttonBGMC.gotoAndStop(2);
      }
      
      private function onRollOut(param1:Event) : void
      {
         this.view.buttonBGMC.gotoAndStop(1);
      }
      
      private function onClickNorTD(param1:MouseEvent) : void
      {
         GameFlowCmd.gotoLevelSelect();
      }
      
      private function onClickSpecTD(param1:MouseEvent) : void
      {
         if(this.view.button_spec.enabled)
         {
            GameFlowCmd.gotoTDChallengeLevel();
         }
         else
         {
            GameFlowCmd.gotoLevelSelect();
         }
      }
   }
}
