package com.qq.modules.yellowDiamond.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class YellowDiamondViewCmd
   {
       
      
      public function YellowDiamondViewCmd()
      {
         super();
      }
      
      public static function openYellowDiamond() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("YellowDiamondViewCommand","openYellowDiamond",[]));
      }
   }
}
