package com.qq.modules.main.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class TQOSCmd
   {
       
      
      public function TQOSCmd()
      {
         super();
      }
      
      public static function report_TD_performence(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TQOSCommand","report_TD_performence",[param1,param2,param3,param4,param5,param6]));
      }
   }
}
