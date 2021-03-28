package com.qq.modules.td.logic.action.zombie.basic
{
   import com.qq.CommandName;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.modules.td.logic.numeric.TDDamageCaculete;
   import com.qq.modules.td.logic.unit.basic.IGameObject;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.utils.CommandDispatcher;
   import flash.events.Event;
   
   public class ZombieActionEat extends BasicZombieAction
   {
       
      
      private var lastEatTime:Number;
      
      protected var _walkAnimFlagName:String;
      
      public function ZombieActionEat()
      {
         super();
         this._walkAnimFlagName = TDConstant.ZombieAnmi_Eat;
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _zombie.animation.gotoAndPlay(this._walkAnimFlagName,true);
         _zombie.animation.addEventListener(Event.COMPLETE,this.playCompleteHandler);
         this.lastEatTime = TDGameInfo.getInstance().getCurGameTime();
      }
      
      protected function playCompleteHandler(param1:Event) : void
      {
         _zombie.setAction();
      }
      
      override public function leaveState() : void
      {
         _zombie.animation.removeEventListener(Event.COMPLETE,this.playCompleteHandler);
      }
      
      override public function runningState() : void
      {
         if(!_zombie.animation.isPlaying)
         {
            return;
         }
         if(TDGameInfo.getInstance().getCurGameTime() - this.lastEatTime >= 500)
         {
            this.onEat();
            this.lastEatTime = TDGameInfo.getInstance().getCurGameTime();
         }
      }
      
      protected function onEat() : void
      {
         var _loc1_:IGameObject = null;
         if(_zombie.curAttackTarget != null)
         {
            _loc1_ = _zombie.curAttackTarget;
            if(_loc1_ != null && _loc1_.isVaild)
            {
               TDSoundCmd.zombieEat();
               TDDamageCaculete.caculateZombieDamage(_zombie,_loc1_);
               CommandDispatcher.send(CommandName.TD_ZombieEatPlant,[_loc1_,_zombie]);
            }
         }
      }
   }
}
