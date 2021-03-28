package com.qq.modules.map.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class MapUIViewCmd
   {
       
      
      public function MapUIViewCmd()
      {
         super();
      }
      
      public static function showUI() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MapUIViewCommand","showUI",[]));
      }
      
      public static function hideUI() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MapUIViewCommand","hideUI",[]));
      }
   }
}
