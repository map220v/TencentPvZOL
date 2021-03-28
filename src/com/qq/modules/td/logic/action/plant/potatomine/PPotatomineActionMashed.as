package com.qq.modules.td.logic.action.plant.potatomine
{
   import com.qq.CommandName;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.effects.TDEffectCmd;
   import com.qq.modules.td.command.game.TDExplodeCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   import com.qq.utils.CommandDispatcher;
   import flash.events.Event;
   
   public class PPotatomineActionMashed extends BasicPlantAction
   {
       
      
      private var _lastCheckTime:Number;
      
      public function PPotatomineActionMashed()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Attack,false);
         _plant.animation.addEventListener(Event.COMPLETE,this.onFinishAttack);
      }
      
      private function onFinishAttack(param1:Event) : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishAttack);
         this.explode();
         _gameObject.dispose();
      }
      
      private function explode() : void
      {
         _plant.killBySelfExplode = true;
         TDSoundCmd.potatoMineExplode();
         CommandDispatcher.send(CommandName.TD_PlayShakeEffect);
         TDEffectCmd.playBombEffect(1000,_gameObject.x,_gameObject.y);
         TDExplodeCmd.explodeForPlant(_plant,1,true);
      }
      
      override public function leaveState() : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onFinishAttack);
         super.leaveState();
      }
   }
}
