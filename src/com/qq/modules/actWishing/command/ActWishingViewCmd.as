package com.qq.modules.actWishing.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ActWishingViewCmd
   {
       
      
      public function ActWishingViewCmd()
      {
         super();
      }
      
      public static function openWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ActWishingViewCommand","openWindow",[]));
      }
      
      public static function openExchangeWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ActWishingViewCommand","openExchangeWindow",[]));
      }
   }
}
