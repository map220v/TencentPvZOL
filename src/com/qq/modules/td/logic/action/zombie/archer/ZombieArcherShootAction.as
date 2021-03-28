package com.qq.modules.td.logic.action.zombie.archer
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.effects.TDEffectCmd;
   import com.qq.modules.td.command.game.TDFireBulletCmd;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   
   public class ZombieArcherShootAction extends BasicZombieAction
   {
       
      
      public function ZombieArcherShootAction()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinish);
         _gameObject.animation.gotoAndPlay("shoot",1);
         TDEffectCmd.showArrowTargetEffect(_gameObject.curAttackTarget.uid,_gameObject.uid);
      }
      
      private function onShoot(param1:FrameEvent) : void
      {
         var _loc2_:int = 0;
         if(param1.frameLabel == "playShootSound")
         {
            TDSoundCmd.archery();
         }
         if(param1.frameLabel == "attack")
         {
            _loc2_ = _gameObject.objectModel.staticInfo.getParam(TDConstant.Zombie_Param_BulletType);
            TDFireBulletCmd.shoot(_gameObject,_gameObject.curAttackTarget,_loc2_,"zombie_jian",-30,-20,-1,false,null,null,TDConstant.TDCamp_Enemy);
         }
      }
      
      override public function leaveState() : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinish);
         _gameObject.animation.removeEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         super.leaveState();
      }
      
      private function onFinish(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onFinish);
         _gameObject.setAction();
         _gameObject.setTimeRecord(TDConstant.TimeRecord_ZombieDuration,TDGameInfo.getInstance().getCurGameTime());
      }
   }
}
