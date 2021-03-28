package com.qq.modules.main.command
{
   import asgui.core.Application;
   import com.qq.IMyApplication;
   import com.qq.utils.UrlManager;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   import org.robotlegs.extend.module.RobotlegModuleLoaderManager;
   
   public class ModuleEntryIconCommand extends StrongRobotlegCommand
   {
      
      public static const NAME:String = "ModuleEntryIconCommand";
      
      private static const MODULE_NAME:String = "ModuleEntryIcon.swf";
       
      
      public function ModuleEntryIconCommand()
      {
         super();
      }
      
      public function start() : void
      {
         RobotlegModuleLoaderManager.impl.doModuleInit(UrlManager.getUrl(UrlManager.Url_Module,MODULE_NAME),null,(Application.application as IMyApplication).uiLayer);
      }
      
      public function unload() : void
      {
         RobotlegModuleLoaderManager.impl.unloadModuleInit(UrlManager.getUrl(UrlManager.Url_Module,MODULE_NAME));
      }
   }
}
