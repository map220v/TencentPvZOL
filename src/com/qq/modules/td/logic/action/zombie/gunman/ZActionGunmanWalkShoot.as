package com.qq.modules.td.logic.action.zombie.gunman
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.modules.td.command.game.TDFireBulletCmd;
   import com.qq.modules.td.logic.action.zombie.basic.ZombieActionWalk;
   import com.qq.modules.td.model.TDGameInfo;
   import flash.events.Event;
   
   public class ZActionGunmanWalkShoot extends ZombieActionWalk
   {
       
      
      public function ZActionGunmanWalkShoot()
      {
         super();
         _walkAnimFlagName = TDConstant.ZombieAnmi_Walk2;
      }
      
      override protected function get playLoop() : int
      {
         return 1;
      }
      
      override protected function get startFrame() : int
      {
         return 1;
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onEvent);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onComplete);
      }
      
      override protected function onEvent(param1:FrameEvent) : void
      {
         var _loc2_:int = 0;
         super.onEvent(param1);
         if(param1.frameLabel == "shoot")
         {
            _loc2_ = _gameObject.objectModel.staticInfo.getParam(TDConstant.Zombie_Param_BulletType);
            TDFireBulletCmd.shoot(_gameObject,null,_loc2_,null,-30,-50,-1,false,null,null,TDConstant.TDCamp_Enemy);
         }
      }
      
      private function onComplete(param1:Event) : void
      {
         _gameObject.animation.removeEventListener(Event.COMPLETE,this.onComplete);
         _gameObject.setTimeRecord(TDConstant.TimeRecord_ZombieDuration,TDGameInfo.getInstance().getCurGameTime());
         _zombie.setAction();
      }
   }
}
