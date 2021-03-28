package com.qq.modules.yetiTD.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class YetiTDViewCmd
   {
       
      
      public function YetiTDViewCmd()
      {
         super();
      }
      
      public static function showMainWd() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("YetiTDViewCommand","showMainWd",[]));
      }
      
      public static function gotoYetiTD(param1:int, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("YetiTDViewCommand","gotoYetiTD",[param1,param2]));
      }
      
      public static function showResultWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("YetiTDViewCommand","showResultWindow",[]));
      }
      
      public static function yetiTDRestartGame(param1:Boolean = false) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("YetiTDViewCommand","yetiTDRestartGame",[param1]));
      }
      
      public static function yetiTDPlayerGameExit(param1:Boolean = false) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("YetiTDViewCommand","yetiTDPlayerGameExit",[param1]));
      }
   }
}
