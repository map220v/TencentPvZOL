package com.qq.modules.activity.command
{
   import PVZ.Cmd.Cmd_FlexibleActivity_GetActivityList_CS;
   import PVZ.Cmd.Cmd_FlexibleActivity_GetActivityStat_CS;
   import PVZ.Cmd.Cmd_FlexibleActivity_Operate_CS;
   import PVZ.Cmd.Cmd_FlexibleActivity_TakeReward_CS;
   import com.qq.modules.activity.ActivityGlobal;
   import com.qq.modules.main.server.PvzSocketService;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class ActivityProxyCommand extends StrongRobotlegCommand
   {
      
      public static const NAME:String = "ActivityProxyCommand";
       
      
      [Inject]
      public var pvzService:PvzSocketService;
      
      public function ActivityProxyCommand()
      {
         super();
      }
      
      public function getActivityList() : void
      {
         var _loc1_:Cmd_FlexibleActivity_GetActivityList_CS = new Cmd_FlexibleActivity_GetActivityList_CS();
         this.pvzService.sendMessage(_loc1_);
      }
      
      public function getActivityInfo(param1:int) : void
      {
         var _loc2_:Cmd_FlexibleActivity_GetActivityStat_CS = new Cmd_FlexibleActivity_GetActivityStat_CS();
         _loc2_.activityId = param1;
         this.pvzService.sendMessage(_loc2_);
      }
      
      public function takeActivityReward(param1:int, param2:int, param3:Boolean = true) : void
      {
         var _loc4_:Cmd_FlexibleActivity_TakeReward_CS;
         (_loc4_ = new Cmd_FlexibleActivity_TakeReward_CS()).activityId = param1;
         _loc4_.rewardIndex = param2;
         this.needUpdate(param1,param3);
         this.pvzService.sendMessage(_loc4_);
      }
      
      public function operateActivity(param1:int) : void
      {
         var _loc2_:Cmd_FlexibleActivity_Operate_CS = new Cmd_FlexibleActivity_Operate_CS();
         _loc2_.activityId = param1;
         this.pvzService.sendMessage(_loc2_);
      }
      
      private function needUpdate(param1:int, param2:Boolean = true) : void
      {
         var _loc3_:int = ActivityGlobal.NEED_UPDATE_LIST.indexOf(param1);
         if(_loc3_ >= 0)
         {
            ActivityGlobal.NEED_UPDATE_LIST.splice(_loc3_,1);
         }
         ActivityGlobal.AUTO_USE_MAP[param1] = param2;
         ActivityGlobal.NEED_UPDATE_LIST.push(param1);
      }
   }
}
