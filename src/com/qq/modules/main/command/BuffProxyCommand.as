package com.qq.modules.main.command
{
   import PVZ.Cmd.Cmd_Buff_GetList_CS;
   import com.qq.modules.main.server.PvzSocketService;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class BuffProxyCommand extends StrongRobotlegCommand
   {
       
      
      [Inject]
      public var server:PvzSocketService;
      
      public function BuffProxyCommand()
      {
         super();
      }
      
      public function getBuffList() : void
      {
         var _loc1_:Cmd_Buff_GetList_CS = new Cmd_Buff_GetList_CS();
         this.server.sendMessage(_loc1_);
      }
   }
}
