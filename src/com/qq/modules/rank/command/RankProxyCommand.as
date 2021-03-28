package com.qq.modules.rank.command
{
   import PVZ.Cmd.Cmd_GetRankList_CS;
   import PVZ.Cmd.Cmd_GetSelfRank_CS;
   import com.qq.modules.main.server.PvzSocketService;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class RankProxyCommand extends StrongRobotlegCommand
   {
      
      public static const NAME:String = "RankProxyCommand";
       
      
      [Inject]
      public var pvzService:PvzSocketService;
      
      public function RankProxyCommand()
      {
         super();
      }
      
      public function queryRankList(param1:int, param2:int) : void
      {
         var _loc3_:Cmd_GetRankList_CS = new Cmd_GetRankList_CS();
         _loc3_.ranktype = param1;
         _loc3_.page = param2;
         this.pvzService.sendMessage(_loc3_);
      }
      
      public function querySelfList(param1:int) : void
      {
         var _loc2_:Cmd_GetSelfRank_CS = new Cmd_GetSelfRank_CS();
         _loc2_.ranktype = param1;
         this.pvzService.sendMessage(_loc2_);
      }
   }
}
