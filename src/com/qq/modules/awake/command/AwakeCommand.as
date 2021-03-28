package com.qq.modules.awake.command
{
   import PVZ.Cmd.Cmd_Card_UseCardAwaken_CS;
   import com.qq.modules.main.server.PvzSocketService;
   import com.tencent.protobuf.Int64;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class AwakeCommand extends StrongRobotlegCommand
   {
      
      public static const NAME:String = "AwakeCommand";
       
      
      [Inject]
      public var pvzService:PvzSocketService;
      
      public function AwakeCommand()
      {
         super();
      }
      
      public function awake(param1:Int64) : void
      {
         var _loc2_:Cmd_Card_UseCardAwaken_CS = new Cmd_Card_UseCardAwaken_CS();
         _loc2_.oldUId = param1;
         this.pvzService.sendMessage(_loc2_);
      }
   }
}
