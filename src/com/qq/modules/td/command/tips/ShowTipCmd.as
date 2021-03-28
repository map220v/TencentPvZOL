package com.qq.modules.td.command.tips
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ShowTipCmd
   {
       
      
      public function ShowTipCmd()
      {
         super();
      }
      
      public static function showBigWave(param1:int = 0) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ShowTipCommand","showBigWave",[param1]));
      }
      
      public static function showFinalWave(param1:int = 0) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ShowTipCommand","showFinalWave",[param1]));
      }
      
      public static function showPlantSetError(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ShowTipCommand","showPlantSetError",[param1]));
      }
      
      public static function showPlantWaveTip(param1:*) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ShowTipCommand","showPlantWaveTip",[param1]));
      }
      
      public static function showCountDown(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ShowTipCommand","showCountDown",[param1]));
      }
   }
}
