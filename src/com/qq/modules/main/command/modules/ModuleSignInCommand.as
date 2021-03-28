package com.qq.modules.main.command.modules
{
   import com.qq.utils.UrlManager;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   import org.robotlegs.extend.module.RobotlegModuleLoaderManager;
   
   public class ModuleSignInCommand extends StrongRobotlegCommand
   {
      
      public static const NAME:String = "ModuleSignInCommand";
       
      
      public function ModuleSignInCommand()
      {
         super();
      }
      
      public function start() : void
      {
         RobotlegModuleLoaderManager.impl.doModuleInit(UrlManager.getUrl(UrlManager.Url_Module,"ModuleSignIn.swf"));
      }
      
      public function unload() : void
      {
         RobotlegModuleLoaderManager.impl.unloadModuleInit(UrlManager.getUrl(UrlManager.Url_Module,"ModuleSignIn.swf"));
      }
   }
}
