package com.qq.modules.td.logic.action.plant.cherryBomb
{
   import com.qq.CommandName;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.effects.TDEffectCmd;
   import com.qq.modules.td.command.game.TDExplodeCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.action.plant.BasicPlantAction;
   import com.qq.modules.td.view.effects.TDEffectPlayInfo;
   import com.qq.utils.CommandDispatcher;
   import flash.events.Event;
   
   public class PCherryBombActionExplode extends BasicPlantAction
   {
       
      
      public function PCherryBombActionExplode()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _plant.animation.gotoAndPlay(TDConstant.PlantAnmi_Attack);
         _plant.animation.addEventListener(Event.COMPLETE,this.onExplode);
      }
      
      override public function runningState() : void
      {
         super.runningState();
      }
      
      override public function leaveState() : void
      {
         _plant.animation.removeEventListener(Event.COMPLETE,this.onExplode);
      }
      
      private function onExplode(param1:Event) : void
      {
         this.playExplode();
      }
      
      private function playExplode() : void
      {
         TDSoundCmd.cherryBombExplode();
         CommandDispatcher.send(CommandName.TD_PlayShakeEffect);
         TDExplodeCmd.explodeForPlant(_plant);
         TDEffectCmd.playBlitAnimation(1100,_plant.x,_plant.y,new TDEffectPlayInfo("anim"));
         _plant.dispose();
      }
   }
}
