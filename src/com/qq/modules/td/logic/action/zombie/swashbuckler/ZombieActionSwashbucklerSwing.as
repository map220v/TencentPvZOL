package com.qq.modules.td.logic.action.zombie.swashbuckler
{
   import com.qq.CommandName;
   import com.qq.modules.td.command.effects.TDEffectCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.utils.CommandDispatcher;
   import flash.events.Event;
   
   public class ZombieActionSwashbucklerSwing extends BasicZombieAction
   {
       
      
      private var _isSwingSuccess:Boolean;
      
      public function ZombieActionSwashbucklerSwing()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.setFrozenAI(true);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinishFirstSwing);
         _gameObject.animation.gotoAndPlay("swing");
         _gameObject.setShadeVisible(false);
         _gameObject.objectModel.isFlying = true;
         CommandDispatcher.send(CommandName.TD_ForceSortDepth);
      }
      
      override public function leaveState() : void
      {
         _gameObject.setFrozenAI(false);
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinishFirstSwing);
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinishAllSwing);
         super.leaveState();
      }
      
      private function onFinishFirstSwing(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinishFirstSwing);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinishAllSwing);
         this._isSwingSuccess = Math.random() < 0.95;
         if(this._isSwingSuccess)
         {
            _gameObject.animation.gotoAndPlay("swing_success");
         }
         else
         {
            _gameObject.animation.gotoAndPlay("swing_failture");
         }
      }
      
      private function onFinishAllSwing(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinishAllSwing);
         if(this._isSwingSuccess)
         {
            _gameObject.setShadeVisible(true);
            _gameObject.setFrozenAI(false);
            _gameObject.objectModel.isFlying = false;
            CommandDispatcher.send(CommandName.TD_ForceSortDepth);
         }
         else
         {
            TDEffectCmd.showWaterSplash(_gameObject.x,_gameObject.y);
            TDSoundCmd.zombieDropWater();
            _gameObject.Dispose();
         }
      }
      
      override public function runningState() : void
      {
         super.runningState();
      }
   }
}
