package com.qq.modules.main.command.modules
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ModuleTDCmd
   {
       
      
      public function ModuleTDCmd()
      {
         super();
      }
      
      public static function startTDGame(param1:Array) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ModuleTDCommand","startTDGame",[param1]));
      }
      
      public static function unloadTD() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ModuleTDCommand","unloadTD",[]));
      }
   }
}
