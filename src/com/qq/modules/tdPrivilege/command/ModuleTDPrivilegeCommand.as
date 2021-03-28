package com.qq.modules.tdPrivilege.command
{
   import asgui.core.Application;
   import com.qq.IMyApplication;
   import com.qq.utils.UrlManager;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   import org.robotlegs.extend.module.RobotlegModuleLoaderManager;
   
   public class ModuleTDPrivilegeCommand extends StrongRobotlegCommand
   {
      
      public static const NAME:String = "ModuleTDPrivilegeCommand";
       
      
      public function ModuleTDPrivilegeCommand()
      {
         super();
      }
      
      public function start() : void
      {
         RobotlegModuleLoaderManager.impl.doModuleInit(UrlManager.getUrl(UrlManager.Url_Module,"ModulePrivilegeBar.swf"),null,(Application.application as IMyApplication).uiLayer);
      }
      
      public function unload() : void
      {
         RobotlegModuleLoaderManager.impl.unloadModuleInit(UrlManager.getUrl(UrlManager.Url_Module,"ModulePrivilegeBar.swf"));
      }
   }
}
