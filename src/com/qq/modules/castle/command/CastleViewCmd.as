package com.qq.modules.castle.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class CastleViewCmd
   {
       
      
      public function CastleViewCmd()
      {
         super();
      }
      
      public static function openMainWindow(param1:Boolean = false) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CastleViewCommand","openMainWindow",[param1]));
      }
      
      public static function openGameWindow(param1:int, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("CastleViewCommand","openGameWindow",[param1,param2]));
      }
   }
}
