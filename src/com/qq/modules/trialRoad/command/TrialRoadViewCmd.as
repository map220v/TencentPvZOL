package com.qq.modules.trialRoad.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class TrialRoadViewCmd
   {
       
      
      public function TrialRoadViewCmd()
      {
         super();
      }
      
      public static function enterScene() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TrialRoadViewCommand","enterScene",[]));
      }
      
      public static function leavaScene() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TrialRoadViewCommand","leavaScene",[]));
      }
   }
}
