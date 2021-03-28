package com.qq.modules.brain.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class BrainViewCmd
   {
       
      
      public function BrainViewCmd()
      {
         super();
      }
      
      public static function openMainView() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("BrainViewCommand","openMainView",[]));
      }
      
      public static function openTestView() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("BrainViewCommand","openTestView",[]));
      }
      
      public static function openConfirmView() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("BrainViewCommand","openConfirmView",[]));
      }
      
      public static function openEndView() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("BrainViewCommand","openEndView",[]));
      }
      
      public static function openRankView() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("BrainViewCommand","openRankView",[]));
      }
   }
}
