package com.qq.modules.friend.command
{
   import flash.display.DisplayObjectContainer;
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class FriendViewCmd
   {
       
      
      public function FriendViewCmd()
      {
         super();
      }
      
      public static function zoom() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FriendViewCommand","zoom",[]));
      }
      
      public static function zoomIn() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FriendViewCommand","zoomIn",[]));
      }
      
      public static function zoomOut() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FriendViewCommand","zoomOut",[]));
      }
      
      public static function addFriendIm(param1:DisplayObjectContainer = null) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FriendViewCommand","addFriendIm",[param1]));
      }
      
      public static function removeFriendIm() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FriendViewCommand","removeFriendIm",[]));
      }
      
      public static function openFriendLogWd() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FriendViewCommand","openFriendLogWd",[]));
      }
      
      public static function openFriendSetAvatarPlantWd() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FriendViewCommand","openFriendSetAvatarPlantWd",[]));
      }
      
      public static function openGiftEnergyLogWd() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FriendViewCommand","openGiftEnergyLogWd",[]));
      }
      
      public static function openRecommendPanel() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FriendViewCommand","openRecommendPanel",[]));
      }
      
      public static function startConfigFriend() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("FriendViewCommand","startConfigFriend",[]));
      }
   }
}
