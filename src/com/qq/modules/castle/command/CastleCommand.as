package com.qq.modules.castle.command
{
   import PVZ.Cmd.Cmd_CastleAdventure_Dice_CS;
   import PVZ.Cmd.Cmd_CastleAdventure_GetInfo_CS;
   import PVZ.Cmd.Cmd_CastleAdventure_GiveUp_CS;
   import PVZ.Cmd.Cmd_CastleAdventure_Move_CS;
   import PVZ.Cmd.Cmd_CastleAdventure_Reset_CS;
   import PVZ.Cmd.Cmd_CastleAdventure_TakeCompletionReward_CS;
   import com.qq.modules.main.server.PvzSocketService;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class CastleCommand extends StrongRobotlegCommand
   {
      
      public static const NAME:String = "CastleCommand";
       
      
      [Inject]
      public var pvzService:PvzSocketService;
      
      public function CastleCommand()
      {
         super();
      }
      
      public function getInfo() : void
      {
         var _loc1_:Cmd_CastleAdventure_GetInfo_CS = new Cmd_CastleAdventure_GetInfo_CS();
         this.pvzService.sendMessage(_loc1_);
      }
      
      public function move(param1:uint) : void
      {
         var _loc2_:Cmd_CastleAdventure_Move_CS = new Cmd_CastleAdventure_Move_CS();
         _loc2_.target = param1;
         this.pvzService.sendMessage(_loc2_);
      }
      
      public function dice() : void
      {
         var _loc1_:Cmd_CastleAdventure_Dice_CS = new Cmd_CastleAdventure_Dice_CS();
         this.pvzService.sendMessage(_loc1_);
      }
      
      public function takeCompletionReward() : void
      {
         var _loc1_:Cmd_CastleAdventure_TakeCompletionReward_CS = new Cmd_CastleAdventure_TakeCompletionReward_CS();
         this.pvzService.sendMessage(_loc1_);
      }
      
      public function giveUp() : void
      {
         var _loc1_:Cmd_CastleAdventure_GiveUp_CS = new Cmd_CastleAdventure_GiveUp_CS();
         this.pvzService.sendMessage(_loc1_);
      }
      
      public function reset() : void
      {
         var _loc1_:Cmd_CastleAdventure_Reset_CS = new Cmd_CastleAdventure_Reset_CS();
         this.pvzService.sendMessage(_loc1_);
      }
   }
}
