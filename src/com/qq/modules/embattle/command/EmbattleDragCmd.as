package com.qq.modules.embattle.command
{
   import asgui.containers.Canvas;
   import flash.events.MouseEvent;
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class EmbattleDragCmd
   {
       
      
      public function EmbattleDragCmd()
      {
         super();
      }
      
      public static function startCardDrag(param1:Canvas, param2:MouseEvent) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EmbattleDragCommand","startCardDrag",[param1,param2]));
      }
      
      public static function startPlantDrag(param1:Canvas, param2:MouseEvent) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EmbattleDragCommand","startPlantDrag",[param1,param2]));
      }
   }
}
