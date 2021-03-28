package com.qq.modules.td.logic.action.object.switcher
{
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDGameObjectCmd;
   import com.qq.modules.td.logic.action.basic.BasicAction;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   
   public class SwitcherActionRun extends BasicAction
   {
       
      
      public function SwitcherActionRun()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.gotoAndPlay("zombiepass",false);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.playCompleteHandler);
         this.doSwitch();
      }
      
      protected function playCompleteHandler(param1:Event) : void
      {
         (param1.currentTarget as IEventDispatcher).removeEventListener(Event.COMPLETE,this.playCompleteHandler);
         _gameObject.setAction(TDConstant.SwitcherActionIdle);
      }
      
      private function doSwitch() : void
      {
         var _loc1_:int = 0;
         if(_gameObject.curAttackTarget != null)
         {
            _loc1_ = _gameObject.objectModel.staticInfo.getParam(TDConstant.NormalObj_Param_SWITCH_TYPE);
            TDGameObjectCmd.switchZombie(_gameObject.curAttackTarget,_loc1_);
         }
      }
      
      private function idle() : void
      {
      }
      
      override public function runningState() : void
      {
      }
   }
}
