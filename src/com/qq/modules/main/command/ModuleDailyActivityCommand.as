package com.qq.modules.main.command
{
   import com.qq.utils.UrlManager;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   import org.robotlegs.extend.module.RobotlegModuleLoaderManager;
   
   public class ModuleDailyActivityCommand extends StrongRobotlegCommand
   {
      
      public static const NAME:String = "ModuleDailyActivityCommand";
       
      
      public function ModuleDailyActivityCommand()
      {
         super();
      }
      
      public function start() : void
      {
         RobotlegModuleLoaderManager.impl.doModuleInit(UrlManager.getUrl(UrlManager.Url_Module,"ModuleDailyActivity.swf"));
      }
      
      public function unload() : void
      {
         RobotlegModuleLoaderManager.impl.unloadModuleInit(UrlManager.getUrl(UrlManager.Url_Module,"ModuleDailyActivity.swf"));
      }
   }
}
