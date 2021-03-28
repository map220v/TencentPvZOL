package com.qq.modules.main.command.modules
{
   import asgui.core.Application;
   import com.qq.IMyApplication;
   import com.qq.utils.UrlManager;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   import org.robotlegs.extend.module.RobotlegModuleLoaderManager;
   
   public class ModuleMyHomeCommand extends StrongRobotlegCommand
   {
       
      
      public function ModuleMyHomeCommand()
      {
         super();
      }
      
      public function start(param1:int = 0) : void
      {
         RobotlegModuleLoaderManager.impl.doModuleInit(UrlManager.getUrl(UrlManager.Url_Module,"ModuleCard.swf"),null,(Application.application as IMyApplication).mainLayer,param1);
      }
      
      public function unload() : void
      {
         RobotlegModuleLoaderManager.impl.unloadModuleInit(UrlManager.getUrl(UrlManager.Url_Module,"ModuleCard.swf"));
      }
   }
}
