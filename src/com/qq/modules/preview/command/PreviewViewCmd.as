package com.qq.modules.preview.command
{
   import org.robotlegs.extend.ExtendContext;
   import org.robotlegs.extend.command.StrongRobotlegCommandEvent;
   
   public class PreviewViewCmd
   {
       
      
      public function PreviewViewCmd()
      {
         super();
      }
      
      public static function openPreviewWindow() : void
      {
         ExtendContext.instance.dispatchEvent(StrongRobotlegCommandEvent.addFunction("PreviewViewCommand","openPreviewWindow",[]));
      }
   }
}
