package com.qq.modules.lab.command
{
   import PVZ.Cmd.Cmd_Lab_GetLabInfo_CS;
   import PVZ.Cmd.Cmd_Lab_ProduceLab_CS;
   import PVZ.Cmd.Cmd_Lab_UpgradeLab_CS;
   import com.qq.modules.main.server.PvzSocketService;
   import com.qq.modules.sound.command.UISoundCmd;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class LabProxyCommand extends StrongRobotlegCommand
   {
       
      
      [Inject]
      public var server:PvzSocketService;
      
      public function LabProxyCommand()
      {
         super();
      }
      
      public function getLabInfo(param1:int = 1) : void
      {
         var _loc2_:Cmd_Lab_GetLabInfo_CS = new Cmd_Lab_GetLabInfo_CS();
         _loc2_.from = param1;
         this.server.sendMessage(_loc2_);
      }
      
      public function upgradeTech(param1:int) : void
      {
         var _loc2_:Cmd_Lab_UpgradeLab_CS = new Cmd_Lab_UpgradeLab_CS();
         _loc2_.labId = param1;
         this.server.sendMessage(_loc2_);
         UISoundCmd.lab_skill_levelup();
      }
      
      public function produceTech(param1:int) : void
      {
         var _loc2_:Cmd_Lab_ProduceLab_CS = new Cmd_Lab_ProduceLab_CS();
         _loc2_.labId = param1;
         this.server.sendMessage(_loc2_);
         UISoundCmd.lab_skill_product();
      }
   }
}
