package com.qq.modules.nutritionExchange.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class NutritionExchangeViewCmd
   {
       
      
      public function NutritionExchangeViewCmd()
      {
         super();
      }
      
      public static function openWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("NutritionExchangeViewCommand","openWindow",[]));
      }
   }
}
