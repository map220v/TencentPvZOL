package com.qq.modules.city.command
{
   import PVZ.Cmd.Cmd_City_GetBuildingEvent_CS;
   import com.qq.CommandName;
   import com.qq.modules.city.logic.plan.addBuilding.StartAddBuildingPlan;
   import com.qq.modules.city.model.CityProxy;
   import com.qq.modules.main.server.PvzSocketService;
   import com.qq.utils.CommandDispatcher;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   import tencent.tools.planMachine.DelayPlan;
   import tencent.tools.planMachine.Plan;
   
   public class CityViewCommand extends StrongRobotlegCommand
   {
       
      
      [Inject]
      public var proxy:CityProxy;
      
      [Inject]
      public var pvzService:PvzSocketService;
      
      public function CityViewCommand()
      {
         super();
      }
      
      public function initBuilding() : void
      {
         CommandDispatcher.send(CommandName.City_InitBuilding);
         CommandDispatcher.send(CommandName.City_UpdateNewBuildingEffect);
      }
      
      public function initBuildState() : void
      {
         var _loc1_:Cmd_City_GetBuildingEvent_CS = new Cmd_City_GetBuildingEvent_CS();
         this.pvzService.sendMessage(_loc1_);
      }
      
      public function moveMapByCenter(param1:int, param2:int, param3:Number = NaN, param4:Boolean = true) : void
      {
         CommandDispatcher.send(CommandName.City_MoveMapByCenter,{
            "centerX":param1,
            "centerY":param2,
            "scale":param3,
            "useTween":param4
         });
      }
      
      public function moveMapByBuilding(param1:int, param2:Number = NaN) : void
      {
         CommandDispatcher.send(CommandName.City_MoveMapByBuilding,{
            "buildingType":param1,
            "scale":param2
         });
      }
      
      public function enableMap(param1:Boolean, param2:Boolean) : void
      {
         CommandDispatcher.send(CommandName.City_ENABLE_MAP,{
            "scrollEnable":param1,
            "mouseEnable":param2
         });
      }
      
      public function setTopRightToolBarVisible(param1:Boolean) : void
      {
         CommandDispatcher.send(CommandName.setCityUIVisible,param1);
      }
      
      public function playAddBuildingAnimation(param1:int) : void
      {
         var _loc2_:Plan = null;
         this.moveMapByBuilding(param1);
         _loc2_ = new DelayPlan(new StartAddBuildingPlan(param1),2500);
         _loc2_.doPlan(null);
      }
      
      public function setBlur(param1:Boolean) : void
      {
         CommandDispatcher.send(CommandName.City_SET_BLUR,param1);
      }
   }
}
