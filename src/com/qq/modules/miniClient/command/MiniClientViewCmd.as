package com.qq.modules.miniClient.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class MiniClientViewCmd
   {
       
      
      public function MiniClientViewCmd()
      {
         super();
      }
      
      public static function showMiniClientDailyActivity() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MiniClientViewCommand","showMiniClientDailyActivity",[]));
      }
   }
}
