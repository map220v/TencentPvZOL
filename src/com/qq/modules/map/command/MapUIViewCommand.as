package com.qq.modules.map.command
{
   import com.qq.modules.basic.event.CommonEvent;
   import com.qq.modules.map.MapGlobals;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class MapUIViewCommand extends StrongRobotlegCommand
   {
       
      
      public function MapUIViewCommand()
      {
         super();
      }
      
      public function showUI() : void
      {
         this.dispatch(new CommonEvent(MapGlobals.MAP_DO_SHOW_UI));
      }
      
      public function hideUI() : void
      {
         this.dispatch(new CommonEvent(MapGlobals.MAP_DO_HIDE_UI));
      }
   }
}
