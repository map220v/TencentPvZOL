package com.qq.modules.guidePlus.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class GuideViewCmd
   {
       
      
      public function GuideViewCmd()
      {
         super();
      }
      
      public static function showComponent(param1:Object, param2:uint, param3:int, param4:int = 0, param5:int = 0, param6:int = 0, param7:int = 0, param8:int = 0) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GuideViewCommand","showComponent",[param1,param2,param3,param4,param5,param6,param7,param8]));
      }
      
      public static function showSkip(param1:int = 1, param2:Boolean = true) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GuideViewCommand","showSkip",[param1,param2]));
      }
      
      public static function delayRun(param1:String) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GuideViewCommand","delayRun",[param1]));
      }
      
      public static function runGuide(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GuideViewCommand","runGuide",[param1]));
      }
      
      public static function checkTarget(param1:String) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GuideViewCommand","checkTarget",[param1]));
      }
      
      public static function changeContext(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GuideViewCommand","changeContext",[param1]));
      }
      
      public static function clearAllComponent() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("GuideViewCommand","clearAllComponent",[]));
      }
   }
}
