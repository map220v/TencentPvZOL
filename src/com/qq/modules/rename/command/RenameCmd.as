package com.qq.modules.rename.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class RenameCmd
   {
       
      
      public function RenameCmd()
      {
         super();
      }
      
      public static function gotoNewRoleStep(param1:Boolean) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("RenameCommand","gotoNewRoleStep",[param1]));
      }
      
      public static function gotoOldRoleChangeNameStep(param1:String = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("RenameCommand","gotoOldRoleChangeNameStep",[param1]));
      }
      
      public static function openRenameCardWd() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("RenameCommand","openRenameCardWd",[]));
      }
      
      public static function showPreMovie() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("RenameCommand","showPreMovie",[]));
      }
      
      public static function openMainWd() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("RenameCommand","openMainWd",[]));
      }
      
      public static function trySetOldRoleName(param1:String, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("RenameCommand","trySetOldRoleName",[param1,param2]));
      }
      
      public static function trySetNewRoleName(param1:String, param2:int) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("RenameCommand","trySetNewRoleName",[param1,param2]));
      }
      
      public static function renameFromItem(param1:String, param2:int, param3:Boolean) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("RenameCommand","renameFromItem",[param1,param2,param3]));
      }
      
      public static function openUnionRenameCardWd() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("RenameCommand","openUnionRenameCardWd",[]));
      }
      
      public static function renameUnionFromItem(param1:String) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("RenameCommand","renameUnionFromItem",[param1]));
      }
   }
}
