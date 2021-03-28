package com.qq.modules.activity.command.blueVip
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class BlueVipCmd
   {
       
      
      public function BlueVipCmd()
      {
         super();
      }
      
      public static function openBlueVipWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("BlueVipCommand","openBlueVipWindow",[]));
      }
   }
}
