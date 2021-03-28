package com.qq.modules.rookieCeremony.command
{
   import PVZ.Cmd.Cmd_FlexibleActivity_GetActivityStat_CS;
   import com.qq.modules.main.server.PvzSocketService;
   import com.qq.modules.rookieCeremony.RookieCeremonyConst;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class RookieCeremonyCommand extends StrongRobotlegCommand
   {
      
      public static const NAME:String = "RookieCeremonyCommand";
       
      
      [Inject]
      public var pvzService:PvzSocketService;
      
      public function RookieCeremonyCommand()
      {
         super();
      }
      
      public function getInfo() : void
      {
         var _loc1_:Cmd_FlexibleActivity_GetActivityStat_CS = new Cmd_FlexibleActivity_GetActivityStat_CS();
         _loc1_.activityId = RookieCeremonyConst.ROOKIE_CEREMONY_ACTIVITY_ID;
         this.pvzService.sendMessage(_loc1_);
      }
   }
}
