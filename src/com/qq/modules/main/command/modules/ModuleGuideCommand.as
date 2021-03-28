package com.qq.modules.main.command.modules
{
   import com.qq.utils.UrlManager;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   import org.robotlegs.extend.module.RobotlegModuleLoaderManager;
   
   public class ModuleGuideCommand extends StrongRobotlegCommand
   {
      
      public static const NAME:String = "ModuleGuideCommand";
      
      private static const MODULE_URL:String = UrlManager.getUrl(UrlManager.Url_Module,"ModuleGuide.swf");
       
      
      public function ModuleGuideCommand()
      {
         super();
      }
      
      public function start() : void
      {
         RobotlegModuleLoaderManager.impl.doModuleInit(MODULE_URL,null,null);
      }
      
      public function unload() : void
      {
         RobotlegModuleLoaderManager.impl.unloadModuleInit(MODULE_URL);
      }
   }
}
