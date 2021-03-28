package com.qq.modules.downloadShortcut.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class DownloadShortcutCmd
   {
       
      
      public function DownloadShortcutCmd()
      {
         super();
      }
      
      public static function openDownloadShortcutWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DownloadShortcutCommand","openDownloadShortcutWindow",[]));
      }
      
      public static function downloadShortcut() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("DownloadShortcutCommand","downloadShortcut",[]));
      }
   }
}
