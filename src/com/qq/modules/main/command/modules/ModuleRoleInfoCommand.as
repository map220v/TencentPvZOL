package com.qq.modules.main.command.modules
{
   import asgui.core.Application;
   import asgui.modules.IModule;
   import com.qq.IMyApplication;
   import com.qq.utils.UrlManager;
   import flash.display.DisplayObject;
   import org.as3commons.logging.api.getLogger;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   import org.robotlegs.extend.module.RobotlegModuleLoaderManager;
   
   public class ModuleRoleInfoCommand extends StrongRobotlegCommand
   {
      
      private static var unloadTimeout:int;
       
      
      public function ModuleRoleInfoCommand()
      {
         super();
      }
      
      public function start(param1:int = 0, param2:int = 0) : void
      {
         RobotlegModuleLoaderManager.impl.doModuleInit(UrlManager.getUrl(UrlManager.Url_Module,"ModuleRoleInfo.swf"),null,(Application.application as IMyApplication).uiLayer,[param1,param2]);
         var _loc3_:IModule = RobotlegModuleLoaderManager.impl.getModuleHelper(UrlManager.getUrl(UrlManager.Url_Module,"ModuleRoleInfo.swf")).loader.module;
         if(_loc3_)
         {
            (_loc3_ as DisplayObject).visible = true;
         }
      }
      
      public function unload() : void
      {
         var _loc1_:IModule = RobotlegModuleLoaderManager.impl.getModuleHelper(UrlManager.getUrl(UrlManager.Url_Module,"ModuleRoleInfo.swf")).loader.module;
         if(_loc1_ != null)
         {
            (_loc1_ as DisplayObject).visible = false;
         }
      }
      
      public function doUnload() : void
      {
         getLogger("RoleInfo").info("doUnload");
         RobotlegModuleLoaderManager.impl.unloadModuleInit(UrlManager.getUrl(UrlManager.Url_Module,"ModuleRoleInfo.swf"));
      }
   }
}
