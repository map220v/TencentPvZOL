package com.qq.modules.entryIcon.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class EntryIconCmd
   {
       
      
      public function EntryIconCmd()
      {
         super();
      }
      
      public static function addActivityIcon(param1:int, param2:Function = null, param3:Array = null, param4:Boolean = false) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EntryIconCommand","addActivityIcon",[param1,param2,param3,param4]));
      }
      
      public static function addSystemIcon(param1:int, param2:Function = null, param3:Array = null, param4:Boolean = false) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EntryIconCommand","addSystemIcon",[param1,param2,param3,param4]));
      }
      
      public static function removeActivityIcon(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EntryIconCommand","removeActivityIcon",[param1]));
      }
      
      public static function removeSystemIcon(param1:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EntryIconCommand","removeSystemIcon",[param1]));
      }
      
      public static function changeActivityEffect(param1:int, param2:Boolean) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EntryIconCommand","changeActivityEffect",[param1,param2]));
      }
      
      public static function changeSystemEffect(param1:int, param2:Boolean) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EntryIconCommand","changeSystemEffect",[param1,param2]));
      }
      
      public static function changeIconEffect(param1:int, param2:Boolean) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EntryIconCommand","changeIconEffect",[param1,param2]));
      }
      
      public static function openGroupIconWin(param1:int, param2:int, param3:String) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("EntryIconCommand","openGroupIconWin",[param1,param2,param3]));
      }
   }
}
