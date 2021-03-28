package com.qq.modules.mapinfo.command
{
   import asgui.containers.Canvas;
   import asgui.controls.Image;
   import com.tencent.protobuf.Int64;
   import flash.display.MovieClip;
   import flash.geom.Point;
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class MapInfoViewCmd
   {
       
      
      public function MapInfoViewCmd()
      {
         super();
      }
      
      public static function addHistoryMiniCt(param1:Canvas) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MapInfoViewCommand","addHistoryMiniCt",[param1]));
      }
      
      public static function showDetailWnd(param1:int = 0) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MapInfoViewCommand","showDetailWnd",[param1]));
      }
      
      public static function showHelpArmyWD() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MapInfoViewCommand","showHelpArmyWD",[]));
      }
      
      public static function showMapRoleWnd(param1:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MapInfoViewCommand","showMapRoleWnd",[param1]));
      }
      
      public static function showMapRoleWndByRoleId(param1:Int64 = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MapInfoViewCommand","showMapRoleWndByRoleId",[param1]));
      }
      
      public static function showMapRoleWndByFriendInfo(param1:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MapInfoViewCommand","showMapRoleWndByFriendInfo",[param1]));
      }
      
      public static function showMapRoleWndByChallenge(param1:Int64, param2:Object) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MapInfoViewCommand","showMapRoleWndByChallenge",[param1,param2]));
      }
      
      public static function showAdvancedMoveCityWnd(param1:int = 0, param2:Point = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MapInfoViewCommand","showAdvancedMoveCityWnd",[param1,param2]));
      }
      
      public static function showSwitchChapterWnd() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MapInfoViewCommand","showSwitchChapterWnd",[]));
      }
      
      public static function showTimemachine(param1:Image, param2:MovieClip) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MapInfoViewCommand","showTimemachine",[param1,param2]));
      }
      
      public static function removeTimemachine(param1:Image) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MapInfoViewCommand","removeTimemachine",[param1]));
      }
      
      public static function checkBeExiled() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("MapInfoViewCommand","checkBeExiled",[]));
      }
   }
}
