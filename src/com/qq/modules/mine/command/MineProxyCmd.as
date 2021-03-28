package com.qq.modules.mine.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class MineProxyCmd
   {
       
      
      public function MineProxyCmd()
      {
         super();
      }
      
      public static function queryInfo(param1:int, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MineProxyCommand","queryInfo",[param1,param2]));
      }
      
      public static function queryDefendTeam(param1:int, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MineProxyCommand","queryDefendTeam",[param1,param2]));
      }
      
      public static function doSetOut(param1:int, param2:int, param3:uint) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MineProxyCommand","doSetOut",[param1,param2,param3]));
      }
      
      public static function doCollectProduct(param1:int, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MineProxyCommand","doCollectProduct",[param1,param2]));
      }
      
      public static function startMine(param1:int, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MineProxyCommand","startMine",[param1,param2]));
      }
      
      public static function stopMine(param1:int, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MineProxyCommand","stopMine",[param1,param2]));
      }
   }
}
