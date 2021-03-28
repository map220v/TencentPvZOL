package org.robotlegs.extend.command
{
   import org.robotlegs.extend.ExtendContext;
   
   public class RobotlegExtendCmd
   {
       
      
      public function RobotlegExtendCmd()
      {
         super();
      }
      
      public static function registerMapView(param1:*, param2:Class, param3:* = null, param4:Boolean = false, param5:Boolean = false) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("org.robotlegs.extend::RobotlegExtendCommand","registerMapView",[param1,param2,param3,param4,param5]));
      }
      
      public static function createMediator(param1:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("org.robotlegs.extend::RobotlegExtendCommand","createMediator",[param1]));
      }
      
      public static function registerAndCreateMediator(param1:Object, param2:Class) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("org.robotlegs.extend::RobotlegExtendCommand","registerAndCreateMediator",[param1,param2]));
      }
      
      public static function registerAndCreateMapView(param1:*, param2:Class, param3:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("org.robotlegs.extend::RobotlegExtendCommand","registerAndCreateMapView",[param1,param2,param3]));
      }
      
      public static function removeMediatorByView(param1:Object, param2:String = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("org.robotlegs.extend::RobotlegExtendCommand","removeMediatorByView",[param1,param2]));
      }
      
      public static function checkViewCloseToUnload(param1:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("org.robotlegs.extend::RobotlegExtendCommand","checkViewCloseToUnload",[param1]));
      }
   }
}
