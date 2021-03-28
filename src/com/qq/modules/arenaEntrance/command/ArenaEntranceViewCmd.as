package com.qq.modules.arenaEntrance.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ArenaEntranceViewCmd
   {
       
      
      public function ArenaEntranceViewCmd()
      {
         super();
      }
      
      public static function enterScene() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ArenaEntranceViewCommand","enterScene",[]));
      }
      
      public static function leavaScene() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ArenaEntranceViewCommand","leavaScene",[]));
      }
   }
}
