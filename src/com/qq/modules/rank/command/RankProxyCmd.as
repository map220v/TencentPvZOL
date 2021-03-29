package com.qq.modules.rank.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class RankProxyCmd
   {
       
      
      public function RankProxyCmd()
      {
         super();
      }
      
      public static function queryRankList(param1:int, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("RankProxyCommand","queryRankList",[param1,param2]));
      }
      
      public static function querySelfList(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("RankProxyCommand","querySelfList",[param1]));
      }
   }
}
