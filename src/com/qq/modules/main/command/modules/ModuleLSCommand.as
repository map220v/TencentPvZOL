package com.qq.modules.main.command.modules
{
   import asgui.core.Application;
   import com.qq.IMyApplication;
   import com.qq.utils.UrlManager;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   import org.robotlegs.extend.module.RobotlegModuleLoaderManager;
   
   public class ModuleLSCommand extends StrongRobotlegCommand
   {
       
      
      public function ModuleLSCommand()
      {
         super();
      }
      
      public function startLS(param1:int, param2:Object = null, param3:int = -1, param4:int = -1) : void
      {
         RobotlegModuleLoaderManager.impl.doModuleInit(UrlManager.getUrl(UrlManager.Url_Module,"ModuleLS.swf"),null,(Application.application as IMyApplication).mainLayer,[param1,param2,param3,param4]);
      }
      
      public function unloadLS() : void
      {
         RobotlegModuleLoaderManager.impl.unloadModuleInit(UrlManager.getUrl(UrlManager.Url_Module,"ModuleLS.swf"));
      }
   }
}
