package com.qq.modules.main.command
{
   import com.qq.GameGloble;
   import com.qq.modules.act14days.command.Act14daysCmd;
   import com.qq.modules.activity.ActivityGlobal;
   import com.qq.modules.activity.model.ActivityCommonInfo;
   import com.qq.modules.activity.model.ActivityProxy;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   
   public class CommonActCommand extends StrongRobotlegCommand
   {
       
      
      [Inject]
      public var activityProxy:ActivityProxy;
      
      public function CommonActCommand()
      {
         super();
      }
      
      public function checkPopup14DayAct() : void
      {
         var _loc1_:Vector.<ActivityCommonInfo> = this.activityProxy.getGroupByViewType(ActivityGlobal.VIEW_TYPE_14days);
         if(_loc1_.length == 0)
         {
            return;
         }
         if(!GameGloble.hasTriggerToday(ActivityGlobal.VIEW_TYPE_14days))
         {
            GameGloble.setTriggerToday(ActivityGlobal.VIEW_TYPE_14days);
            Act14daysCmd.openWindow();
         }
      }
   }
}
