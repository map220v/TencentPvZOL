package com.qq.modules.scratch.command
{
   import PVZ.Cmd.Cmd_Scratch_GetInfo_CS;
   import PVZ.Cmd.Cmd_Scratch_Shave_CS;
   import com.qq.modules.main.server.PvzSocketService;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class ScratchProxyCommand extends StrongRobotlegCommand
   {
      
      public static const NAME:String = "ScratchProxyCommand";
       
      
      [Inject]
      public var pvzService:PvzSocketService;
      
      public function ScratchProxyCommand()
      {
         super();
      }
      
      public function requestScratchData() : void
      {
         var _loc1_:Cmd_Scratch_GetInfo_CS = new Cmd_Scratch_GetInfo_CS();
         this.pvzService.sendMessage(_loc1_);
      }
      
      public function doScratch() : void
      {
         var _loc1_:Cmd_Scratch_Shave_CS = new Cmd_Scratch_Shave_CS();
         this.pvzService.sendMessage(_loc1_);
      }
   }
}
