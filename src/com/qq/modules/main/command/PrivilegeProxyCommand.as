package com.qq.modules.main.command
{
   import PVZ.Cmd.Cmd_PVZPrivilege_CS;
   import com.qq.modules.main.server.PvzSocketService;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class PrivilegeProxyCommand extends StrongRobotlegCommand
   {
       
      
      [Inject]
      public var pvzService:PvzSocketService;
      
      public function PrivilegeProxyCommand()
      {
         super();
      }
      
      public function getPrivilege() : void
      {
         var _loc1_:Cmd_PVZPrivilege_CS = new Cmd_PVZPrivilege_CS();
         this.pvzService.sendMessage(_loc1_);
      }
   }
}
