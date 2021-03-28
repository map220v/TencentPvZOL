package com.qq.modules.td.logic.action.zombie.mechFootball
{
   import asgui.events.FrameEvent;
   import com.qq.constant.td.TDConstant;
   import com.qq.constant.td.TDSoundID;
   import com.qq.modules.td.command.game.sound.TDSoundCmd;
   import com.qq.modules.td.logic.action.zombie.BasicZombieAction;
   import com.qq.modules.td.logic.numeric.TDDamageCaculete;
   import com.qq.modules.td.logic.unit.plant.BasicPlant;
   import com.qq.modules.td.model.TDGameInfo;
   import com.qq.modules.td.model.TDStageInfo;
   import flash.events.Event;
   
   public class ZActionMechFootballBump extends BasicZombieAction
   {
       
      
      public function ZActionMechFootballBump()
      {
         super();
      }
      
      override public function enterState(param1:Array = null) : void
      {
         super.enterState(param1);
         _gameObject.animation.addEventListener(FrameEvent.MOVEMENT_FRAME_EVENT,this.onShoot);
         _gameObject.animation.addEventListener(Event.COMPLETE,this.onFinish);
         _gameObject.animation.gotoAndPlay(TDConstant.ZombieAnmi_Eat);
      }
      
      private function onShoot(param1:FrameEvent) : void
      {
         var _loc2_:BasicPlant = null;
         var _loc3_:int = 0;
         if(param1.frameLabel == "bump")
         {
            if(_zombie.curAttackTarget is BasicPlant)
            {
               if(TDStageInfo.getInstance().tdGameType == TDConstant.TDGameType_Jewels)
               {
                  TDDamageCaculete.caculateZombieDamage(_zombie,_zombie.curAttackTarget);
               }
               else
               {
                  _loc3_ = _zombie.curAttackTarget.objectModel.column;
                  while(_loc3_ <= TDGameInfo.getInstance().maxCol)
                  {
                     _loc2_ = TDGameInfo.getInstance().getPlantByPos(_zombie.curAttackTarget.objectModel.roadIndex,_loc3_);
                     if(!_loc2_)
                     {
                        break;
                     }
                     _loc2_.setAction(TDConstant.PlantAction_PushedAway,[_loc3_ + 1,_zombie.curAttackTarget.objectModel.roadIndex]);
                     TDSoundCmd.playSound(TDSoundID.Future_Football_Mvmt_PushOff);
                     _loc3_++;
                  }
               }
            }
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
      }
   }
}
