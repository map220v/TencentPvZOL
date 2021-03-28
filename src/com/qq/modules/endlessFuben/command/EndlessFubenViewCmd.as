package com.qq.modules.endlessFuben.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class EndlessFubenViewCmd
   {
       
      
      public function EndlessFubenViewCmd()
      {
         super();
      }
      
      public static function enterEndlessFuben() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EndlessFubenViewCommand","enterEndlessFuben",[]));
      }
      
      public static function leaveEndlessFuben() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EndlessFubenViewCommand","leaveEndlessFuben",[]));
      }
      
      public static function openRankWindow(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EndlessFubenViewCommand","openRankWindow",[param1]));
      }
      
      public static function openPrepareView() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EndlessFubenViewCommand","openPrepareView",[]));
      }
   }
}
