package com.qq.modules.td.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class TDItemCmd
   {
       
      
      public function TDItemCmd()
      {
         super();
      }
      
      public static function showLootItemAt(param1:int, param2:int, param3:int, param4:Array = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDItemCommand","showLootItemAt",[param1,param2,param3,param4]));
      }
      
      public static function showFinalItemAt(param1:int, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDItemCommand","showFinalItemAt",[param1,param2]));
      }
      
      public static function showRewardItemFromBag(param1:int, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDItemCommand","showRewardItemFromBag",[param1,param2]));
      }
      
      public static function lootItemEndGame() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("TDItemCommand","lootItemEndGame",[]));
      }
   }
}
