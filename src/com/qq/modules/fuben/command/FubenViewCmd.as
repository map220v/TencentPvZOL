package com.qq.modules.fuben.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class FubenViewCmd
   {
       
      
      public function FubenViewCmd()
      {
         super();
      }
      
      public static function showChapterChoose() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FubenViewCommand","showChapterChoose",[]));
      }
      
      public static function setChapter(param1:int, param2:int = 1) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FubenViewCommand","setChapter",[param1,param2]));
      }
      
      public static function showSweepWinds(param1:uint, param2:uint, param3:uint, param4:uint = 1) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FubenViewCommand","showSweepWinds",[param1,param2,param3,param4]));
      }
   }
}
