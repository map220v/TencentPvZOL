package com.qq.modules.awake.command
{
   import asgui.core.Application;
   import com.qq.IMyApplication;
   import com.qq.utils.UrlManager;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   import org.robotlegs.extend.module.RobotlegModuleLoaderManager;
   
   public class ModuleAwakeCommand extends StrongRobotlegCommand
   {
      
      public static const NAME:String = "ModuleAwakeCommand";
       
      
      public function ModuleAwakeCommand()
      {
         super();
      }
      
      public function start(param1:Boolean = false) : void
      {
         RobotlegModuleLoaderManager.impl.doModuleInit(UrlManager.getUrl(UrlManager.Url_Module,"ModuleAwake.swf"),null,(Application.application as IMyApplication).mainLayer,param1);
      }
      
      public function unload() : void
      {
         RobotlegModuleLoaderManager.impl.unloadModuleInit(UrlManager.getUrl(UrlManager.Url_Module,"ModuleAwake.swf"));
      }
   }
}
