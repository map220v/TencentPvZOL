package com.qq.modules.city.command
{
   import PVZ.Cmd.Cmd_City_GetBuildingInfo_CS;
   import PVZ.Cmd.Cmd_City_GetTownDurability_CS;
   import PVZ.Cmd.Cmd_TD_CollectProduct_CS;
   import PVZ.Cmd.Cmd_TD_GetStageInfo_CS;
   import com.qq.modules.main.server.PvzSocketService;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class CityProxyCommand extends StrongRobotlegCommand
   {
       
      
      [Inject]
      public var server:PvzSocketService;
      
      public function CityProxyCommand()
      {
         super();
      }
      
      public function requestCityBuildingInfo() : void
      {
         var _loc1_:Cmd_City_GetBuildingInfo_CS = new Cmd_City_GetBuildingInfo_CS();
         this.server.sendMessage(_loc1_);
      }
      
      public function collect() : void
      {
         var _loc1_:Cmd_TD_CollectProduct_CS = new Cmd_TD_CollectProduct_CS();
         this.server.sendMessage(_loc1_);
      }
      
      public function requestCityDurability() : void
      {
         var _loc1_:Cmd_City_GetTownDurability_CS = new Cmd_City_GetTownDurability_CS();
         this.server.sendMessage(_loc1_);
      }
      
      public function requestBuildNotice() : void
      {
      }
      
      public function requestCurrentStageInfo(param1:int) : void
      {
         var _loc2_:Cmd_TD_GetStageInfo_CS = new Cmd_TD_GetStageInfo_CS();
         _loc2_.stageId = param1;
         this.server.sendMessage(_loc2_);
      }
   }
}
