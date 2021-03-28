package com.qq.modules.main.command.modules
{
   import asgui.core.Application;
   import com.qq.IMyApplication;
   import com.qq.utils.UrlManager;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   import org.robotlegs.extend.module.RobotlegModuleLoaderManager;
   
   public class ModuleFubenCommand extends StrongRobotlegCommand
   {
       
      
      public function ModuleFubenCommand()
      {
         super();
      }
      
      public function start() : void
      {
         RobotlegModuleLoaderManager.impl.doModuleInit(UrlManager.getUrl(UrlManager.Url_Module,"ModuleFuben.swf"),null,(Application.application as IMyApplication).mainLayer);
      }
      
      public function unload() : void
      {
         RobotlegModuleLoaderManager.impl.unloadModuleInit(UrlManager.getUrl(UrlManager.Url_Module,"ModuleFuben.swf"));
      }
   }
}
