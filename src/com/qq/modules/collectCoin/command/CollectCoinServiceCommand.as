package com.qq.modules.collectCoin.command
{
   import PVZ.Cmd.Cmd_TD_CollectProduct_CS;
   import PVZ.Cmd.Cmd_TD_GetProductInfo_CS;
   import PVZ.Cmd.Cmd_Vip_GetTodayEnergy_CS;
   import PVZ.Cmd.Cmd_Vip_GetTodayTicket_CS;
   import com.qq.modules.main.server.PvzSocketService;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class CollectCoinServiceCommand extends StrongRobotlegCommand
   {
       
      
      [Inject]
      public var server:PvzSocketService;
      
      public function CollectCoinServiceCommand()
      {
         super();
      }
      
      public function requestCoinCollectInfo() : void
      {
         var _loc1_:Cmd_TD_GetProductInfo_CS = new Cmd_TD_GetProductInfo_CS();
         this.server.sendMessage(_loc1_);
      }
      
      public function collectCoin() : void
      {
         var _loc1_:Cmd_TD_CollectProduct_CS = new Cmd_TD_CollectProduct_CS();
         this.server.sendMessage(_loc1_);
      }
      
      public function collectPhysical() : void
      {
         var _loc1_:Cmd_Vip_GetTodayEnergy_CS = new Cmd_Vip_GetTodayEnergy_CS();
         this.server.sendMessage(_loc1_);
      }
      
      public function collectTicket() : void
      {
         var _loc1_:Cmd_Vip_GetTodayTicket_CS = new Cmd_Vip_GetTodayTicket_CS();
         this.server.sendMessage(_loc1_);
      }
   }
}
