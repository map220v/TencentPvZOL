package com.qq.modules.mergeServer.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class MergeServerCmd
   {
       
      
      public function MergeServerCmd()
      {
         super();
      }
      
      public static function showMergeFlag() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MergeServerCommand","showMergeFlag",[]));
      }
   }
}
