package com.qq.modules.groupBuying.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class GroupBuyingViewCmd
   {
       
      
      public function GroupBuyingViewCmd()
      {
         super();
      }
      
      public static function openGroupBuyingWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GroupBuyingViewCommand","openGroupBuyingWindow",[]));
      }
   }
}
