package com.qq.modules.main.logic.initData
{
   import com.qq.GameGloble;
   import com.qq.modules.city.command.CityProxyCmd;
   import com.qq.modules.city.model.CityProxy;
   import com.qq.modules.main.logic.initData.basic.BasicInitDataTask;
   import org.as3commons.logging.api.getLogger;
   
   public class InitCityBuildingInfoTask extends BasicInitDataTask
   {
       
      
      public function InitCityBuildingInfoTask()
      {
         super(InitDataManager.Init_CityInfo);
      }
      
      override public function start() : void
      {
         super.start();
         getLogger("loading").debug("Loading City Building Information");
         var _loc1_:CityProxy = GameGloble.injector.getInstance(CityProxy);
         _loc1_.init();
         CityProxyCmd.requestCityBuildingInfo();
      }
   }
}
