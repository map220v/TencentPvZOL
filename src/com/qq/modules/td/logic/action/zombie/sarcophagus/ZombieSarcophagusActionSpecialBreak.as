package com.qq.modules.td.logic.action.zombie.sarcophagus
{
   import asgui.blit.bone.BlitBoneAnim;
   import com.qq.GameGloble;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.utils.UrlManager;
   import flash.events.Event;
   
   public class ZombieSarcophagusActionSpecialBreak extends BasicZombieAction
   {
       
      
      private var _explodeEffect:BlitBoneAnim;
      
      public function ZombieSarcophagusActionSpecialBreak()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _zombie.animation.gotoAndPlay("idle_norm",true);
         this._explodeEffect = _zombie.animation.upperBoneGotoAndPlay(UrlManager.getUrl(UrlManager.Url_TDZombieAnmi,"zombie_egypt_sarcophagus." + GameGloble.BONE_FILE_EXT),"break_power");
         this._explodeEffect.addEventListener(Event.COMPLETE,this.onFinishExplodeStart);
         TDSoundCmd.sarcophagusBreak();
      }
      
      private function onFinishExplodeStart(param1:Event) : void
      {
         this._explodeEffect.removeEventListener(Event.COMPLETE,this.onFinishExplodeStart);
         _zombie.setFrozenAI(false);
      }
      
      override public function leaveState() : void
      {
         this._explodeEffect.removeEventListener(Event.COMPLETE,this.onFinishExplodeStart);
         this._explodeEffect.stop();
         this._explodeEffect.Dispose();
         this._explodeEffect = null;
      }
   }
}
