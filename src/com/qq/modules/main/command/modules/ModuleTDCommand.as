package com.qq.modules.main.command.modules
{
   import asgui.core.Application;
   import com.qq.IMyApplication;
   import com.qq.utils.UrlManager;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   import org.robotlegs.extend.module.RobotlegModuleLoaderManager;
   
   public class ModuleTDCommand extends StrongRobotlegCommand
   {
       
      
      public function ModuleTDCommand()
      {
         super();
      }
      
      public function startTDGame(param1:Array) : void
      {
         RobotlegModuleLoaderManager.impl.doModuleInit(UrlManager.getUrl(UrlManager.Url_Module,"ModuleTD.swf"),null,(Application.application as IMyApplication).mainLayer,param1);
      }
      
      public function unloadTD() : void
      {
         RobotlegModuleLoaderManager.impl.unloadModuleInit(UrlManager.getUrl(UrlManager.Url_Module,"ModuleTD.swf"));
      }
   }
}
