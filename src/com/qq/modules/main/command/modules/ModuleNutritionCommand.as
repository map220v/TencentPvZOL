package com.qq.modules.main.command.modules
{
   import asgui.core.Application;
   import com.qq.IMyApplication;
   import com.qq.utils.UrlManager;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   import org.robotlegs.extend.module.RobotlegModuleLoaderManager;
   
   public class ModuleNutritionCommand extends StrongRobotlegCommand
   {
      
      public static const NAME:String = "ModuleNutritionCommand";
       
      
      public function ModuleNutritionCommand()
      {
         super();
      }
      
      public function start(param1:Object = null) : void
      {
         RobotlegModuleLoaderManager.impl.doModuleInit(UrlManager.getUrl(UrlManager.Url_Module,"ModuleNutrition.swf"),null,(Application.application as IMyApplication).mainLayer,param1);
      }
      
      public function unload() : void
      {
         RobotlegModuleLoaderManager.impl.unloadModuleInit(UrlManager.getUrl(UrlManager.Url_Module,"ModuleNutrition.swf"));
      }
   }
}
