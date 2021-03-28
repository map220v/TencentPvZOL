package com.qq.modules.dragonBoat.command
{
   import PVZ.Cmd.Cmd_DragonBoat_Exchange_CS;
   import PVZ.Cmd.Cmd_DragonBoat_SetOut_CS;
   import PVZ.Cmd.Cmd_DragonBoat_Summon_CS;
   import PVZ.Cmd.Cmd_FlexibleActivity_GetActivityStat_CS;
   import PVZ.Cmd.E_SetOutType;
   import PVZ.Cmd.E_SummonType;
   import com.qq.modules.dragonBoat.DragonBoatConst;
   import com.qq.modules.main.server.PvzSocketService;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class DragonBoatCommand extends StrongRobotlegCommand
   {
      
      public static const NAME:String = "DragonBoatCommand";
       
      
      [Inject]
      public var pvzService:PvzSocketService;
      
      public function DragonBoatCommand()
      {
         super();
      }
      
      public function getInfo() : void
      {
         var _loc1_:Cmd_FlexibleActivity_GetActivityStat_CS = new Cmd_FlexibleActivity_GetActivityStat_CS();
         _loc1_.activityId = DragonBoatConst.ACTIVITY_ID;
         this.pvzService.sendMessage(_loc1_);
      }
      
      public function exchange(param1:int) : void
      {
         var _loc2_:Cmd_DragonBoat_Exchange_CS = new Cmd_DragonBoat_Exchange_CS();
         _loc2_.exchangeid = param1;
         _loc2_.activityid = DragonBoatConst.ACTIVITY_ID;
         this.pvzService.sendMessage(_loc2_);
      }
      
      public function partSetOut() : void
      {
         var _loc1_:Cmd_DragonBoat_SetOut_CS = new Cmd_DragonBoat_SetOut_CS();
         _loc1_.setouttype = E_SetOutType.E_SetOutType_Part;
         _loc1_.activityid = DragonBoatConst.ACTIVITY_ID;
         this.pvzService.sendMessage(_loc1_);
      }
      
      public function allSetOut() : void
      {
         var _loc1_:Cmd_DragonBoat_SetOut_CS = new Cmd_DragonBoat_SetOut_CS();
         _loc1_.setouttype = E_SetOutType.E_SetOutType_All;
         _loc1_.activityid = DragonBoatConst.ACTIVITY_ID;
         this.pvzService.sendMessage(_loc1_);
      }
      
      public function summonOne() : void
      {
         var _loc1_:Cmd_DragonBoat_Summon_CS = new Cmd_DragonBoat_Summon_CS();
         _loc1_.summontype = E_SummonType.E_SummonType_One;
         _loc1_.activityid = DragonBoatConst.ACTIVITY_ID;
         this.pvzService.sendMessage(_loc1_);
      }
      
      public function summonTen() : void
      {
         var _loc1_:Cmd_DragonBoat_Summon_CS = new Cmd_DragonBoat_Summon_CS();
         _loc1_.summontype = E_SummonType.E_SummonType_Ten;
         _loc1_.activityid = DragonBoatConst.ACTIVITY_ID;
         this.pvzService.sendMessage(_loc1_);
      }
   }
}
