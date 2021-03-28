package com.qq.modules.main.command.modules
{
   import asgui.core.Application;
   import com.qq.IMyApplication;
   import com.qq.constant.city.CityConstant;
   import com.qq.display.QAlert;
   import com.qq.modules.city.model.vo.CityData;
   import com.qq.utils.UrlManager;
   import org.robotlegs.extend.command.StrongRobotlegCommand;
   import org.robotlegs.extend.module.RobotlegModuleLoaderManager;
   
   public class ModuleLabCommand extends StrongRobotlegCommand
   {
       
      
      [Inject]
      public var cityData:CityData;
      
      public function ModuleLabCommand()
      {
         super();
      }
      
      public function start() : void
      {
         if(this.cityData.hasBuilding(CityConstant.Building_Lab))
         {
            RobotlegModuleLoaderManager.impl.doModuleInit(UrlManager.getUrl(UrlManager.Url_Module,"ModuleLab.swf"),null,(Application.application as IMyApplication).mainLayer);
         }
         else
         {
            QAlert.Show("实验室未开放！");
         }
      }
      
      public function unload() : void
      {
         RobotlegModuleLoaderManager.impl.unloadModuleInit(UrlManager.getUrl(UrlManager.Url_Module,"ModuleLab.swf"));
      }
   }
}
