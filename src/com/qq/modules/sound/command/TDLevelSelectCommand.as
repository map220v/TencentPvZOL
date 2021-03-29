package com.qq.modules.sound.command
{
   import com.qq.modules.levelselect.model.templates.LSDataFactory;
   import com.qq.modules.levelselect.model.templates.ce.LSStageSoundInfoCE;
   import com.qq.modules.main.model.ActorModel;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class TDLevelSelectCommand extends StrongRobotlegCommand
   {
       
      
      public function TDLevelSelectCommand()
      {
         super();
      }
      
      public function playBGSound(param1:int) : void
      {
         var _loc3_:LSStageSoundInfoCE = null;
         SoundCmd.stopBackgroundSound();
         var _loc2_:int = 1;
         while(_loc2_ <= ActorModel.MAX_STAGE)
         {
            _loc3_ = LSDataFactory.instance.getStageSoundInfoByStageID(_loc2_);
            if(_loc3_ != null)
            {
               if(param1 == _loc3_.stageID)
               {
                  SoundCmd.playBackgroundSound(_loc3_.bgSoundID);
                  break;
               }
            }
            _loc2_++;
         }
      }
      
      public function openLockDoor() : void
      {
         SoundCmd.playSound(251);
      }
   }
}
