package com.qq.modules.td.logic.action.zombie.flipCard
{
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.action.zombie.basic.ZombieActionDeath;
   import com.qq.modules.td.logic.unit.zombie.FlipCardZombie;
   import flash.events.Event;
   
   public class ZActionFlipCardDeath extends ZombieActionDeath
   {
       
      
      private var _isDropStoneCard:Boolean;
      
      public function ZActionFlipCardDeath()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         _zombie.animation.addEventListener(Event.COMPLETE,this.onFinishAction);
         _zombie.animation.gotoAndPlay("die",1);
         this._isDropStoneCard = false;
      }
      
      override public function runningState() : void
      {
         super.runningState();
         if(!this._isDropStoneCard)
         {
            if(_gameObject.animation.getCurrentFrameIndex() > 118)
            {
               TDSoundCmd.camelPanelBreak();
               this._isDropStoneCard = true;
               if(_gameObject as FlipCardZombie != null && (_gameObject as FlipCardZombie).filpCardAnmi != null)
               {
                  (_gameObject as FlipCardZombie).filpCardAnmi.asset.visible = false;
               }
            }
         }
      }
      
      override public function leaveState() : void
      {
         _zombie.animation.removeEventListener(Event.COMPLETE,this.onFinishAction);
      }
      
      override protected function onFinishAction(param1:Event) : void
      {
         onFinishDisappear();
      }
   }
}
