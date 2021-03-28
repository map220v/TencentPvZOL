package com.qq.modules.nutrition.command
{
   import PVZ.Cmd.Cmd_Nutrition_GetReagentAll_CS;
   import com.qq.modules.main.server.PvzSocketService;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class NutritionGlobalProxyCommand extends StrongRobotlegCommand
   {
       
      
      [Inject]
      public var pvzService:PvzSocketService;
      
      public function NutritionGlobalProxyCommand()
      {
         super();
      }
      
      public function getReagentBag() : void
      {
         var _loc1_:Cmd_Nutrition_GetReagentAll_CS = new Cmd_Nutrition_GetReagentAll_CS();
         this.pvzService.sendMessage(_loc1_);
      }
   }
}
