package com.qq.modules.actPennyShop.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ActPennyShopCmd
   {
       
      
      public function ActPennyShopCmd()
      {
         super();
      }
      
      public static function openWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ActPennyShopCommand","openWindow",[]));
      }
      
      public static function exchangeItem(param1:int, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ActPennyShopCommand","exchangeItem",[param1,param2]));
      }
   }
}
