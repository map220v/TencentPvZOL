package com.qq.modules.notice.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class NoticeCmd
   {
       
      
      public function NoticeCmd()
      {
         super();
      }
      
      public static function noticeGetSysList() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("NoticeCommand","noticeGetSysList",[]));
      }
      
      public static function noticeGetRollList() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("NoticeCommand","noticeGetRollList",[]));
      }
      
      public static function openNoticeWin() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("NoticeCommand","openNoticeWin",[]));
      }
      
      public static function showRollNoticeCav(param1:String) : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("NoticeCommand","showRollNoticeCav",[param1]));
      }
      
      public static function updateRollNoticeCav() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("NoticeCommand","updateRollNoticeCav",[]));
      }
      
      public static function updateSysNoticeCav() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("NoticeCommand","updateSysNoticeCav",[]));
      }
      
      public static function createRollNoticeCav() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("NoticeCommand","createRollNoticeCav",[]));
      }
      
      public static function removedRollNoticeCav() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("NoticeCommand","removedRollNoticeCav",[]));
      }
      
      public static function showNoticeIcon() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("NoticeCommand","showNoticeIcon",[]));
      }
      
      public static function flashNoticeIcon() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("NoticeCommand","flashNoticeIcon",[]));
      }
      
      public static function onClickIcon() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("NoticeCommand","onClickIcon",[]));
      }
      
      public static function hideNoticeIcon() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("NoticeCommand","hideNoticeIcon",[]));
      }
   }
}
