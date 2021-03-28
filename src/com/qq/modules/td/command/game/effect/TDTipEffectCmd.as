package com.qq.modules.td.command.game.effect
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class TDTipEffectCmd
   {
       
      
      public function TDTipEffectCmd()
      {
         super();
      }
      
      public static function showAllLevelupPlantTipCommand(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDTipEffectCommand","showAllLevelupPlantTipCommand",[param1]));
      }
      
      public static function hideLevelupPlantTip(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDTipEffectCommand","hideLevelupPlantTip",[param1]));
      }
      
      public static function hideAllLevelupPlantTip() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDTipEffectCommand","hideAllLevelupPlantTip",[]));
      }
   }
}
