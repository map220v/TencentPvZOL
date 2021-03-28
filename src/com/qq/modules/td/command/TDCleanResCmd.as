package com.qq.modules.td.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class TDCleanResCmd
   {
       
      
      public function TDCleanResCmd()
      {
         super();
      }
      
      public static function cleanTDRes() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDCleanResCommand","cleanTDRes",[]));
      }
   }
}
