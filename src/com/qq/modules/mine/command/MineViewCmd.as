package com.qq.modules.mine.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class MineViewCmd
   {
       
      
      public function MineViewCmd()
      {
         super();
      }
      
      public static function openMineInfo(param1:int, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MineViewCommand","openMineInfo",[param1,param2]));
      }
      
      public static function showReward(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MineViewCommand","showReward",[param1]));
      }
      
      public static function armyActionSuccess(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MineViewCommand","armyActionSuccess",[param1]));
      }
   }
}
