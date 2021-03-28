package com.qq.modules.main.command.modules
{
   import com.qq.utils.UrlManager;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   import org.robotlegs.extend.module.RobotlegModuleLoaderManager;
   
   public class ModuleWorldBossCommand extends StrongRobotlegCommand
   {
       
      
      public function ModuleWorldBossCommand()
      {
         super();
      }
      
      public function unload() : void
      {
         RobotlegModuleLoaderManager.impl.unloadModuleInit(UrlManager.getUrl(UrlManager.Url_Module,"ModuleWorldBoss.swf"));
      }
   }
}
