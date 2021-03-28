package com.qq.modules.actPlantCarnival.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ActPlantCarnivalViewCmd
   {
       
      
      public function ActPlantCarnivalViewCmd()
      {
         super();
      }
      
      public static function openWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ActPlantCarnivalViewCommand","openWindow",[]));
      }
   }
}
