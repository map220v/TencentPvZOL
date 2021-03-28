package com.qq.modules.buy.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class BuyViewCmd
   {
       
      
      public function BuyViewCmd()
      {
         super();
      }
      
      public static function openMallWnd() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("BuyViewCommand","openMallWnd",[]));
      }
   }
}
