package com.qq.modules.main.command.modules
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class ModuleBattleCardMarketCmd
   {
       
      
      public function ModuleBattleCardMarketCmd()
      {
         super();
      }
      
      public static function start() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ModuleBattleCardMarketCommand","start",[]));
      }
      
      public static function unload() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("ModuleBattleCardMarketCommand","unload",[]));
      }
   }
}
