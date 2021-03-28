package com.qq.modules.rankArena.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class RankArenaViewCmd
   {
       
      
      public function RankArenaViewCmd()
      {
         super();
      }
      
      public static function enterScene() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("RankArenaViewCommand","enterScene",[]));
      }
      
      public static function leavaScene() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("RankArenaViewCommand","leavaScene",[]));
      }
      
      public static function showLogWd() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("RankArenaViewCommand","showLogWd",[]));
      }
      
      public static function showChatShareWd(param1:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("RankArenaViewCommand","showChatShareWd",[param1]));
      }
   }
}
