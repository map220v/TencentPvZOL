package com.qq.modules.arena.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ArenaCmd
   {
       
      
      public function ArenaCmd()
      {
         super();
      }
      
      public static function openArenaWD() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ArenaCommand","openArenaWD",[]));
      }
      
      public static function leaveScene() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ArenaCommand","leaveScene",[]));
      }
      
      public static function closeArenaWD(param1:Boolean = true) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ArenaCommand","closeArenaWD",[param1]));
      }
      
      public static function reduceCD() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ArenaCommand","reduceCD",[]));
      }
      
      public static function getMyinfo() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ArenaCommand","getMyinfo",[]));
      }
      
      public static function challenge() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ArenaCommand","challenge",[]));
      }
   }
}
