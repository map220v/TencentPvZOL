package com.qq.modules.halloween.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class HalloweenViewCmd
   {
       
      
      public function HalloweenViewCmd()
      {
         super();
      }
      
      public static function openHalloween() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("HalloweenViewCommand","openHalloween",[]));
      }
   }
}
