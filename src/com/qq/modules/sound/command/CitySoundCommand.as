package com.qq.modules.sound.command
{
   import com.qq.GameGloble;
   import com.qq.utils.DMath;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class CitySoundCommand extends StrongRobotlegCommand
   {
       
      
      public function CitySoundCommand()
      {
         super();
      }
      
      public function playBGSound() : void
      {
         var _loc1_:Array = null;
         var _loc2_:int = 0;
         if(GameGloble.bgSoundIndex == -1)
         {
            _loc1_ = [231,452,453];
            _loc2_ = DMath.randNum(0,2);
            _loc2_ = Math.min(_loc2_,_loc1_.length - 1);
            GameGloble.bgSoundIndex = _loc1_[_loc2_];
         }
         SoundCmd.playBackgroundSound(GameGloble.bgSoundIndex);
      }
   }
}
